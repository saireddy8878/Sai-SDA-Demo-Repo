const cds = require('@sap/cds')

module.exports = cds.service.impl(function () {
  const { ExpenseReports, ExpenseItems } = this.entities

  // --- Actions: Approve / Reject (work for active + draft) -------------------
  const approve = async (req) => {
    const [{ ID }] = req.params
    await UPDATE(ExpenseReports).set({ status: 'ACCEPTED' }).where({ ID })
    return { ID }
  }
  const reject = async (req) => {
    const [{ ID }] = req.params
    await UPDATE(ExpenseReports).set({ status: 'REJECTED' }).where({ ID })
    return { ID }
  }

  // register for active entity
  this.on('Approve', ExpenseReports, approve)
  this.on('Reject',  ExpenseReports, reject)
  // register for draft entity too (what FE calls from list/object page in edit flows)
  this.on('Approve', 'ExpenseReports.drafts', approve)
  this.on('Reject',  'ExpenseReports.drafts',  reject)

  // --- Keep parent total in sync when items change ---------------------------
  const recalc = async (req) => {
    // get parent key regardless of before/after phase shape
    const reportId =
      req.data?.report_ID ??
      req.params?.[0]?.report_ID ??
      req.row?.report_ID
    if (!reportId) return

    const tx = cds.tx(req)
    const rows = await tx.read(ExpenseItems).columns('amount').where({ report_ID: reportId })
    const sum = rows.reduce((a, r) => a + Number(r.amount || 0), 0)
    await tx.update(ExpenseReports, reportId).with({ totalAmount: sum })
  }
  this.after(['CREATE', 'UPDATE', 'DELETE'], ExpenseItems, recalc)

  // --- Function sample: TotalByMonth(year, month) ----------------------------
  this.on('TotalByMonth', async (req) => {
    const { year, month } = req.data
    const start = new Date(Date.UTC(year, month - 1, 1))
    const end   = new Date(Date.UTC(year, month,     1))
    const row = await SELECT.one
      .from(ExpenseReports)
      .columns`sum(totalAmount) as total`
      .where`tripDate >= ${start} and tripDate < ${end}`
    return row?.total ?? 0
  })
})

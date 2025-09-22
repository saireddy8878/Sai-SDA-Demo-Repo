using {
  Employees       as DbEmployees,
  ExpenseReports  as DbExpenseReports,
  ExpenseItems    as DbExpenseItems
} from '../db/schema';

service TravelServiceSrv @(path:'travel') {
  @readonly
  entity Employees      as projection on DbEmployees;

  // Draft root with actions (Create/Edit/Delete are enabled)
  @odata.draft.enabled
  entity ExpenseReports as projection on DbExpenseReports
  actions {
    action Approve() returns ExpenseReports;
    action Reject() returns ExpenseReports;
  };

  // Child entity of the draft root (do NOT annotate with draft)
  entity ExpenseItems   as projection on DbExpenseItems;

  function TotalByMonth(year: Integer, month: Integer) returns Decimal(15,2);
}

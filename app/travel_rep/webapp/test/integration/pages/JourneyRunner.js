sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"travelrep/test/integration/pages/ExpenseReportsList",
	"travelrep/test/integration/pages/ExpenseReportsObjectPage"
], function (JourneyRunner, ExpenseReportsList, ExpenseReportsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('travelrep') + '/test/flp.html#app-preview',
        pages: {
			onTheExpenseReportsList: ExpenseReportsList,
			onTheExpenseReportsObjectPage: ExpenseReportsObjectPage
        },
        async: true
    });

    return runner;
});


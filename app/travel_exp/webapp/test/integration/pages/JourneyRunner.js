sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"travelexp/test/integration/pages/ExpenseItemsList",
	"travelexp/test/integration/pages/ExpenseItemsObjectPage"
], function (JourneyRunner, ExpenseItemsList, ExpenseItemsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('travelexp') + '/test/flp.html#app-preview',
        pages: {
			onTheExpenseItemsList: ExpenseItemsList,
			onTheExpenseItemsObjectPage: ExpenseItemsObjectPage
        },
        async: true
    });

    return runner;
});


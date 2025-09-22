using TravelServiceSrv as service from '../../srv/travel-service';
annotate service.ExpenseItems with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'ID',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'report_ID',
                Value : report_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'category',
                Value : category,
            },
            {
                $Type : 'UI.DataField',
                Label : 'amount',
                Value : amount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'currency',
                Value : currency,
            },
            {
                $Type : 'UI.DataField',
                Label : 'notes',
                Value : notes,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'ID',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'report_ID',
            Value : report_ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'category',
            Value : category,
        },
        {
            $Type : 'UI.DataField',
            Label : 'amount',
            Value : amount,
        },
        {
            $Type : 'UI.DataField',
            Label : 'currency',
            Value : currency,
        },
    ],
);

annotate service.ExpenseItems with {
    report @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'ExpenseReports',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : report_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'title',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'employee_ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'tripDate',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'status',
            },
        ],
    }
};


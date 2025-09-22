using { cuid, managed } from '@sap/cds/common';

entity Employees : cuid, managed {
  key ID        : Integer;         // keep your existing IDs if you prefer
  name          : String(100);
  email         : String(120);
  department    : String(60);
}

entity ExpenseReports : managed {
  key ID         : String(36);
  title          : String(100);
  employee       : Association to Employees;
  tripDate       : Date;
  status         : String(10);     // NEW | APPROVED | REJECTED
  totalAmount    : Decimal(15,2);
  currency       : String(3);
  items          : Composition of many ExpenseItems
                     on items.report = $self;
}

entity ExpenseItems : managed {
  key ID         : String(36);
  report         : Association to ExpenseReports;
  category       : String(40);     // Hotel | Meal | Taxi | Flight ...
  amount         : Decimal(15,2);
  currency       : String(3);
  notes          : String(255);
}

tableextension 70011 "SPTExtnFF1" extends "Salesperson/Purchaser"
{
    fields
    {
        // Add changes to table fields here
        field(111111; "Total Orders SP"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST(Order), "Salesperson Code" = FIELD(Code)));
        }
        field(111112; "Total Invoices SP"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST(Invoice), "Salesperson Code" = FIELD(Code)));
        }
    }
}
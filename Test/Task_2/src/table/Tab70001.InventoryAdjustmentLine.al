table 70001 "Inventory Adjustment Line"
{
    Caption = 'AGT_DG Inventory Adjustment Line';

    fields
    {
        field(1; "Adjustment No."; Code[20]) { }
        field(2; "Line No."; Integer) { }
        field(3; "Item No."; Code[20]) { }
        field(4; Description; Text[100]) { }
        field(5; Quantity; Decimal)
        {
            trigger OnValidate()
            begin
                if Quantity = 0 then
                    Error('Quantity cannot be zero.');

                "Total Cost" := Quantity * "Unit Cost";
            end;
        }
        field(6; "Unit Cost"; Decimal)
        {
            trigger OnValidate()
            begin
                "Total Cost" := Quantity * "Unit Cost";
            end;
        }
        field(7; "Total Cost"; Decimal) { }
    }

    keys
    {
        key(PK; "Adjustment No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
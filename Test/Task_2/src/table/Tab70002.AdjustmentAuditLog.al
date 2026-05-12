table 70002 "Adjustment Audit Log"
{
    Caption = 'AGT_DG Adjustment Audit Log';

    fields
    {
        field(1; "Entry No."; Integer) { AutoIncrement = true; }
        field(2; "Adjustment No."; Code[20]) { }
        field(3; "Action Type"; Text[50]) { }
        field(4; "User ID"; Code[50]) { }
        field(5; "Action Date Time"; DateTime) { }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
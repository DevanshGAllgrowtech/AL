table 70000 "Inventory Adjustment Header"
{
    Caption = 'AGT_DG Inventory Adjustment Header';

    fields
    {
        field(1; "Adjustment No."; Code[20]) { }
        field(2; "Location Code"; Code[20]) { }
        field(3; "Request Date"; Date) { }
        field(4; "Requested By"; Code[50]) { }
        field(5; Status; Option)
        {
            OptionMembers = Open,"Pending Approval",Approved,Posted;
            InitValue = Open;
        }
        field(6; "Approved By"; Code[50]) { }
        field(7; "Posting Date"; Date) { }
    }

    keys
    {
        key(PK; "Adjustment No.")
        {
            Clustered = true;
        }
    }
}
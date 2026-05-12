table 70000 "Vendor Evaluation Header"
{
    DataClassification = ToBeClassified;
    Caption = 'Vendor Evaluation Header AGT_DG';

    fields
    {
        field(1; "Evaluation No."; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if (Rec."Evaluation No." = '') then
                    Error('Evaluation No. cannot be empty!!!');
            end;
        }
        field(2; "Vendor No."; Code[20]) { }
        field(3; "Vendor Name"; Text[100]) { }
        field(4; "Evaluation Month"; Date) { }
        field(5; "Final Score"; Decimal) { }
        field(6; "Rating Status"; Option)
        {
            OptionMembers = "",Excellent,Good,"Average",Poor;
            InitValue = "";
        }
        field(7; "Status"; Option)
        {
            OptionMembers = Open,Completed;
            InitValue = "Open";
        }
    }

    keys
    {
        key(PK; "Evaluation No.")
        {
            Clustered = true;
        }
    }

}
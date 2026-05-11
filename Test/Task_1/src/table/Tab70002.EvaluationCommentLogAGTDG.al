table 70002 "Evaluation Comment Log AGT_DG"
{
    DataClassification = ToBeClassified;
    Caption = 'Evaluation Comment Log AGT_DG';
    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Evaluation No."; Code[20]) { }
        field(3; "Comments"; Text[250]) { }
        field(4; "Created By"; Code[50]) { }
        field(5; "Created Date Time"; DateTime) { }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
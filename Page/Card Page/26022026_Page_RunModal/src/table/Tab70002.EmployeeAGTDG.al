table 70002 "Employee AGT_DG"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Student No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Name; Text[50]) { }
        field(3; "No."; Code[20])
        {
            TableRelation = "Project AGT_DG"."No.";
        }
        field(4; "Porject Name"; Text[50]) { }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

}
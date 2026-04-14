table 70001 "Log Table AGT_DG"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PK; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "User ID"; Text[2048])
        {

        }
        field(3; "Clicked Date And Time"; DateTime)
        {

        }
        // field(4; "Clicked Date"; Date)
        // {

        // }

        field(4; "Document No."; Code[20])
        {

        }
        field(5; "Status"; Enum "Sales Document Status")
        {

        }
        field(6; "Click On Action Name"; Text[30])
        {

        }
    }

    keys
    {
        key(PK; PK)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}
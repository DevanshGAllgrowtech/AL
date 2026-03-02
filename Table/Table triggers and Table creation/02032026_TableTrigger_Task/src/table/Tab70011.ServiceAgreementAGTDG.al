table 70011 "Service Agreement AGT_DG"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Assignment No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Customer No."; Code[20])
        {
            TableRelation = Customer."No.";
            DataClassification = ToBeClassified;
        }
        field(3; "Customer Name"; Text[100])
        {

        }
        field(4; "Service Cost"; Decimal)
        {

        }
        field(5; "Status"; Option)
        {
            OptionMembers = Open,Released,Completed;
            InitValue = Open;
        }
        field(6; "Created Date"; Date)
        {

        }
        field(7; "Created By"; Code[50])
        {

        }
        field(8; "Modified By"; Code[50])
        {

        }
        field(9; "Modified Date"; Date)
        {

        }
    }

    keys
    {
        key(PK; "Assignment No.")
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
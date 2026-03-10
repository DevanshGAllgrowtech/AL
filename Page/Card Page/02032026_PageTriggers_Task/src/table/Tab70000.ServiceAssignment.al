table 70000 "Service Assignment"

{
    DataClassification = ToBeClassified;
    Caption = 'Service Assignment AGT_DG';

    fields
    {
        field(1; "Assignment No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Customer Name"; Text[100])
        {

        }
        field(3; "Service Cost"; Decimal)
        {

        }
        field(4; "Status"; Option)
        {
            OptionMembers = Open,Released,Completed;
        }
        field(5; "Assignment Date"; Date)
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
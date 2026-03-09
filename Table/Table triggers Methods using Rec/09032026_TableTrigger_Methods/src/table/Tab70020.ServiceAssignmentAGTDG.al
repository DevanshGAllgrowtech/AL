table 70020 "Service Assignment AGT DG"
{
    DataClassification = ToBeClassified;
    Caption = 'Service Assignment Table AGT DG';
    fields
    {
        field(1; "Assignment No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Customer Name"; Text[100]) { }
        field(3; "Service Cost"; Decimal) { }
        field(4; "Status"; Option)
        {
            OptionMembers = Open,Released,Completed;
        }
        field(5; "Created Date"; Date)
        {

        }
        field(6; "Modified Date"; Date)
        {

        }
    }

    keys
    {
        key(PK; "Assignment No.")
        {
            // Clustered = true;
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
        Rec."Created Date" := today;
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
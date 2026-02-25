table 70000 "Campus Table AGT_DG"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Campus ID"; Code[20])
        {
        }
        field(2; "Campus Name"; Text[100])
        {

        }
        field(3; "Campus City"; Text[50])
        {

        }
        field(4; "IS ACTIVE"; Boolean)
        {
            InitValue = false;
        }
        field(5; "Current Campus Capacity"; Integer)
        {
            InitValue = 0;
        }
        field(6; "Max Campus Capacity"; Integer)
        {
        }
        field(7; "Current Enrollment"; Integer)
        {

        }
    }

    keys
    {
        key(PK; "Campus ID")
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
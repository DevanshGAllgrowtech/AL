table 70130 "Course Table AGT_DG"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Course Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Course Code';

        }
        field(2; "Course Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Course Name';
        }
    }

    keys
    {
        key(PK; "Course Code")
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
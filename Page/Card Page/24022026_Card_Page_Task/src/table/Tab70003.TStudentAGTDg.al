table 70003 "TStudent AGT_Dg"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
        }
        field(2; "Name"; Text[100])
        {
        }
        field(3; Status; Option)
        {
            OptionMembers = Draft,Active,Blocked;
            InitValue = Draft;
        }
        field(4; "Is Active"; Boolean)
        {
            InitValue = false;
        }
        field(5; "Total Marks"; Integer) { }
        field(6; "Grade"; Code[10]) { }
        field(7; "Email"; Text[100]) { }
        field(8; "Phone"; Text[20]) { }
        field(9; "Block Reason"; Text[150]) { }
        field(10; "Attempt Count"; Integer)
        {
            // trigger OnValidate()
            // begin
            //     if Rec."Attempt Count" > 2 then begin
            //         Error('You are missing something');
            //     end;
            // end;
        }
        //Auto filled fields
        field(11; "Created By"; Code[50]) { }
        field(12; "Last Modified By"; Code[50]) { }
        field(13; "Created On"; Date) { }
        field(14; "Last Modified On"; Date) { }
    }

    keys
    {
        key(PK; "No.")
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
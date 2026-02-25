table 70105 "TableTriggers AGT_DG"
{
    DataClassification = ToBeClassified;
    Caption = 'TableTriggers AGT_DG';

    fields
    {
        //AGT_DG Feb-11-2026++
        field(1; "Task ID"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            Caption = 'Task ID';
        }
        field(2; "Task Title"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Task Title';
        }
        field(3; "Task Description"; Text[500])
        {
            DataClassification = ToBeClassified;
            Caption = 'Task Description';
        }
        field(4; "Creation Date"; DateTime)
        {
            DataClassification = ToBeClassified;
            Caption = 'Task Creation Date';
            Editable = false;
        }
        field(5; "Task Status"; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Task Status';
            OptionMembers = "In Progress",Open,Completed,Changed;
            InitValue = Open;
        }
        field(6; "Is Modified"; Text[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Is Modified';
            InitValue = 'NO';
            Editable = false;
        }
        //AGT_DG Feb-11-2026--
    }

    keys
    {
        //AGT_DG Feb-11-2026++
        key(PK; "Task ID")
        {
            Clustered = true;
        }
        //AGT_DG Feb-11-2026--
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    var
        currDateTime: DateTime;
    begin
        currDateTime := System.CurrentDateTime();
        "Creation Date" := currDateTime;
    end;

    trigger OnModify()

    var
        changeIsModified: Text[10];
    begin
        if Rec."Is Modified" <> 'Modified' then begin
            "Is Modified" := 'Modified';
        end;

    end;

    trigger OnDelete()
    begin
        Error('You can not delete a Task');
    end;

    trigger OnRename()
    begin

    end;

}
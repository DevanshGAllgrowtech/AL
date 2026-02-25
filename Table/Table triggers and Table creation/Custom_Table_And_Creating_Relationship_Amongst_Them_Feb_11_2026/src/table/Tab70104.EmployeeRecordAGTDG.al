table 70104 "Employee Record AGT_DG"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Employee ID"; Code[12])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            Caption = 'Employee ID';
        }
        field(2; "Employee Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Employee Name';
        }
        field(3; "Employee Description"; Text[200])
        {
            DataClassification = ToBeClassified;
            Caption = 'Employee Description';
        }
        field(4; "Task Completion Hour"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Task Completion Hour';
        }
        field(5; "Completed Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Completed Date';
        }
    }

    keys
    {
        key(PK; "Employee ID")
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
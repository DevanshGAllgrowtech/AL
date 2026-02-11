table 70100 "CustomTask"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
            Editable = false;
            Caption = 'T_ID';
        }

        field(2; Title; Text[200])
        {
            DataClassification = ToBeClassified;
            Caption = 'T_Title';
        }
        field(3; Description; Text[200])
        {
            DataClassification = ToBeClassified;
            Caption = 'T_Description';
        }
        field(4; Deadline; DateTime)
        {
            DataClassification = ToBeClassified;
            Caption = 'T_Deadline';
        }
        field(5; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = In_Progress,Completed,Re_Opened;
            Caption = 'T_Deadline';
        }
    }

    keys
    {
        key(PK; ID)
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
        Message('Task successfully added with ID => ', Rec.ID, ' on ', Rec.SystemCreatedAt);
    end;

    trigger OnModify()
    begin
        Message('Task modified with ID => ', Rec.ID, ' on ', Rec.SystemCreatedAt);
    end;

    trigger OnDelete()
    begin
        Message('Task deleted with Title => ', Rec.Title, ' on ', Rec.SystemCreatedAt);
    end;

    trigger OnRename()
    begin

    end;

}
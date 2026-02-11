table 70101 "Customer Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
            Editable = false;
            Caption = 'C_ID';
        }

        field(2; Name; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'C_Name';
        }
        field(3; Email; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'C_Email';
        }
        field(4; Phone; Text[12])
        {
            DataClassification = ToBeClassified;
            Caption = 'C_Phone';
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
        Message('Customer successfully added with ID => ', Rec.ID, ' on ', Rec.SystemCreatedAt);
    end;

    trigger OnModify()
    begin
        Message('Customer details modified with ID => ', Rec.ID, ' on ', Rec.SystemCreatedAt);
    end;

    trigger OnDelete()
    begin
        Message('Customer deleted with Name => ', Rec.Name, ' on ', Rec.SystemCreatedAt);
    end;

    trigger OnRename()
    begin

    end;

}
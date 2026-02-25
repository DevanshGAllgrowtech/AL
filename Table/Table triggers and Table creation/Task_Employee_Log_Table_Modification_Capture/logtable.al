table 70103 "Employee Updation Logs"
{
    DataClassification = ToBeClassified;

    fields
    {
        //AGT_DG -> 10-02-2026++
        field(1; ID; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
            Editable = false;
            Caption = 'Entry No.';
        }
        field(2; "Employee Name"; Text[20])
        {
            Caption = 'Employee Name';
            trigger OnValidate()
            begin
                if ("Employee Name".Trim() = '') then begin
                    Error('Employee name should not be empty');
                end;
                if (StrLen("Employee Name") < 3) then begin
                    Error('Employee name should contain atleast 3 characters');
                end;
            end;
        }
        field(3; Department; Boolean)
        {
            Caption = 'Employee Department';
            trigger OnValidate()
            begin
                if ("Department" = false) then begin
                    Error('Department must be true');
                end;
            end;

        }
        field(4; "Salary"; Decimal)
        {
            Caption = 'Current Salary';
            trigger OnValidate()
            begin
                if ("Salary" > 20000) then begin
                    Error('Salary should not be greater than 20000');
                end;
                if ("Salary" < 0) then begin
                    Error('Salary should not be negative');
                end;
            end;
        }
        //AGT_DG -> 10-02-2026--
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

    end;

    trigger OnModify()
    ////AGT_DG -> 10-02-2026++
    var
        recordModified: Record "Employee Updation Logs";

    begin
        //This will display a message whenever the record is modified
        //and it will also display the ID 
        Message('Record is modified with ID =', Rec.ID);
        //AGT_DG -> 10-02-2026--
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}
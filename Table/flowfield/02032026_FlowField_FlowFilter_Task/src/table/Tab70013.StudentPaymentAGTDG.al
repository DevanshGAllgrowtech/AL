table 70013 "Student Payment AGT_DG"
{
    DataClassification = ToBeClassified;
    Caption = 'Student Payment AGT_DG';
    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Student No."; Code[20])
        {
            TableRelation = "Student (Master Table)"."Student No.";
        }
        field(3; "Payment Date"; Date)
        {

        }
        field(4; "Amount"; Decimal)
        {

        }
        // field(5; "Last Payment Date"; Date)
        // {
        //     FieldClass = FlowField;
        //     CalcFormula = max("Student Payment AGT_DG"."Payment Date" where("Student No." = field("Student No.")));
        // }
    }

    keys
    {
        key(PK; "Entry No.")
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
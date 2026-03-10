table 70012 "Student (Master Table)"
{
    DataClassification = ToBeClassified;
    Caption = 'Student (Master Table) AGT_DG';
    fields
    {
        field(1; "Student No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Student Name"; Text[100]) { }
        field(3; "Total Fees"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Student Payment AGT_DG".Amount where("Student No." = field("Student No.")));
        }
        field(4; "Total Payments"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Student Payment AGT_DG" where("Student No." = field("Student No.")));
        }
        field(5; "Last Payment Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Student Payment AGT_DG".Amount
                                    where
                                    (
                                        "Student No." = field("Student No."),
                                        "Payment Date" = field("Last Payment Date")
                                    )
                                );
        }
        field(6; "Payment Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(7; "Last Payment Date"; Date)
        {
            FieldClass = FlowField;
            CalcFormula = max("Student Payment AGT_DG"."Payment Date" where("Student No." = field("Student No.")));
        }

    }

    keys
    {
        key(PK; "Student No.") { }
    }

}
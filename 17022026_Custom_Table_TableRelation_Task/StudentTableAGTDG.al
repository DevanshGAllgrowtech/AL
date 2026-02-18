table 70129 "Student Table AGT_DG"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Student No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Student No.';
        }
        field(2; "Student Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Student Name';
        }
        field(3; "Age"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Student Age';
            Editable = false;
        }
        field(4; "Status"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Student Status';
            InitValue = true;
        }
        field(5; "DOB"; Date)
        {
            Caption = 'Student DOB';
            trigger OnValidate()
            var
                getCurrentDate: Date;
                getCurrentDateTime: DateTime;
            begin

                getCurrentDate := getCurrentDateTime.Date();
                if (Rec.DOB = getCurrentDate) or (Rec.DOB > getCurrentDate) then begin
                    Error('Please enter correct DOB');
                end
                else begin
                    setStudentStaus(Rec.Status);
                    setStudentAge(Rec.DOB);
                end;
            end;
        }
        field(6; "Course Code"; Code[20])
        {
            Caption = 'Course Code';
            TableRelation = "Course Table AGT_DG";
        }
        field(7; "Total Courses"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Enrollment Table AGT_DG"
                                    where("Student No." = field("Student No."),
                                    "Enrollment Date" = field("Date Filter"))
                                );
        }
        field(8; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
    }

    keys
    {
        //s1, c1 1rec
        //s1, c2 2rec
        key(PK; "Student No.", "Course Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }



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

    procedure setStudentAge(DOB: Date)
    var
        getCurrentDate: Date;
        getCurrentDateTime: DateTime;
        getCurrentYear: Integer;
        calculateStudentAge: Integer;
    begin

        getCurrentYear := getCurrentDate.Year();
        calculateStudentAge := getCurrentYear - DOB.Year();
        if dob.Month() > getCurrentDate.Month() then begin
            calculateStudentAge -= 1;
            Age := calculateStudentAge;
        end else
            if ((dob.Month() = getCurrentDate.Month()) or (dob.Month() = getCurrentDate.Month()))
                and
                ((dob.Day = getCurrentDate.Day) or (dob.Day < getCurrentDate.Day))
                then begin
                Age := calculateStudentAge;
            end;
    end;

    procedure setStudentStaus(Status: Boolean)
    var
        changeStudentStatus: Boolean;
    begin
        changeStudentStatus := true;
        if rec."Student No." <> '' then begin
            Status := changeStudentStatus;
        end;
    end;

}
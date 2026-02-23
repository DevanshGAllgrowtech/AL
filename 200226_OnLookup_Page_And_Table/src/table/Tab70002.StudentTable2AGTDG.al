table 70002 "Student Table2 AGT_DG"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Student ID"; Code[20])
        {
        }
        field(2; "Student First Name"; Text[50])
        {
        }
        field(3; "Student Last Name"; Text[50])
        {
        }
        field(4; "Student City"; Text[50])
        {
        }
        field(5; "Campus ID"; Code[20])
        {
            TableRelation = "Campus Table AGT_DG"."Campus ID";
            // trigger OnValidate()
            // var
            //     CAMPUS_REC: Record "Campus Table AGT_DG";
            // begin

            //     CAMPUS_REC.Get(Rec."Campus ID");
            //     CAMPUS_REC."Current Campus Capacity" += 1;

            // end;

        }
    }

    keys
    {
        key(PK; "Student ID")
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

// If requesting support, please provide the following details to help troubleshooting:

// Error message: 
// The Campus Table AGT_DG does not exist. Identification fields and values: Campus ID=''

// AL call stack: 
// "Student Table2 AGT_DG"(Table 70002).OnInsert(Trigger) line 5 - 200226_OnLookup_Page_And_Table by AGT DG version 1.0.0.0


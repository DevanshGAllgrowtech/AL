table 70131 "Enrollment Table AGT_DG"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; MyField; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Student No."; Code[10])
        {

        }
        field(3; "Course Code"; Code[20])
        {

        }
        field(4; "Enrollment Date"; Date) { }
    }
    //s1,c3
    //s1,c4
    keys
    {
        key(PK; "Student No.", "Course Code")
        {
            Clustered = true;
        }
    }
}
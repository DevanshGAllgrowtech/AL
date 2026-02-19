page 70111 "Student Page AGT_DG"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Student Table AGT_DG";

    layout
    {
        area(Content)
        {
            repeater("Student Data")
            {
                field("Student No."; Rec."Student No.")
                {

                }
                field("Student Name"; Rec."Student Name")
                {

                }
                field(DOB; Rec.DOB)
                {

                }
                field(Age; Rec.Age)
                {
                    Editable = false;
                }

                field(Status; Rec.Status)
                {

                }
                field("Course Code"; Rec."Course Code")
                {

                }
                field("Total Courses"; Rec."Total Courses")
                {
                    Editable = false;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }
}
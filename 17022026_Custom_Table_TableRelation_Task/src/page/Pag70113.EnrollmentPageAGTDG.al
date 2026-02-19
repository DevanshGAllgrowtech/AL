page 70113 "Enrollment Page AGT DG"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Enrollment Table AGT_DG";

    layout
    {
        area(Content)
        {
            repeater("Enrollment Data")
            {
                field("Student No."; Rec."Student No.")
                {
                }
                field("Course Code"; Rec."Course Code")
                {
                }
                field("Enrollment Date"; Rec."Enrollment Date") { }
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
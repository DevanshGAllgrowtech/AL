page 70112 "Course Page AGT DG"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Course Table AGT_DG";

    layout
    {
        area(Content)
        {
            repeater("Course Data")
            {
                field("Course Code"; Rec."Course Code")
                {

                }
                field("Course Name"; Rec."Course Name")
                {

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
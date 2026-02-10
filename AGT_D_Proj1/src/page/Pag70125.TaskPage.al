page 70125 "Task Page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = CustomTask;

    layout
    {
        area(Content)
        {
            repeater("Task Data")
            {
                field(T_ID; Rec.ID)
                {

                }
                field(T_Title; Rec.Title)
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
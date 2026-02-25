page 70025 "Tstudent List Page AGTDG"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "TStudent AGT_Dg";
    CardPageId = "TStudent Page AGT_Dg";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {

                }
                field(Name; Rec.Name) { }
                field(Email; Rec.Email) { }
                field("Is Active"; Rec."Is Active") { }
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
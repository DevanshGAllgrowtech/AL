page 70003 "Project AGT_DG"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Project AGT_DG";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    Caption = 'Project No.';
                }
                field(Name; Rec.Name)
                {
                    Caption = 'Project Name';
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


    trigger OnOpenPage()
    begin
        Message('Currently you are on Project LIST Page');
    end;
}
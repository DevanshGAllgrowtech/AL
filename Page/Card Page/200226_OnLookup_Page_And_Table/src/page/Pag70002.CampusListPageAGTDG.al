page 70002 "Campus List Page AGT_DG"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Campus Table AGT_DG";

    layout
    {
        area(Content)
        {
            repeater("Campus Data")
            {
                field("Campus ID"; Rec."Campus ID") { }
                field("Campus Name"; Rec."Campus Name") { }
                field("Campus City"; Rec."Campus City") { }
                field("Current Campus Capacity"; Rec."Current Campus Capacity")
                {
                    // Visible = false;
                    Editable = false;
                }
                field("Max Campus Capacity"; Rec."Max Campus Capacity") { }
                field("IS ACTIVE"; Rec."IS ACTIVE") { }
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
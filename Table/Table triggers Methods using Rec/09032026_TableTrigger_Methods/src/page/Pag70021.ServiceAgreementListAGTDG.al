page 70021 "Service Agreement List AGT_DG"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Service Assignment AGT DG";
    Editable = false;
    CardPageId = 70022;

    layout
    {
        area(Content)
        {
            repeater("Data")
            {
                field("Assignment No."; Rec."Assignment No.")
                {

                }
                field("Customer Name"; Rec."Customer Name") { }
                field("Service Cost"; Rec."Service Cost") { }
                field(Status; Rec.Status) { }
                field("Created Date"; Rec."Created Date") { }
                field("Modified Date"; Rec."Modified Date") { }
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
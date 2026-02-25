page 70109 "Table Relation List AGT_DG"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Table Relation Demo AGT_DG";

    layout
    {
        area(Content)
        {
            repeater("Table Relation Data")
            {
                field(TR_ID; Rec.TR_ID)
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    Caption = 'Associated Customer Name';
                    ApplicationArea = All;
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
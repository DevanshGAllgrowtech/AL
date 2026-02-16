page 70128 "Product FlowField Page AGT_DG"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Product FlowField AGT_DG";
    // Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Product Chair AVG_Price"; Rec."Product Chair AVG_Price")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Product Chair Count"; Rec."Product Chair Count")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Product Chair Max_Price"; Rec."Product Chair Max_Price")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Product Chair Min_Price"; Rec."Product Chair Min_Price")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Product Chair SumOf_Price"; Rec."Product Chair SumOf_Price")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Product Type"; Rec."Product Type")
                {
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
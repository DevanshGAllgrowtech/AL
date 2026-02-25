page 70127 "Product Page AGT_DG"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Product Table AGT_DG1";


    layout
    {
        area(Content)
        {
            repeater("Product Data")
            {
                field("Product ID"; Rec."Product ID")
                {
                    ApplicationArea = All;
                }
                field("Product Price"; Rec."Product Price")
                {
                    ApplicationArea = All;
                }
                field("Product Quantity"; Rec."Product Quantity")
                {
                    ApplicationArea = All;
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
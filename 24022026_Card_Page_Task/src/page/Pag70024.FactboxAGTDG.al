page 70024 "Factbox AGTDG"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "TStudent AGT_Dg";

    layout
    {
        area(Content)
        {
            group(Stats)
            {
                field("Attempt Count"; Rec."Attempt Count")
                {
                    Editable = false;
                }
            }
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

    var
        myInt: Integer;
}
page 70108 "Table Relation Page"
{
    Caption = 'Table Relation Demo Page';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Table Relation Demo AGT_DG";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(TR_ID; Rec.TR_ID)
                {
                    ApplicationArea = All;
                    Editable = false;

                }
            }
            group("Customer Details")
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Lookup = true;
                    LookupPageId = "Customer List";
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
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
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }
}
page 70000 "Vendor Evaluation AGT_Devansh"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Vendor Evaluation Header";
    Caption = 'Vendor Evaluation AGT_Devansh';
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater("Vendor Details")
            {
                field("Evaluation No."; Rec."Evaluation No.")
                {
                    DrillDownPageId = "Vendor Evaluation";
                }
                field("Vendor No."; Rec."Vendor No.") { }
                field("Vendor Name"; Rec."Vendor Name") { }
                field("Evaluation Month"; Rec."Evaluation Month") { }
                field("Final Score"; Rec."Final Score") { }
                field("Rating Status"; Rec."Rating Status") { }
                field(Status; Rec.Status) { }
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
}
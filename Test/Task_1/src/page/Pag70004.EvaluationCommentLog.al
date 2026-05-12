page 70004 "Evaluation Comment Log"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Evaluation Comment Log AGT_DG";
    Caption = 'Evaluation Comment Log AGT_DG';
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater("Comment Logs")
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Evaluation No."; Rec."Evaluation No.")
                {
                    ApplicationArea = All;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = All;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
                field("Created Date Time"; Rec."Created Date Time")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
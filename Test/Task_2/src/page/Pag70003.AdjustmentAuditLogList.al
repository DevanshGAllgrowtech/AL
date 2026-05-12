page 70003 "Adjustment Audit Log List"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Adjustment Audit Log";
    Caption = 'AGT_DG Audit Log';

    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Adjustment No."; Rec."Adjustment No.") { }
                field("Action Type"; Rec."Action Type") { }
                field("User ID"; Rec."User ID") { }
                field("Action Date Time"; Rec."Action Date Time") { }
            }
        }
    }
}
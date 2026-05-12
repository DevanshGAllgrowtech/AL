page 70000 "Inventory Adjustment List"
{
    PageType = List;
    SourceTable = "Inventory Adjustment Header";
    Caption = 'AGT_DG Inventory Adjustment List';
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Adjustment No."; Rec."Adjustment No.")
                {
                    DrillDownPageId = "Inventory Adjustment Document";
                }
                field("Location Code"; Rec."Location Code") { }
                field(Status; Rec.Status) { }
                field("Request Date"; Rec."Request Date") { }
            }
        }
    }
}
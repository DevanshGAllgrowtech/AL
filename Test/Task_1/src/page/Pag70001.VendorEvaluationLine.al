page 70001 "Vendor Evaluation Line"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Vendor Evaluation Line";
    Caption = 'Vendor Evaluation Line AGT_DG';

    layout
    {
        area(Content)
        {
            repeater("Vendor Evaluation Line")
            {
                field("Criteria Code"; Rec."Criteria Code") { }
                field("Criteria Description"; Rec."Criteria Description") { }
                field(Score; Rec.Score) { }
                field(Weightage; Rec.Weightage) { }
                field("Weighted Score"; Rec."Weighted Score")
                {
                    Editable = false;
                }
            }
        }
    }
}
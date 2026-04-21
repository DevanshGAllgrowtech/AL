page 70199 "Setup Page AGT_DG"
{
    PageType = Card;
    SourceTable = "Setup Table AGT_DG";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Posting From"; Rec."Posting From") { }
                field("Posting To"; Rec."Posting To") { }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.GetSetup(Rec);
    end;
}
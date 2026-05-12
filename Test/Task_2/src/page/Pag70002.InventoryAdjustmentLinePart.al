page 70002 "Inventory Adjustment Line Part"
{
    PageType = ListPart;
    SourceTable = "Inventory Adjustment Line";
    Caption = 'AGT_DG Inventory Adjustment Lines';
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No."; Rec."Item No.") { }
                field(Description; Rec.Description) { }
                field(Quantity; Rec.Quantity) { }
                field("Unit Cost"; Rec."Unit Cost") { }
                field("Total Cost"; Rec."Total Cost") { }
            }
        }
    }
}
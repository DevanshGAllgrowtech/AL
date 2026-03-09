page 70018 "Item Master Page AGT_DG"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Item Master AGT-DG";

    layout
    {
        area(Content)
        {
            repeater("Item Master Data")
            {
                field("Item No."; Rec."Item No.") { }
                field("Item Name"; Rec."Item Name") { }
                field("Item Type"; Rec."Item Type") { }
                field("Service Cost"; Rec."Service Cost") { }
            }
        }

    }
}
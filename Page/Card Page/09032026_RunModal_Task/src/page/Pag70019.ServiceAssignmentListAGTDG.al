page 70019 "Service Assignment List AGT_DG"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Service Assignment AGT_DG";
    Editable = false;
    CardPageId = "Servcie Assignment Card AGT-DG";

    layout
    {
        area(Content)
        {
            repeater("Assignment Record")
            {
                field("Assignment No."; Rec."Assignment No.") { }
                field("Item No."; Rec."Item No.") { }
                field("Item Name"; Rec."Item Name") { }
                field("Service Cost"; Rec."Service Cost") { }
                field("Technician Name"; Rec."Technician Name") { }
                field("Assignment Date"; Rec."Assignment Date") { }
                field("Total Assignments"; Rec."Total Assignments") { }
            }
        }
    }
}
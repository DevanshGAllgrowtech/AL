page 70002 "Log Page AGT_DG"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Log Table AGT_DG";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater("Log Data")
            {
                field(PK; Rec.PK)
                {
                    // ApplicationArea = all;
                }
                field("User ID"; Rec."User ID")
                {
                    // ApplicationArea = all;
                }
                field("Click On Action Name"; Rec."Click On Action Name")
                {
                    // ApplicationArea = all;
                }
                field("Clicked Date And Time"; Rec."Clicked Date And Time")
                {
                    // ApplicationArea = all;
                }
                // field("Clicked Time"; Rec."Clicked Time")
                // {
                //     // ApplicationArea = all;
                // }
                field("Document No."; Rec."Document No.") { }
                field(Status; Rec.Status)
                {
                    // ApplicationArea = all;
                }
            }
        }
        area(Factboxes)
        {

        }
    }
}
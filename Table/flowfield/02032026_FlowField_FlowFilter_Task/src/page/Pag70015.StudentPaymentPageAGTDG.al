page 70015 "Student Payment Page AGT_DG"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Student Payment AGT_DG";

    layout
    {
        area(Content)
        {
            repeater("Student Payment Data")
            {
                field("Entry No."; Rec."Entry No.") { }
                field("Student No."; Rec."Student No.") { }
                field("Payment Date"; Rec."Payment Date") { }
                field(Amount; Rec.Amount) { }
            }
        }
    }
}
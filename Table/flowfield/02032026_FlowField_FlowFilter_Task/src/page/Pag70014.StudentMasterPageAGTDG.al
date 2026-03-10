page 70014 "Student Master Page AGT_DG"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Student (Master Table)";

    layout
    {
        area(Content)
        {
            repeater("Student")
            {
                field("Student No."; Rec."Student No.")
                {

                }
                field("Student Name"; Rec."Student Name") { }
                field("Total Fees"; Rec."Total Fees") { }
                field("Total Payments"; Rec."Total Payments") { }
                field("Last Payment Amount"; Rec."Last Payment Amount") { }
            }
        }
    }
}
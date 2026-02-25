page 70003 "Student2 Page List AGTDG"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Student Table2 AGT_DG";
    CardPageId = "Student Card2 Page AGT_DG";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater("Student Data")
            {
                field("Student ID"; Rec."Student ID") { }
                field("Student First Name"; Rec."Student First Name") { }
                field("Student Last Name"; Rec."Student Last Name") { }
                field("Student City"; Rec."Student City") { }
                field("Campus ID"; Rec."Campus ID")
                {
                    Caption = 'Associated With Campus';
                    Editable = false;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }
}
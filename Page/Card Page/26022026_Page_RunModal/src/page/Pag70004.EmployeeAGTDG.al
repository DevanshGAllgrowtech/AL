page 70004 "Employee AGT_DG"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Employee AGT_DG";
    Editable = false;
    CardPageId = "Employee Card AGT_DG";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Student No."; Rec."Student No.")
                {
                    Caption = 'Student No.';
                }
                field(Name; Rec.Name)
                {
                    Caption = 'Student Name';
                }
                field("No."; Rec."No.")
                {
                    Caption = 'Project No.';
                }
                field("Porject Name"; Rec."Porject Name")
                {
                    Caption = 'Project Name';
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


    trigger OnOpenPage()
    begin
        Message('Currently you are on Employee LIST Page');
    end;
}
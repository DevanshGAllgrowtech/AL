page 70005 "Employee Card AGT_DG"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Employee AGT_DG";

    layout
    {
        area(Content)
        {
            group(GroupName)
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
                    Lookup = true;
                    trigger OnLookup(var myText: Text): Boolean
                    var
                        projectListPageRef: Record "Project AGT_DG";
                        pageRef: Page "Employee Card AGT_DG";
                        temp: Text;
                    begin
                        if Page.RunModal(Page::"Project AGT_DG", projectListPageRef) = Action::LookupOK then begin
                            Rec."No." := projectListPageRef."No.";
                            myText := projectListPageRef."No.";
                            Rec."Porject Name" := projectListPageRef.Name;
                        end;
                        exit(true);
                    end;
                }
                field("Porject Name"; Rec."Porject Name")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Open Project List")
            {
                Caption = 'Open Project List';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    projectListPageRef: Page "Project AGT_DG";
                begin
                    projectListPageRef.Run();
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Message('Currently you are on Employee Card Page');
    end;

    var
        myInt: Integer;
}
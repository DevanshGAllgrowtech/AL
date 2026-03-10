page 70022 "Service Agreement Card AGT_DG"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Service Assignment AGT DG";

    layout
    {
        area(Content)
        {
            group("General")
            {
                field("Assignment No."; Rec."Assignment No.")
                {

                }
                field("Customer Name"; Rec."Customer Name") { }
                field("Service Cost"; Rec."Service Cost") { }
                field(Status; Rec.Status) { }
                field("Created Date"; Rec."Created Date")
                {
                    Editable = false;
                }
                field("Modified Date"; Rec."Modified Date")
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
            action("Create Assignment Automatically")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    Rec.Init();
                    Rec."Assignment No." := '1';
                    Rec."Customer Name" := 'With Insert(True)';
                    Rec.Status := Rec.Status::Open;
                    Rec."Service Cost" := 100;

                    Rec.Insert(true);
                end;
            }

            action("Create Assignment Without Trigger")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    Rec.Init();
                    Rec."Assignment No." := '2';
                    Rec."Customer Name" := 'With Insert(False)';
                    Rec.Status := Rec.Status::Released;
                    Rec."Service Cost" := 200;

                    Rec.Insert();
                end;
            }
        }
    }

    var
        myInt: Integer;
}
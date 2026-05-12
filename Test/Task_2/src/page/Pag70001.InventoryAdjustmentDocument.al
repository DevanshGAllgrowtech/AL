page 70001 "Inventory Adjustment Document"
{
    PageType = Document;
    SourceTable = "Inventory Adjustment Header";
    Caption = 'AGT_DG Inventory Adjustment Document';
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Adjustment No."; Rec."Adjustment No.") { }
                field("Location Code"; Rec."Location Code") { }
                field("Request Date"; Rec."Request Date") { }
                field("Requested By"; Rec."Requested By") { }
                field(Status; Rec.Status) { }
                field("Approved By"; Rec."Approved By") { }
                field("Posting Date"; Rec."Posting Date") { }
            }

            part(Lines; "Inventory Adjustment Line Part")
            {
                SubPageLink = "Adjustment No." = FIELD("Adjustment No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Send for Approval")
            {
                trigger OnAction()
                begin
                    Rec.Validate(Status, Rec.Status::"Pending Approval");
                    Rec.Modify(true);
                end;
            }

            action(Approve)
            {
                trigger OnAction()
                begin
                    if Rec.Status <> Rec.Status::"Pending Approval" then
                        Error('Cannot approve.');

                    Rec.Validate(Status, Rec.Status::Approved);
                    Rec.Validate("Approved By", UserId);
                    Rec.Modify(true);
                end;
            }

            action(Reject)
            {
                trigger OnAction()
                begin
                    Rec.Validate(Status, Rec.Status::Open);
                    Rec.Modify(true);
                end;
            }

            action("Post Adjustment")
            {
                trigger OnAction()
                var
                    Line: Record "Inventory Adjustment Line";
                begin
                    if Rec.Status <> Rec.Status::Approved then
                        Error('Only approved documents can be posted.');

                    Line.SetRange("Adjustment No.", Rec."Adjustment No.");
                    if not Line.FindFirst() then
                        Error('No lines exist.');

                    Rec.Validate(Status, Rec.Status::Posted);
                    Rec.Validate("Posting Date", Today);
                    Rec.Modify(true);
                end;
            }
        }
    }
}
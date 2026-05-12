page 70001 "Inventory Adjustment Document"
{
    PageType = Document;
    SourceTable = "Inventory Adjustment Header";
    Caption = 'AGT_DG Inventory Adjustment Document';
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Adjustment No."; Rec."Adjustment No.")
                {
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        IsPendingForApproval := false;
                        Rec."Requested By" := UserId;
                        Rec."Request Date" := Today;
                    end;
                }
                field("Location Code"; Rec."Location Code") { }
                field("Request Date"; Rec."Request Date") { }
                field("Requested By"; Rec."Requested By")
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Approved By"; Rec."Approved By")
                {
                    TableRelation = "User Setup"."User ID";
                    ApplicationArea = All;

                }
                field("Posting Date"; Rec."Posting Date")
                {
                    Editable = false;
                }
            }

            part(Lines; "Inventory Adjustment Line Part")
            {
                SubPageLink = "Adjustment No." = FIELD("Adjustment No.");
                Editable = not IsPendingForApproval;
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
                    IsPendingForApproval := PostingMgtCodeunit.SendForApproval(Rec);
                    Message('%1', IsPendingForApproval);
                    CurrPage.Update(true);
                end;
            }

            action("Approve Document")
            {
                Visible = IsPendingForApproval;
                trigger OnAction()
                begin
                    PostingMgtCodeunit.ApproveDocument(Rec);
                end;
            }

            // action(Reject)
            // {
            //     trigger OnAction()
            //     begin
            //         Rec.Validate(Status, Rec.Status::Open);
            //         Rec.Modify(true);
            //     end;
            // }

            action("Post Adjustment")
            {
                trigger OnAction()

                begin
                    PostingMgtCodeunit.PostAdjustment(Rec);
                end;
            }
        }
    }

    var
        PostingMgtCodeunit: Codeunit "Posting Management";
        IsPendingForApproval: Boolean;
}
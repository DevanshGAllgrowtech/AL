page 70003 "Vendor Evaluation"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Vendor Evaluation Header";
    Caption = 'Vendor Evaluation AGT_DG';

    layout
    {
        area(Content)
        {
            group("General")
            {
                field("Evaluation No."; Rec."Evaluation No.") { }
                field("Vendor No."; Rec."Vendor No.") { }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    Editable = false;
                }
                field("Evaluation Month"; Rec."Evaluation Month") { }
                field("Final Score"; Rec."Final Score")
                {
                    Editable = false;
                }
                field("Rating Status"; Rec."Rating Status")
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
            }
            part("Evaluation Line"; "Vendor Evaluation Line")
            {
                ApplicationArea = All;
                SubPageLink = "Evaluation No. Line" = field("Evaluation No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Calculate Score")
            {
                ApplicationArea = All;
                Image = Calculate;

                trigger OnAction()
                var
                    VendorEvaluationCodeunit: Codeunit "Evaluation Mgt. AGT_DG";
                begin
                    VendorEvaluationCodeunit.CalculateFinalScore(Rec);
                    CurrPage.Update();
                end;
            }

            action("Complete Evaluation")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    VendorEvaluationCodeunit: Codeunit "Evaluation Mgt. AGT_DG";
                begin
                    VendorEvaluationCodeunit.SetStatusCompleted(Rec);
                    CurrPage.Update();
                end;
            }

            action("Reopen Evaluation")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    VendorEvaluationCodeunit: Codeunit "Evaluation Mgt. AGT_DG";
                begin
                    VendorEvaluationCodeunit.ReopenEvaluation(Rec);
                    CurrPage.Update();
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if Rec.Status = Rec.Status::Completed then
            CurrPage.Editable(false)
        else
            CurrPage.Editable(true);
    end;
}
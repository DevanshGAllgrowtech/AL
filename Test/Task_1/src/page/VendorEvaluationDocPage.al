page 70003 "Vendor Evaluation"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Vendor Evaluation Header";
    Caption = 'Vendor Evaluation AGT_DG';
    Editable = true;

    layout
    {
        area(Content)
        {
            group("General")
            {
                field("Evaluation No."; Rec."Evaluation No.")
                {
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    TableRelation = Vendor."No.";
                    trigger OnValidate()
                    var
                        VendorRec: Record Vendor;
                    begin
                        if (VendorRec.get(Rec."Vendor No.")) then begin
                            Rec."Vendor Name" := VendorRec.Name;
                        end;
                    end;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    Editable = false;

                }
                field("Evaluation Month"; Rec."Evaluation Month") { }
                field("Final Score"; Rec."Final Score")
                {
                    Editable = false;
                }
                field("Rating Status"; Rec."Rating Status") { }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    trigger OnValidate()
                    begin
                        if (Rec.Status = Rec.Status::Open) then begin
                            CurrPage.Editable(true);
                        end else begin
                            CurrPage.Editable(false);
                        end;
                    end;
                }


            }
            part("Evaluation Line"; "Vendor Evaluation Line")
            {
                ApplicationArea = all;
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

                trigger OnAction()
                var
                    VendorEvaluationLineRec: Record "Vendor Evaluation Line";
                    CalculateScore: Decimal;
                begin
                    VendorEvaluationLineRec.Reset();
                    VendorEvaluationLineRec.SetRange("Evaluation No. Line", Rec."Evaluation No.");

                    if (VendorEvaluationLineRec.FindSet()) then begin
                        CalculateScore := 0;
                        repeat
                            CalculateScore += VendorEvaluationLineRec.Score;
                        until VendorEvaluationLineRec.Next() = 0;
                        Rec.Validate("Final Score", CalculateScore);
                    end;

                end;
            }

            action("Complete Evaluation")
            {

                trigger OnAction()
                var
                    VendorEvaluationCodeunit: Codeunit "Evaluation Mgt. AGT_DG";
                begin
                    VendorEvaluationCodeunit.SetStatusCompleted(Rec);
                end;
            }

            action("Reopen Evaluation")
            {

                trigger OnAction()
                var
                    VendorEvaluationHeaderRec: Record "Vendor Evaluation Header";
                begin
                    if (VendorEvaluationHeaderRec.get(Rec."Evaluation No.")) then begin
                        Rec.Validate(Status, VendorEvaluationHeaderRec.Status::Open);
                    end;
                end;
            }
        }
    }


}
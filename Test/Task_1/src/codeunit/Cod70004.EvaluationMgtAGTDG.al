codeunit 70004 "Evaluation Mgt. AGT_DG"
{
    procedure CalculateWeightedScore(var VendorEvaluationLine: Record "Vendor Evaluation Line")
    begin
        if VendorEvaluationLine.Weightage = 0 then
            Error('Weightage cannot be zero.');

        VendorEvaluationLine.Validate("Weighted Score", (VendorEvaluationLine.Score * VendorEvaluationLine.Weightage) / 100);
        VendorEvaluationLine.Modify(true);
    end;

    procedure CalculateFinalScore(var VendorEvaluationHeader: Record "Vendor Evaluation Header")
    var
        VendorEvaluationLine: Record "Vendor Evaluation Line";
        TotalScore: Decimal;
    begin
        TotalScore := 0;
        VendorEvaluationLine.SetRange("Evaluation No. Line", VendorEvaluationHeader."Evaluation No.");

        if VendorEvaluationLine.FindSet() then
            repeat
                CalculateWeightedScore(VendorEvaluationLine);
                TotalScore += VendorEvaluationLine."Weighted Score";
            until VendorEvaluationLine.Next() = 0;
        VendorEvaluationHeader.Validate("Final Score", TotalScore);
        AssignRating(VendorEvaluationHeader);

        OnAfterScoreCalculation(VendorEvaluationHeader);
    end;

    local procedure AssignRating(var VendorEvaluationHeader: Record "Vendor Evaluation Header")
    begin
        case true of
            VendorEvaluationHeader."Final Score" >= 85:
                VendorEvaluationHeader.Validate("Rating Status", VendorEvaluationHeader."Rating Status"::Excellent);

            VendorEvaluationHeader."Final Score" >= 70:
                VendorEvaluationHeader.Validate("Rating Status", VendorEvaluationHeader."Rating Status"::Good);

            VendorEvaluationHeader."Final Score" >= 50:
                VendorEvaluationHeader.Validate("Rating Status", VendorEvaluationHeader."Rating Status"::Average);
            else
                VendorEvaluationHeader.Validate("Rating Status", VendorEvaluationHeader."Rating Status"::Poor);
        end;
    end;


    procedure SetStatusCompleted(var VendorEvaluationHeader: Record "Vendor Evaluation Header")
    var
        VendorEvaluationLine: Record "Vendor Evaluation Line";
    begin
        OnBeforeCompleteEvaluation(VendorEvaluationHeader);

        VendorEvaluationLine.SetRange("Evaluation No. Line", VendorEvaluationHeader."Evaluation No.");

        if VendorEvaluationLine.IsEmpty() then
            Error('Cannot complete evaluation without lines.');

        VendorEvaluationHeader.Validate(Status, VendorEvaluationHeader.Status::Completed);


        OnAfterEvaluationCompleted(VendorEvaluationHeader);
        VendorEvaluationHeader.Delete(VendorEvaluationHeader.get(VendorEvaluationHeader."Evaluation No."));
    end;

    procedure ReopenEvaluation(var VendorEvaluationHeader: Record "Vendor Evaluation Header")
    begin
        VendorEvaluationHeader.Validate(Status, VendorEvaluationHeader.Status::Open);
    end;

    [IntegrationEvent(false, false)]
    procedure OnBeforeCompleteEvaluation(var VendorEvaluationHeader: Record "Vendor Evaluation Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnAfterScoreCalculation(var VendorEvaluationHeader: Record "Vendor Evaluation Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnAfterEvaluationCompleted(var VendorEvaluationHeader: Record "Vendor Evaluation Header")
    begin
    end;
}
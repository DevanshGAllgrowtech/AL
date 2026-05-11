codeunit 70004 "Evaluation Mgt. AGT_DG"
{

    procedure SetStatusCompleted(var Rec: Record "Vendor Evaluation Header")
    var
        VendorEvaluationHeaderRec: Record "Vendor Evaluation Header";
    begin
        if (VendorEvaluationHeaderRec.get(Rec."Evaluation No.")) then begin
            OnBeforeCompleteEvaluation(Rec);
            Rec.Validate(Status, VendorEvaluationHeaderRec.Status::Completed);
            OnAfterEvaluationCompleted(Rec);
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Evaluation Mgt. AGT_DG", OnBeforeCompleteEvaluation, '', true, true)]
    local procedure DisplayMessageBeforeCompleted(var Rec: Record "Vendor Evaluation Header")
    begin
        Message('On subscribing Before OnBeforeCompleteEvaluation event status is: %1', Rec.Status);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Evaluation Mgt. AGT_DG", OnAfterEvaluationCompleted, '', true, true)]
    local procedure DisplayMessageAfterCompleted(var Rec: Record "Vendor Evaluation Header")
    begin
        Message('On subscribing After OnAfterEvaluationCompleted event status is: %1', Rec.Status);
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeCompleteEvaluation(var Rec: Record "Vendor Evaluation Header")
    begin
    end;


    [IntegrationEvent(true, false)]
    local procedure OnAfterScoreCalculation(var Rec: Record "Vendor Evaluation Header")
    begin
    end;


    [IntegrationEvent(true, false)]
    local procedure OnAfterEvaluationCompleted(var Rec: Record "Vendor Evaluation Header")
    begin
    end;
}
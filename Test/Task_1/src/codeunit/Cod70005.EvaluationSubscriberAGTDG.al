codeunit 70005 "Evaluation Subscriber AGT_DG"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Evaluation Mgt. AGT_DG", 'OnBeforeCompleteEvaluation', '', true, true)]
    local procedure BeforeCompleteEvaluation(var VendorEvaluationHeader: Record "Vendor Evaluation Header")
    begin
        Message('Before completion status is: %1', VendorEvaluationHeader.Status);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Evaluation Mgt. AGT_DG", 'OnAfterScoreCalculation', '', true, true)]
    local procedure AfterScoreCalculation(var VendorEvaluationHeader: Record "Vendor Evaluation Header")
    var
        CommentLog: Record "Evaluation Comment Log AGT_DG";
    begin
        CommentLog.Init();
        CommentLog.Validate("Evaluation No.", VendorEvaluationHeader."Evaluation No.");
        CommentLog.Validate("Comments", 'Final score calculated successfully.');
        CommentLog.Validate("Created By", UserId);
        CommentLog.Validate("Created Date Time", CurrentDateTime);
        CommentLog.Insert(true);

        Message('Final score calculated. Final Score = %1', VendorEvaluationHeader."Final Score");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Evaluation Mgt. AGT_DG", 'OnAfterEvaluationCompleted', '', true, true)]
    local procedure AfterEvaluationCompleted(var VendorEvaluationHeader: Record "Vendor Evaluation Header")
    var
        CommentLog: Record "Evaluation Comment Log AGT_DG";
    begin

        CommentLog.Init();
        CommentLog.Validate("Evaluation No.", VendorEvaluationHeader."Evaluation No.");
        CommentLog.Validate("Comments", 'Evaluation completed successfully.');
        CommentLog.Validate("Created By", UserId);
        CommentLog.Validate("Created Date Time", CurrentDateTime);
        CommentLog.Insert(true);

        Message('Evaluation %1 completed successfully.', VendorEvaluationHeader."Evaluation No.");
    end;
}
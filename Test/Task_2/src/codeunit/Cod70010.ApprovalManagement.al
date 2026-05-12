codeunit 70010 "Approval Management"
{
    procedure SendForApproval(var Rec: Record "Inventory Adjustment Header"): Boolean
    var
        IsActionButtonVisible: Boolean;
        AdjAuditLogRec: Record "Adjustment Audit Log";
    begin
        IsActionButtonVisible := false;
        if ((Rec.Status = rec.Status::Open) and (Rec."Requested By" = UserId)) then begin
            Rec.Validate(Status, Rec.Status::"Pending Approval");
            IsActionButtonVisible := true;
            AdjAuditLogRec.Init();
            AdjAuditLogRec.Validate("Adjustment No.", Rec."Adjustment No.");
            AdjAuditLogRec.Validate("Action Type", 'Document Sent for Approval Successfully!!!');
            AdjAuditLogRec.Validate("Action Date Time", CurrentDateTime);
            AdjAuditLogRec.Insert(true);
        end else begin
            Error('Cannot change Status to "Pending for Approval"');
        end;
        exit(IsActionButtonVisible);
    end;

    procedure ApproveDocument(var Rec: Record "Inventory Adjustment Header")
    var
        UserSetup: Record "User Setup";
        AdjAuditLogRec: Record "Adjustment Audit Log";
    begin
        if ((Rec."Approved By" = UserId) and (Rec.Status = Rec.Status::"Pending Approval")) then begin
            Rec.Validate(Status, Rec.Status::Approved);

            AdjAuditLogRec.Init();
            AdjAuditLogRec.Validate("Adjustment No.", Rec."Adjustment No.");
            AdjAuditLogRec.Validate("Action Type", 'Document Approved Successfully!!!');
            AdjAuditLogRec.Validate("Action Date Time", CurrentDateTime);
            AdjAuditLogRec.Insert(true);
        end else begin
            Error('Cannot Approve!!!');
        end;
    end;
}
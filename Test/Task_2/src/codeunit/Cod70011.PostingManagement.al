codeunit 70011 "Posting Management"
{
    procedure PostAdjustment(var Rec: Record "Inventory Adjustment Header")
    var
        Line: Record "Inventory Adjustment Line";
        AdjAuditLogRec: Record "Adjustment Audit Log";
    begin

        OnBeforePosting(Rec);

        OnAfterPosting(Rec);
        Rec.Modify(true);
        AdjAuditLogRec.Init();
        AdjAuditLogRec.Validate("Adjustment No.", Rec."Adjustment No.");
        AdjAuditLogRec.Validate("Action Type", 'Document Posted Successfully!!!');
        AdjAuditLogRec.Validate("Action Date Time", CurrentDateTime);
        AdjAuditLogRec.Insert(true);
    end;

    procedure SendForApproval(var Rec: Record "Inventory Adjustment Header"): Boolean
    var
        IsActionButtonVisible: Boolean;
        AdjAuditLogRec: Record "Adjustment Audit Log";
    begin
        IsActionButtonVisible := ApprovalMgtCodeunit.SendForApproval(Rec);
        Rec.Modify(true);
        AdjAuditLogRec.Init();
        AdjAuditLogRec.Validate("Adjustment No.", Rec."Adjustment No.");
        AdjAuditLogRec.Validate("Action Type", 'Document Sent for Approval Successfully!!!');
        AdjAuditLogRec.Validate("Action Date Time", CurrentDateTime);
        AdjAuditLogRec.Insert(true);
        exit(IsActionButtonVisible);
    end;

    procedure ApproveDocument(var Rec: Record "Inventory Adjustment Header")
    var
        AdjAuditLogRec: Record "Adjustment Audit Log";
    begin
        ApprovalMgtCodeunit.ApproveDocument(Rec);

        AdjAuditLogRec.Init();
        AdjAuditLogRec.Validate("Adjustment No.", Rec."Adjustment No.");
        AdjAuditLogRec.Validate("Action Type", 'Document Approved Successfully!!!');
        AdjAuditLogRec.Validate("Action Date Time", CurrentDateTime);
        AdjAuditLogRec.Insert(true);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeApproval(var Rec: Record "Inventory Adjustment Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterApproval(var Rec: Record "Inventory Adjustment Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforePosting(var Rec: Record "Inventory Adjustment Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterPosting(var Rec: Record "Inventory Adjustment Header")
    begin
    end;

    var
        ApprovalMgtCodeunit: Codeunit "Approval Management";

}
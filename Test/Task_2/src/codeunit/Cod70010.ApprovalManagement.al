codeunit 70010 "Approval Management"
{
    procedure SendForApproval(var Rec: Record "Inventory Adjustment Header"): Boolean
    var
        IsActionButtonVisible: Boolean;
    begin
        IsActionButtonVisible := false;
        if ((Rec.Status = rec.Status::Open) and (Rec."Requested By" = UserId)) then begin
            Rec.Validate(Status, Rec.Status::"Pending Approval");
            IsActionButtonVisible := true;
        end else begin
            Error('Cannot change Status to "Pending for Approval"');
        end;
        exit(IsActionButtonVisible);
    end;

    procedure ApproveDocument(var Rec: Record "Inventory Adjustment Header")
    var
        UserSetup: Record "User Setup";
    begin
        if ((Rec."Approved By" = UserId) and (Rec.Status = Rec.Status::"Pending Approval")) then begin
            Rec.Validate(Status, Rec.Status::Approved);
        end else begin
            Error('Cannot Approve!!!');
        end;
    end;
}
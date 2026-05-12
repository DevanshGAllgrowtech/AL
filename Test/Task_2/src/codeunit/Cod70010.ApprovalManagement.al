codeunit 70010 "Approval Management"
{
    procedure SendForApproval(var Rec: Record "Inventory Adjustment Header")
    begin
        Rec.Validate(Status, Rec.Status::"Pending Approval");
        Rec.Modify(true);
    end;
}
codeunit 70011 "Posting Management"
{
    procedure PostAdjustment(var Rec: Record "Inventory Adjustment Header")
    var
        Line: Record "Inventory Adjustment Line";
    begin
        if Rec.Status <> Rec.Status::Approved then
            Error('Only approved documents can be posted.');

        Line.SetRange("Adjustment No.", Rec."Adjustment No.");
        if not Line.FindFirst() then
            Error('No lines exist.');

        Rec.Validate(Status, Rec.Status::Posted);
        Rec.Validate("Posting Date", Today);
        Rec.Modify(true);
    end;
}
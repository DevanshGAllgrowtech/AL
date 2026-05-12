codeunit 70012 "Posting Management Subscriber"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Posting Management", OnBeforePosting, '', true, true)]
    local procedure ValidationBeforePosting(var Rec: Record "Inventory Adjustment Header")
    var
        Line: Record "Inventory Adjustment Line";
    begin
        if Rec.Status <> Rec.Status::Approved then
            Error('Only approved documents can be posted.');

        Line.SetRange("Adjustment No.", Rec."Adjustment No.");
        if not Line.FindFirst() then
            Error('No lines exist.');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Posting Management", OnAfterPosting, '', true, true)]
    local procedure AfterPostingSteps(var Rec: Record "Inventory Adjustment Header")
    var
        Line: Record "Inventory Adjustment Line";
    begin
        Rec.Validate(Status, Rec.Status::Posted);
        Rec.Validate("Posting Date", Today);
    end;
}
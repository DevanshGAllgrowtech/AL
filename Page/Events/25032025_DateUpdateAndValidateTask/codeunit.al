codeunit 70003 MyCodeunit
{
    [EventSubscriber(ObjectType::page, page::"Sales Order Subform", OnAfterValidateEvent, "Temp Field AGT_DG", true, true)]
    local procedure MyProcedure(var Rec: Record "Sales Line")
    var
        SalesHeaderRec: Record "Sales Header";
    begin
        if SalesHeaderRec.get(rec."Document Type", rec."Document No.") then begin
            SalesHeaderRec."Shipment Date" := CalcDate('-2D', Rec."Temp Field AGT_DG");
            SalesHeaderRec.Modify();
        end;
    end;
}
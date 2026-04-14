codeunit 70003 "Update Quant if Rel AGT_DG"
{
    // Task 21:
    // "In Sales order while releasing a order if i try to modify 
    // sales line it should not throw error instead it it reopen it and after changing values it automatically release it ."
    [EventSubscriber(ObjectType::page, page::"Sales Order Subform", OnBeforeDeltaUpdateTotals, '', true, true)]


    local procedure CheckStatusAndUpdateQuantity(var SalesLine: Record "Sales Line"; xSalesLine: Record "Sales Line")
    var
        SalesHeaderRec: Record "Sales Header";
        ReleaseSalesDoc: Codeunit "Release Sales Document";
    begin
        if SalesHeaderRec.get(SalesLine."Document Type", SalesLine."Document No.") then begin
            ReleaseSalesDoc.PerformManualReopen(SalesHeaderRec);
        end;
    end;
}
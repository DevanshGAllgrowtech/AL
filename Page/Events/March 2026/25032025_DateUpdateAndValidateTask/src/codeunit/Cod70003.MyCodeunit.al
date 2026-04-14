codeunit 70003 MyCodeunit
{

    //     Task:
    //     "
    // Add a new custom date field in the Sales Line table. When a user enters this date, the system should 
    // automatically update the existing Shipment Date to two days earlier than the entered. 
    // Additionally, the system must validate that the field is later than today’s date, and if not, raise an error stating 
    // ' date is out of range
    // "

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
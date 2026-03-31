codeunit 70003 "Bharat Task AGT_DG"
{
    [EventSubscriber(ObjectType::Page, page::"Sales Order", OnAfterValidateEvent, 'Cstm Field AGT_DG', true, true)]
    local procedure MyProcedure(var Rec: Record "Sales Header"; var xRec: Record "Sales Header")
    var
        SHPK: Code[20];
        valueToBeUpdated: Text[30];
        tempSalesLines: Record "Sales Line";
    begin
        if Rec.Status <> Rec.Status::Released then begin
            SHPK := Rec."No.";
            valueToBeUpdated := Rec."Cstm Field AGT_DG";
            updateCustomFieldValue(SHPK, valueToBeUpdated, tempSalesLines);
        end;
    end;

    [EventSubscriber(ObjectType::table, database::"Sales Line", OnAfterAssignHeaderValues, '', true, true)]
    local procedure MyProcedure2(var SalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header")
    begin
        if SalesHeader.Status <> SalesHeader.Status::Released then begin
            SalesLine."Cstm Field AGT_DG" := SalesHeader."Cstm Field AGT_DG";
        end

    end;

    procedure updateCustomFieldValue(shpk: Code[20]; valueToBeUpdated: TExt[30]; var tempSalesLines: Record "Sales Line")
    var
    // tempSalesLines: Record "Sales Line";
    begin
        tempSalesLines.SetRange("Document No.", shpk);

        // if tempSalesLines.FindSet() then begin
        //     repeat
        //         tempSalesLines."Cstm Field AGT_DG" := valueToBeUpdated;
        //     until tempSalesLines.Next() = 0;
        // end;
        tempSalesLines.ModifyAll("Cstm Field AGT_DG", valueToBeUpdated);
    end;

}
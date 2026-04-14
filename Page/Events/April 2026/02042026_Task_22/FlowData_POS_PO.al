codeunit 70004 "Flow Data POS_PO"
{
    //     Task: 22
    //     "create a custom field in purchase order and purchase line
    //  where the data should flow atuomatically when user 
    // selects item type in purchase line."

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", OnafterValidateEvent, 'Type', true, true)]
    local procedure FlowData(var Rec: Record "Purchase Line")
    var
        PurchHeaderRec: Record "Purchase Header";
    begin
        if PurchHeaderRec.get(Rec."Document Type", Rec."Document No.") then begin
            Rec."Cstm Fld AGT_DG" := PurchHeaderRec."Cstm Fld AGT_DG";
        end;
    end;
}
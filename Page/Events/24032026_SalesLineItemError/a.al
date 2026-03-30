codeunit 70001 "Block sales order AGT_DG"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforePostSalesLines, '', true, true)]
    local procedure MyProcedure(var SalesHeader: Record "Sales Header"; var TempSalesLineGlobal: Record "Sales Line" temporary; var TempVATAmountLine: Record "VAT Amount Line" temporary; var EverythingInvoiced: Boolean)
    var
        ItemRec: Record Item;
        itemRecPrimaryKeyVal, tempVal : Code[20];
        containsItem: Boolean;
    begin
        tempVal := '1896-S';
        containsItem := false;

        // When someone posts an  order and it contains a 1896-S item in its sales line then error it out , 
        // stop user from posting that  sales order.

        if not ItemRec.Get(tempVal) then begin
            exit;
        end;
        if TempSalesLineGlobal.FindSet() then begin
            itemRecPrimaryKeyVal := ItemRec."No.";
            repeat

                if (TempSalesLineGlobal.Type = TempSalesLineGlobal.type::Item) and (TempSalesLineGlobal."No." = itemRecPrimaryKeyVal) then begin
                    containsItem := true;

                end;
            until TempSalesLineGlobal.Next() = 0;
            if containsItem then begin
                Error('Sales Order (%1) can not be posted.\It contains Item %2(%3).\Please remove it or use another item.', SalesHeader."No.", itemRecPrimaryKeyVal, ItemRec.Description);
            end;
        end;
    end;
}
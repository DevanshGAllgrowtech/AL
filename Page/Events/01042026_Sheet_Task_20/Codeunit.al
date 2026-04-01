codeunit 70002 "Flow Data AGT_DG"
{

    //     Task 20:
    //     "Add two custom fields to the Item card. After posting a Sales or Purchase order,
    // update these fields with the Unit Price from the posted document lines."

    //The below code will find the MAXIMUM QUANTITY of Items if there exists multiple lines of Same Item.
    [EventSubscriber(ObjectType::Codeunit, codeunit::"Sales-Post", OnAfterPostSalesLines, '', true, true)]
    local procedure flowDataFromSalesLineToItemTable(var TempSalesLineGlobal: Record "Sales Line" temporary)
    var
        ItemQtyDict: Dictionary of [Code[20], Integer];
        MaxQuantity: Decimal;
        ItemRec: Record Item;
    begin
        if TempSalesLineGlobal.FindSet() then begin
            repeat
                if ItemQtyDict.ContainsKey(TempSalesLineGlobal."No.") then begin
                    if TempSalesLineGlobal.Quantity > MaxQuantity then begin
                        MaxQuantity := TempSalesLineGlobal.Quantity;
                    end;
                    ItemQtyDict.Set(TempSalesLineGlobal."No.", ItemQtyDict.Get(TempSalesLineGlobal."No.") + 1);
                end else begin
                    ItemQtyDict.Add(TempSalesLineGlobal."No.", 1);
                    MaxQuantity := TempSalesLineGlobal.Quantity;
                end;
                // Message('%1', MaxQuantity);
                if ItemRec.get(TempSalesLineGlobal."No.") then begin
                    ItemRec."SO AGT_DG" := TempSalesLineGlobal.Quantity;
                    ItemRec.Modify();
                end;
            until TempSalesLineGlobal.Next() = 0;
        end;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", OnRunOnAfterPostPurchLine, '', true, true)]
    local procedure flowDataFromPurchaseLineToItemTable(var TempPurchLineGlobal: Record "Purchase Line" temporary)
    var
        ItemQtyDict: Dictionary of [Code[20], Integer];
        MaxQuantity: Decimal;
        ItemRec: Record Item;
    begin
        if TempPurchLineGlobal.FindSet() then begin
            repeat
                if ItemQtyDict.ContainsKey(TempPurchLineGlobal."No.") then begin
                    if TempPurchLineGlobal.Quantity > MaxQuantity then begin
                        MaxQuantity := TempPurchLineGlobal.Quantity;
                    end;
                    ItemQtyDict.Set(TempPurchLineGlobal."No.", ItemQtyDict.Get(TempPurchLineGlobal."No.") + 1);
                end else begin
                    ItemQtyDict.Add(TempPurchLineGlobal."No.", 1);
                    MaxQuantity := TempPurchLineGlobal.Quantity;
                end;

                if ItemRec.get(TempPurchLineGlobal."No.") then begin
                    ItemRec."PO AGT_DG" := MaxQuantity;
                    ItemRec.Modify();
                end;
            until TempPurchLineGlobal.Next() = 0;
        end;
    end;
}
codeunit 70000 Task26
{

    //  Task 26

    //  "Creating a purchase order when the quantity entered in a
    //  sales order's line for an item exceeds the quantity in
    //  inventory for that item ."
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, 'Quantity', true, true)]
    local procedure CreatePurchaseOrder(var Rec: Record "Sales Line")
    var
        ItemRec: Record Item;
        PurchHeaderRec: Record "Purchase Header";
        PurchLineRec: Record "Purchase Line";
    begin
        if Rec.Type = Rec.Type::Item then begin
            ItemRec.Get(Rec."No.");
            ItemRec.CalcFields(Inventory);

            if Rec.Quantity > ItemRec.Inventory then begin
                PurchHeaderRec.Init();
                PurchHeaderRec."Document Type" := PurchHeaderRec."Document Type"::Order;
                PurchHeaderRec."Buy-from Vendor No." := 'V00040';
                PurchHeaderRec.Insert(true);

                PurchLineRec.Init();
                PurchLineRec."Document Type" := PurchHeaderRec."Document Type";
                PurchLineRec."Document No." := PurchHeaderRec."No.";
                PurchLineRec.Type := PurchLineRec.Type::Item;
                PurchLineRec."No." := Rec."No.";
                PurchLineRec.Quantity := Rec.Quantity - ItemRec.Inventory;
                PurchLineRec.Insert(true);
            end;
        end;
    end;

}
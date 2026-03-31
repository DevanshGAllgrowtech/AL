codeunit 70000 MyCodeunit
{
    [EventSubscriber(ObjectType::page, page::"Sales Order Subform", OnAfterValidateEvent, 'Quantity', true, true)]
    local procedure MyProcedure(var Rec: Record "Sales Line")
    var
        currUserEnteredQuantity, currItemQuantity, remainingQuantityToAdd, positiveRemainingQuantityToAdd : Decimal;
        itemPK: Code[20];
        ItemRec: Record Item;
    begin
        currUserEnteredQuantity := Rec.Quantity;
        itemPK := Rec."No.";
        currItemQuantity := GetAvailableInventory(itemPK, Rec."Location Code");
        remainingQuantityToAdd := currItemQuantity - currUserEnteredQuantity;
        if (remainingQuantityToAdd < 0) then begin
            positiveRemainingQuantityToAdd := Abs(remainingQuantityToAdd);
            CreateAndPostItemJournal(itemPK, Rec."Location Code", positiveRemainingQuantityToAdd);
        end;

    end;

    local procedure GetAvailableInventory(ItemNo: Code[20]; LocationCode: Code[10]): Decimal
    var
        ItemRec: Record Item;
    begin
        ItemRec.Get(ItemNo);
        ItemRec.Reset();
        ItemRec.SetRange("Location Filter", LocationCode);
        ItemRec.CalcFields(Inventory);
        exit(ItemRec.Inventory);
    end;

    local procedure CreateAndPostItemJournal(ItemNo: Code[20]; LocationCode: Code[10]; QtyToAdd: Decimal)
    var
        ItemJnlLine: Record "Item Journal Line";
        ItemJnlPost: Codeunit "Item Jnl.-Post";
    begin
        ItemJnlLine.Init();
        ItemJnlLine.Validate("Journal Template Name", 'ITEM');
        ItemJnlLine.Validate("Journal Batch Name", 'DEFAULT');
        ItemJnlLine.Validate("Entry Type", ItemJnlLine."Entry Type"::"Positive Adjmt.");
        ItemJnlLine.Validate("Item No.", ItemNo);
        ItemJnlLine.Validate("Location Code", LocationCode);
        ItemJnlLine.Validate(Quantity, QtyToAdd);
        ItemJnlLine.Insert(true);

        // Post the journal
        ItemJnlPost.Run(ItemJnlLine);
    end;
}
pageextension 70002 "Item List Action Ext AGT_DG" extends "Item List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("&Item Availability by")
        {
            action("Filter items where:Blocked = FALSE AGT_DG")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    itemRecs: Record Item;
                    highestInventItem, lowestInvestItem : Code[20];
                    maxInventItem, minInventItem, temp : Decimal;
                begin
                    itemRecs.Reset();
                    itemRecs.SetRange(Blocked, false);

                    if itemRecs.FindSet() then begin
                        itemRecs.CalcFields(Inventory);
                        temp := itemRecs.Inventory;
                        maxInventItem := temp;
                        minInventItem := temp;
                        repeat
                            itemRecs.CalcFields(Inventory);
                            temp := itemRecs.Inventory;
                            if (temp > maxInventItem) then begin
                                maxInventItem := temp;
                                highestInventItem := itemRecs."No.";
                            end;
                            if (temp < minInventItem) then begin
                                minInventItem := temp;
                                lowestInvestItem := itemRecs."No.";
                            end;
                        until itemRecs.Next() = 0;
                    end;

                    Message('Highest Invetory Item:\ Item No. => %1 \Inventory => %2 \\Lowest Inventory Item:\ Item No. => %3 \Inventory => %4 ', highestInventItem, maxInventItem, lowestInvestItem, minInventItem);
                end;
            }
        }
    }

    var
        myInt: Integer;
}
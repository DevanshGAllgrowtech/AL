pageextension 70001 "Item Page Ext AGT_DG" extends "Item List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addlast(History)
        {
            action("Filter Items by Blocked AGT_DG")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ItemRecs: Record Item;
                    count: Integer;
                begin
                    ItemRecs.Reset();
                    ItemRecs.SetCurrentKey(Inventory);
                    if ItemRecs.FindFirst() then begin
                        Message('%1\%2\%3', ItemRecs."No.", ItemRecs.Description, ItemRecs.Inventory);
                    end;

                    ItemRecs.Reset();
                    ItemRecs.SetFilter(Blocked, '%1', false);
                    ItemRecs.SetFilter(Inventory, '<5');

                    if ItemRecs.FindFirst() then begin
                        count := 0;
                        repeat
                            count += 1;
                        until ItemRecs.Next() = 0;
                    end;

                    Message('Count of Inventory items < 5 are => %1', count);

                end;
            }
        }
    }

    var
        myInt: Integer;
}
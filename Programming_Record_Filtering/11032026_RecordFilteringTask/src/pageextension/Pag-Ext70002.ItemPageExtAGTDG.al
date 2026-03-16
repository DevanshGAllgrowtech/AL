pageextension 70002 "Item Page Ext AGT_DG" extends "Item Card"
{
    layout
    {
        addafter("Item Category Code")
        {
            field("Custom Item Cat Code"; itemCatCode)
            {
                ApplicationArea = all;
                trigger OnLookup(var myText: Text): Boolean
                var
                    itemCatRec: Record "Item Category";
                begin
                    if page.RunModal(Page::"Item Categories", itemCatRec) = Action::LookupOK then begin
                        myText := itemCatRec.Code;
                    end;
                    exit(true);
                end;

                trigger OnValidate()
                var
                    myInt: Integer;
                begin
                    itemRecs.Reset();
                    itemRecs.SetRange("Item Category Code", itemCatCode);
                    Message('%1', itemCatCode);
                    if itemRecs.FindFirst() then begin
                        Message('Item Category Code -> %1 \findfirst -> %2', itemCatCode, itemRecs.Description);
                    end;
                end;
            }
        }
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        itemCatCode: Code[20];
        itemRecs: Record Item;
}
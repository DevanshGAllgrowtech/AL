pageextension 70001 "Cust Lst Ext AGT_DG" extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addlast("&Customer")
        {
            action("Filter customers created today AGT_DG")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.Reset();
                    Rec.SetFilter(SystemCreatedAt, Today.ToText());
                    if rec.FindLast() then begin
                        Message('%1, %2', Rec.Name, Rec."No.");
                    end else begin
                        Message('No such customer exists');
                    end;
                end;
            }
        }
    }
}
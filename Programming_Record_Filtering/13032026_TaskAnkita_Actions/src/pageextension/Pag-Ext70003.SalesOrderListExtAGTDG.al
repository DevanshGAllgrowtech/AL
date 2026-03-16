pageextension 70003 "Sales Order List Ext AGT_DG" extends "Sales Order List"
{

    actions
    {
        // Add changes to page actions here
        addafter("&Print")
        {
            action("Filter:Document Type = Order AGT_DG")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedIsBig = true;
                // PromotedCategory = Process;

                trigger OnAction()
                var
                    salesOrderRecs: Record "Sales Header";
                    count: Integer;
                    lastSalesOrderNo: Code[20];

                begin
                    salesOrderRecs.Reset();
                    Message('%1', WorkDate());
                    salesOrderRecs.SetRange("Document Type", salesOrderRecs."Document Type"::Order);
                    salesOrderRecs.SetFilter("Posting Date", '<%1', workDate());
                    count := 0;
                    lastSalesOrderNo := '@';
                    if salesOrderRecs.FindSet() then begin

                        repeat
                            count += 1;
                        until salesOrderRecs.Next() = 0;

                        if (salesOrderRecs.FindLast()) then begin
                            lastSalesOrderNo := salesOrderRecs."No.";
                        end;
                    end;

                    Message('Count of orders with Future Posting date => %1\\Last Order No. => %2', count, lastSalesOrderNo);
                end;
            }
        }
    }

    var
        myInt: Integer;
}
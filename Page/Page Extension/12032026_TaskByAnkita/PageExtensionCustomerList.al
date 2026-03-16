pageextension 70000 "Cust Page Extn AGT_DG" extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("&Customer")
        {
            group("Custom Button AGT_DG")
            {
                action("Get Cust Sales Details AGT_DG")
                {
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedIsBig = true;
                    trigger OnAction()
                    var
                        CUSTOMER_LEDGER_ENTRY_RECS: Record "Cust. Ledger Entry";
                        storeMaxAmount: Decimal;
                        tempMaxAmount: Decimal;
                        tempDate: Date;

                        custNo: Code[20];
                        custName: Text[100];
                        totalSales: Decimal;
                    begin
                        CUSTOMER_LEDGER_ENTRY_RECS.Reset();
                        // CUSTOMER_LEDGER_ENTRY_RECS.FindFirst();
                        // while CUSTOMER_LEDGER_ENTRY_RECS.Next() <> 0 do begin

                        // end;

                        // if CUSTOMER_LEDGER_ENTRY_RECS.FindSet() then begin
                        //     repeat 

                        //     until
                        // end;

                        // CUSTOMER_LEDGER_ENTRY_RECS.SetFilter("Document Type", '%1', CUSTOMER_LEDGER_ENTRY_RECS."Document Type"::Invoice);
                        // CUSTOMER_LEDGER_ENTRY_RECS.SetFilter("Posting Date", Today.ToText());

                        CUSTOMER_LEDGER_ENTRY_RECS.SetRange("Document Type", CUSTOMER_LEDGER_ENTRY_RECS."Document Type"::Invoice);
                        // CUSTOMER_LEDGER_ENTRY_RECS.SetRange("Posting Date", Today);
                        tempDate := DMY2Date(14, 1, 2026);
                        CUSTOMER_LEDGER_ENTRY_RECS.SetRange("Posting Date", tempDate);

                        if CUSTOMER_LEDGER_ENTRY_RECS.FindFirst() then begin
                            CUSTOMER_LEDGER_ENTRY_RECS.CalcFields(Amount);
                            storeMaxAmount := CUSTOMER_LEDGER_ENTRY_RECS.Amount;
                            // Message('%1', storeMaxAmount);
                            custNo := CUSTOMER_LEDGER_ENTRY_RECS."Customer No.";
                            // Message('%1', CUSTOMER_LEDGER_ENTRY_RECS."Customer No.");
                            custName := CUSTOMER_LEDGER_ENTRY_RECS."Customer Name";
                            // CUSTOMER_LEDGER_ENTRY_RECS.CalcFields("Sales (LCY)");
                            totalSales := CUSTOMER_LEDGER_ENTRY_RECS."Sales (LCY)";
                            repeat
                                CUSTOMER_LEDGER_ENTRY_RECS.CalcFields(Amount);
                                tempMaxAmount := CUSTOMER_LEDGER_ENTRY_RECS.Amount;
                                // Message('%1', tempMaxAmount);
                                if tempMaxAmount > storeMaxAmount then begin
                                    storeMaxAmount := tempMaxAmount;
                                    custNo := CUSTOMER_LEDGER_ENTRY_RECS."Customer No.";
                                    custName := CUSTOMER_LEDGER_ENTRY_RECS."Customer Name";
                                    // CUSTOMER_LEDGER_ENTRY_RECS.CalcFields("Sales (LCY)");
                                    CUSTOMER_LEDGER_ENTRY_RECS.CalcSums("Sales (LCY)");
                                    totalSales := CUSTOMER_LEDGER_ENTRY_RECS."Sales (LCY)";
                                end;
                            until CUSTOMER_LEDGER_ENTRY_RECS.Next() = 0;
                            Message('Highest sales for %5 -> %1,\Customer No. -> %2,\Customer Name -> %3,\Total sales -> %4', storeMaxAmount, custNo, custName, totalSales, tempDate);
                        end else begin
                            Message('No data exists in Customer Ledger Table.');
                        end;
                    end;
                }
            }

        }
    }

    var
        myInt: Integer;
}
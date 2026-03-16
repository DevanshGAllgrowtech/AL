pageextension 70000 "Cust Card Ext AGT_DG Action" extends "Customer Card"
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
            action("Get CurrCust Avg Invoice Amount AGT_DG")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    getTotals: Text;
                    resultAfterSplit: List of [Text];
                    CurrentCust: Code[20];
                    temp: TExt;


                    countOfTotalInvoice: Integer;
                    sumOfAmount: Decimal;
                    averageInvoiceAmount: Decimal;



                begin
                    CurrentCust := Rec."No.";
                    getTotals := GetTotalInvoicesCountAndAmount(CurrentCust);
                    resultAfterSplit := getTotals.Split(',');




                    System.Evaluate(countOfTotalInvoice, resultAfterSplit.Get(1));
                    // countOfTotalInvoice := 
                    System.Evaluate(sumOfAmount, resultAfterSplit.Get(2));

                    averageInvoiceAmount := sumOfAmount / countOfTotalInvoice;
                    averageInvoiceAmount := Round(averageInvoiceAmount, 0.01);

                    Message('Customer Invoice Summary:\\ Customer No. -> %1, \Total Invoices -> %2, \Total Amount -> %3, \Average Invoice Amount -> %4', Rec."No.", countOfTotalInvoice, sumOfAmount, averageInvoiceAmount);

                end;
            }
        }
    }

    procedure GetTotalInvoicesCountAndAmount(currentCust: Code[20]): Text
    var
        SalesRec: Record "Sales Header";
        totalAmount: Decimal;
        invoiceCount: Integer;
        startdate, endDate : Date;
        result: Text;
    begin
        SalesRec.Reset();

        // startdate := CalcDate('<-CM>', Today);
        // endDate := CalcDate('<CM>', Today);

        startdate := 20251001D;
        endDate := 20251030D;


        SalesRec.SetRange("Document Type", SalesRec."Document Type"::Invoice);
        SalesRec.setRange("Sell-to Customer No.", currentCust);
        SalesRec.SetRange("Posting Date", startdate, endDate);
        totalAmount := 0.0;
        invoiceCount := 0;

        if SalesRec.FindSet() then begin
            repeat
                invoiceCount += 1;
                SalesRec.CalcFields(Amount);
                totalAmount := totalAmount + SalesRec.Amount;
            until SalesRec.Next() = 0;
        end else begin
            Message('There are not any invoices for customer -> %1 from %2 to %3', REc."No.", startdate, endDate);
        end;

        result := invoiceCount.ToText() + ', ' + totalAmount.ToText();
        exit(result);
    end;

    var
        myInt: Integer;
}
pageextension 70000 "Cust Card Ext AGT_DG" extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
        addafter("Address & Contact")
        {
            group("Custom AGT_DG")
            {
                field("City AGT_DG"; tempCity)
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                        CUSTOMER_RECS: Record Customer;
                    begin


                    end;
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addlast("Request Approval")
        {
            //task given by ANKITA
            action("Filter Sales Header FindLast AGT_DG")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    SalesHeaderRecDocType: Record "Sales Header";
                    salesLineRec: Record "Sales Line";
                    tempText: Text;
                    roundedAmount: Decimal;
                begin
                    SalesHeaderRec.Reset();
                    SalesHeaderRec.SetRange("Sell-to Customer No.", Rec."No.");
                    SalesHeaderRec.SetRange("Document Type", SalesHeaderRecDocType."Document Type"::Invoice);
                    if SalesHeaderRec.FindLast() then begin
                        // if salesLineRec.get(SalesHeaderRec."No.") then begin
                        //     Message('Last Invoice No. -> %1', salesLineRec."Document No.");
                        // end;
                        roundedAmount := Round(SalesHeaderRec.Amount, 0.001, '=');
                        Message('Last Invoice No -> %1, \Posting Date -> %2, \Amount -> %3', SalesHeaderRec."No.", SalesHeaderRec."Posting Date", roundedAmount);
                    end else begin
                        Message('Invoice do not exists for customer -> %1', Rec.Name);
                    end;
                end;
            }

            action("Filter Sales Header FindFirst AGT_DG")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    SalesHeaderRecDocType: Record "Sales Header";
                begin
                    SalesHeaderRec.Reset();
                    SalesHeaderRec.SetRange("Sell-to Customer No.", Rec."No.");
                    SalesHeaderRec.SetRange("Document Type", SalesHeaderRecDocType."Document Type"::Order);
                    if SalesHeaderRec.FindFirst() then begin
                        // if salesLineRec.get(SalesHeaderRec."No.") then begin
                        //     Message('Last Invoice No. -> %1', salesLineRec."Document No.");
                        // end;
                        // roundedAmount := Round(SalesHeaderRec.Amount, 0.001, '=');
                        Message('Last Invoice No -> %1, \Posting Date -> %2', SalesHeaderRec."No.", SalesHeaderRec."Posting Date");
                    end else begin
                        Message('Invoice do not exists for customer -> %1', Rec.Name);
                    end;
                end;
            }

            action("Filter Customer Ledger Entry AGT_DG")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    CustomerLedgerEntry.Reset();
                    CustomerLedgerEntry.SetRange("Customer No.", Rec."No.");
                    CustomerLedgerEntry.SetRange("Document Type", CustomerLedgerEntry."Document Type"::Invoice);
                    CustomerLedgerEntry.CalcSums("Sales (LCY)");
                    Message('Total Sales Amount -> %1', CustomerLedgerEntry."Sales (LCY)");
                end;
            }


            //task given by RISHABH
            action("Filter Customer by City FF AGT_DG")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    CUSTOMER_RECS: Record Customer;
                begin
                    CUSTOMER_RECS.Reset();
                    CUSTOMER_RECS.SetRange(City, tempCity);
                    if CUSTOMER_RECS.FindFirst() then begin
                        Message('Using FindFirst: \Customer Name -> %1', CUSTOMER_RECS.Name);
                    end else begin
                        Message('No such customer exists');
                    end;
                    if CUSTOMER_RECS.FindLast() then begin
                        Message('Using FindLast \Customer Name -> %1', CUSTOMER_RECS.Name);
                    end else begin
                        Message('No such customer exists');
                    end;
                end;

            }

            action("Get Last Customer Rec AGT_DG")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    customerRecs: Record Customer;
                begin
                    customerRecs.Reset();
                    if customerRecs.FindLast() then begin
                        Message('%1', customerRecs.Name);
                    end else begin
                        Message('Error');
                    end;
                end;
            }
        }
    }

    var
        myInt: Integer;
        SalesHeaderRec: Record "Sales Header";
        CustomerLedgerEntry: Record "Cust. Ledger Entry";
        tempCity: Text[30];
}
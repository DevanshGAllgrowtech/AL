codeunit 70001 MyCodeunit
{
    // Task:
    //     "1.There is a field called SalesPerson code on Sales Header, by defauly this comes from Customer card. 
    // 2. When a new sales order is created  Then update the salesperson code on the sales Header with the salesperson code 
    // which has the least no of orders+Invoices."
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnBeforeInsertEvent, '', true, true)]
    local procedure MyProcedure(var Rec: Record "Sales Header")
    var
        // salesHeaderRec: Record "Sales Header";
        // salesIvoiceHeaderRec: Record "Sales Invoice Header";
        salesPersonRec: Record "Salesperson/Purchaser";
        salesPersonPK, minSalesPersonPK : Code[20];
        // countOfOrders, countOfInvoices, 
        sumOfOrdersAndInvoices, minSumOfOrdersAndInvoices : Integer;
    begin

        if UserId = 'DEVANSH.GUPTA' then begin
            if salesPersonRec.FindSet() then begin
                minSumOfOrdersAndInvoices := 2147483647;
                repeat
                    salesPersonPK := salesPersonRec.Code;
                    sumOfOrdersAndInvoices := salesPersonRec."Total Orders SP" + salesPersonRec."Total Invoices SP";
                    if (sumOfOrdersAndInvoices < minSumOfOrdersAndInvoices) then begin
                        minSumOfOrdersAndInvoices := sumOfOrdersAndInvoices;
                        minSalesPersonPK := salesPersonPK;
                    end;
                until salesPersonRec.Next() = 0;
                Rec."Salesperson Code" := minSalesPersonPK;
            end;
        end;

        // if UserId = 'DEVANSH.GUPTA' then begin
        //     if salesPersonRec.FindSet() then begin
        //         minSumOfOrdersAndInvoices := 2147483647;
        //         repeat
        //             salesPersonPK := salesPersonRec.Code;
        //             salesHeaderRec.Reset();
        //             salesHeaderRec.SetRange("Document Type", salesHeaderRec."Document Type"::Order);
        //             salesHeaderRec.SetRange("Salesperson Code", salesPersonPK);
        //             countOfOrders := salesHeaderRec.Count;

        //             // salesIvoiceHeaderRec.Reset();
        //             // salesIvoiceHeaderRec.SetRange("Salesperson Code", salesPersonPK);

        //             // countOfInvoices := salesIvoiceHeaderRec.Count;

        //             salesHeaderRec.Reset();
        //             salesHeaderRec.SetRange("Document Type", salesHeaderRec."Document Type"::Invoice);
        //             salesHeaderRec.SetRange("Salesperson Code", salesPersonPK);

        //             countOfInvoices := salesHeaderRec.Count;

        //             sumOfOrdersAndInvoices := countOfInvoices + countOfOrders;
        //             Message('%1', sumOfOrdersAndInvoices);

        //             if sumOfOrdersAndInvoices < minSumOfOrdersAndInvoices then begin
        //                 minSumOfOrdersAndInvoices := sumOfOrdersAndInvoices;
        //                 minSalesPersonPK := salesPersonPK;
        //             end;
        //         until salesPersonRec.Next() = 0;

        //         Rec."Salesperson Code" := minSalesPersonPK;
        //         Message('%1', minSalesPersonPK);
        //     end;
        // end;


    end;
}
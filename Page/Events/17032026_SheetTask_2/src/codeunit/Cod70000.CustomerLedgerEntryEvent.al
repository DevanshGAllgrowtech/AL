codeunit 70000 "Customer Ledger Entry Event"
{
    // "Flow custom field value from Sales Header to Customer Ledger Entry using event
    // 1. Create a new field in Sales Header (text or code or Boolean)
    // 2. Create the same field in Customer Ledger Entry table
    // 3. Upon posting the sales order, custom field value should flow to customer ledger entry"


    [EventSubscriber(ObjectType::Codeunit, codeunit::"Sales-Post", OnAfterPostSalesDoc, '', true, true)]
    local procedure MyProcedure(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; CommitIsSuppressed: Boolean; InvtPickPutaway: Boolean; var CustLedgerEntry: Record "Cust. Ledger Entry"; WhseShip: Boolean; WhseReceiv: Boolean; PreviewMode: Boolean)
    var
        tempRecSH: Record "Sales Header";
        tempRecCust: Record "Cust. Ledger Entry";
        tempDesc: TExt[100];
    begin
        tempRecSH := SalesHeader;
        tempDesc := 'Order ' + tempRecSH."No.";
        Message('%1', tempDesc);
        // if (PostingCodeunitID = codeunit::"Sales-Post (Yes/No)") then begin
        tempRecCust.Reset();
        tempRecCust.SetRange("Document No.", SalesInvHdrNo);
        if tempRecCust.FindFirst() then begin
            repeat
                tempRecCust."temp field" := tempRecSH."temp field";
                tempRecCust.Modify();
            until tempRecCust.Next() = 0;
        end;
    end;



    var
        temp: Boolean;
}
codeunit 70004 "Task 30"
{
    // Task 30:

    // " Restricted users from posting 
    // if the balance due in the customer table 
    // and the open sales order amount exceed 
    // the credit limit for that customer."
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', false, false)]
    local procedure CheckCreditLimit(var SalesHeader: Record "Sales Header")
    var
        Customer: Record Customer;
        OpenSalesHeader: Record "Sales Header";// this is for fetching all open sales order of the customer to calculate the total open amount.
        OpenAmount: Decimal;

    begin
        OpenAmount := 0;
        if SalesHeader."Document Type" <> SalesHeader."Document Type"::Order then
            exit;

        Customer.Get(SalesHeader."Sell-to Customer No.");
        Customer.CalcFields("Balance (LCY)");
        SalesHeader.CalcFields(Amount);
        Message('SalesHeader.Amount: %1', SalesHeader.Amount);

        OpenSalesHeader.Reset();
        OpenSalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        OpenSalesHeader.SetRange("Sell-to Customer No.", Customer."No.");
        OpenSalesHeader.SetRange(Status, OpenSalesHeader.Status::Open);

        if OpenSalesHeader.FindSet() then
            OpenSalesHeader.SetAutoCalcFields(Amount);
        repeat
            OpenAmount += OpenSalesHeader.Amount;
        until OpenSalesHeader.Next() = 0;

        Message('Customer Balance: %1, Open Amount: %2, Credit Limit: %3 ,salesheader: %4', Customer."Balance (LCY)", OpenAmount, Customer."Credit Limit (LCY)", SalesHeader."Amount");

        if (Customer."Balance (LCY)" + OpenAmount) > Customer."Credit Limit (LCY)" then
            Error('Devansh: Credit limit exceeded.');
    end;
}



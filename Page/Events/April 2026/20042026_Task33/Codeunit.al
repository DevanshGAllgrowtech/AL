codeunit 70197 MyCodeunit
{
    procedure LoadOverdueEntries(var TempCustLedg: Record "Cust. Ledger Entry" temporary)
    var
        CustLedgEntry: Record "Cust. Ledger Entry";
        SetupRec: Record "Setup Table AGT_DG";
    begin
        // Get setup safely
        SetupRec.GetSetup(SetupRec);

        TempCustLedg.DeleteAll();

        CustLedgEntry.Reset();

        CustLedgEntry.SetRange("Document Type", CustLedgEntry."Document Type"::Invoice);
        CustLedgEntry.SetRange("Posting Date", SetupRec."Posting From", SetupRec."Posting To");
        CustLedgEntry.SetFilter("Due Date", '<%1', Today);
        CustLedgEntry.SetRange(Open, true);

        if CustLedgEntry.FindSet() then
            repeat
                TempCustLedg := CustLedgEntry;
                TempCustLedg.Insert(true);
            until CustLedgEntry.Next() = 0;
    end;

    procedure SendEmails(var TempCustLedg: Record "Cust. Ledger Entry" temporary)
    var
        CustomerRec: Record Customer;
        Email: Codeunit "Email";
        EmailMessage: Codeunit "Email Message";
    begin
        // if TempCustLedg.FindSet() then
        //     repeat
        //         // https://businesscentralgeek.com/5-ways-to-send-an-email-in-business-central
        //         if CustomerRec.Get(TempCustLedg."Customer No.") then
        //             if CustomerRec."E-Mail" <> '' then begin

        //                 EmailMessage.Create(CustomerRec."E-Mail", 'Overdue Invoice Reminder', StrSubstNo('Dear %1\, your invoice %2 is overdue. Please make payment.', CustomerRec.Name, TempCustLedg."Document No."));
        //                 Email.Send(EmailMessage);
        //             end;

        //     until TempCustLedg.Next() = 0;

        if CustomerRec.Get('C00610') then begin
            if CustomerRec."E-Mail" <> '' then begin
                Message('%1', CustomerRec."E-Mail");
                EmailMessage.Create(CustomerRec."E-Mail", 'Overdue Invoice Reminder', StrSubstNo('Dear %1\, your invoice %2 is overdue. Please make payment.', CustomerRec.Name));
                Email.Send(EmailMessage);
            end;
        end;
        Message('Emails sent successfully.');
    end;
}
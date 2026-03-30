codeunit 70000 "Customer Ledger Entry Event"
{
    SingleInstance = true;
    // "Flow custom field value from Sales Header to Customer Ledger Entry using event
    // 1. Create a new field in Sales Header (text or code or Boolean)
    // 2. Create the same field in Customer Ledger Entry table
    // 3. Upon posting the sales order, custom field value should flow to customer ledger entry"


    // [EventSubscriber(ObjectType::table, database::"Gen. Journal Line", OnBeforeGetCustLedgerEntry, '', true, true)]
    // local procedure MyProcedure(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; CommitIsSuppressed: Boolean; InvtPickPutaway: Boolean; var CustLedgerEntry: Record "Cust. Ledger Entry"; WhseShip: Boolean; WhseReceiv: Boolean; PreviewMode: Boolean)
    // // var
    // // tempRecSH: Record "Sales Header";
    // // tempRecCust: Record "Cust. Ledger Entry";
    // // // generalJournalRef: Record genjnl
    // // tempDesc: TExt[100];
    // begin
    //     // tempRecSH := SalesHeader;
    //     // tempDesc := 'Order ' + tempRecSH."No.";
    //     // Message('%1', tempDesc);
    //     // // if (PostingCodeunitID = codeunit::"Sales-Post (Yes/No)") then begin
    //     // tempRecCust.Reset();
    //     // tempRecCust.SetRange("Document No.", SalesInvHdrNo);
    //     // if tempRecCust.FindFirst() then begin
    //     //     // repeat
    //     //     tempRecCust."temp field" := tempRecSH."temp field";
    //     //     tempRecCust.Modify();
    //     //     // until tempRecCust.Next() = 0;
    //     // end;
    //     if (SalesHeader."Document Type" = SalesHeader."Document Type"::Invoice) then
    //         CustLedgerEntry."temp field" := SalesHeader."temp field";

    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforePostCustLedgEntry, '', true, true)]
    // local procedure MyProcedure()
    // begin

    // end;


    // [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", OnAfterCopyGenJnlLineFromCustLedgEntry, '', false, false)]
    // local procedure FlowCustomFieldToCLE(CustLedgerEntry: Record "Cust. Ledger Entry"; var GenJournalLine: Record "Gen. Journal Line")
    // var
    //     SalesHeader: Record "Sales Header";
    // begin
    //     if SalesHeader.Get(GenJournalLine."Document No.") then
    //         CustLedgerEntry."temp field" := SalesHeader."temp field";
    // end;



    // [EventSubscriber(ObjectType::page, page::"Customer Ledger Entries", on, '', true, true)]
    // local procedure MyProcedure2(var RelatedRecord: Variant; var RecordFound: Boolean; var IncomingDocument: Record "Incoming Document")
    // begin
    //     // if (RelatedRecord.IsRecordRef) then begin
    //     if (IncomingDocument."Document Type" = IncomingDocument."Document Type"::"Sales Invoice") then begin

    //     end
    //     // end;
    // end;

    // // var
    // //     temp: Boolean;


    // [EventSubscriber(ObjectType::Codeunit, codeunit::"Sales-Post", OnAfterPostSalesDoc, '', true, true)]
    // local procedure MyProcedure1(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; CommitIsSuppressed: Boolean; InvtPickPutaway: Boolean; var CustLedgerEntry: Record "Cust. Ledger Entry"; WhseShip: Boolean; WhseReceiv: Boolean; PreviewMode: Boolean)
    // var
    //     genJourRec: Record "Gen. Journal Line";
    // begin
    //     tempFieldData := SalesHeader."temp field";
    //     tempSalesInvoiceHeaderNo := SalesInvHdrNo;



    // end;

    // [EventSubscriber(ObjectType::Table, Database::"Cust. Ledger Entry", OnBeforeInsertEvent, '', true, true)]
    // local procedure MyProcedure(var Rec: Record "Cust. Ledger Entry")
    // begin
    //     Rec.Reset();
    //     Rec.SetRange("Document No.");
    // end;


    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforePostSalesDoc, '', true, true)]
    // local procedure MyProcedure(var SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; PreviewMode: Boolean; var HideProgressWindow: Boolean; var IsHandled: Boolean; var CalledBy: Integer)
    // begin

    //     if (SalesHeader."Document Type" = SalesHeader."Document Type"::Invoice) then begin
    //         // tempSalesInvoiceHeaderNo := SalesHeader."No.";
    //         tempFieldData := SalesHeader."temp field";
    //     end;

    //     Message('%1\%2', tempSalesInvoiceHeaderNo, tempFieldData);
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", OnBeforeCustLedgEntryInsert, '', true, true)]
    // local procedure MyProcedure2(var CustLedgerEntry: Record "Cust. Ledger Entry"; var GenJournalLine: Record "Gen. Journal Line"; GLRegister: Record "G/L Register"; var TempDtldCVLedgEntryBuf: Record "Detailed CV Ledg. Entry Buffer"; var NextEntryNo: Integer)
    // begin
    //     CustLedgerEntry.SetRange("Document No.", GenJournalLine."Document No.");
    //     Message('%1', CustLedgerEntry);

    //     if (CustLedgerEntry.FindSet()) then begin
    //         // repeat
    //         CustLedgerEntry."temp field" := tempFieldData;
    //         // until CustLedgerEntry.Next() = 0;
    //     end

    // end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforeSalesInvHeaderInsert, '', true, true)]
    local procedure CaptureTempField(var SalesInvHeader: Record "Sales Invoice Header"; var SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; var IsHandled: Boolean; WhseShip: Boolean; WhseShptHeader: Record "Warehouse Shipment Header"; InvtPickPutaway: Boolean)
    begin
        // Only handle sales invoices 
        // if SalesHeader."Document Type" = SalesHeader."Document Type"::Invoice then begin
        // TempFieldData := ;
        // tempSalesInvoiceHeaderNo := ;
        // Message('%1, %2', tempSalesInvoiceHeaderNo, tempFieldData);
        // storeTempFieldDataAndRef(SalesInvLine."Document No.", SalesHeader."temp field");
        tempFieldData := SalesHeader."temp field";
        tempSalesInvoiceHeaderNo := SalesInvHeader."No.";
        // end;

        // simple assignment 
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", OnBeforeCustLedgEntryInsert, '', true, true)]
    local procedure UpdateCustLedgerEntry(var CustLedgerEntry: Record "Cust. Ledger Entry"; var GenJournalLine: Record "Gen. Journal Line")
    var
        tempSalesHeaderRec: Record "Sales Header";
        tempText: text[20];

    begin
        // Assign the stored temp field value to the Cust. Ledger Entry 
        // Message('%1', GenJournalLine."Document No.");
        // if (tempSalesHeaderRec.get(GenJournalLine."Document Type", GenJournalLine."Document No.")) then begin
        //     Message('%1', tempSalesHeaderRec);
        //     CustLedgerEntry."temp field" := tempSalesHeaderRec."temp field";
        // end;
        // Message('%1, %2', tempSalesInvoiceHeaderNo, tempFieldData);
        // tempText := 'Order ' + getTempFieldRef();
        Message('%1,\%2\%3', GenJournalLine."Document No.", tempSalesInvoiceHeaderNo, tempFieldData);
        // if CustLedgerEntry.Description = tempText then begin
        if GenJournalLine."Document No." = tempSalesInvoiceHeaderNo then begin
            CustLedgerEntry."temp field" := getTempFieldData();
            tempSalesInvoiceHeaderNo := '';
            tempFieldData := '';
        end;

        //     Message('%1', CustLedgerEntry."temp field");
        // end;

    end;

    procedure storeTempFieldDataAndRef(var a: Code[20]; var b: text[20])
    begin
        tempSalesInvoiceHeaderNo := a;
        tempFieldData := b;

        Message('%1\%2', tempSalesInvoiceHeaderNo, tempFieldData);
    end;

    procedure getTempFieldData(): text[20]
    begin
        // Message('%1', tempFieldData);
        exit(tempFieldData);
    end;

    procedure getTempFieldRef(): code[20]
    begin
        // Message('%1', getTempFieldRef());
        exit(tempSalesInvoiceHeaderNo);
    end;

    var
        tempSalesInvoiceHeaderNo: Code[20];
        tempFieldData: text[20];
}
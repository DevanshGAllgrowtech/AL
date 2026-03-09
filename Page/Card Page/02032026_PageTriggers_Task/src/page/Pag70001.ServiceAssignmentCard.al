page 70001 "Service Assignment Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Service Assignment";
    Caption = 'Service Assignment Card AGT_DG';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Assignment No."; Rec."Assignment No.")
                {
                }
                field("Customer No."; customerNo)
                {

                }
                field("Customer Name"; Rec."Customer Name")
                {
                    Editable = false;
                }
                field("Service Cost"; Rec."Service Cost") { }
                field("Tax Amount"; taxAmount)
                {
                    Editable = false;
                }
                field("Total Amount"; totalAmount)
                {
                    Editable = false;
                }
                field(Status; Rec.Status) { }
                field("Assignment Date"; Rec."Assignment Date") { }

            }
        }
    }
    trigger OnInsertRecord(bool: Boolean): Boolean
    begin
        calculateTaxAmountAndTotalAmount(xRec."Service Cost", Rec."Service Cost");
        populateCustomerName('', customerNo);
    end;

    trigger OnModifyRecord(): Boolean

    begin
        calculateTaxAmountAndTotalAmount(xRec."Service Cost", Rec."Service Cost");
        populateCustomerName(oldCustomerNo, customerNo);
    end;

    trigger OnOpenPage()
    begin
        if Rec.Status = Rec.Status::Completed then begin
            Error('You are not allowed to perform modification on current record as the status is COMPLETED.');
            CurrPage.Editable := false;
        end else begin
            CurrPage.Editable := true;
        end;
    end;

    procedure calculateTaxAmountAndTotalAmount(oldServiceCost: Decimal; currServiceCost: Decimal)
    var
        localTaxAmount: Decimal;
    begin
        if oldServiceCost <> currServiceCost then begin
            localTaxAmount := 0.18;
            taxAmount := currServiceCost * localTaxAmount;
            totalAmount := currServiceCost * 1.18;
        end;
    end;

    procedure populateCustomerName(oldCustPK: code[20]; currCustPK: code[20])
    var
        getCustomerRec: Record Customer;
    begin
        if oldCustPK <> currCustPK then begin
            if getCustomerRec.Get(currCustPK) then begin
                Rec."Customer Name" := getCustomerRec.Name;
            end else begin
                Message('Customer not exists with Customer No. = "%1"', currCustPK);
            end;
        end;

        if oldCustPK = '' then begin
            oldCustPK := currCustPK;
        end;

    end;

    var
        taxAmount: Decimal;
        totalAmount: Decimal;
        oldcustomerNo, customerNo : Code[20];
}
codeunit 70000 "Event Subscribe AGT_DG"

{
    [EventSubscriber(ObjectType::Table, Database::Customer, OnAfterOnInsert, '', true, true)]
    local procedure myCustomEvent(var Customer: Record Customer; xCustomer: Record Customer)
    begin
        // Message('T1');
        // if (Customer."No." = xCustomer."No.") then
        Customer."Credit Limit (LCY)" := 200;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Customer Card", OnAfterGetCurrRecordEvent, '', true, true)]
    local procedure myCustomerCardCityPopulateEvent(var Rec: Record Customer)
    var
        tempCity: text[30];
    begin
        // Message('T2');
        // if Customer."No." = xCustomer."No." then
        tempCity := Rec.City;
        if (tempCity = '') then begin
            Rec.City := 'temp City AGT_DG';
            Rec.Modify();
        end;
    end;


    [EventSubscriber(ObjectType::Page, Page::"Sales Order", OnPostDocumentBeforeNavigateAfterPosting, '', true, true)]
    local procedure MyProcedure()
    begin
        Message('Sales Order Posted AGT_DG');
    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, OnAfterValidateEvent, 'name', true, true)]
    local procedure MyProcedure2(var Rec: Record Customer; currFieldNo: Integer)
    var
        tempName: Text[100];
    begin
        // Customer.CalcFields(Name);

        Message('T4');
        tempName := Rec.Name;
        if tempName <> '' then begin
            // Customer.CalcFields(Name);
            tempName := Rec.Name;
            // Message('%1', tempName);
            Message('Value you entered in name field is ->%1', tempName);
        end
    end;
}
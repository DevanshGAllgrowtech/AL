// codeunit 70000 "Block Posting AGT DG"
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforePostSalesDoc, '', true, true)]
//     local procedure BockSO(var SalesHeader: Record "Sales Header")
//     var
//         dueBalOfCust: Decimal;
//         CustLedgRec: Record "Cust. Ledger Entry";
//         countOfOverDueInvoice: Integer;
//         isConditionFulfilled, isSuperUser : Boolean;

//         UserPermissionSuper: Codeunit "User Permissions";

//     begin
//         CustLedgRec.SetRange("Customer No.", SalesHeader."Sell-to Customer No.");
//         CustLedgRec.SetFilter("Due Date", '<%1', Today);
//         CustLedgRec.SetFilter("Remaining Amount", '>0');
//         countOfOverDueInvoice := CustLedgRec.Count;

//         if CustLedgRec.FindSet() then begin
//             repeat
//                 CustLedgRec.CalcFields("Remaining Amount");
//                 dueBalOfCust += CustLedgRec."Remaining Amount";
//             until CustLedgRec.Next() = 0;
//         end;
//         if (dueBalOfCust > 10000) or (countOfOverDueInvoice > 2) then begin
//             isConditionFulfilled := true;
//         end;

//         // Reference : https://yzhums.com/25886/
//         isSuperUser := UserPermissionSuper.IsSuper(UserSecurityId());

//         if isConditionFulfilled then begin
//             if isSuperUser then begin
//                 Message('Congratulations %1!\You are a SUPER USER.\Overdue invoices for "%2" -> %3,\Overdue amount -> %4', UserId, SalesHeader."Sell-to Customer No.", countOfOverDueInvoice, dueBalOfCust);
//             end else begin
//                 if Confirm('Only users with a SUPER user should be allowed to override and continue posting.') then begin
//                     Error('Overdue amount > 10,000 and Overdue invoices < 3 by AGT_DG');
//                 end;
//             end;
//         end;
//     end;
// }
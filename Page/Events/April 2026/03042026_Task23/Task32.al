// codeunit 70006 MyCodeunit
// {
//     // Task 32:

//     // Create a custom field in sales line and it should have same base validation as other fields when order is released.
//     [EventSubscriber(ObjectType::Page, Page::"Sales Order", 'OnBeforeActionEvent', 'Release', false, false)]
//     local procedure CheckMyField(var Rec: Record "Sales Header")
//     var
//         SalesLine: Record "Sales Line";
//     begin
//         SalesLine.Reset();
//         SalesLine.SetRange("Document Type", Rec."Document Type");
//         SalesLine.SetRange("Document No.", Rec."No.");

//         if SalesLine.FindSet() then begin
//             repeat
//                 if SalesLine.Quantity > 0 then
//                     Error('Please fill Quantity field before release AGT_DG');
//             until SalesLine.Next() = 0;
//         end;
//     end;
// }
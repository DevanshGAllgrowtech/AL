// codeunit 70001 "Task27"
// {

//     //  Task 27

//     //  "Concatenating my name in the description field of the last
//     //  line of sales lines in the sales invoice.
//     [EventSubscriber(ObjectType::Table, Database::"Sales Invoice Line", OnBeforeInsertEvent, '', true, true)]
//     local procedure SalesInvoiceLineOnBeforeInsert(var Rec: Record "Sales Invoice Line")
//     var
//         SalesInvLine: Record "Sales Invoice Line";
//     begin
//         SalesInvLine.Reset();
//         SalesInvLine.SetRange("Document No.", Rec."Document No.");
//         if SalesInvLine.FindLast() then begin
//             Rec.Description := Rec.Description + ' - AGT_DG';
//         end;
//     end;


// }
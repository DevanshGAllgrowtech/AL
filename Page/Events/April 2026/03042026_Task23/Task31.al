// codeunit 70005 "Task 31"
// {
//     // Task 31:

//     // "Throwing an error and restricting posting when the 
//     // quantity entered for an item is greater
//     //  than the quantity i n hand for that particular item in inventory."

//     [EventSubscriber(ObjectType::Table, Database::"Purchase Line", OnAfterValidateEvent, 'Quantity', false, false)]
//     local procedure CheckInventory(var Rec: Record "Purchase Line")
//     var
//         Item: Record Item;
//     begin

//         if Rec.Type = Rec.Type::Item then begin
//             if Item.Get(Rec."No.") then begin
//                 item.CalcFields(Inventory);
//                 if Rec.Quantity > Item.Inventory then
//                     Error('Devansh: Enough stock does not exists');
//             end;

//         end;
//     end;
// }
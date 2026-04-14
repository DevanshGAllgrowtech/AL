// codeunit 70000 "Ship SO When Release"
// {

//     //     Task: 23
//     //     "when user clicks release it should automatically 
//     // ship the order without manually clicking the post.
//     // "


//     [EventSubscriber(ObjectType::page, Page::"Sales Order", OnAfterActionEvent, 'Release', true, true)]
//     local procedure MyProcedure(var Rec: Record "Sales Header")
//     var
//         SalesPost: Codeunit "Sales-Post";
//     begin
//         Rec.Invoice := false;
//         Rec.Ship := true;
//         SalesPost.Run(Rec);
//     end;
// }
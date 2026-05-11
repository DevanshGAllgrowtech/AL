// report 70001 "Inventory By Location AGT_DG"
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     DefaultLayout = RDLC;
//     RDLCLayout = './Inventory_By_Location.rdl';

//     dataset
//     {
//         dataitem(Item; Item)
//         {
//             column(No_; "No.") { }
//             column(Description; Description) { }

//             dataitem(ItemLedger; "Item Ledger Entry")
//             {
//                 DataItemLink = "Item No." = field("No.");
//                 DataItemTableView = where("Location Code" = filter('EAST|WEST|MAIN'));
//                 column(LocationCode; "Location Code") { }
//                 column(RemainingQty; "Remaining Quantity") { }

//             }
//         }
//     }
// }

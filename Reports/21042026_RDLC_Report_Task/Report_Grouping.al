// report 70001 "Sales Report Grouping AGT_DG"
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     DefaultLayout = RDLC;
//     RDLCLayout = './SalesOrder_Grouping.rdl';

//     dataset
//     {
//         dataitem(Customer; Customer)
//         {

//             column(No_; "No.")
//             {

//             }
//             column(Name; "Name")
//             {

//             }

//             dataitem("Sales Header"; "Sales Header")

//             {
//                 DataItemLink = "Sell-to Customer No." = field("No.");
//                 column("Order_No_"; "No.")
//                 {

//                 }
//                 column("Cus_Name"; "Sell-to Customer Name")
//                 {

//                 }
//             }
//         }

//     }
// }

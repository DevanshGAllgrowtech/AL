// report 70000 "Custom Sales Report AGT_DG"
// {
//     Caption = 'Custom Sales Report AGT_DG';
//     UsageCategory = Administration;
//     ApplicationArea = All;
//     DefaultLayout = RDLC;
//     RDLCLayout = './Sales_Order.rdl';

//     dataset
//     {
//         dataitem("Sales Header"; "Sales Header")
//         {
//             column(No_; "No.")
//             {
//                 Caption = 'Order No.';
//             }
//             column(Sell_to_Customer_Name; "Sell-to Customer Name")
//             {
//                 Caption = 'Customer Name';
//             }
//             column(Order_Date; "Order Date")
//             {
//                 Caption = 'Order Date';
//             }
//             column(Posting_Date; "Posting Date")
//             {
//                 Caption = 'Posting Date';
//             }
//             column(Status; Status)
//             {

//             }
//             column(Amount; Amount)
//             {

//             }
//         }

//         // requestpage
//         // {
//         //     layout
//         //     {
//         //         area(Content)
//         //         {
//         //             group(GroupName)
//         //             {
//         //                 field(Name; SourceExpression)
//         //                 {
//         //                     ApplicationArea = All;

//         //                 }
//         //             }
//         //         }
//         //     }
//         // }
//     }
// }
report 70000 "PO Vendor ByDate AGT_DG"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './PO_Vendor_ByDate2.rdl';


    dataset
    {
        dataitem(Vendor; Vendor)
        {
            column(Name; Name)
            {

            }
            dataitem("Purchase Header"; "Purchase Header")
            {
                DataItemLink = "Buy-from Vendor No." = field("No.");
                DataItemTableView = sorting("Document Date") order(descending);
                column(Document_Date; "Document Date") { }
                column(No_; "No.") { }
                column(MonthYear; Format("Document Date", 0, '<Month Text> <Year4>')) { }
            }
        }
    }

    // requestpage
    // {
    //     AboutTitle = 'Teaching tip title';
    //     AboutText = 'Teaching tip content';
    //     layout
    //     {
    //         area(Content)
    //         {
    //             group(GroupName)
    //             {
    //                 field(Name; SourceExpression)
    //                 {

    //                 }
    //             }
    //         }
    //     }

    //     actions
    //     {
    //         area(processing)
    //         {
    //             action(LayoutName)
    //             {

    //             }
    //         }
    //     }
    // }

    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = Excel;
    //         LayoutFile = 'mySpreadsheet.xlsx';
    //     }
    // }

    var
        myInt: Integer;
}
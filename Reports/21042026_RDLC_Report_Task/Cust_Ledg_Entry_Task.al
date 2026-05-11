report 70002 "CustLed Report Grouping AGT_DG"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Amount_with_line.rdl';

    dataset
    {
        dataitem("Salesperson/Purchaser"; "Salesperson/Purchaser")
        {
            column(Code; Code) { }
            column(Name; "Name") { }

            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLink = "Salesperson Code" = field(Code);
                // DataItemTableView = where("Document Type" = );
                column(Customer_Name; "Customer Name") { }
                column(Document_No_; "Document No.") { }

                dataitem("Sales Invoice Header"; "Sales Invoice Header")
                {
                    DataItemLink = "No." = field("Document No.");
                    // column(Line_No_; "Line No.") { }
                    column(Amount; Amount) { }
                }
            }
        }

    }
}

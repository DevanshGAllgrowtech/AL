report 70000 "RDLC_Cust_Item_PS_Relation"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './RDLC_Cust_Item_Posted_Sales_Relation.rdl';

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(No_; "No.") { }
            column(Name; Name) { }
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Sell-to Customer No." = field("No.");

                column(Item_No; "No.") { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(Amount; Amount) { }
                column(CompanyName; Database.CompanyName) { }
                column(CompanyImage; CompInf.CalcFields(Picture)) { }
            }
        }
    }
    var
        CompInf: Record "Company Information";

}
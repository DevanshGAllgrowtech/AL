report 70000 "Item_ByLoc_Total_Purchase_Sale"
{
    Caption = 'Item_ByLoc_Total_Purchase_Sale';
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Item_ByLoc_Total_Purchase_Sale_4.rdl';

    dataset
    {
        dataitem(Item; Item)
        {
            column(No_; "No.") { }
            column(Description; Description) { }

            dataitem(ItemLedger; "Item Ledger Entry")
            {
                DataItemLink = "Item No." = field("No.");
                DataItemTableView = where("Location Code" = filter('EAST|WEST|MAIN'));

                column(LocationCode; "Location Code") { }
                column(RemainingQty; "Remaining Quantity") { }
                // https://community.dynamics.com/blogs/post/?postid=72cf2996-f6c3-4c3f-b021-848e91428e5c
                column(Quantity; Quantity) { }
                column(EntryType; "Entry Type") { }
            }
        }
    }
}
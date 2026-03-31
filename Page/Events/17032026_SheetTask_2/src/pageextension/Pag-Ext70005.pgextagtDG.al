pageextension 70005 "pg ext agt_DG" extends "Customer Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addbefore("Document No.")
        {
            // group("Customer AGT_DG")
            // {
            field("temp field"; Rec."temp field")
            {
                ApplicationArea = all;
            }
            // }
        }
    }
}
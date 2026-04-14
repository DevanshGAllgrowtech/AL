pageextension 70002 "Sh Fld Purch Order" extends "Purchase Order"
{
    layout
    {
        addafter("Vendor Invoice No.")
        {
            field("Cstm Fld AGT_DG"; Rec."Cstm Fld AGT_DG")
            {
                ApplicationArea = all;
            }
        }
    }
}
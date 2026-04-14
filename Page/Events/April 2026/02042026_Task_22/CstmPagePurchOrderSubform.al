pageextension 70003 "Sh Field Puch Ord Sub" extends "Purchase Order Subform"
{
    layout
    {
        addafter("Item Reference No.")
        {
            field("Cstm Fld AGT_DG"; Rec."Cstm Fld AGT_DG")
            {
                ApplicationArea = all;
                Editable = false;
            }
        }
    }
}
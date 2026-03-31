pageextension 70014 "PG Extn AGT_DG sl" extends "Sales Order Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter(Description)
        {
            field("Cstm Field AGT_DG"; Rec."Cstm Field AGT_DG")
            {
                ApplicationArea = all;
            }
        }
    }
}
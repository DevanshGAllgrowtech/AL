pageextension 70001 "Pg Extn AGT_DG" extends "Item Card"
{
    layout
    {
        addafter("Unit Volume")
        {
            field("SO AGT_DG"; Rec."SO AGT_DG")
            {
                ApplicationArea = all;
                Editable = false;
            }
            field("PO AGT_DG"; Rec."PO AGT_DG")
            {
                ApplicationArea = all;
                Editable = false;
            }
        }
    }
}
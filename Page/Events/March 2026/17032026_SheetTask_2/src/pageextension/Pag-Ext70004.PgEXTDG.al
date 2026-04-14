pageextension 70004 "Pg EXT DG" extends "Sales Order"
{
    layout
    {
        // Add changes to page layout here
        addbefore(General)
        {
            group("Custom AGT_DG")
            {
                field("temp field"; Rec."temp field")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}
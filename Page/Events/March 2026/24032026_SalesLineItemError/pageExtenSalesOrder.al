pageextension 70011 addField extends "Sales Order"
{
    layout
    {
        // Add changes to page layout here
        addafter(General)
        {
            field("Cstm Field AGT_DG"; Rec."Cstm Field AGT_DG")
            {
                ApplicationArea = all;
                trigger OnValidate()
                begin

                end;
            }
        }
    }
}
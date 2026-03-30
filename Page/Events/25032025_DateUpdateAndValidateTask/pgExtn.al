pageextension 70001 "cstm pgextn AGt_DG" extends "Sales Order Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter(Description)
        {
            field("Temp Field AGT_DG"; Rec."Temp Field AGT_DG")
            {
                ApplicationArea = all;
                trigger OnValidate()
                begin
                    if (Rec."Temp Field AGT_DG" < Today) then begin
                        Error('Date out of range');
                    end;
                end;
            }
        }
    }
}
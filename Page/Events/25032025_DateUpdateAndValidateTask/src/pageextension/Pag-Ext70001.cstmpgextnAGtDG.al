pageextension 70001 "cstm pgextn AGt_DG" extends "Sales Order Subform"
{

    //     Task:
    //     "
    // Add a new custom date field in the Sales Line table. When a user enters this date, the system should 
    // automatically update the existing Shipment Date to two days earlier than the entered. 
    // Additionally, the system must validate that the field is later than today’s date, and if not, raise an error stating 
    // ' date is out of range
    // "
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
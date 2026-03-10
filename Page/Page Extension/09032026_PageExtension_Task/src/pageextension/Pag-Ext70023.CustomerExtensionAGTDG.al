pageextension 70023 "Customer Extension AGT_DG" extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
        modify(Blocked)
        {
            trigger OnBeforeValidate()
            begin
                if Rec.Blocked = Rec.Blocked::All then begin
                    changeEditProperty := false;
                    // changeForCreditLimit := true;
                end else begin
                    changeEditProperty := true;
                    // changeForCreditLimit := false;
                end;
            end;
        }
        modify(Name)
        {
            Editable = changeEditProperty;
        }
        modify("Credit Limit (LCY)")
        {
            Editable = changeEditProperty;
        }
        addafter(General)
        {
            group("Service Information AGT_DG")
            {
                Caption = 'Service Information AGT_DG';
                field(Contact; Rec.Contact)
                {
                    Caption = 'Contact AGT_DG';
                    ApplicationArea = all;
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    Caption = 'Phone AGT_DG';
                    ApplicationArea = all;
                    Editable = changeEditProperty;
                }
                // field("E-Mail"; Rec."E-Mail")
                // {
                //     Caption = 'Email AGT_DG';
                //     ApplicationArea = all;
                // }

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        changeEditProperty: Boolean;
        changeForCreditLimit: Boolean;
}
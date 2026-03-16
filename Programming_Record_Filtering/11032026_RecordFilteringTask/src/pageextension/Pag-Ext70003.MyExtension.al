pageextension 70003 MyExtension extends "Vendor Card"
{
    layout
    {
        addafter("Payment Terms Code")
        {
            field("Custom PTC AGT_DG"; CustomPTC)
            {
                ApplicationArea = all;
                trigger OnLookup(var myText: Text): Boolean
                var
                    ptRecs: Record "Payment Terms";
                begin
                    if page.RunModal(page::"Payment Terms", ptRecs) = Action::LookupOK then begin
                        myText := ptRecs.Code;
                    end;
                    exit(true);
                end;

                trigger OnValidate()
                begin
                    vendorRecs.Reset();
                    vendorRecs.SetRange("Payment Terms Code", CustomPTC);
                    if vendorRecs.FindFirst() then begin
                        Message('%1 \%2', CustomPTC, vendorRecs.Name);
                    end else begin
                        Message('No matching vendor found');
                    end;
                end;
            }
        }
    }

    var
        CustomPTC: Code[10];
        vendorRecs: Record Vendor;
}
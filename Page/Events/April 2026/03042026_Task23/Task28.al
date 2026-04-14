codeunit 70003 "Task 28"
{
    //  Task 28:

    //  "Ensuring the new field flows from the                                                                                                                                                                                                                                       Sales header to the posted Sales header
    //  while shipping, with different IDs for
    //  the new field but the same name."

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforeSalesInvHeaderInsert, '', true, true)]
    local procedure CopyCustomFieldToPostedInvoiceHeader(var SalesInvHeader: Record "Sales Invoice Header"; SalesHeader: Record "Sales Header")
    begin
        SalesInvHeader."Custom Field" := SalesHeader."Custom Field";
    end;

}

tableextension 70100 SalesHeaderExt extends "Sales Header"
{
    fields
    {
        field(50100; "Custom Field"; Text[100])
        {
            Caption = 'Custom Field';
            DataClassification = CustomerContent;
        }
    }
}

pageextension 70101 "SO Page Ext" extends "Sales Order"
{
    layout
    {
        // Add changes to page layout here
        addfirst(General)
        {
            field("Custom Field"; Rec."Custom Field")
            {

            }
        }
    }
}

tableextension 70102 SalesInvHeaderExt extends "Sales Invoice Header"
{
    fields
    {
        field(50101; "Custom Field"; Text[100])
        {
            Caption = 'Custom Field';
            DataClassification = CustomerContent;
        }
    }
}

pageextension 70103 "SIH PG EXT" extends "Posted Sales Invoice"
{
    layout
    {
        // Add changes to page layout here
        addfirst(General)
        {
            field("Custom Field"; Rec."Custom Field") { }
        }
    }
}
page 70008 "Service Agreement List"
{
    Editable = false;
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Service Assignment";
    Caption = 'Service Agreement List AGT_DG';
    CardPageId = "Service Assignment Card";

    layout
    {
        area(Content)
        {
            repeater("Service Data")
            {
                field("Assignment No."; Rec."Assignment No.")
                {

                }
                field("Customer Name"; Rec."Customer Name") { }
                field("Service Cost"; Rec."Service Cost") { }
                field(Status; Rec.Status) { }
                field("Assignment Date"; Rec."Assignment Date") { }

            }
        }
        area(Factboxes)
        {

        }
    }

    trigger OnOpenPage()
    var
        tempStatus: Option Open,Released,Completed;
    // serviceAgreementRecs: Record "Service Assignment";
    begin

        Rec.SetRange(Status, tempStatus::Open);
        // CurrPage.GetRecord(serviceAgreementRecs);
        // currpage.SetSelectionFilter(serviceAgreementRecs);
    end;

    trigger OnAfterGetCurrRecord()
    begin
        if Rec."Service Cost" > 10000 then begin
            Message('High value service assignment');
        end;
    end;
}
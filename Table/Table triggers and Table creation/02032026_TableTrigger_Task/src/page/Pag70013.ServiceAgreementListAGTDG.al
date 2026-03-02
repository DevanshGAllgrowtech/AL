page 70013 "Service Agreement List AGT_DG"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Service Agreement AGT_DG";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Assignment No."; Rec."Assignment No.")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                    Lookup = true;
                    trigger OnLookup(var myText: Text): Boolean
                    var
                        CustomerRecs: Record Customer;
                    begin
                        if Page.RunModal(Page::"Customer List", CustomerRecs) = Action::LookupOK then begin
                            Rec."Customer No." := CustomerRecs."No.";
                            Rec."Customer Name" := CustomerRecs.Name;
                            myText := CustomerRecs."No.";
                        end;
                    end;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    Editable = false;
                }
                field("Service Cost"; Rec."Service Cost")
                {
                    trigger OnValidate()
                    begin
                        if (Rec."Service Cost" < 0) then begin
                            Error('Service cost cannot be lest than 0.');
                        end;
                    end;
                }
                field(Status; Rec.Status)
                {

                }
                field("Created By"; Rec."Created By") { Editable = false; }
                field("Modified By"; Rec."Modified By") { Editable = false; }
                field("Created Date"; Rec."Created Date") { Editable = false; }
                field("Modified Date"; Rec."Modified Date") { Editable = false; }
            }
        }
    }

    trigger OnInsertRecord(bool: Boolean): Boolean
    begin
        Rec."Created Date" := Today;
        Rec."Created By" := UserId;
    end;

    trigger OnModifyRecord(): Boolean
    var
        getCurrentCustomerNo: Code[20];
    begin
        getCurrentCustomerNo := xRec."Customer No.";
        if Rec."Customer No." <> getCurrentCustomerNo then begin
            Rec."Modified Date" := Today;
            Rec."Modified By" := UserId;
        end;
    end;
}
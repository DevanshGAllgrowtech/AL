page 70200 "Overdue Invoice Email AGT_DG"
{
    PageType = List;
    SourceTable = "Cust. Ledger Entry";
    SourceTableTemporary = true;
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater("Customer Entries")
            {
                field("Customer No."; Rec."Customer No.") { }
                field("Customer Name"; Rec."Customer Name") { }
                field("Document No."; Rec."Document No.") { }
                field("Posting Date"; Rec."Posting Date") { }
                field("Due Date"; Rec."Due Date") { }
                field("Remaining Amount"; Rec."Remaining Amount") { }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Send Email AGT_DG")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    OverdueMgmt.SendEmails(Rec);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        OverdueMgmt.LoadOverdueEntries(Rec);
        CurrPage.Update();
    end;

    var
        OverdueMgmt: Codeunit MyCodeunit;
}
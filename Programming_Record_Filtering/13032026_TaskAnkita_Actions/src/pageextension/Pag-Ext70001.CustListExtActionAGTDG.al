pageextension 70001 "Cust List Ext Action AGT_DG" extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("&Customer")
        {
            action("Filter customers where:Balance > 50 AGT_DG")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    tempCustTable: Record Customer temporary;
                    custRecs: Record Customer;
                    tempCustRec: Record Customer;

                    count: Integer;
                    lastCustomerName: Text[100];
                begin
                    custRecs.Reset();
                    custRecs.SetFilter("Balance (LCY)", '> 50');

                    if custRecs.FindSet() then begin
                        count := 0;
                        repeat
                            tempCustTable.Init();
                            tempCustTable."No." := custRecs."No.";
                            tempCustTable.Insert();
                            count += 1;
                        until custRecs.Next() = 0;
                    end;

                    tempCustTable.Reset();
                    if tempCustTable.FindLast() then begin
                        tempCustRec.get(tempCustTable."No.");
                        lastCustomerName := tempCustRec.Name;
                        Message('High value Customers in Temporary Customer Table -> %1 \\Last Customer in Temporary Customer Table -> %2 \\Customer Name -> %3', count, tempCustTable."No.", lastCustomerName);
                    end;
                end;
            }
        }
    }

    var
        myInt: Integer;
}
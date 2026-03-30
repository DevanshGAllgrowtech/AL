codeunit 70000 "AGT_DG Codeunit"
{
    //Sales line to Item ledger entry

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterPostSalesLine, '', true, true)]
    local procedure MyProcedure()
    begin

    end;

    var
        myInt: Integer;
}
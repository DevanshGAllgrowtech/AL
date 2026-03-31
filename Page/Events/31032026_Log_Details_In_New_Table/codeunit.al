codeunit 70000 "Log Details in CT AGT_DG"
{
    [EventSubscriber(ObjectType::Page, Page::"Sales Order", OnAfterActionEvent, 'Release', true, true)]
    local procedure MyProcedure()
    begin

    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order", OnAfterActionEvent, 'Reopen', true, true)]
    local procedure MyProcedure()
    begin

    end;
}
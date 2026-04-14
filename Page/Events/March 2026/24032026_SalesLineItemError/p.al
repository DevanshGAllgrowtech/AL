codeunit 70000 "Prince Task AGT_DG"
{
    [EventSubscriber(ObjectType::Codeunit, codeunit::"Copy Item", OnCopyItemOnBeforeTargetItemInsert, '', true, true)]
    local procedure MyProcedure(var CopyItemBuffer: Record "Copy Item Buffer"; SourceItem: Record Item; var TargetItem: Record Item)
    begin
        TargetItem.Description := 'Copied Item AGT_DG';
    end;
}
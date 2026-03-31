codeunit 70000 "Log Details in CT AGT_DG"
{
    //     Task 18
    //     " On sales order after clicking on release/reopen then 
    //     user name, time and action clicked(release/reopen) needs to be logged in a new table."


    [EventSubscriber(ObjectType::Page, Page::"Sales Order", OnAfterActionEvent, 'Release', true, true)]
    local procedure UpdateRecDetailsAfterClickOnReleaseAction(var Rec: Record "Sales Header")
    begin
        InsertDetailsInCustomTableAfterClickOnActionReleaseAndReopen(Rec, 'Release');
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order", OnAfterActionEvent, 'Reopen', true, true)]
    local procedure UpdateRecDetailsAfterClickOnReopenAction(var Rec: Record "Sales Header")
    begin
        InsertDetailsInCustomTableAfterClickOnActionReleaseAndReopen(Rec, 'Reopen');
    end;

    procedure InsertDetailsInCustomTableAfterClickOnActionReleaseAndReopen(Rec: Record "Sales Header"; clickedOn: Text[50])
    var
        CustomTableRec: Record "Log Table AGT_DG";
    begin
        // UserId
        // Time
        // today
        CustomTableRec.Init();
        CustomTableRec."Click On Action Name" := clickedOn;
        CustomTableRec."Clicked Date And Time" := System.CurrentDateTime();
        CustomTableRec."Document No." := Rec."No.";
        // CustomTableRec."Clicked Time" := Time;
        CustomTableRec."User ID" := UserId;
        CustomTableRec.Status := Rec.Status;
        CustomTableRec.Insert();
    end;
}
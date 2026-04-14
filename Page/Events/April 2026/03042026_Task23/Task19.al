codeunit 70008 "Task 19"
{
    // Task 19:
    // "When creating the sales line, upon inserting the value in the ""Qty. to ship"" field - 
    // program should automatically insert / create the line into the ""Tracking specification"" table."

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, 'Qty. to Ship', true, true)]
    local procedure OnAfterValidateQtyToShip(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    var
        TrackingSpecificationRec: Record "Tracking Specification";
    begin
        if Rec."Qty. to Ship" <> xRec."Qty. to Ship" then begin
            // Create a new Tracking Specification record
            TrackingSpecificationRec.Init();
            TrackingSpecificationRec."Source Type" := DATABASE::"Sales Line";
            TrackingSpecificationRec."Source Subtype" := Rec."Document Type";
            TrackingSpecificationRec."Source ID" := Rec."Document No.";
            TrackingSpecificationRec."Source Ref. No." := Rec."Line No.";
            TrackingSpecificationRec."Quantity (Base)" := Rec."Qty. to Ship (Base)";
            TrackingSpecificationRec.Insert(true);
        end;
    end;

}
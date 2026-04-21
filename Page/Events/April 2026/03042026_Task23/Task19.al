codeunit 70008 "Task 19"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, "Qty. to Ship", true, true)]
    local procedure InsertManualReservation(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    var
        ReservEntry: Record "Reservation Entry";
        ItemRec: Record Item;
        EntryNo: Integer;
    begin
        if ItemRec.Get(Rec."No.") then begin
            if ItemRec."Item Tracking Code" = '' then begin
                Error('Please enter Item Tracking Code for Item -> %1', ItemRec."No.");
            end;
        end;

        ReservEntry.Reset();
        ReservEntry.SetRange("Source Type", Database::"Sales Line");
        ReservEntry.SetRange("Source ID", Rec."Document No.");
        ReservEntry.SetRange("Source Ref. No.", Rec."Line No.");
        ReservEntry.SetRange("Item No.", Rec."No.");
        ReservEntry.SetRange("Location Code", Rec."Location Code");
        ReservEntry.SetRange("Reservation Status", ReservEntry."Reservation Status"::Surplus);

        if ReservEntry.FindFirst() then begin
            ReservEntry.Validate("Quantity (Base)", Rec."Qty. to Ship (Base)");
            ReservEntry.Validate("Quantity", Rec."Qty. to Ship");
            ReservEntry.Validate("Shipment Date", Rec."Shipment Date");
            ReservEntry.Modify(true);
            exit;
        end;

        EntryNo := ReservEntry.GetLastEntryNo() + 1;

        ReservEntry.Init();
        ReservEntry."Entry No." := EntryNo;
        ReservEntry.Validate("Item No.", Rec."No.");
        ReservEntry.Validate("Location Code", Rec."Location Code");
        ReservEntry.Validate("Quantity (Base)", Rec."Qty. to Ship (Base)");
        ReservEntry.Validate("Quantity", Rec."Qty. to Ship");
        ReservEntry.Validate("Reservation Status", ReservEntry."Reservation Status"::Surplus);
        ReservEntry.Validate("Description", Rec.Description);
        ReservEntry.Validate("Source Type", Database::"Sales Line");
        ReservEntry.Validate("Source Subtype", 1);
        ReservEntry.Validate("Source ID", Rec."Document No.");
        ReservEntry.Validate("Source Ref. No.", Rec."Line No.");
        ReservEntry.Validate("Lot No.", ItemRec."Lot Nos.");
        ReservEntry.Validate("Shipment Date", Rec."Shipment Date");
        ReservEntry.Validate("Qty. per Unit of Measure", Rec."Qty. per Unit of Measure");
        ReservEntry.Validate("Qty. to Handle (Base)", Rec."Qty. to Ship (Base)");
        ReservEntry.Validate("Qty. to Invoice (Base)", Rec."Qty. Invoiced (Base)");
        ReservEntry.Validate("Variant Code", Rec."Variant Code");
        ReservEntry.Validate("Created By", UserId);
        ReservEntry.Validate("Creation Date", Today);
        ReservEntry.Insert(true);

        Message('Reservation Entry created for Item -> %1\ with Entry No -> %3', Rec."No.", ReservEntry."Entry No.");
    end;
}

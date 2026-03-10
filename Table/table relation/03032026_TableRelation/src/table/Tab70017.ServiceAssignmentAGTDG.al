table 70017 "Service Assignment AGT_DG"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Assignment No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Item No."; Code[20])
        {
            TableRelation = "Item Master AGT-DG"."Item No." where("Item Type" = const(Service));
            trigger OnValidate()
            begin
                populateNameAndCost("Item No.");
            end;
        }
        field(3; "Item Name"; Text[100])
        {

        }
        field(4; "Service Cost"; Decimal) { }
        field(5; "Technician Name"; Text[100]) { }
        field(6; "Assignment Date"; Date) { }
        field(7; "Total Assignments"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Service Assignment AGT_DG" where("Item No." = field("Item No.")));
        }
    }

    keys
    {
        key(PK; "Assignment No.")
        {
            // Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    procedure populateNameAndCost("Item No.": Code[20])
    var
        ItemMasterRec: Record "Item Master AGT-DG";
    begin
        if "Item No." <> '' then begin
            ItemMasterRec.Get("Item No.");
            Rec."Item Name" := ItemMasterRec."Item Name";
            Rec."Service Cost" := ItemMasterRec."Service Cost";
        end;
    end;

}
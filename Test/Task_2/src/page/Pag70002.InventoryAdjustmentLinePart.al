page 70002 "Inventory Adjustment Line Part"
{
    PageType = ListPart;
    SourceTable = "Inventory Adjustment Line";
    Caption = 'AGT_DG Inventory Adjustment Lines';
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No."; Rec."Item No.")
                {
                    TableRelation = Item."No.";
                    trigger OnValidate()
                    var
                        ItemRec: Record Item;
                    begin
                        if (ItemRec.get(Rec."Item No.")) then begin
                            Rec.Description := ItemRec.Description;
                        end;
                    end;
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                }
                field(Quantity; Rec.Quantity)
                {
                    trigger OnValidate()
                    begin
                        if Rec.Quantity = 0 then
                            Error('Quantity cannot be zero.');

                        Rec."Total Cost" := Rec.Quantity * Rec."Unit Cost";
                    end;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        if Rec."Unit Cost" = 0 then begin
                            Error('Unit Cost cannot be 0');
                        end;
                    end;
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    Editable = false;
                    trigger OnValidate()
                    begin
                        Rec."Total Cost" := Rec.Quantity * Rec."Unit Cost";
                    end;
                }
            }
        }
    }

    trigger OnModifyRecord(): Boolean
    begin
        Rec.Validate("Total Cost", (Rec.Quantity * Rec."Unit Cost"));
    end;
}
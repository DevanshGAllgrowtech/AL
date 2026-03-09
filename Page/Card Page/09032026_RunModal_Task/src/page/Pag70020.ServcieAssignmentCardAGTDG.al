page 70020 "Servcie Assignment Card AGT-DG"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Service Assignment AGT_DG";

    layout
    {
        area(Content)
        {
            group("General")
            {
                field("Assignment No."; Rec."Assignment No.") { }
                field("Assignment Date"; Rec."Assignment Date") { }
                field("Technician Name"; Rec."Technician Name") { }
            }
            group("Item Details")
            {
                field("Item No."; Rec."Item No.")
                {
                    trigger OnLookup(var varText: Text): Boolean
                    var
                        ItemRecs: Record "Item Master AGT-DG";
                    begin
                        if Page.RunModal(Page::"Item Master Page AGT_DG", ItemRecs) = Action::LookupOK then begin
                            if ItemRecs."Item Type" = ItemRecs."Item Type"::Service then begin
                                varText := ItemRecs."Item No.";
                                Rec."Item Name" := ItemRecs."Item Name";
                                Rec."Service Cost" := ItemRecs."Service Cost";
                            end else begin
                                Message('You are allowed to select Service items only');
                            end;
                            ;
                        end;
                        exit(true);
                    end;
                }
                field("Item Name"; Rec."Item Name")
                {
                    Editable = false;
                }
                field("Service Cost"; Rec."Service Cost")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("View Items")
            {
                caption = 'View Items';
                ApplicationArea = all;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    ItemMasterRecs: Page "Item Master Page AGT_DG";
                begin
                    ItemMasterRecs.Editable := false;
                    // Page.Run(Page::"Item Master Page AGT_DG");
                    ItemMasterRecs.run();
                    ItemMasterRecs.Close();
                end;
            }
        }
    }

    var
        myInt: Integer;
}
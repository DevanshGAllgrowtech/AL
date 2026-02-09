// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.AGT_D_Proj1;

using Microsoft.Inventory.Item;

pageextension 50111 ItemListExt extends "Item List"
{
    trigger OnOpenPage();
    begin
        Message('First app published by Devansh');
    end;
}
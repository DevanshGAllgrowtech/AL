table 70016 "Item Master AGT-DG"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Item Name"; Text[100]) { }
        field(3; "Item Type"; Option)
        {
            OptionMembers = Chair,Laptop,Bottle,Service;
        }
        field(4; "Service Cost"; Decimal)
        {

        }
    }

    keys
    {
        key(PK; "Item No.")
        {
            // Clustered = true;
        }
    }
}
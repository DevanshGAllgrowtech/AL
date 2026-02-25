table 70105 "Product Table AGT_DG1"

{
    DataClassification = ToBeClassified;
    Access = Public;

    fields
    {
        field(1; "Product ID"; Integer)
        {
            Caption = 'P_ID';
            DataClassification = ToBeClassified;
        }
        field(2; "Product Type"; Option)
        {
            OptionMembers = Chair,"Table",Laptops;
            Caption = 'P_Type';
            DataClassification = ToBeClassified;
        }
        field(3; "Product Quantity"; Integer)
        {
            Caption = 'P_Quantity';
            trigger OnValidate()
            begin
                if "Product Quantity" < 0 then
                    Error('Quantity can not be negative');
            end;
        }
        field(4; "Product Price"; Decimal)
        {
            Caption = 'P_Price';
            trigger OnValidate()
            begin
                if "Product Price" < 1 then
                    Error('Product Price must have a value greater than 0');
            end;
        }
        // field(5; "PK ID"; Integer)
        // {
        //     Caption = 'PF_ID';
        // }
    }

    keys
    {
        key(PK; "Product ID")
        {
            Clustered = true;
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

}
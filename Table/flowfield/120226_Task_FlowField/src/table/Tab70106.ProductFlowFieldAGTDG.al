table 70106 "Product FlowField AGT_DG"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "PK ID"; Integer)
        {
            Caption = 'PF_ID';
            AutoIncrement = true;

        }
        field(2; "Product Chair Count"; Integer)
        {
            FieldClass = FlowField;
            Caption = 'PF_Chair_Count';
            CalcFormula = count("Product Table AGT_DG1" where("Product Type" = const(Chair), "Product Type" = field("Product Type")));
        }
        field(3; "Product Chair AVG_Price"; Decimal)
        {

            FieldClass = FlowField;
            Caption = 'PF_Chair_AVG_Price';
            CalcFormula = average("Product Table AGT_DG1"."Product Price" where("Product Type" = const(Chair), "Product Type" = field("Product Type")));
        }
        field(4; "Product Chair Max_Price"; Decimal)
        {
            FieldClass = FlowField;
            Caption = 'PF_Chair_MAX_Price';
            CalcFormula = max("Product Table AGT_DG1"."Product Price" where("Product Type" = const(Chair), "Product Type" = field("Product Type")));
        }
        field(5; "Product Chair Min_Price"; Decimal)
        {
            FieldClass = FlowField;
            Caption = 'PF_Chair_MIN_Price';
            CalcFormula = min("Product Table AGT_DG1"."Product Price" where("Product Type" = const(Chair), "Product Type" = field("Product Type")));
        }
        field(6; "Product Chair SumOf_Price"; Decimal)
        {
            FieldClass = FlowField;
            Caption = 'PF_SumOf_Chair_Price';
            CalcFormula = sum("Product Table AGT_DG1"."Product Price" where("Product Type" = const(Chair), "Product Type" = field("Product Type")));
        }
        field(7; "Product Type"; Option)
        {
            Caption = 'Product Type';
            OptionMembers = Chair,"Table",Laptops;
        }
    }

    keys
    {
        key(PK; "PK ID")
        {
            Clustered = true;
        }
    }

    var
        getProductType: Option;
        setCaption: Text[20];

    trigger OnInsert()
    begin
        getProductType := "Product Type";
        setCaption := '';
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
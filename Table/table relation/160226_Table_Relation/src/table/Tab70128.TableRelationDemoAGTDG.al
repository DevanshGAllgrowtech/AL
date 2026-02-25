table 70128 "Table Relation Demo AGT_DG"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer No.';
            TableRelation = Customer;
            // trigger OnValidate()
            // var
            //     getCustomerRecord: Record Customer;
            // begin
            //     if getCustomerRecord.GET("No.") then begin
            //         "Customer Name" := getCustomerRecord.Name;
            //     end
            // end;
        }
        field(2; "Customer Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Name';
        }
        field(3; "TR_ID"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'TR_ID';
            AutoIncrement = true;
        }
    }

    keys
    {
        key(PK; TR_ID)
        {
            Clustered = true;
        }
    }


    // 160226 AGT DG++
    var
        getCustomerNo: Code[20];
        getCustomerName: Text[100];
        getCustomerData: Record Customer;
    // 160226 AGT DG--
    trigger OnInsert()
    begin
        // 160226 AGT DG++
        getCustomerNo := Rec."No.";
        getCustomerData.Get(getCustomerNo);
        getCustomerName := getCustomerData.Name;
        "Customer Name" := getCustomerName;
        // 160226 AGT DG--
    end;
}
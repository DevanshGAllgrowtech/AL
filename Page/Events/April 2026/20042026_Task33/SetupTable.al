table 70198 "Setup Table AGT_DG"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = ToBeClassified;
        }

        field(2; "Posting From"; Date)
        {
            trigger OnValidate()
            begin
                ValidateDates();
            end;
        }

        field(3; "Posting To"; Date)
        {
            trigger OnValidate()
            begin
                ValidateDates();
            end;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        SetDefaults();
    end;

    // =============================
    // 🔹 Internal Logic
    // =============================
    local procedure ValidateDates()
    begin
        if ("Posting From" <> 0D) and ("Posting To" <> 0D) then
            if "Posting From" > "Posting To" then
                Error('Posting From cannot be greater than Posting To.');
    end;

    local procedure SetDefaults()
    begin
        if "Posting From" = 0D then
            "Posting From" := CalcDate('-30D', Today);

        if "Posting To" = 0D then
            "Posting To" := Today;
    end;

    procedure GetSetup(var SetupRec: Record "Setup Table AGT_DG")
    begin
        if not SetupRec.Get('SETUP') then begin
            SetupRec.Init();
            SetupRec."Primary Key" := 'SETUP';
            SetupRec.Insert();
        end;
    end;
}
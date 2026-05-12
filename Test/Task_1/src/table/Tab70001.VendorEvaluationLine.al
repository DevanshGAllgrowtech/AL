table 70001 "Vendor Evaluation Line"
{
    DataClassification = ToBeClassified;
    Caption = 'Vendor Evaluation Line AGT_DG';

    fields
    {
        field(1; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Evaluation No. Line"; Code[20])
        {
            // Caption = 'Evaluation No.';
            TableRelation = "Vendor Evaluation Header"."Evaluation No.";
        }
        field(3; "Criteria Code"; Code[20]) { }
        field(4; "Criteria Description"; Text[100]) { }
        field(5; "Score"; Decimal)
        {
            trigger OnValidate()
            begin
                if Score > 100 then
                    Error('Score cannot exceed 100.');

                if Score < 0 then
                    Error('Score cannot be negative.');
            end;
        }
        field(6; "Weightage"; Decimal)
        {
            trigger OnValidate()
            begin
                if Weightage = 0 then
                    Error('Weightage cannot be zero.');

                if Weightage < 0 then
                    Error('Weightage cannot be negative.');
            end;
        }
        field(7; "Weighted Score"; Decimal)
        {
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Evaluation No. Line", "Line No.")
        {
            Clustered = true;
        }
    }
}
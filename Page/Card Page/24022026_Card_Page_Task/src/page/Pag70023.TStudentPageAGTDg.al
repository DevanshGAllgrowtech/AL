page 70023 "TStudent Page AGT_Dg"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "TStudent AGT_Dg";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.") { }
                field(Name; Rec.Name)
                {
                    Caption = 'Student Name';
                }
                field("Is Active"; Rec."Is Active")
                {
                    Caption = 'Indicates Active Status';
                    Editable = false;
                }
            }
            group(Contact)
            {
                field(Email; Rec.Email)
                {
                    Caption = 'Contact Email';
                }
                field(Phone; Rec.Phone)
                {
                    Caption = 'Contact No.';
                }
            }
            group(Academic)
            {
                field(Status; Rec.Status)
                {
                    // Editable = false;
                }
                field("Block Reason"; Rec."Block Reason")
                {
                }
                field(Grade; Rec.Grade)
                {
                    Editable = false;
                }
                field("Total Marks"; Rec."Total Marks") { }
                field("Attempt Count"; Rec."Attempt Count")
                {
                    Editable = false;
                    // trigger OnValidate()
                    // begin
                    //     if Rec."Attempt Count" > 2 then begin
                    //         Error('You are missing something');
                    //     end;
                    // end;
                }
            }
            group(Audit)
            {
                field("Created By"; Rec."Created By")
                {
                    Editable = false;
                }
                field("Created On"; Rec."Created On") { Editable = false; }
                field("Last Modified By"; Rec."Last Modified By") { Editable = false; }
                field("Last Modified On"; Rec."Last Modified On") { Editable = false; }
            }
        }
        area(FactBoxes)
        {
            part("Factbox"; "Factbox AGTDG")
            {
                ApplicationArea = all;
                SubPageLink = "No." = field("No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Approve Student")
            {
                Caption = 'Approve Student';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = all;
                trigger OnAction()
                var
                    changeStatusTo: Option Active;
                    ifStatus: Option Draft;
                    reason: Text[100];
                    temp: Text[100];
                    checkConditions: Boolean;
                    getCurrentAttemptCount: Integer;
                begin
                    checkConditions := false;
                    if rec.Status <> ifStatus::Draft then begin
                        reason := 'Current Status is ' + Format(Rec.Status) + '. Please change it to Draft.';
                        checkConditions := true;
                    end;
                    if (rec."Total Marks" < 39) then begin
                        reason += ' Total Marks should be greater than 40. Currently it is ' + Format(Rec."Total Marks");
                        checkConditions := true;
                    end;
                    if (checkValidEmail(Rec.Email) = false) then begin
                        reason += ' Email should be valid.';
                        checkConditions := true;
                    end;
                    if checkConditions = true then begin
                        // Rec."Block Reason" := reason;
                        Message(reason);
                        Rec."Attempt Count" += 1;
                        Rec."Is Active" := false;
                    end
                    else begin
                        Rec.Status := Rec.Status::Active;
                        Rec."Is Active" := true;
                    end;

                end;
            }
            action("Block Student")
            {
                Caption = 'Block Student';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = all;
                trigger OnAction()
                var
                    changeStatusTo: Option Blocked;
                begin
                    if Rec.Status <> Rec.Status::Blocked then begin
                        Rec.Status := Rec.Status::Blocked;
                        Rec."Is Active" := false;
                    end;

                    if (Rec.Status = rec.Status::Blocked) and (Rec."Block Reason".Trim() = '') then begin
                        Message('Please enter the block reason');
                    end;
                end;
            }
            action("Reset to Draft")
            {
                ApplicationArea = all;
                Caption = 'Reset to Draft';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    changeStatusTo: Option Draft;
                    getCurrentStatus: Option;
                    ifStatus: Option Blocked;
                begin
                    if (Rec.Status <> Rec.Status::Draft) then begin
                        Rec.Status := Rec.Status::Draft;
                        Rec."Block Reason" := '';
                    end;
                end;
            }
            action("Reset Attempt Count")
            {
                Caption = 'Reset Attempt Count';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    Rec."Attempt Count" := 0;
                end;
            }
        }
    }

    trigger OnInsertRecord(temp: Boolean): Boolean
    begin
        changeName := 'Devansh';
        Rec."Created On" := System.CurrentDateTime.Date;
        Rec."Created By" := changeName;

    end;

    trigger OnModifyRecord(): Boolean
    var
        getAttemptCount: Integer;
    begin
        changeName := 'You';
        Rec."Last Modified On" := System.CurrentDateTime.Date();
        Rec."Last Modified By" := changeName;
        getAttemptCount := rec."Attempt Count";
        // if getAttemptCount = 3 then begin
        //     flag := true;
        // end;
        // if (Rec."Attempt Count" > 2) and (flag = true) then begin
        if (Rec."Attempt Count" > 2) then begin
            Message('You are missing something');
            // flag := false;
        end;
    end;

    procedure checkValidEmail(email: Text[100]): Boolean
    var
        MailManagement: Codeunit "Mail Management";
        isValidEmail: Boolean;
    begin
        isValidEmail := MailManagement.CheckValidEmailAddress(email);
        if isValidEmail = true then begin
            exit(true);
        end;
        exit(false);
    end;

    var
        changeName: Code[50];
        flag: Boolean;
}
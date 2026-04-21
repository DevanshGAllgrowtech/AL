// codeunit 70009 "Task 29"
// {
//     // Task 29:
//     // "Creating log entries for credit limit changes. 
//     // The log entries display the old and new credit limits,
//     //  username, and date and time.

//     [EventSubscriber(ObjectType::Table, Database::Customer, OnAfterValidateEvent, 'Credit Limit (LCY)', false, false)]
//     local procedure LogCreditLimitChange(var Rec: Record Customer; var xRec: Record Customer)
//     var
//         LogRec: Record "Credit Limit Log";
//     begin
//         if Rec."Credit Limit (LCY)" <> xRec."Credit Limit (LCY)" then begin

//             LogRec.Init();
//             LogRec.Validate("Customer No.", Rec."No.");
//             LogRec.Validate("Old Credit Limit", xRec."Credit Limit (LCY)");
//             LogRec.Validate("New Credit Limit", Rec."Credit Limit (LCY)");
//             LogRec.Validate("User ID", UserId);
//             LogRec.Validate("Changed At", CurrentDateTime);
//             LogRec.Insert();
//         end;
//     end;
// }

// table 70010 "Credit Limit Log"
// {
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; MyField; Integer)
//         {
//             DataClassification = ToBeClassified;

//         }
//         field(2; "Customer No."; Code[20]) { }
//         field(3; "Old Credit Limit"; Decimal) { }
//         field(4; "New Credit Limit"; Decimal) { }
//         field(5; "User ID"; Text[200]) { }
//         field(6; "Changed AT"; DateTime) { }
//     }

//     keys
//     {
//         key(PK; MyField)
//         {
//             Clustered = true;
//         }
//     }
// }

// page 70011 "Credit Page AGT_DG"
// {
//     PageType = List;
//     ApplicationArea = All;
//     UsageCategory = Lists;
//     SourceTable = "Credit Limit Log";

//     layout
//     {
//         area(Content)
//         {
//             repeater("Credit Data")
//             {
//                 field("Customer No."; Rec."Customer No.")
//                 {

//                 }
//                 field("Old Credit Limit"; Rec."Old Credit Limit") { }
//                 field("New Credit Limit"; Rec."New Credit Limit") { }
//                 field("User ID"; Rec."User ID") { }
//                 field("Changed AT"; Rec."Changed AT") { }

//             }
//         }
//     }
// }
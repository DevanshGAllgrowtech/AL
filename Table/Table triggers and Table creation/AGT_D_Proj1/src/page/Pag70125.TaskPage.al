page 70125 "Task Page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = CustomTask;

    layout
    {
        area(Content)
        {
            repeater("Task Data")
            {
                field(T_ID; Rec.ID)
                {

                }
                field(T_Title; Rec.Title)
                {

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(DataTypesDemo)
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    MyCodeunit.DataTypesDemo();
                    // DataTypesDemo();

                end;
            }
            action(OperatorDemo)
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    MyCodeunit.OperatorDemo();
                    // OperatorDemo();
                end;
            }
            action(ConditionalDemo)
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    MyCodeunit.ConditionalDemo();
                    // ConditionalDemo();

                end;
            }
            action(LoopDemo)
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    MyCodeunit.LoopDemo();
                    // LoopDemo();
                end;
            }
            action(BuiltInDemo)
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    MyCodeunit.BuiltInDemo();
                    // BuiltInDemo();
                end;
            }
            action(DateDemo)
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    MyCodeunit.DateDemo();
                    // DateDemo();
                end;
            }
            action(CustomerRecordDemo)
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    MyCodeunit.CustomerRecordDemo();
                    // CustomerRecordDemo();
                end;
            }
        }
    }

    var
        MyCodeunit: Codeunit "AL Basics Demo";
}
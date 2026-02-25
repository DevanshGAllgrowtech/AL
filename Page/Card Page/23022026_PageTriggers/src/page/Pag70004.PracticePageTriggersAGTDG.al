page 70004 "Practice Page Triggers AGTDG"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    // SourceTable = TableName;

    layout
    {
        area(Content)
        {
            group("Personal Details")

            {
                field(Name; myText)
                {
                }
                field("How are you feeling today"; Options)
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Greet Yourself")
            {

                trigger OnAction()
                begin
                    if myText = '' then begin
                        Message('Please enter your name!!!');
                    end else begin
                        Message('Hi, %1.', myText);
                    end;
                end;
            }
        }
    }


    trigger OnOpenPage()
    begin
        Message('Welcome to my Greeting Page');
    end;

    trigger OnAfterGetCurrRecord()

    begin

    end;

    trigger OnClosePage()
    begin
        Message('Bye bye ;), Have a nice day :)');
    end;


    var
        myText: Text[50];
        Options: Option Better,Good,Exceptional;
}
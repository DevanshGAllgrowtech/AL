codeunit 70149 "AL Basics Demo"
{
    trigger OnRun()
    begin
        DataTypesDemo();
        OperatorDemo();
        ConditionalDemo();
        LoopDemo();
        BuiltInDemo();
        DateDemo();
        CustomerRecordDemo();
    end;

    procedure DataTypesDemo()
    var
        MyInteger: Integer;
        MyDecimal: Decimal;
        MyBoolean: Boolean;
        MyText: Text[50];
        MyCode: Code[10];
        MyDate: Date;
    begin
        // assigning values to different data types
        MyInteger := 10;
        MyDecimal := 12.5;
        MyBoolean := true;
        MyText := 'Hello AL';
        MyCode := 'ITEM001';
        MyDate := Today;

        // display values
        Message('Int:%1 Text:%2 Date:%3', MyInteger, MyText, MyDate);
    end;

    procedure OperatorDemo()
    var
        A: Integer;
        B: Integer;
        Result: Integer;
    begin
        A := 10;
        B := 5;

        // arithmetic operator example
        Result := A + B;

        // comparison operator
        if A > B then
            Message('A greater than B');

        // logical operator
        if (A > 0) AND (B > 0) then
            Message('Both numbers positive');
    end;

    procedure ConditionalDemo()
    var
        Number: Integer;
    begin
        Number := 7;

        // IF condition example
        if Number > 5 then
            Message('Greater than 5')
        else
            Message('Less or equal to 5');

        // CASE condition example
        case Number of
            1:
                Message('One');
            7:
                Message('Seven');
            else
                Message('Other number');
        end;
    end;

    procedure LoopDemo()
    var
        i: Integer;
    begin
        // FOR loop runs fixed number of times
        for i := 1 to 3 do
            Message('FOR %1', i);

        // WHILE loop runs while condition is true
        i := 1;
        while i <= 2 do begin
            Message('WHILE %1', i);
            i := i + 1;
        end;

        // REPEAT loop runs at least once
        i := 1;
        repeat
            Message('REPEAT %1', i);
            i := i + 1;
        until i > 2;
    end;

    procedure BuiltInDemo()
    var
        MyText: Text;
        Length: Integer;
        Num: Integer;
        NewText: Text;
    begin
        MyText := 'BusinessCentral';

        // StrLen returns text length
        Length := StrLen(MyText);

        // CopyStr copies part of text
        NewText := CopyStr(MyText, 1, 8);

        // Evaluate converts text to number
        Evaluate(Num, '100');

        // Round rounds decimal value
        Num := Round(10.567, 0.01);

        // Format converts value to text
        Message('Len:%1 Text:%2 Num:%3', Length, NewText, Format(Num));

        // Confirm shows Yes/No dialog
        if Confirm('Continue?') then
            Message('User pressed Yes')
        else
            Error('Process stopped');
    end;

    procedure DateDemo()
    var
        TodayDate: Date;
        WorkDateValue: Date;
        NextMonth: Date;
    begin
        // Today gives current system date
        TodayDate := Today;

        // WorkDate used in Business Central posting
        WorkDateValue := WorkDate;

        // CalcDate calculates date using formula
        NextMonth := CalcDate('<1M>', TodayDate);

        Message('Today:%1 WorkDate:%2 Next:%3', TodayDate, WorkDateValue, NextMonth);
    end;

    procedure CustomerRecordDemo()
    var
        Cust: Record Customer;
        Cust2: Record Customer;
    begin
        // GET retrieves record using primary key
        if Cust.Get('10000') then
            Message('Customer Name: %1', Cust.Name);

        // SetRange filters records by exact value
        Cust.Reset();
        Cust.SetRange(Blocked, Cust.Blocked::" ");

        // FindFirst returns first record in filtered set
        if Cust.FindFirst() then
            Message('First Customer: %1', Cust.Name);

        // FindLast returns last record in filtered set
        if Cust.FindLast() then
            Message('Last Customer: %1', Cust.Name);

        // SetFilter allows advanced filter expressions
        Cust.Reset();
        Cust.SetFilter("No.", '1*');

        // FindSet used to loop through records
        if Cust.FindSet() then
            repeat
                Message('Customer No: %1', Cust."No.");
            until Cust.Next() = 0;

        // combining multiple filters
        Cust2.Reset();
        Cust2.SetRange(Blocked, Cust2.Blocked::" ");
        Cust2.SetFilter(Name, 'A*');

        if Cust2.FindFirst() then
            Message('Filtered Customer: %1', Cust2.Name);
    end;
}
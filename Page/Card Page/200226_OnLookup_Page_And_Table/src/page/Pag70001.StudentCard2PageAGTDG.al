page 70001 "Student Card2 Page AGT_DG"
{
    PageType = Card;
    ApplicationArea = All;
    // UsageCategory = Administration;
    SourceTable = "Student Table2 AGT_DG";

    layout
    {
        area(Content)
        {
            group("General")
            {
                field("Student ID"; Rec."Student ID")
                {

                }
                field("Student First Name"; Rec."Student First Name")
                {

                }
                field("Student Last Name"; Rec."Student Last Name")
                {

                }
                field("Student City"; Rec."Student City")
                {

                }
                field("Campus ID"; Rec."Campus ID")
                {
                    Lookup = true;
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        currentCampusStatus: Boolean;
                        CAMPUS_RECS_WITH_ACTIVE_STATUS, CAMPUS_RECS_WITH_AVAILABLE_CAPACITY : Record "Campus Table AGT_DG";
                        student_City: TExt[50];
                        campus_id: Code[20];
                        presentCampusCapacity, maxCampusCapacity : Integer;
                    begin
                        student_City := REc."Student City";
                        CAMPUS_RECS_WITH_ACTIVE_STATUS.SetRange("IS ACTIVE", true);
                        if (student_City = '') then begin
                            if (Page.RunModal(Page::"Campus List Page AGT_DG", CAMPUS_RECS_WITH_ACTIVE_STATUS)) = Action::LookupOK then begin
                                campus_id := CAMPUS_RECS_WITH_ACTIVE_STATUS."Campus ID";
                                Rec."Campus ID" := CAMPUS_RECS_WITH_ACTIVE_STATUS."Campus ID";
                                Rec.Modify();
                                Text := CAMPUS_RECS_WITH_ACTIVE_STATUS."Campus ID";
                            end;
                        end else begin
                            CAMPUS_RECS_WITH_ACTIVE_STATUS.SetRange("Campus City", student_City);
                            if (Page.RunModal(Page::"Campus List Page AGT_DG", CAMPUS_RECS_WITH_ACTIVE_STATUS)) = Action::LookupOK then begin
                                campus_id := CAMPUS_RECS_WITH_ACTIVE_STATUS."Campus ID";
                                Rec."Campus ID" := CAMPUS_RECS_WITH_ACTIVE_STATUS."Campus ID";
                                Rec.Modify();
                                Text := CAMPUS_RECS_WITH_ACTIVE_STATUS."Campus ID";
                            end;
                        end;

                        //check for capacity
                        CAMPUS_RECS_WITH_AVAILABLE_CAPACITY.Get(campus_id);
                        maxCampusCapacity := CAMPUS_RECS_WITH_AVAILABLE_CAPACITY."Max Campus Capacity";
                        presentCampusCapacity := CAMPUS_RECS_WITH_AVAILABLE_CAPACITY."Current Campus Capacity" + 1;
                        // Message('Max Campus Capacity %1', CAMPUS_RECS_WITH_AVAILABLE_CAPACITY."Max Campus Capacity");
                        if presentCampusCapacity > maxCampusCapacity then begin
                            // Rec."Campus ID" := '';
                            Error('You cannot enroll in Campus %1 because max capacity reached.', CAMPUS_RECS_WITH_AVAILABLE_CAPACITY."Campus Name");
                        end else begin
                            // Rec."Campus ID" := campus_id;
                            CAMPUS_RECS_WITH_AVAILABLE_CAPACITY."Current Campus Capacity" := presentCampusCapacity;
                            CAMPUS_RECS_WITH_AVAILABLE_CAPACITY.Modify();
                        end;
                        // Message('current Campus Capacity %1', CAMPUS_RECS_WITH_AVAILABLE_CAPACITY."Current Campus Capacity");

                        exit(true);

                    end;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}
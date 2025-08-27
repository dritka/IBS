page 50101 StudentListPage
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = StudentTable;

    InsertAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Students)
            {
                field("Student ID"; Rec."Student ID") { ApplicationArea = All; }
                field("First Name"; Rec."First Name") { ApplicationArea = All; }
                field("Last Name"; Rec."Last Name") { ApplicationArea = All; }
                field("Full Name"; Rec."Full Name") { ApplicationArea = All; }
                field("Age"; Rec."Age") { ApplicationArea = All; }
                field("Class"; Rec."Class") { ApplicationArea = All; }
                field("GPA"; Rec."GPA") { ApplicationArea = All; }
                field("Student"; StudentCardLbl)
                {
                    DrillDown = true;

                    trigger OnDrillDown()
                    var
                        StudentRec: Record StudentTable;
                    begin
                        StudentRec.Get(Rec."Student ID");
                        Page.Run(Page::StudentCardPage, StudentRec);
                    end;
                }
            }
        }
    }

    var
        StudentCardLbl: Label 'Open student card';
}
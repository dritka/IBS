page 50103 GradesListPage
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = StudentGradesTable;

    InsertAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Grades)
            {
                field("Student ID"; Rec."Student ID") { ApplicationArea = All; }
                field("Teacher ID"; Rec."Teacher ID") { ApplicationArea = All; }
                field("Grade"; Rec."Grade") { ApplicationArea = All; }
                field("Registered Date"; Rec."Registered Date") { ApplicationArea = All; }
                field("Grade card"; GradeCardLbl)
                {
                    DrillDown = true;

                    trigger OnDrillDown()
                    var
                        GradeRec: Record StudentGradesTable;
                    begin
                        GradeRec.Get(Rec."Entry No.");
                        Page.Run(Page::GradesCardPage, GradeRec);
                    end;
                }
            }
        }
    }

    var
        GradeCardLbl: Label 'Open grade card';
}
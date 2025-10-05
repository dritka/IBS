page 50102 GradesCardPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = StudentGradesTable;

    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            Group(Grades)
            {
                field("Student ID"; Rec."Student ID")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Teacher ID"; Rec."Teacher ID")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Grade"; Rec."Grade")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Registered Date"; Rec."Registered Date") { ApplicationArea = All; }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Delete current grade")
            {
                Image = Delete;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    // TO DO
                end;
            }
        }
    }
}
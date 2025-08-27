page 50100 StudentCardPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = StudentTable;

    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            Group(Students)
            {
                field("Student ID"; Rec."Student ID")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = All;

                    trigger OnAssistEdit()
                    begin
                        Rec."Full Name" := Rec."First Name" + ' ' + Rec."Last Name";
                    end;
                }
                field("Age"; Rec."Age")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Class"; Rec."Class")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("GPA"; Rec."GPA")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Display grades")
            {
                Image = ShowList;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'Displays all the grades that are registered for the current student';

                trigger OnAction()
                var
                    GradeRec: Record StudentGradesTable;
                begin
                    GradeRec.SetRange("Student ID", Rec."Student ID");
                    Page.Run(Page::GradesListPage, GradeRec);
                end;
            }

            action("Delete current student")
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

            action("Clear all fields")
            {
                Image = ClearFilter;
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

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        CodeU: Codeunit Management;
    begin
        exit(CodeU.AllMandatoryFields(Rec));
    end;
}
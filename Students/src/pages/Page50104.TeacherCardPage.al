page 50104 TeacherCardPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = TeacherTable;

    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            Group(Teachers)
            {
                field("Teacher ID"; Rec."Teacher ID")
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
                        if (Rec."First Name" <> '') and (Rec."Last Name" <> '') then
                            Rec."Full Name" := Rec."First Name" + ' ' + Rec."Last Name";
                    end;
                }
                field("Admin"; Rec."Admin")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Administrator privileges';
                }
                field("Class"; Rec."Class")
                {
                    ApplicationArea = All;
                    ToolTip = 'The class for which the teacher is responsible for';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Display students")
            {
                Image = ShowList;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'Display the students that the current teacher is responsible for';

                trigger OnAction()
                var
                    StudentRec: Record StudentTable;
                begin
                    if Rec."Class" = ClassEnum::None then
                        Message('The teacher is not responsible for any class')
                    else begin
                        StudentRec.SetRange("Class", Rec."Class");
                        Page.Run(Page::StudentListPage, StudentRec);
                    end;
                end;
            }
            action("Delete current teacher")
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
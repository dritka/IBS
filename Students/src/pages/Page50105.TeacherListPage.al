page 50105 TeacherListPage
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = TeacherTable;

    InsertAllowed = False;
    ModifyAllowed = False;

    layout
    {
        area(Content)
        {
            repeater(Teachers)
            {
                field("Teacher ID"; Rec."Teacher ID") { ApplicationArea = All; }
                field("First Name"; Rec."First Name") { ApplicationArea = All; }
                field("Last Name"; Rec."Last Name") { ApplicationArea = All; }
                field("Full Name"; Rec."Full Name") { ApplicationArea = All; }
                field("Admin"; Rec."Admin") { ApplicationArea = All; }
                field("Class"; Rec."Class") { ApplicationArea = All; }
                field("Teacher"; TeacherCardLbl)
                {
                    DrillDown = true;

                    trigger OnDrillDown()
                    var
                        TeacherRec: Record TeacherTable;
                    begin
                        TeacherRec.Get(Rec."Teacher ID");
                        Page.Run(Page::TeacherCardPage, TeacherRec);
                    end;
                }
            }
        }
    }

    var
        TeacherCardLbl: Label 'Open teacher card';
}
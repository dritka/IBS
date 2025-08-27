codeunit 50101 GradeManagement
{
    [EventSubscriber(ObjectType::Table, Database::StudentGradesTable, 'OnAfterInsertEvent', '', false, false)]
    local procedure OnAfterGradeInsert(var Rec: Record StudentGradesTable)
    var
        StudentRecord: Record StudentTable;
        StudentGradesRecord: Record StudentGradesTable;
        TotalGrade, GradeCount : Integer;
    begin
        // Set the registered date of the grade
        Rec."Registered Date" := Today();
        Rec.Modify();

        /*
        Since a new grrade has been enter, the new average
        has to be recalculated for the student for which
        the grade was entered (specified by the PID).
        */

        StudentRecord.Get(Rec."Student ID");
        StudentGradesRecord.SetRange("Student ID", Rec."Student ID");

        TotalGrade := 0;
        GradeCount := 0;
        if StudentGradesRecord.FindSet() then begin
            repeat
                TotalGrade += StudentGradesRecord."Grade";
                GradeCount += 1;
            until StudentGradesRecord.Next() = 0;
        end;

        if Gradecount <> 0 then // avoid division by zero
            StudentRecord."GPA" := TotalGrade / GradeCount
        else
            StudentRecord."GPA" := 0;
        StudentRecord.Modify();
    end;
}
table 50101 StudentGradesTable
{
    DataClassification = CustomerContent;
    Caption = 'List of grades for all students';
    // LookupPageId = GradesCardPage;
    // DrillDownPageId = GradesCardPage;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement = true;
            InitValue = 1;
        }
        field(2; "Student ID"; Code[10])
        {
            TableRelation = StudentTable."Student ID";
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(3; "Teacher ID"; Code[10])
        {
            TableRelation = TeacherTable."Teacher ID";
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(4; "Grade"; Integer)
        {
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(5; "Registered Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Registered Date';
        }
    }

    keys
    {
        key(PK; "Entry No.") { Clustered = true; }
    }
}
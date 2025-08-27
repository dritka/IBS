table 50100 StudentTable
{
    DataClassification = CustomerContent;
    Caption = 'List of students';
    LookupPageId = StudentCardPage;
    DrillDownPageId = StudentCardPage;

    fields
    {
        field(1; "Student ID"; Code[5])
        {
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(2; "First Name"; Code[20])
        {
            DataClassification = CustomerContent;
            NotBlank = true;
            Caption = 'First Name';
        }
        field(3; "Last Name"; Code[20])
        {
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(4; "Full Name"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(5; "Age"; Integer)
        {
            DataClassification = CustomerContent;
            NotBlank = true;
            InitValue = 0;
        }
        field(6; "Class"; Code[10])
        {
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(7; "GPA"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = average(StudentGradesTable.Grade where("Student ID" = Field("Student ID")));
        }
    }

    keys
    {
        key(PK; "Student ID") { Clustered = true; }
    }
}
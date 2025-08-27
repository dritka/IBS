table 50102 TeacherTable
{
    DataClassification = CustomerContent;
    Caption = 'List of teachers';
    LookupPageId = TeacherCardPage;
    DrillDownPageId = TeacherCardPage;

    fields
    {
        field(1; "Teacher ID"; Text[5])
        {
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(2; "First Name"; Text[20])
        {
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(3; "Last Name"; Text[20])
        {
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(4; "Full Name"; Text[50]) { DataClassification = CustomerContent; }
        field(5; "Admin"; Boolean)
        {
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(6; "Class"; Enum ClassEnum) { DataClassification = CustomerContent; }
    }

    keys
    {
        key(PK; "Teacher ID") { Clustered = true; }
    }
}
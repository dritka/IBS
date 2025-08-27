table 50102 TeacherTable
{
    DataClassification = CustomerContent;
    Caption = 'List of teachers';
    LookupPageId = TeacherCardPage;
    DrillDownPageId = TeacherCardPage;

    fields
    {
        field(1; "Teacher ID"; Code[5])
        {
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(2; "First Name"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'First Name';
            NotBlank = true;
        }

        field(3; "Last Name"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Last Name';
            NotBlank = true;
        }

        field(4; "Full Name"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Full Name';
        }

        field(5; "Admin"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Administrator Privileges';
        }

        field(6; "Class"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Responsible For';
        }
    }

    keys
    {
        key(PK; "Teacher ID") { Clustered = true; }
    }
}
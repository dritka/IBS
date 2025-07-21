table 65401 "Cards Type Table"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Card Type"; Code[20]) { DataClassification = CustomerContent; }
        field(2; "Description"; Text[100]) { DataClassification = CustomerContent; }

        field(3; "Debit/Credit"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = "Debit","Credit";
            OptionCaption = 'Debit, Credit';
        }
    }

    keys
    {
        key(PK; "Card Type") { Clustered = true; }
    }
}
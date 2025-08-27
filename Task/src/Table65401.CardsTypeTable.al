table 65401 "Cards Type Table"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Card Type"; Enum "Card Type") { DataClassification = CustomerContent; }
        field(2; "Debit/Credit"; Enum "Debit/Credit") { DataClassification = CustomerContent; }
        field(3; "Description"; Text[100]) { DataClassification = CustomerContent; }
    }

    keys
    {
        key(PK; "Card Type", "Debit/Credit") { Clustered = true; }
    }
}
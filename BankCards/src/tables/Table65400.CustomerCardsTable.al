table 65400 "Customer Cards Table"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Description"; Text[100]) { DataClassification = CustomerContent; }
        field(2; "Card Type"; Enum "Card Type")
        {
            DataClassification = CustomerContent;
            InitValue = Default;
        }
        field(3; "Card Code"; Code[16])
        {
            DataClassification = CustomerContent;
            NotBlank = true;
            Numeric = true;
        }
        field(4; "CVS"; Code[3])
        {
            DataClassification = CustomerContent;
            NotBlank = true;
            Numeric = true;
        }
        field(5; "Valid Thru"; Date)
        {
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(6; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";
        }
        /*
        field(5000; "Valid Thru Date"; Date)
        {
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        */
    }

    keys
    {
        key(PK; "Card Code") { Clustered = true; }
    }
}
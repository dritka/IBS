table 65400 "Customer Cards Table"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Description"; Code[100])
        {
            DataClassification = CustomerContent;
        }

        field(2; "Card Type"; Code[25])
        {
            DataClassification = CustomerContent;
            TableRelation = "Cards Type Table"."Card Type";
        }

        field(3; "Card Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(4; "CVS"; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(5; "Valid Thru"; Date)
        {
            DataClassification = CustomerContent;
        }

        field(6; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";
        }
    }
}
table 65400 "Customer Cards Table"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Description"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(2; "Card Type"; Enum "Card Type")
        {
            DataClassification = CustomerContent;
            TableRelation = "Cards Type Table"."Card Type";
        }
        field(3; "Card Code"; Code[16])
        {
            DataClassification = CustomerContent;
            Numeric = true;

            trigger OnValidate()
            begin
                if (StrLen(Rec."Card Code") <> 16) then
                    Error('Card Code must be exactly 16 digits long!');
            end;
        }
        field(4; "CVS"; Code[3])
        {
            DataClassification = CustomerContent;
            Numeric = true;
            trigger OnValidate()
            begin
                if StrLen(Rec."CVS") <> 3 then
                    Error('CVS must be exactly 3 digits long!');
            end;
        }
        field(5; "Valid Thru"; Date)
        {
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if Rec."Valid Thru" = 0D then
                    Error('You must choose a date!');
            end;
        }
        field(6; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";
        }
    }

    keys
    {
        key(PK; "Card Code") { Clustered = true; }
    }
}
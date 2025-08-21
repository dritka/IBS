page 65403 "Cards Type Page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Cards Type Table";

    layout
    {
        area(Content)
        {
            repeater("Card Types")
            {
                field("Card Type"; Rec."Card Type") { ApplicationArea = All; }
                field("Debit/Credit"; Rec."Debit/Credit") { ApplicationArea = All; }
                field("Description"; Rec."Description") { ApplicationArea = All; }
            }
        }
    }
}
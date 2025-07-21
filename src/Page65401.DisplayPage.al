page 65401 "Display Page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Customer Cards Table";

    Editable = true;
    CardPageId = "Customer Cards Page";

    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater("Owned Cards")
            {
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                }

                field("Card Type"; Rec."Card Type")
                {
                    ApplicationArea = All;
                }

                field("Card Code"; Rec."Card Code")
                {
                    ApplicationArea = All;
                }

                field("CVS"; Rec."CVS")
                {
                    ApplicationArea = All;
                }

                field("Valid Thru"; Rec."Valid Thru")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    var
        CustomerNo: Integer;
        Text000: Label 'Cards for the Customer with Customer No.: %1';

    trigger OnOpenPage()
    begin
        Message(Text000, CustomerNo);
    end;
}
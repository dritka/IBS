page 65401 "Display Cards Page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Customer Cards Table";

    Editable = false;

    layout
    {
        area(Content)
        {
            repeater("Owned Cards")
            {
                field("Description"; Rec."Description") { ApplicationArea = All; }
                field("Card Type"; Rec."Card Type") { ApplicationArea = All; }
                field("Card Code"; Rec."Card Code") { ApplicationArea = All; }
                field("CVS"; Rec."CVS") { ApplicationArea = All; }
                field("Valid Thru"; Rec."Valid Thru") { ApplicationArea = All; }
                field("Customer Actions"; CustomerActionLbl)
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    Caption = 'Open customer card';
                    trigger OnDrillDown()
                    var
                        CustomerCards: Page "Customer Cards Page";
                        CustomerRec: Record "Customer Cards Table";
                    begin
                        CustomerRec.SetRange("Customer No.", Rec."Customer No.");
                        CustomerCards.Run();
                    end;
                }
            }
        }
    }

    var
        CustomerActionLbl: Label 'Customer Cards';
}
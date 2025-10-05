pageextension 65401 "Customer Card Extension" extends "Customer Card"
{
    actions
    {
        addfirst(Processing)
        {
            action("Customer Cards")
            {
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Caption = 'Display cards for current customer';
                RunObject = page "Display Cards Page";
                RunPageLink = "Customer No." = field("No.");
                ApplicationArea = All;
            }

            action("Cards Report 1")
            {
                ApplicationArea = All;
                Caption = 'Cards report for a customer';
                RunObject = report "Cards Report";
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
            }

            action("Cards Report 2")
            {
                ApplicationArea = All;
                Caption = 'Cards report for all customers';
                RunObject = report "Customer Cards Report";
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
            }
        }
    }
}
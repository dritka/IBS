pageextension 65401 "Customer Card Extension" extends "Customer Card"
{
    actions
    {
        addfirst(processing)
        {
            action("Customer Cards")
            {
                ApplicationArea = All;
                Caption = 'Cards report for a customer';
                RunObject = page "Display Cards Page";
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
            }
        }
    }
}
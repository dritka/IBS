pageextension 65400 "Customer List Extension" extends "Customer List"
{
    actions
    {
        addlast(Reports)
        {
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
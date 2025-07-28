page 65400 "Customer Cards Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = History;
    SourceTable = "Customer Cards Table";

    layout
    {
        area(Content)
        {
            group(Group)
            {
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                }

                field("Card Type"; Rec."Card Type")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    NotBlank = true;
                    Caption = 'Card Type';
                }

                field("Card Code"; Rec."Card Code")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    NotBlank = true;
                    Caption = 'Card Code';
                }

                field("CVS"; Rec."CVS")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    NotBlank = true;
                    Caption = 'CVS';
                }

                field("Valid Thru"; Rec."Valid Thru")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    NotBlank = true;
                    Caption = 'Valid Thru';
                }

                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Customer No.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Customer Cards")
            {
                Image = ShowList;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Caption = 'Show cards for this customer';
                RunObject = page "Display Page";
                RunPageLink = "Customer No." = field("Customer No.");
            }

            action("Cards Report 1")
            {
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Caption = 'Cards Report';
                RunObject = report "Cards Report";
            }

            action("Cards Report 2")
            {
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Caption = 'Cards report for each customer';
                RunObject = report "Customer Cards Report";
            }
        }
    }
}
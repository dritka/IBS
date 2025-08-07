page 65402 "Customer Cards List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Customer Cards Table";

    layout
    {
        area(Content)
        {
            group(Group)
            {
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Customer No.';
                }
                field("Card Type"; Rec."Card Type")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Caption = 'Card Type';
                }
                field("Card Code"; Rec."Card Code")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Caption = 'Card Code';
                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                }
                field("CVS"; Rec."CVS")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Caption = 'CVS';
                }
                field("Valid Thru"; Rec."Valid Thru")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Caption = 'Valid Thru';
                }
            }
        }
    }
}
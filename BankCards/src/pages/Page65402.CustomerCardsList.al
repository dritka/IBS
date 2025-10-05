page 65402 "Customer Cards List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Customer Cards Table";

    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = true;

    layout
    {
        area(Content)
        {
            repeater("Customer List")
            {
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Customer No.';
                }
                field("Card Type"; Rec."Card Type")
                {
                    ApplicationArea = All;
                    Caption = 'Card Type';
                }
                field("Card Code"; Rec."Card Code")
                {
                    ApplicationArea = All;
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
                    Caption = 'CVS';
                }
                field("Valid Thru"; Rec."Valid Thru")
                {
                    ApplicationArea = All;
                    Caption = 'Valid Thru';
                }
            }
        }
    }
}
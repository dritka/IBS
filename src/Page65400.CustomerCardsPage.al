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

                    trigger OnValidate()
                    begin
                        if Rec."Card Type" = '' then
                            Error('Card Type cannot be empty!');
                    end;
                }

                field("Card Code"; Rec."Card Code")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    NotBlank = true;
                    Caption = 'Card Code';

                    trigger OnValidate()
                    begin
                        if (StrLen(Rec."Card Code") <> 16) or not (isNumeric(Rec."Card Code")) then
                            Error('Card Code must be exactly 16 digits long!');
                    end;
                }

                field("CVS"; Rec."CVS")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    NotBlank = true;
                    Caption = 'CVS';

                    trigger OnValidate()
                    begin
                        if (StrLen(Rec."CVS") <> 3) and not (isNumeric(Rec."CVS")) then
                            Error('CVS must be exactly 3 digits long!');
                    end;
                }

                field("Valid Thru"; Rec."Valid Thru")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    NotBlank = true;
                    Caption = 'Valid Thru';

                    trigger OnValidate()
                    var
                        DateText: Code[8];
                    begin
                        DateText := Format(Rec."Valid Thru", 0, '<Year,4>/<Month,2>');
                        if DateText = '' then
                            Error('You must choose a date!');
                    end;
                }

                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Customer No.';
                }
            }
        }
    }

    // TO DO: Review and refactor
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
        }
    }

    local procedure isNumeric(Input: Code[25]): Boolean
    var
        i: Integer;
    begin
        for i := 1 to StrLen(Input) do
            if not (Format(Input[i]) in ['0' .. '9']) then
                exit(false);
        exit(true);
    end;

    trigger OnOpenPage()
    var
        CustomerCards: Record "Customer Cards Table";
    begin
        CustomerCards.DeleteAll(); // Deletes all the entries in the table
    end;
}
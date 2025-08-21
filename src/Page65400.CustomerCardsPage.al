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

                    /*
                    trigger OnValidate()
                    begin
                        if Rec."Card Type" = "Card Type"::Default then
                            Error('Default is not a valid card type, please select a valid card type!')
                    end;
                    */
                }
                field("Card Code"; Rec."Card Code")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Caption = 'Card Code';

                    /*
                    trigger OnValidate()
                    begin
                        if StrLen(Rec."Card Code") <> 16 then
                            Error('Card Code must be exactly 16 characters long!')
                    end;
                    */
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

                    /*
                    trigger OnValidate()
                    begin
                        if StrLen(Rec."CVS") <> 3 then
                            Error('CVS must be exactly 3 characters long!')
                    end;
                    */
                }
                field("Valid Thru"; Rec."Valid Thru")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Caption = 'Valid Thru (Month/Year)';

                    /*
                    trigger OnValidate()
                    begin
                        if Rec."Valid Thru" = 0D then
                            Error('Valid Thru date cannot be empty!')
                    end;
                    */
                }
            }
        }
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        ErrorText: Text;
    begin
        if AllFieldsEmpty(Rec) then
            exit(true);

        ErrorText := '';

        if Rec."Card Type" = "Card Type"::Default then
            ErrorText += 'Card Type must be filled in.\';
        if Rec."Card Code" = '' then
            ErrorText += 'Card Code must be filled in and 16 digits long exactly.\';
        if Rec."CVS" = '' then
            ErrorText += 'CVS must be filled in and 3 digits long exactly.\';
        if Rec."Valid Thru" = 0D then
            ErrorText += 'Valid Thru date must be filled';
        if ErrorText <> '' then begin
            Message(ErrorText);
            exit(false);
        end;

        exit(true);
    end;

    local procedure AllFieldsEmpty(CustomerRecord: Record "Customer Cards Table"): Boolean
    begin
        if (Rec."Description" = '') and
           (Rec."Card Type" = "Card Type"::Default) and
           (Rec."Card Code" = '') and
           (Rec."CVS" = '') and
           (Rec."Valid Thru" = 0D) and
           (Rec."Customer No." = '') then
            exit(true);
        exit(false);
    end;
}
page 65400 "Customer Cards Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = History;
    SourceTable = "Customer Cards Table";

    DeleteAllowed = false;

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
                    AutoFormatExpression = Format(Rec."Valid Thru", 0, '<Month, 2>/<Year, 4>');
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Print current customer details")
            {
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = ShowSelected;
                ApplicationArea = All;

                trigger OnAction()
                var
                    OutputMessage: Text;
                begin
                    OutputMessage += ('Description: ' + Rec."Description" + '\');
                    OutputMessage += ('Customer No.: ' + Rec."Customer No." + '\');
                    OutputMessage += ('Card code: ' + Rec."Card Code" + '\');
                    OutputMessage += ('Card type: ' + Format(Rec."Card Type") + '\');
                    OutputMessage += ('CVS: ' + Rec."CVS" + '\');
                    OutputMessage += ('Valid Thru: ' + Format(Rec."Valid Thru", 0, '<Month, 2>/<Year, 4>') + '\');
                    Message(OutputMessage);
                end;
            }

            action("Delete current customer card")
            {
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = Delete;
                ApplicationArea = All;

                trigger OnAction()
                var
                    TempCustomer: Record "Customer Cards Table";
                    CustomerRecord: Record "Customer Cards Table";
                begin
                    CustomerRecord.Get(Rec."Card Code");
                    CustomerRecord.Delete();
                    CurrPage.Close();
                    TempCustomer."Customer No." := '';
                    TempCustomer."Card Code" := '';
                    TempCustomer."Card Type" := "Card Type"::Default;
                    TempCustomer."CVS" := '';
                    TempCustomer."Description" := '';
                    TempCustomer."Valid Thru" := 0D;
                    Page.Run(Page::"Customer Cards Page", TempCustomer);
                end;
            }
        }
    }

    trigger OnDeleteRecord(): Boolean
    begin
        exit(false);
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        ErrorText: Text;
    begin
        if AllFieldsEmpty() then
            exit(true);

        ErrorText := '';

        if Rec."Card Type" = "Card Type"::Default then
            ErrorText += 'Card Type must be filled in.\';
        if (Rec."Card Code" = '') or (StrLen(Rec."Card Code") <> 16) then
            ErrorText += 'Card Code must be filled in and 16 digits long exactly.\';
        if (Rec."CVS" = '') or (StrLen(Rec."CVS") <> 3) then
            ErrorText += 'CVS must be filled in and 3 digits long exactly.\';
        if Rec."Valid Thru" = 0D then
            ErrorText += 'Valid Thru date must be filled';
        if ErrorText <> '' then begin
            Message(ErrorText);
            exit(false);
        end;

        exit(true);
    end;

    local procedure AllFieldsEmpty(): Boolean
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
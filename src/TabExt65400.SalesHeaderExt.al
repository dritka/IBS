tableextension 65400 "Sales Header Extension" extends "Sales Header"
{
    fields
    {
        field(50101; "Card Type"; Code[20])
        {
            Caption = 'Card Type';
            TableRelation = "Cards Type Table"."Card Type";
        }

        field(50102; "Card Code"; Code[20])
        {
            Caption = 'Card Code';
            TableRelation = "Customer Cards Table"."Card Code";
        }
    }

    trigger OnInsert()
    var
        CustomerCard: Record "Customer Cards Table";
    begin
        if CustomerCard.Get("Sell-to Customer No.") then begin
            "Card Type" := CustomerCard."Card Type";
            "Card Code" := CustomerCard."Card Code";
        end;
    end;
}
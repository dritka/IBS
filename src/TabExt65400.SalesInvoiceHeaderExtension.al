tableextension 65400 "Sales Invoice Header Extension" extends "Sales Invoice Header"
{
    fields
    {
        field(50101; "Card Type"; Enum "Card Type")
        {
            Caption = 'Card Type';
            TableRelation = "Cards Type Table"."Card Type";
        }
        field(50102; "Card Code"; Code[16])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Customer Cards Table"."Card Code" where("Customer No." = field("Sell-to Customer No.")));
        }
        modify("Sell-to Customer No.")
        {
            trigger OnAfterValidate()
            var
                CustomerCards: Record "Customer Cards Table";
            begin
                CustomerCards.SetRange("Customer No.", Rec."Sell-to Customer No.");
                if CustomerCards.FindFirst() then begin
                    "Card Type" := CustomerCards."Card Type";
                end;
            end;
        }
    }
}
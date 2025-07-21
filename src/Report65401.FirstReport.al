report 65401 "First Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = './layouts/CardSales.rdl';
    Caption = 'Sales for each card type for a selected customer';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Cards; "Cards Type Table")
        {
            /*
            column(CardType; CardTypeLbl) { }
            column(NoOfSalesOrder; NoOfSalesOrderLbl) { }
            column(SalesOrderAmount; SalesOrderAmountLbl) { }
            */

            column(Card_Type; "Card Type") { }
            column(No_Of_Sales_Order; NoOfSalesOrder) { }
            column(Sales_Order_Amount; SalesOrderAmount) { }

            trigger OnPreDataItem()
            var
                Rec: Record "Sales Header";
            begin
                NoOfSalesOrder := 0;
                SalesOrderAmount := 0;

                Rec.SetRange("Card Type", "Card Type");
                repeat
                    NoOfSalesOrder += 1;
                    SalesOrderAmount += Rec."Amount Including VAT";
                until Rec.Next() = 0
            end;
        }
    }

    /*
    Set the option to filter
    the data based on a from
    and to date.
    */
    requestpage
    {
        layout
        {

        }
    }

    var
        NoOfSalesOrder: Decimal;
        SalesOrderAmount: Decimal;
        CardTypeLbl: Label 'Card Type';
        NoOfSalesOrderLbl: Label 'Nr. Of Sales Order';
        SalesOrderAmountLbl: Label 'Sales Order Amount';
}
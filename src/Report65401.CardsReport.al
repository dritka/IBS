report 65401 "Cards Report"
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

    requestpage
    {
        layout
        {
            area(Content)
            {
                field(FromDate; FromDate)
                {
                    ApplicationArea = All;
                    Caption = 'Starting Date';
                }

                field(ToDate; ToDate)
                {
                    ApplicationArea = All;
                    Caption = 'Ending Date';
                }
            }
        }
    }

    labels
    {
        CardTypeLbl = 'Card Type';
        NoOfSalesOrderLbl = 'Nr. Of Sales Order';
        SalesOrderAmountLbl = 'Sales Order Amount';
    }

    var
        FromDate: Date;
        ToDate: Date;
        NoOfSalesOrder: Decimal;
        SalesOrderAmount: Decimal;
}
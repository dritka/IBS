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
            PrintOnlyIfDetail = true;
            column(Card_Type; "Card Type") { }
            column(No_Of_Sales_Order; NoOfSalesOrder) { }
            column(Sales_Order_Amount; SalesOrderAmount) { }

            trigger OnAfterGetRecord()
            var
                myInt: Integer;
                SalesInvoiceHeader: Record "Sales Invoice Header";
            begin
                NoOfSalesOrder := 0;
                SalesOrderAmount := 0;
                SalesInvoiceHeader.SetRange("Card Type", "Card Type");
                SalesInvoiceHeader.SetRange("Posting Date", FromDate, ToDate);
                SalesInvoiceHeader.CalcFields("Amount Including Vat");
                repeat
                    NoOfSalesOrder += 1;
                    SalesOrderAmount += SalesInvoiceHeader."Amount Including VAT";
                until SalesInvoiceHeader.Next() = 0;
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
        SalesPerCardTypeLbl = 'Sales per Card Type';
    }

    var
        FromDate: Date;
        ToDate: Date;
        NoOfSalesOrder: Decimal;
        SalesOrderAmount: Decimal;
}
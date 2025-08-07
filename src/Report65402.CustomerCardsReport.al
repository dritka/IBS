report 65402 "Customer Cards Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = './layouts/CustomerCardSales.rdl';
    Caption = 'Card sales for all customer';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Customer; "Customer")
        {
            PrintOnlyIfDetail = true;
            column(Customer_No; "No.") { }
            column(Customer_Name; "Name") { }
            dataitem(CustomerCards; "Customer Cards Table")
            {
                DataItemLink = "Customer No." = field("No.");
                DataItemLinkReference = Customer;
                PrintOnlyIfDetail = true;

                column(Card_Type; "Card Type") { }
                dataitem(SaleseInvoiceHeader; "Sales Invoice Header")
                {
                    DataItemLink = "Card Type" = field("Card Type");
                    DataItemLinkReference = CustomerCards;
                    CalcFields = Amount;
                    column(Sales_Order_No; "No.") { }
                    column(Sales_Order_Amount; Amount) { }
                    column(Sales_Order_Currency; "Currency Code") { }
                }
            }
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
        CustomerNoLbl = 'Customer No.';
        CustomerNameLbl = 'Customer Name';
        CardTypeLbl = 'Card Type';
        SalesOrderNoLbl = 'Sales Order No.';
        SalesOrderAmountLbl = 'Sales Order Amount';
        SalesOrderCurrencyLbl = 'Sales Order Currency';
    }

    var
        FromDate: Date;
        ToDate: Date;
}
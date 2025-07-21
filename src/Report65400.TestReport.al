report 65400 "Test Report"
{
    RDLCLayout = './layouts/MyOrderConf.rdl';
    Caption = 'My Order Confirmation';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            column(No; "No.") { }
            column(BilltoCustomerNo; "Bill-to Customer No.") { }
            column(BilltoName; "Bill-to Name") { }
            column(BilltoAddress; "Bill-to Address") { }
            column(BilltoCity; "Bill-to City") { }
            column(BilltoPostCode; "Bill-to Post Code") { }

            dataitem(Line; "Sales Line")
            {
                DataItemLink = "Document No." = Field("No.");
                DataItemLinkReference = SalesHeader;
                DataItemTableView = sorting("Document No.", "Line No.");

                column(No_; "No.") { }
            }
        }
    }
}
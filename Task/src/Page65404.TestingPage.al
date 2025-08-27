page 65404 "Testing Page"
{
    PageType = Card;
    ApplicationArea = All;

    actions
    {
        area(processing)
        {
            action("Start Counting")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    MyDialog: Dialog;
                    MyNext: Integer;
                    Text000: Label 'The page will close in #1';
                begin
                    MyNext := 10;
                    MyDialog.Open(Text000, MyNext);
                    repeat
                        Sleep(1000);
                        MyNext := MyNext - 1;
                        MyDialog.Update();
                    until MyNext = 0;
                    Sleep(1000);
                    MyDialog.Close();
                    CurrPage.Close();
                end;
            }
        }
    }
}
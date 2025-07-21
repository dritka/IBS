codeunit 65400 "Customer Handler"
{
    [EventSubscriber(ObjectType::Table, Database::"Customer Cards table", OnBeforeInsertEvent, '', false, false)]
    local procedure OnBeforeInsertCustomerData(Rec: Record "Customer Cards Table")
    begin
        Rec.TestField("Card Type", Rec."Card Type");
    end;
}
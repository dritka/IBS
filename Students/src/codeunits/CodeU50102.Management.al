codeunit 50102 Management
{
    procedure AllMandatoryFields(Rec: Record StudentTable): Boolean
    var
        ErrorText: Text;
    begin
        if Rec."Student ID" = '' then
            ErrorText += 'Student ID cannot be empty!\';
        if Rec."First Name" = '' then
            ErrorText += 'First name cannot be empty!\';
        if Rec."Last Name" = '' then
            ErrorText += 'Last name cannot be empty!\';
        if not ValidFullName(Rec."First Name", Rec."Last Name", Rec."Full Name") then
            ErrorText += 'Full name must match first and last names!\';
        if Rec."Age" = 0 then
            ErrorText += 'Age cannot be empty! Please enter a valid age!\';
        if Rec."Class" = ClassEnum::None then
            ErrorText += 'Class cannot be empty!';

        if ErrorText <> '' then begin
            Message(ErrorText);
            exit(false);
        end;
        exit(true);
    end;

    // Review
    procedure ValidFullName(FirstName: Text[20]; LastName: Text[20]; FullName: Text[50]): Boolean
    begin
        if (not FullName.StartsWith(FirstName)) or (not FullName.EndsWith(LastName)) then
            exit(false);
        exit(true);
    end;
}
permissionset 50100 StudentPermissions
{
    Caption = 'Students';
    Assignable = true;
    Permissions =
        tabledata Studenttable = RMID,
        tabledata StudentGrades = RMID;
}
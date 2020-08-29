
var addEmployee = document.getElementById("addEmployee");
var departmentDropdown = document.getElementById("departmentDropdown");
var leaveDropdown = document.getElementById("leaveDropdown");
var employeeRole = document.getElementById("employeeRole").value;

if(employeeRole == 2){
    leaveDropdown.style.display = "none";
    addEmployee.style.display = "none";
    departmentDropdown.style.display = "none";
}
else
{
    leaveDropdown.style.display = "";
    addEmployee.style.display = "";
    departmentDropdown.style.display = "";
}

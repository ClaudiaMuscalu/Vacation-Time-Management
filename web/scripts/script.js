dropdownFunction = function ()  {
    const dropdown = document.getElementsByClassName("dropdown-btn");

    for (let i = 0; i < dropdown.length; i++) {
        dropdown[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var dropdownContent = this.nextElementSibling;
            if (dropdownContent.style.display === "block") {
                dropdownContent.style.display = "none";
            } else {
                dropdownContent.style.display = "block";
            }
        });
    }
}
dropdownFunction();

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

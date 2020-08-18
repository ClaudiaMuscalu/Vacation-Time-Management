var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
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

DeleteFunction = function () {
    var button = document.getElementById("delete-button");

    button.addEventListener("click", function() {
        debugger;
        if(confirm("Are you sure that you want to delete this item?"))
        {
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4) {

                    var data = xhr.responseText;
                    alert(data);
                }
            }
            xhr.open('GET', url, true);
            xhr.send(null);
        }
    });
}

var startDateInput = document.getElementById("start");
var endDateInput = document.getElementById("end");
var errorStartDate = document.getElementById("wrongStart");
var errorEndDate = document.getElementById("wrongEnd");
var errorPeriod = document.getElementById("wrongPeriod");
var btnRequest = document.getElementById("btn-submit");
var errorData = document.getElementById("wrongData");

var ok1 = 1;
var ok2 = 1;
var ok3 = 1;

startDateInput.addEventListener("focusout", function() {
    debugger;
    var currentDate = new Date();
    var startDate = new Date(startDateInput.value);
    if(startDate <= currentDate)
    {
        errorStartDate.style.display = "";
        ok1 = 0;
    }

    else{
        errorStartDate.style.display = "none";
        ok1 = 1;
    }

});

endDateInput.addEventListener("focusout", function() {
    debugger;
    var currentDate = new Date();
    var endDate = new Date(endDateInput.value);
    var startDate = new Date(startDateInput.value);
    if(endDate <= currentDate){
        errorEndDate.style.display = "";
        ok2 = 0;
    }

    else{
        errorEndDate.style.display = "none";
        ok2 = 1;
    }


    if(endDate < startDate) {
        ok3 = 0;
        errorPeriod.style.display = "";
    }

    else {
        errorPeriod.style.display = "none";
        ok3 = 1;
    }
});

btnRequest.addEventListener("click", function () {

    let endDate = new Date(endDateInput.value);
    let startDate = new Date(startDateInput.value);
    let Difference_In_Time = endDate.getTime() - startDate.getTime();

    let Difference_In_Days = Difference_In_Time / (1000 * 3600 * 24);

    var inputDaysLeft = document.getElementById("daysLeft");
    var inputPeriodsLeft = document.getElementById("periodsLeft");
    var errorNotDaysLeft = document.getElementById("notDaysLeft");
    var errorNotPeriodsLeft = document.getElementById("notPeriodsLeft");

    var ok4 = 1;
    var ok5 = 1;

    if(inputDaysLeft.value < Difference_In_Days)
    {
        errorNotDaysLeft.style.display = "";
        btnRequest.type = "button";
        ok4 = 0;
    }

    else
    {
        errorNotDaysLeft.style.display = "none";
        btnRequest.type = "submit";
        ok4 = 1;
    }

    if(inputPeriodsLeft.value == 1)
    {
        if(inputDaysLeft.value != Difference_In_Days)
        {
            errorNotPeriodsLeft.style.display = "";
            ok5 = 0;
        }
        else
        {
            errorNotPeriodsLeft.style.display = "none";
            ok5 = 1;
        }
    }

    if(ok1 + ok2 + ok3 + ok4  + ok5 != 5){
        btnRequest.type = "button";
        errorData.style.display = "";

    }
    else
    {
        errorData.style.display = "none";
        btnRequest.type = "submit";
    }
});




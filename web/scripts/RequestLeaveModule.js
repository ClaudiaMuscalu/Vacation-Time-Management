

var startDateInput = document.getElementById("start");
var endDateInput = document.getElementById("end");
var errorStartDate = document.getElementById("wrongStart");
var errorEndDate = document.getElementById("wrongEnd");
var errorPeriod = document.getElementById("wrongPeriod");
var btnRequest = document.getElementById("btn-submit");
var errorData = document.getElementById("wrongData");
var errorMinimumPeriod = document.getElementById("minPeriodLeave");
var errorRestrictivePeriod = document.getElementById("restrictivePeriod");
var inputHoliday1June31August = document.getElementById("holidayBetween1June31Aug");
var specialPeriod = document.getElementById("specialPeriod");

var ok1 = 1;
var ok2 = 1;
var ok3 = 1;

startDateInput.addEventListener("focusout", function () {

    var currentDate = new Date();
    var startDate = new Date(startDateInput.value);
    if (startDate <= currentDate) {
        errorStartDate.style.display = "";
        ok1 = 0;
    } else {
        errorStartDate.style.display = "none";
        ok1 = 1;
    }

});

endDateInput.addEventListener("focusout", function () {

    var currentDate = new Date();
    var endDate = new Date(endDateInput.value);
    var startDate = new Date(startDateInput.value);
    if (endDate <= currentDate) {
        errorEndDate.style.display = "";
        ok2 = 0;
    } else {
        errorEndDate.style.display = "none";
        ok2 = 1;
    }


    if (endDate < startDate) {
        ok3 = 0;
        errorPeriod.style.display = "";
    } else {
        errorPeriod.style.display = "none";
        ok3 = 1;
    }
});

btnRequest.addEventListener("click", function () {
    //debugger;

    let endDate = new Date(endDateInput.value);
    let startDate = new Date(startDateInput.value);
    let Difference_In_Time = endDate.getTime() - startDate.getTime();

    let Difference_In_Days = Difference_In_Time / (1000 * 3600 * 24);
    console.log(Difference_In_Days);

    var ok6 = 1;
    if (Difference_In_Days < 5) {
        errorMinimumPeriod.style.display = "";
        ok6 = 0;
    } else {
        errorMinimumPeriod.style.display = "none";
        ok6 = 1;
    }

    var inputDaysLeft = document.getElementById("daysLeft");
    var inputPeriodsLeft = document.getElementById("periodsLeft");
    var errorNotDaysLeft = document.getElementById("notDaysLeft");
    var errorNotPeriodsLeft = document.getElementById("notPeriodsLeft");

    var ok4 = 1;
    var ok5 = 1;

    if (inputDaysLeft.value < Difference_In_Days) {
        errorNotDaysLeft.style.display = "";
        btnRequest.type = "button";
        ok4 = 0;
    } else {
        errorNotDaysLeft.style.display = "none";
        btnRequest.type = "submit";
        ok4 = 1;
    }

    if (inputPeriodsLeft.value == 1) {
        if (inputDaysLeft.value != Difference_In_Days) {
            errorNotPeriodsLeft.style.display = "";
            ok5 = 0;
        } else {
            errorNotPeriodsLeft.style.display = "none";
            ok5 = 1;
        }
    }

    var ok7 = 1;
    var ok8 = 1;

    if (startDate.getMonth() == 5 || startDate.getMonth() == 6 || endDate.getMonth() == 5
        || endDate.getMonth() == 6) {
        if (inputHoliday1June31August.value == 1) {
            specialPeriod.style.display = "";
            ok8 = 0;
        } else {
            specialPeriod.style.display = "none";
            ok8 = 1;
        }

    }

    if (ok8 == 1) {
        const date1 = new Date('06/01/2021');
        const date2 = new Date('08/31/2021');

        var PeriodBetweenJuneAndAugust = Difference_In_Days;

        var timeBefore1June = date1.getTime() - startDate.getTime();
        var daysBefore1June = Math.ceil(timeBefore1June / (1000 * 3600 * 24));

        var timeAfter31August = endDate.getTime() - date2.getTime();
        var daysAfter31August = Math.ceil(timeAfter31August / (1000 * 3600 * 24));


        if (daysBefore1June > 0) {
            if (endDate >= date1 && endDate <= date2) {
                PeriodBetweenJuneAndAugust = PeriodBetweenJuneAndAugust - daysBefore1June;
                if (PeriodBetweenJuneAndAugust > 21) {
                    ok7 = 0;
                    errorRestrictivePeriod.style.display = "";
                } else {
                    ok7 = 1;
                    errorRestrictivePeriod.style.display = "none";
                    inputHoliday1June31August.value = "1";
                }
            }
        } else {
            if ((startDate <= date2 && startDate >= date1)) {
                if ((endDate <= date2 && endDate >= date1)) {
                    if (Difference_In_Days > 21) {
                        ok7 = 0;
                        errorRestrictivePeriod.style.display = "";
                    } else {
                        ok7 = 1;
                        errorRestrictivePeriod.style.display = "none";
                        inputHoliday1June31August.value = "1";
                    }
                } else {
                    if (Difference_In_Days - daysAfter31August > 21) {
                        ok7 = 0;
                        errorRestrictivePeriod.style.display = "";
                    } else {
                        ok7 = 1;
                        errorRestrictivePeriod.style.display = "none";
                        inputHoliday1June31August.value = "1";
                    }

                }

            }
        }
    }


    if (ok1 + ok2 + ok3 + ok4 + ok5 + ok6 + ok7 + ok8 != 8) {
        btnRequest.type = "button";
        errorData.style.display = "";

    } else {
        errorData.style.display = "none";
        btnRequest.type = "submit";
    }
});




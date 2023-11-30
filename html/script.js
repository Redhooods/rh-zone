var display = false;

function displayUI(bool) {
    if (!bool) {
        $("#zona").hide();
    } else {
        $("#zona").show();
    }
}


$(document).ready(function () {
    displayUI(false);

    document.onkeyup = function (data) {
        if (data.which == 27) { // ESC
            $.post("https://rh-zone/exit", JSON.stringify({}));
            console.log("exited");
            return;
        }
    };
});

window.addEventListener("message", function(event) {
    var item = event.data;
    if (item.type === "ui") {
        if (item.status == true) {
            displayUI(true);
        } else {
            displayUI(false);
        }
    }
});

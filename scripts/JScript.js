function onReady(callback) {
    var intervalID = window.setInterval(checkReady, 6000); //6

    function checkReady() {
        if (document.getElementsByTagName('body')[0] !== undefined) {
            window.clearInterval(intervalID);
            callback.call(this);
        }
    }
}

function show(id, value) {
    document.getElementById(id).style.display = value ? 'block' : 'none';
}

onReady(function () {
    show('form1', true);
    show('loading', false);
    $("div").remove("#loading");

});



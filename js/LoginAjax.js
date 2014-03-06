//tipo de mensajes ->  anim error, success,info,anim warning
function mensaje(texto, titulo, tipo) {
    new Messi(texto, {
        title: titulo,
        titleClass: tipo, modal: true, buttons: [{ id: 0, label: 'Close', val: 'X' }]
    });
}

$(document).keypress(function (e) {
    if (e.which == 13) {
        $("#login").click();
    }
});

$(document).ready(function () {

    $("#login").click(function () {
        $.prettyLoader();
        var pass = $("#UserPass").val();
        pass = $.sha256(pass);
        var usreg = $("#usuario").val();
        var app = "Survey012014";
        var datae = { 'name': usreg, 'pass': pass, 'app': app };
        $.ajax({
            type: "POST",
            url: "admin.aspx/validarIngresoAdmin",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(datae),
            dataType: "json",
            success: function (resultado) {
                if (resultado.d === "ok") {
                    document.location.href = "report.aspx";
                } else {
                    mensaje("Alert, please try again", "Avaya Survey", "anim error");
                }
            }
        });
        return false;
    });
});
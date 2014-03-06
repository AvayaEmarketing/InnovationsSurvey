//tipo de mensajes ->  anim error, success, info, anim warning
function mensaje(texto, titulo, tipo) {
    new Messi(texto, {
        title: titulo,
        titleClass: tipo, modal: true, buttons: [{ id: 0, label: 'Close', val: 'X' }]
    });
}

var QueryString = function () {
    // This function is anonymous, is executed immediately and 
    // the return value is assigned to QueryString!
    var query_string = {};
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split("=");
        // If first entry with this name
        if (typeof query_string[pair[0]] === "undefined") {
            query_string[pair[0]] = pair[1];
            // If second entry with this name
        } else if (typeof query_string[pair[0]] === "string") {
            var arr = [query_string[pair[0]], pair[1]];
            query_string[pair[0]] = arr;
            // If third or later entry with this name
        } else {
            query_string[pair[0]].push(pair[1]);
        }
    }
    return query_string;
}();


function putInformation(formulario) {
    var datae = { 'email': formulario.email, 'q1': formulario.q1, 'q2': formulario.q2, 'q3': formulario.q3, 'q4': formulario.q4, 'q5': formulario.q5, 'q6': formulario.q6, 'q7': formulario.q7, 'q8': formulario.q8, 'q9': formulario.q9, 'q10': formulario.q10, 'q11': formulario.q11, 'q12': formulario.q12, 'q13': formulario.q13, 'q14': formulario.q14 };
    $.ajax({
        type: "POST",
        url: "register.aspx/putData",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(datae),
        dataType: "json",
        success: function (resultado) {
            if (resultado.d !== "fail") {
                document.location.href = "thanks.html";
            } else {
                mensaje("Alert, please try again", "Avaya Survey", "anim error");
            }
        }
    });
    return false;
}

$(document).ready(function () {
   
    $("#accept").click(function () {
        var formulario = getForm();
        var validado = validar(formulario);
        if (validado) {
            putInformation(formulario);
        } else {
            mensaje("Please check the required fields", "Avaya Survey", "anim error");
        }
    });


});

function validaMail(mail) {
    var rta;
    var correo = /^[A-Za-z][A-Za-z0-9_\.-]*@[A-Za-z0-9_-]+\.[A-Za-z0-9_.]+[A-za-z]$/;
    if (!correo.exec(mail)) {
        rta = false;
    } else {
        rta = true;
    }
    return rta;
}

function validar(obj) {
    var respuesta = 0;
    for (var i in obj) {
        if (obj[i] == null || obj[i].length < 1 || /^\s+$/.test(obj[i])) {
            if (i == "q11") {
                respuesta = respuesta + 0;
                $("#" + i).css('background', '#FFF');
            } else {
                respuesta = respuesta + 1;
                $("#" + i).css('background', '#E2E4FF');
            }

        } else {
            if (i == "email") {
                var correo = /^[A-Za-z][A-Za-z0-9_\.-]*@[A-Za-z0-9_-]+\.[A-Za-z0-9_.]+[A-za-z]$/;
                if (!correo.exec(obj[i])) {
                    respuesta = respuesta + 1;
                    $("#" + i).css('background', '#E0AAAA');
                } else {
                    respuesta = respuesta + 0;
                    $("#" + i).css('background', '#FFF');
                }
            } else {
                respuesta = respuesta + 0;
            }

        }
    }
    if (respuesta === 0) {
        return true;
    } else {
        return false;
    }
}

function getForm() {

    var valores2 = "";
    $('#q2 :checkbox:checked').each(function () {
        valores2 = valores2 + $(this).val() + ',';
    });
    if ((valores2.substring(valores2.length - 1, valores2.length)) === ',') {
        valores2 = valores2.substring(0, valores2.length - 1);
    }
    var q1 = $("#q1").val();
    var q2 = valores2;
    var q3 = $("#q3 input[type='radio']:checked").val();
    var q4 = $("#q4 input[type='radio']:checked").val();
    var q5 = $("#q5 input[type='radio']:checked").val();
    var q6 = $("#q6 input[type='radio']:checked").val();
    var q7 = $("#q7 input[type='radio']:checked").val();
    var q8 = $("#q8 input[type='radio']:checked").val();
    var q9 = $("#q9 input[type='radio']:checked").val();
    var q10 = $("#q10 input[type='radio']:checked").val();
    var q11 = $("#q11").val();
    var q12 = $("#q12").val();
    var q13 = $("#q13").val();
    var q14 = $("#q14").val();
    var email = QueryString.em;
    if (email == undefined) {
        email = "wballesteros@avaya.com";
    }

    var formulario = new Object();
        formulario.q1 = q1;
        formulario.q2 = q2;
        formulario.q3 = q3;
        formulario.q4 = q4;
        formulario.q5 = q5;
        formulario.q6 = q6;
        formulario.q7 = q7;
        formulario.q8 = q8;
        formulario.q9 = q9;
        formulario.q10 = q10;
        formulario.q11 = q11;
        formulario.q12 = q12;
        formulario.q13 = q13;
        formulario.q14 = q14;
        formulario.email = email;
    
    return formulario;
}


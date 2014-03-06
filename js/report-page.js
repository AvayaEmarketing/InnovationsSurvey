var oTable;
var giRedraw = false;
var dataTab;
var aData;
var iframe;

//tipo de mensajes ->  anim error, success, info, anim warning
function mensaje(texto,titulo,tipo) {
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

function cargarDatos() {
    
    $.prettyLoader();
    

    $.ajax({
        type: "POST",
        url: "report.aspx/getDatosReg",
        contentType: "application/json; charset=utf-8",
        data: '{}',
        dataType: "json",
        success: AjaxGetFieldDataSucceeded,
        error: AjaxGetFieldDataFailed
    });
}

function cargarDatos2() {
    
    $.ajax({
        type: "POST",
        url: "report.aspx/getDatosReg",
        contentType: "application/json; charset=utf-8",
        data: '{}',
        dataType: "json",
        success: AjaxRefreshDataSucceeded,
        error: AjaxRefreshDataFailed
    });
}

function AjaxRefreshDataSucceeded(result) {
    if (result.d != "[]") {
        var jposts = result.d;
        var mensaje;
        var titulo;
        dataTab = $.parseJSON(jposts);
        oTable.fnClearTable();
        oTable.fnAddData(dataTab);
    } else {
	    oTable.fnClearTable();
		mensaje = "No data found";
                titulo = "anim error";
                new Messi(mensaje,
                { title: 'Alert', titleClass: titulo, modal: true, buttons: [{ id: 0, label: 'Close', val: 'X' }] });
		
	}
}

function AjaxRefreshDataFailed(result) {
    alert(result.status + ' ' + result.statusText);
}

function AjaxGetFieldDataSucceeded(result) {
    if ((result.d != "[]") || (result.d == "")){
        var jposts = result.d;
        var mensaje;
        var titulo;
        try {
            dataTab = $.parseJSON(jposts);
        } catch (exception) {
            dataTab = "error";
        }
        if (dataTab != "error") {
            $("#datatables").css("visibility", "visible");
            oTable = $('#datatables').dataTable({
                "bProcessing": true,
                "aaData": dataTab,
                "aoColumns": [{ "mDataProp": "email" }, { "mDataProp": "registerDate" }, { "mDataProp": "q1" }, { "mDataProp": "q2" }, { "mDataProp": "q3" }, { "mDataProp": "q4" }, { "mDataProp": "q5" }, { "mDataProp": "q6" }, { "mDataProp": "q7" }, { "mDataProp": "q8" }, { "mDataProp": "q9" }, { "mDataProp": "q10" }, { "mDataProp": "q11" }, { "mDataProp": "q12" }, { "mDataProp": "q13" }, { "mDataProp": "q14" }],
                "sPaginationType": "full_numbers",
                "aaSorting": [[0, "asc"]],
                "bJQueryUI": true
            });
        };
    } else {
	    mensaje = "No data found";
                titulo = "anim error";
                new Messi(mensaje,
                { title: 'Alert', titleClass: titulo, modal: true, buttons: [{ id: 0, label: 'Close', val: 'X' }] });
        
    }
}

function AjaxGetFieldDataFailed(result) {
    alert(result.status + ' ' + result.statusText);
}


$(document).ready(function () {

    validaSession();

    cargarDatos();
    
    $("#datatables #tbody").click(function (event) {
        $(oTable.fnSettings().aoData).each(function () {
            $(this.nTr).removeClass('row_selected');
        });
        $(event.target.parentNode).addClass('row_selected');

        var tds = $(event.target.parentNode).find("td");
        var node = tds[0].childNodes[0];
        aData = node.data;
    });

    $("#toPDF").click(function (e) {
        exportarTabla('PDF');
        if (iframe !== undefined) {
            iframe.src = "";
        }
    });

    $("#toExcel").click(function (e) {
        exportarTabla('XLS');
        if (iframe !== undefined) {
            iframe.src = "";
        }
    });
	
	$("#exit").click(function (e) {
	    
        document.location.href = "admin.aspx";
    });
	
	

});

function validaSession() {
    var rta = 0;;
    $.ajax({
        type: "POST",
        url: "admin.aspx/validaSession",
        dataType: "text",
        contentType: "application/json; charset=utf-8",
        data: '{}',
        dataType: "json",
        success: function (result) {
            if (result.d === "fail") {
                document.location.href = "admin.aspx";
            } else {
                $("#nombre").html(result.d);
            }
        }
    });
    return false;
}

function exportarTabla(formato) {
    var DTO = { 'format': formato };

    $.ajax({
        type: "POST",
        url: "report.aspx/Convertir",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(DTO),
        dataType: "json",
        success: function (result) {
            var jposts = result.d;
            var mensaje;
            var titulo;

            if (result.d != "fail") {
                //url = "http://www4.avaya.com/usa/events/Evolutions/SanFrancisco/ExcelFiles/" + result.d;
                //window.open(url, '_blank');
                downloadURL(result.d);
            }
            else if (result.d == "fail") {
                mensaje = "fail, please try again";
                titulo = "anim error";
                new Messi(mensaje,
                { title: 'User Proccess', titleClass: titulo, modal: true, buttons: [{ id: 0, label: 'Close', val: 'X' }] });
            }
        },
        error: AjaxtoPDFFailed
    });

}

function downloadURL(url) {

    iframe = document.getElementById("hiddenDownloader");
    if (iframe === null) {
        iframe = document.createElement('iframe');
        iframe.id = "hiddenDownloader";
        iframe.style.visibility = 'hidden';
        document.body.appendChild(iframe);
    }
    iframe.src = "DescargarArchivo.ashx?file=" + url;
}

function fnGetSelected(oTableLocal) {
    var aReturn = new Array();
    var aTrs = oTableLocal.fnGetNodes();

    for (var i = 0 ; i < aTrs.length ; i++) {
        if ($(aTrs).hasClass('row_selected')) {
            aReturn.push(aTrs);
        }
    }
    return aReturn;
}

function AjaxtoPDFFailed(result) {
    alert(result.status + ' ' + result.statusText);
}

function AjaxDeleteDataFailed(result) {
    alert(result.status + ' ' + result.statusText);
}

function AjaxGetDataFailed(result) {
    alert(result.status + ' ' + result.statusText);
}


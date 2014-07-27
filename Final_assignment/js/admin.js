
$(document).ready(function() {            
	$.ajax({
        	type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/Ajax.asmx/GetUsers',
                data: '{}',
                dataType:"json",
                success: function (msg) {
                    $("#ddlUsers").get(0).options.length = 0;
                    $("#ddlUsers").get(0).options[0] = new Option("Select User", "-1");
                    
                    $(msg.d).each(function (index) {                                                
                        $("#ddlUsers").get(0).options[$("#ddlUsers").get(0).options.length] = new Option(msg.d[index],index)
                    });
                },
                error: function (msg) {
                    alert('Failed to load'+msg);
                }
            });
	$.ajax({
        	type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/Ajax.asmx/GetText',
                data: '{}',
                dataType:"json",
                success: function (msg) {
                    $("#ddlParagraphs").get(0).options.length = 0;
                    $("#ddlParagraphs").get(0).options[0] = new Option("Select Paragraph", "-1");
                    
                    $(msg.d).each(function (index) {                                                
                        $("#ddlParagraphs").get(0).options[$("#ddlParagraphs").get(0).options.length] = new Option(msg.d[index],index)
                    });
                },
                error: function (msg) {
                    alert('Failed to load'+msg);
                }
            });       
        
    $("#btnEditText").click(function () {
        $("#initialContent").fadeToggle(2000, "linear", function () {
            $("#webEdits").fadeToggle(2000, "linear");
        })
    });
    $("#btnSubmitParagraph").click(function () {
        var text = $("#txtEditParagraph").val();
        var p = $("#ddlParagraphs").val();
        if (text == '' || text == undefined) {
            return alert("please enter some text");
        }
        $.ajax({
            type: "POST",
            url: "/Ajax.asmx/UpdateParagraphText",
            contentType: "application/json",
            data: '{ "text" : "' + text + '","id" : "'+p+'"}',
            success: function (data) {
                alert(data.d);
                $("#txtEditParagraph").val('')
                $("#ddlParagraphs").val(-1);
            },
            error: function (data) {                
                alert(data.responseText);
            }
        });        
    });

});

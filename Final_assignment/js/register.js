
        $(document).ready(function () {
            $('#btnCheck').click(function () {
                var user = $('#ContentPlaceHolder1_txtUser').val();
                if (user == '' || user == undefined) {
                    return alert("please enter username");
                }
                $.ajax({
                    type: "POST",
                    url: "/Ajax.asmx/CheckUser",
                    contentType: "application/json",
                    data: '{ "user" : "' + user + '"}',
                    success: function (data) {
                        var userName = $("#usernameCheck");
                        userName.html(data.d);
                        userName.animate({left:'230px',opacity:'0.5'},4000,function(){userName.hide()})

                    },
                    error: function (data) {
                        var error = $("#error");
                        $(error).html(data.responseText);
                    }
                });
            });
        });
    
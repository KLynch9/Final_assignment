$("#btnBuyTickets").click(function () {
            $("#content").animate({ letterSpacing: "10px", fontSize: "1px" }, 2000).hide(1000, function () {
                $("#ticketPurchase").fadeIn(2000).css({ "color": "82AC10", "font-size": "20px", "font-weight": "bold" });                
            });
        });
        $("#selAdults").change(function () {
            var combined = 0;
            $("#selAdults").each(function () {
                combined += parseFloat(this.value, 10)*15;
            });                        
            $("#totalAdults").html(combined); 
        });
        $("#selChild").change(function () {
            var combined = 0;
            $("#selChild").each(function () {
                combined += parseFloat(this.value, 10) * 5;
            });
            $("#totalChild").html(combined);
        });
        $("#selSenior").change(function () {
            var combined = 0;
            $("#selSenior").each(function () {
                combined += parseFloat(this.value, 10) * 10.00;
            });
            $("#totalSenior").html(combined);
        });
        $("#selFamily").change(function () {
            var combined = 0;
            $("#selFamily").each(function () {
                combined += parseInt(this.value, 10) * 35.00;
            });
            $("#totalFamily").html(combined);
        });        
        
        $('select').change(function () {
            var total = 0;
            $('select > option:selected').each(function () {                
                var a = $("#totalFamily").html();
                var b = $("#totalSenior").html();
                var c = $("#totalChild").html();
                var d = $("#totalAdults").html();
                if (a!="") {
                    a = parseFloat(a);
                }
                else {
                    a = 0;
                }
                if (b != "") {
                    b = parseFloat(b);
                }
                else {
                    b = 0;
                }
                if (c != "") {
                    c = parseFloat(c);
                }
                else {
                    c = 0;
                }
                if (d != "") {
                    d = parseFloat(d);
                }
                else {
                    d = 0;
                }
                total = a + b + c + d;
                total = 'Total: $'+total.toFixed(2);
            });
            printTotal(total);
        });
        function printTotal(total) {
            $("#pTotal").html(total);
        }
        $("#btnBuyTix").click(function () {
            if (userValidate() == "valid") {
                $("#pPayment").html("Here are you options for payment");
            }
            else {
                $("#pError").html("You need to Login");
            }
            
        });
        function userValidate() {
            var valid;
            $.ajax({
                type: "POST",
                url: "/Ajax.asmx/CheckSession",                
                data: '{}',
                async: false,
                success: function (data) {
                    //var userName = $("#pPayment");
                    valid = data.documentElement.innerHTML;                   
                },
                error: function (data) {
                    var error = $("#pPayment");
                    $(error).html(data.responseText);
                }
            });            
            return valid;
        }

        $(document).ready(function () {
            welcomeText();
            featuredText();
            tixText();
        });
        function welcomeText() {
            $('#welcomeText').load("/Ajax.asmx/GetWelcomeParagraph", function (responseTxt, statusTxt, xhr) {
                if (statusTxt == "error") {
                    alert("error" + xhr.status + "," + xhr.statusText);
                };            
            })
        }
        function featuredText() {
            $('#featuredAnimals').load("/Ajax.asmx/GetFeaturedAnimalsParagraph", function (responseTxt, statusTxt, xhr) {
                if (statusTxt == "error") {
                    alert("error" + xhr.status + "," + xhr.statusText);
                };
            })
        }
        function tixText() {
            $('#tix').load("/Ajax.asmx/GetTixParagraph", function (responseTxt, statusTxt, xhr) {
                if (statusTxt == "error") {
                    alert("error" + xhr.status + "," + xhr.statusText);
                };
            })
        }

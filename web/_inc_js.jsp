<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script>


    $("#loginForm").submit(function () {

        var _email = $(this).children("input[name=email]").val();
        var _password = $(this).children("input[name=password]").val();

        $.post("login.jsp", {email: _email, password: _password}, function (data) {
            //console.log(data.trim());
            if (data.trim() == "ok") {
                window.location = "profile.jsp";
            } else {
                $("#loginwindow").css("border", "3px solid red");
            }
        });

        return false;
    })

    $("#loginLink").click(function () {
        $("#popupLogin").fadeIn();
    });

    $("#signinLink").click(function () {
        $("#popupSignin").fadeIn();
    });

    $(".popup img").click(function () {
        $(this).parent("div").fadeOut();
    });

    $("#search input").keydown(function () {
        $("#searchResults").fadeIn();
    });

    $("#search input").keyup(function () {
        if ($(this).val() == "") {
            //$("#searchResults").html("");
            $("#searchResults").fadeOut();
        }
    });

</script>
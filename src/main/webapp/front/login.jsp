<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../boot/css/bootstrap.min.css">
    <link rel="stylesheet" href="../jqgrid/extend/css/trirand/ui.jqgrid-bootstrap.css">
    <script src="../boot/js/jquery-3.3.1.min.js"></script>
    <script src="../boot/js/bootstrap.3.3.7.min.js"></script>
    <script src="../jqgrid/js/i18n/grid.locale-cn.js"></script>
    <script src="../jqgrid/extend/js/trirand/jquery.jqGrid.min.js"></script>
    <script src="../boot/js/ajaxfileupload.js"></script>
    <title>持明法洲前台登录页面</title>
    <script type="text/javascript">
        function sub() {
            var prop = $("#checkb").prop("checked");
            if(prop == true){
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/user/login",
                data: $('#form').serialize(),
                success: function (result) {
                    if(result.error == 200){
                        mo();
                    }else if(result.error == 400){
                        $("#username").attr("class","form-group has-error has-feedback")
                        $("#usernamesp").attr("class","glyphicon glyphicon-remove form-control-feedback")
                    }else if(result.error == 300){
                        mo1();
                    }else{
                        $("#password").attr("class","form-group has-error has-feedback")
                        $("#passwordsp").attr("class","glyphicon glyphicon-remove form-control-feedback")
                    }
                }
                });
            }else{
                $("#mymo1").modal("show")
            }
        }
        function rem() {
            $("#username").attr("class","form-group  has-feedback")
            $("#usernamesp").attr("class","glyphicon  form-control-feedback")
        }
        function rem1() {
            $("#password").attr("class","form-group  has-feedback")
            $("#passwordsp").attr("class","glyphicon  form-control-feedback")
        }
        function mo() {
            $("#mymo").modal("show")
            setInterval("jindu()",100);
        }
        function mo1() {
            $("#mymo3").modal("show")
            setInterval("jindu()",100);
        }
        var time = 0;
        function jindu() {
            $("#jd").attr("style","width:"+time+"%")
            if(time < 20){
                time = time + 1 ;
            }else{
                time = time + 8
            }
            if(time == 100){
                <%--parent.location.href="${pageContext.request.contextPath}/back/main.jsp"--%>
            }
        }
        $(function () {
            $('[data-toggle="popover"]').popover()
        })
        function regist() {
            location.href = "${pageContext.request.contextPath}/front/regist.jsp";
        }
        function loginPhone() {
            $("#body").load("${pageContext.request.contextPath}/front/phonelogin.jsp")
        }
        function loginuser() {
            $("#body").load("${pageContext.request.contextPath}/front/loginbody.jsp")
        }
        function num(){
            var val = $("#phone1").val();
            $.get("${pageContext.request.contextPath}/user/code","phone="+val,function (data) {
                alert(data)
                $("#code").blur(function () {
                    var val1 = $("#code").val();
                    if(val1 == data){
                        alert($("#qq"))
                        $("#qq").click(function () {
                            $("#myfor").submit();
                        })
                    }else{
                        alert("验证码输入不正确")
                        $("#qq").click(function () {
                        })
                    }

                })

            },"json")
        }
    </script>
    <style>
    #mymo{
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translateX(-50%) translateY(-50%);

    }
    #mymo1{
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translateX(-50%) translateY(-50%);

    }
    #mymo3{
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translateX(-50%) translateY(-50%);

    }
    </style>
</head>
  <body>
<%--页头--%>
    <jsp:include page="loginhead.jsp"/>
<%--页体--%>
<div id = "body">
    <jsp:include page="loginbody.jsp"/>
</div>
<%--页尾--%>
<jsp:include page="foot.jsp"/>
  </body>
</html>

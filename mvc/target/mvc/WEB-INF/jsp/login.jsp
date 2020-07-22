<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath}/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="${pageContext.request.contextPath}/vendors/animate.css/animate.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/build/css/custom.min.css" rel="stylesheet">
    <!-- layui -->
    <link href="${pageContext.request.contextPath}/vendors/layui/css/layui.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js"></script>
    <!-- layui -->
    <script src="${pageContext.request.contextPath}/vendors/layui/layui.all.js"></script>
    <script>
        function  login() {
            $.ajax({
                url: "${pageContext.request.contextPath}/sys/user/login.action",
                type: "post",
                data:{
                    id : $("#id").val(),
                    password:$("#password").val()
                },
                dataType:"json",
                success : function(data){
                    if(data.success){
                        window.location.href = "${pageContext.request.contextPath}/page/index.action";
                    }else{
                        layer.msg('账号或密码错误');
                    }
                }
            });
            return false;
        }
    </script>
</head>

<body class="login">
<div>
    <a class="hiddenanchor" id="signup"></a>
    <a class="hiddenanchor" id="signin"></a>

    <div class="login_wrapper">
        <div class="animate form login_form">
            <section class="login_content">
                <form>
                    <h1>用户登录</h1>
                    <div>
                        <input id="id" type="text" class="form-control" placeholder="账号" required="" />
                    </div>
                    <div>
                        <input id="password" type="password" class="form-control" placeholder="密码" required="" />
                    </div>

                    <div class="clearfix">
                        <button onclick="return login()" class="btn btn-success" style="width:100%">登录</button>
                    </div>

                    <div class="separator">

                        <div class="clearfix"></div>
                        <br />

                        <div>
                            <h1>SSM</h1>
                            <p>©2020 All Rights Reserved. SSM! ChinaSofti</p>
                        </div>
                    </div>
                </form>
            </section>
        </div>
    </div>
</div>
</body>
</html>


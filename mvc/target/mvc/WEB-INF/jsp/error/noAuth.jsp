<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>主页</title>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath}/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/build/css/custom.min.css" rel="stylesheet">
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <!--菜单和头像-->
        <jsp:include page="../menu.jsp"></jsp:include>
        <!-- 顶部导航 -->
        <jsp:include page="../topnav.jsp"></jsp:include>
        <!-- 页面内容 -->
        <div class="right_col" role="main">
            <div class="container body">
                <div class="main_container">
                    <!-- page content -->
                    <div class="col-md-12">
                        <div class="col-middle">
                            <div class="text-center text-center">
                                <h1 class="error-number">无权限</h1>
                                <h2>对不起，您没有权限访问该页面。</h2>
                                <p>可联系系统管理人员</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <!-- /page content -->
                </div>
            </div>
        </div>
        <!-- 版权 -->
        <jsp:include page="../copyright.jsp"></jsp:include>
    </div>
</div>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!-- FastClick -->
<script src="${pageContext.request.contextPath}/vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="${pageContext.request.contextPath}/vendors/nprogress/nprogress.js"></script>
<!-- Custom Theme Scripts -->
<script src="${pageContext.request.contextPath}/build/js/custom.min.js"></script>
<!--文档就绪函数-->
<script>
    $(function () {

    });
</script>
</body>
</html>

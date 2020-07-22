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
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3>用户设置</h3>
                    </div>
                    <div class="title_right">
                        <div class="pull-right">
                            <button class="btn btn-success">更改密码</button>
                        </div>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 ">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>用户<small>报告</small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="col-md-3 col-sm-3  profile_left">
                                    <div class="profile_img">
                                        <div id="crop-avatar">
                                            <!-- Current avatar -->
                                            <img class="img-responsive avatar-view"
                                                 src="${pageContext.request.contextPath}/sys/user/loadImg.action?id=${user.id}"
                                                 alt="Avatar" title="Change the avatar">
                                        </div>
                                    </div>
                                    <h3>${user.name}</h3>
                                    <form action="${pageContext.request.contextPath}/sys/user/upload.action"
                                          method="post" enctype="multipart/form-data">
                                        <input type="file" name="file"><input type="submit" class="btn btn-success"
                                                                              value="上传"></input>
                                    </form>
                                    <br/>
                                </div>
                            </div>
                        </div>
                    </div>
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

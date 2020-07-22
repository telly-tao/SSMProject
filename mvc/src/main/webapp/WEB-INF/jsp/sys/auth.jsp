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
    <!--dataTables-->
    <link href="${pageContext.request.contextPath}/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css"
          rel="stylesheet">
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath}/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/build/css/custom.min.css" rel="stylesheet">
    <!-- jquery.validate -->
    <link href="${pageContext.request.contextPath}/build/css/jquery.validate.css" rel="stylesheet">
    <!-- layui -->
    <link href="${pageContext.request.contextPath}/vendors/layui/css/layui.css" rel="stylesheet">
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
                        <h3>权限设置</h3>
                    </div>
                    <div class="title_right">
                        <div class="pull-right">
                            <button onclick="showAdd()" class="btn btn-success">新增</button>
                        </div>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12  ">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>权限列表</h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <ul id="tree"></ul>
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

<!-- 新增页面 -->
<div class="modal fade" id="addModal" tabindex="-1" aria-hidden="true">
    <jsp:include page="authAdd.jsp"></jsp:include>
</div>
<!-- 修改页面 -->
<div class="modal fade" id="editModal" tabindex="-1" aria-hidden="true">
    <jsp:include page="authEdit.jsp"></jsp:include>
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
<!-- Datatables -->
<script src="${pageContext.request.contextPath}/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/build/js/dataTable.language.js"></script>
<!--validator-->
<script src="${pageContext.request.contextPath}/vendors/validator/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/vendors/validator/messages_zh.min.js"></script>
<!-- layui -->
<script src="${pageContext.request.contextPath}/vendors/layui/layui.all.js"></script>
<!--文档就绪函数-->
<script>

    layui.config({
        base: '/mvc/vendors/layui/lib/'
    }).extend({
        treeSelect: 'treeSelect'
    });

    $(function () {
        loadTree();
        initAdd();
    });

    function loadTree() {
        $.ajax({
            url: "${pageContext.request.contextPath}/sys/auth/tree.action",
            type: "post",
            dataType: "json",
            success: function (data) {
                let tree = layui.tree;
                layui.tree.render({
                    elem: '#tree',  //绑定元素
                    contentType: 'application/json',
                    data: data,
                    id: 'id',
                    edit:['del'],
                    click: function (obj) {
                        showEdit(obj.data.id);
                    },
                    operate: function (obj){
                        if(obj.type === 'del'){
                            remove(obj.data.id);
                        }
                    }
                })
            }
        });
    }

    function showAdd() {
        $("#addModal").modal("show");
        $("#addForm input").val("");
    }

    function showEdit(id) {
        $("#editModal").modal("show");
        loadEditData(id);
    }

    function remove(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/sys/auth/remove.action",
            type: "post",
            data: {
                id: id
            },
            dataType: "json",
            success: function (data) {
                if (data.success) {
                    loadTree();
                }
                layer.msg(data.message);
            }
        });
    }
</script>
</body>
</html>

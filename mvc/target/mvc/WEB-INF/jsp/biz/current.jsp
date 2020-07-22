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
                        <h3>当前班级</h3>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12  ">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>当前班级列表</h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div id="dataDiv">
                                    <table id="dataTables"
                                           class="table table-striped table-bordered dt-responsive nowrap"
                                           cellspacing="0" width="100%"></table>
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
    $(function () {
        loadDataTables();
    });

    function loadDataTables() {
        $('#dataTables').DataTable({
            aLengthMenu: [5, 25, 50, 100],//本地分页显示数据
            responsive: true,//是否自适应换行
            bProcessing: true,//表格过多显示处理中
            dom: 't<"bottom"ilp>',//分页显示位置
            serverSide: true,//开启后台分页，默认前台分页
            bSort: true,//列可排序
            order: [2, 'desc'],//默认排序列
            searching: false,//是否显示搜索框
            ajax: {
                "type": "POST",
                "url": "${pageContext.request.contextPath}/biz/clazz/currentdata.action",
                "dataType": "json",
                "data": function (data) {
                    for (let i = 0; i < data.columns.length; i++) {
                        let column = data.columns[i];
                        column.searchRegex = column.search.regex;
                        column.searchValue = column.search.value;
                        delete (column.search);
                    }
                    data.id = $("#id").val();
                    data.name = $("#name").val();
                }
            },
            'aoColumns': [{
                'sTitle': '教室编号',
                'mDataProp': 'classroom',
                "render": function (data, type, row, meta) {
                    if(data!=null){
                        return data.name;
                    }else {
                        return null;
                    }

                }
            }, {
                'sTitle': '班级人数',
                'mDataProp': 'num'
            }, {
                'sTitle': '技术方向',
                'mDataProp': 'setup',
                "render": function (data, type, row, meta) {
                    if(data!=null){
                        return data.name;
                    }else {
                        return null;
                    }
                }
            },  {
                'sTitle': '讲师',
                'mDataProp': 'empta',
                "render": function (data, type, row, meta) {
                    if(data!=null){
                        return data.name;
                    }else {
                        return null;
                    }
                }
            }, {
                'sTitle': '助教',
                'mDataProp': 'empte',
                "render": function (data, type, row, meta) {
                    if(data!=null){
                        return data.name;
                    }else {
                        return null;
                    }
                }
            }, {
                'sTitle': '班主任',
                'mDataProp': 'emptr',
                "render": function (data, type, row, meta) {
                    if(data!=null){
                        return data.name;
                    }else {
                        return null;
                    }
                }
            }, {
                'sTitle': '开班时间',
                'mDataProp': 'startdate'
            }, {
                'sTitle': '结束时间',
                'mDataProp': 'enddate'
            }, {
                'sTitle': '班级性质',
                'mDataProp': 'properties'
            }, {
                'sTitle': '班级状态',
                'mDataProp': 'status',
                "render": function (data, type, row, meta) {
                    return data == '0' ? '正常' : '结束';
                }
            },{
                'sTitle': '操作',
                'bSortable': false,
                "render": function (data, type, row, meta) {
                    let editBtn = "<button class='btn  btn-warning btn-sm' onclick=\"showEdit('" + row.id + "')\" >编辑</button>";
                    let delBtn = "<button class='btn  btn-danger btn-sm' onclick=\"remove('" + row.id + "')\" >删除</button>";
                    return editBtn + "&nbsp;" + delBtn;
                }
            }]
        });
    }

    function query() {
        $("#dataDiv").empty();
        $("#dataDiv").append('<table id="dataTables" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%"></table>');
        loadDataTables();
    }

    function showAdd() {
        $("#add_companyid").empty();
        $("#add_deptid").empty();
        $("#add_positionid").empty();
        $("#add_setupid").empty();
        $("#addModal").modal("show");
        loadDataAdd();
        $("#addForm input").val("");
    }

    function showEdit(id) {
        $("#edit_companyid").empty();
        $("#add_deptid").empty();
        $("#add_positionid").empty();
        $("#add_setupid").empty();
        $("#editModal").modal("show");
        loadDataEdit();
        loadEditData(id);
    }

    function showImp() {
        $("#impModal").modal("show");
    }

    function remove(id) {
        layer.confirm('确认要删除吗？', {
            btn: ['确定', '取消']//按钮
        }, function () {
            $.ajax({
                url: "${pageContext.request.contextPath}/area/emp/remove.action",
                type: "post",
                data: {
                    id: id,
                },
                dataType: "json",
                success: function (data) {
                    if (data.success) {
                        query();
                    }
                    layer.msg(data.message);
                }
            });
        });
    }
</script>
</body>
</html>

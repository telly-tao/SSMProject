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
                        <h3>开班管理</h3>
                    </div>
                    <div class="title_right">
                        <div class="pull-right">
                        </div>
                    </div>
                </div>

                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12 col-sm-12  ">
                        <div class="x_panel">
                            <form id="addForm" data-parsley-validate class="form-horizontal form-label-left">
                                <div class="item form-group">
                                    <label class="col-form-label col-md-3 col-sm-3 label-align">班级名称</label>
                                    <div class="col-md-6 col-sm-6 ">
                                        <input type="text" id="name" name="name" class="form-control">
                                    </div>
                                </div>
                                <div class="item form-group">
                                    <label class="col-form-label col-md-1 col-sm-1 label-align">地区</label>
                                    <select id ="companyid" name="companyid" class="form-control" >
                                        <option value="0">选择地区</option>
                                    </select>
                                    <label class="col-form-label col-md-1 col-sm-1 label-align">技术方向</label>
                                    <select id ="setupid" name="setupid" class="form-control" >

                                    </select>
                                </div>
                                <div class="item form-group">
                                    <label class="col-form-label col-md-1 col-sm-1 label-align">班级性质</label>
                                    <select id ="properties" name="properties" class="form-control" >
                                        <option value="就业班">就业班</option>
                                        <option value="非就业班">非就业班</option>
                                    </select>
                                    <label class="col-form-label col-md-1 col-sm-1 label-align">教室</label>
                                    <select id ="classroomid" name="classroomid" class="form-control" >
                                        <option value="0">选择教室</option>
                                    </select>
                                </div>
                                <div class="item form-group">
                                    <label class="col-form-label col-md-1 col-sm-1  label-align">开始日期
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-5 col-sm-5">
                                    <input id="startdate" name="startdate" class="form-control" class='form_datetime' type="date" required='required'></div>
                                    <label class="col-form-label col-md-1 col-sm-1  label-align">结束日期<span
                                            class="required">*</span></label>
                                    <div class="col-md-5 col-sm-5">
                                    <input id="enddate" name="enddate" class="form-control" class='form_datetime' type="date" required='required'></div>
                                 </div>
                                <div class="item form-group">
                                    <label class="col-form-label col-md-1 col-sm-1 label-align">讲师</label>
                                    <select id ="te" name="te" class="form-control" >

                                    </select>
                                    <label class="col-form-label col-md-1 col-sm-1 label-align">助教</label>
                                    <select id ="ta" name="ta" class="form-control" >

                                    </select>
                                </div>
                                <div class="item form-group">
                                    <label class="col-form-label col-md-1 col-sm-1 label-align">班主任</label>
                                    <select id ="tr" name="tr" class="form-control" >

                                    </select>
                                    <label class="col-form-label col-md-1 col-sm-1 label-align">人数</label>
                                    <select id ="num" name="num" class="form-control" >

                                    </select>
                                </div>
                                <div class="item form-group">
                                    <label class="col-form-label col-md-1 col-sm-1 label-align">学校信息</label>
                                    <textarea id="mark" required="required" name='mark'></textarea>
                                </div>

                            </form>
                        <button type="submit" class="btn btn-success" onclick="add()">保存</button>
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
        $.ajax({
            url: "${pageContext.request.contextPath}/area/company/queryCompany.action",
            type: "post",
            data: {
            },
            dataType: "json",
            success: function (data) {
                let bb =$(document).find("#companyid");
                for ( let i = 0; i < data.length; i++) {
                    bb.append("<option value='"+data[i].id+"'>"+ data[i].name+ "</option>");
                }
            }
        });
        $("#companyid").change(function () {
            let companyid=$("#companyid").val();
            $("#setupid").find("option").remove();
            $.ajax({
                url: "${pageContext.request.contextPath}/setup/setup/querySetup.action",
                type: "post",
                data: {
                    companyid:companyid
                },
                dataType: "json",
                success: function (data) {
                    let bb =$(document).find("#setupid");
                    for ( let i = 0; i < data.length; i++) {
                        bb.append("<option value='"+data[i].id+"'>"+ data[i].name+ "</option>");
                    }
                }
            });
            $("#classroomid").find("option").remove();
            $.ajax({
                url: "${pageContext.request.contextPath}/room/classroom/queryClassRoom.action",
                type: "post",
                data: {
                    companyid:companyid
                },
                dataType: "json",
                success: function (data) {
                    let bb =$(document).find("#classroomid");
                    for ( let i = 0; i < data.length; i++) {
                        bb.append("<option value='"+data[i].id+"'>"+ data[i].name+ "</option>");
                    }
                }
            });
            $("#te").find("option").remove();
            $.ajax({
                url: "${pageContext.request.contextPath}/area/emp/queryTE.action",
                type: "post",
                data: {
                    companyid:companyid
                },
                dataType: "json",
                success: function (data) {
                    let bb =$(document).find("#te");
                    for ( let i = 0; i < data.length; i++) {
                        bb.append("<option value='"+data[i].id+"'>"+ data[i].name+ "</option>");
                    }
                }
            });
            $("#ta").find("option").remove();
            $.ajax({
                url: "${pageContext.request.contextPath}/area/emp/queryTA.action",
                type: "post",
                data: {
                    companyid:companyid
                },
                dataType: "json",
                success: function (data) {
                    let bb =$(document).find("#ta");
                    for ( let i = 0; i < data.length; i++) {
                        bb.append("<option value='"+data[i].id+"'>"+ data[i].name+ "</option>");
                    }
                }
            });
            $("#tr").find("option").remove();
            $.ajax({
                url: "${pageContext.request.contextPath}/area/emp/queryTR.action",
                type: "post",
                data: {
                    companyid:companyid
                },
                dataType: "json",
                success: function (data) {
                    let bb =$(document).find("#tr");
                    for ( let i = 0; i < data.length; i++) {
                        bb.append("<option value='"+data[i].id+"'>"+ data[i].name+ "</option>");
                    }
                }
            });
        })
        $("#classroomid").change(function () {
            let classroomid = $("#classroomid").val();
            $("#num").find("option").remove();
            $.ajax({
                url: "${pageContext.request.contextPath}/room/classroom/query.action",
                type: "post",
                data: {
                    id:classroomid
                },
                dataType: "json",
                success: function (data) {
                    let bb =$(document).find("#num");
                    for ( let i = 1; i < data.num+1; i++) {
                        bb.append("<option value='"+i+"'>"+i+ "</option>");
                    }
                }
            });
        })
    }
    function add(){
       var adddata= $("#addForm").serialize();
        $.ajax({
            url: "${pageContext.request.contextPath}/biz/clazz/add.action",
            type: "post",
            data: adddata,
           // data: {
           //      companyid:$("#companyid").val(),
           //      setupid:$("#setupid").val(),
           //      properties:$("#properties").val(),
           //      id:$("#classroomid").val(),
           //      startdate:$("#startdate").val(),
           //      enddate:$("#enddate").val(),
           //      te:$("#te").val(),
           //      ta:$("#ta").val(),
           //      tr:$("#tr").val(),
           //      num:$("#num").val(),
           //      mark:$("#mark").val()
           // },
            dataType: "json",
            success: function (data) {
                layer.msg(data.message);
            }
        });
    }
</script>
</body>
</html>

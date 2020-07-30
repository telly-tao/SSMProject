<%--
  Created by IntelliJ IDEA.
  User: 86187
  Date: 2020/7/29
  Time: 12:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!--datetimepicker-->
    <link href="${pageContext.request.contextPath}/vendors/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" media="screen">
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" media="screen">

</head>
<body><span style="font-size:14px;"><div class="col-md-6 cy-text-right-md">
<div class="form-inline">
<div class="form-group cy-mar-ver-s">
<span class="cy-pad-hor-s">最后接入时间</span>
</div>
<div class="input-daterange input-group" id="datepicker">
<input type="date" class="form-control" name="start" id="qBeginTime" />
<span class="input-group-addon">至</span>
<input type="date" class="form-control" name="end" id="qEndTime" />
</div>
<div class="form-group cy-mar-ver-s">
<button class="btn btn-primary cy-pad-rgt-s" onclick="javascript:doQuery();" type="button">搜索</button>
</div>
</div>
</div></span>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js"></script>
<!--datetimepicker-->
<script src="${pageContext.request.contextPath}/vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js" ></script>
<script src="${pageContext.request.contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.js" ></script>

<script>
    $(function(){
        $('#qBeginTime').datepicker({
            todayBtn : "linked",
            autoclose : true,
            todayHighlight : true,
            endDate : new Date()
        }).on('changeDate',function(e){
            var startTime = e.date;
            $('#qEndTime').datepicker('setStartDate',startTime);
        });
        //结束时间：
        $('#qEndTime').datepicker({
            todayBtn : "linked",
            autoclose : true,
            todayHighlight : true,
            endDate : new Date()
        }).on('changeDate',function(e){
            var endTime = e.date;
            $('#qBeginTime').datepicker('setEndDate',endTime);
        });
    });

</script>
</body>
</html>

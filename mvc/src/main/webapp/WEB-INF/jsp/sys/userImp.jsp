<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title" id="NoPermissionModalLabel">数据导入</h4>
        </div>
        <div class="modal-body">
            <form id="impForm" action="${pageContext.request.contextPath}/sys/user/imp.action" method="post" enctype="multipart/form-data" data-parsley-validate class="form-horizontal form-label-left">
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">模板</label>
                    <div class="col-md-6 col-sm-6 ">
                        <a href="${pageContext.request.contextPath}/file/user.xls">用户数据导入模板</a>
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">文件</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="file"  name="file" class="form-control">
                    </div>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button type="submit" class="btn btn-success" onclick="imp()">保存</button>
            <button class="btn btn-info" type="button" data-dismiss="modal">关闭</button>
        </div>
    </div>
</div>
<script>
    function  imp() {
        $("#impForm").submit();
    }
</script>

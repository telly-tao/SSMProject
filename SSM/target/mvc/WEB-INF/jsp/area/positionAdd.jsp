<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title" id="NoPermissionModalLabel">职位新增</h4>
        </div>
        <div class="modal-body">
            <form id="addForm" data-parsley-validate class="form-horizontal form-label-left">
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">职位名称</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="add_name" name="add_name" class="form-control">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">所属部门</label>
                    <div class="col-md-6 col-sm-6 ">
                        <select id ="add_deptid" name="add_deptid" class="form-control" id="edit_status" name="edit_status">

                        </select>
                    </div>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button type="submit" class="btn btn-success" onclick="add()">保存</button>
            <button class="btn btn-info" type="button" data-dismiss="modal">关闭</button>
        </div>
    </div>
</div>
<script>
    function add() {
        //校验表单数据
        if (!add_form_validate()) return false;
        //提交表单请求
        $.ajax({
            url: "${pageContext.request.contextPath}/area/position/add.action",
            type: "post",
            data: {
                name: $("#add_name").val(),
                deptid: $("#add_deptid").val()
            },
            dataType: "json",
            success: function (data) {
                if (data.success) {
                    $("#addModal").modal("hide");
                    query();
                } else {
                    layer.msg(data.message);
                }
            }
        });
    }

    function add_form_validate() {
        let validate = $("#addForm").validate({
            rules: {
                add_name: {
                    required: true,
                    minlength: 1,
                    maxlength: 20
                },
                add_mark: {
                    minlength: 2,
                    maxlength: 20
                }
            }
        });
        return validate.form();
    }

    function  loadDeptDataAdd() {
        $.ajax({
            url: "${pageContext.request.contextPath}/area/dept/queryDept.action",
            type: "post",
            data: {
            },
            dataType: "json",
            success: function (data) {
                var bb =$(document).find("#add_deptid");
                for ( var i = 0; i < data.length; i++) {
                    bb.append("<option value='"+data[i].id+"'>"+ data[i].name+ "</option>");
                }
            }
        });

    }

</script>
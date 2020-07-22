<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title" id="NoPermissionModalLabel">公司新增</h4>
        </div>
        <div class="modal-body">
            <form id="addForm" data-parsley-validate class="form-horizontal form-label-left">
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">编号</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="add_id" name="add_id" class="form-control ">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">名称</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="add_name" name="add_name" class="form-control">
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
            url: "${pageContext.request.contextPath}/area/company/add.action",
            type: "post",
            data: {
                id: $("#add_id").val(),
                name: $("#add_name").val()
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
                add_id: {
                    required: true,
                    minlength: 2,
                    maxlength: 20
                },
                add_name: {
                    required: true,
                    minlength: 2,
                    maxlength: 20
                }
            }
        });
        return validate.form();
    }
</script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title" id="NoPermissionModalLabel">用户修改</h4>
        </div>
        <div class="modal-body">
            <form id="editForm" data-parsley-validate class="form-horizontal form-label-left">
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">账号</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="edit_id" name="edit_id" class="form-control" readonly>
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">名称</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="edit_name" name="edit_name" class="form-control">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">状态</label>
                    <div class="col-md-6 col-sm-6 ">
                        <select class="form-control" id="edit_status" name="edit_status">
                            <option value="0">正常</option>
                            <option value="1">锁定</option>
                        </select>
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">密码</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input id="edit_password" name="edit_password" class="form-control" type="password">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">确认</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input id="edit_repPassword" name="edit_repPassword" class="form-control" type="password">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">角色</label>
                    <div class="col-md-6 col-sm-6 ">
                        <select id="edit_roleids" name="edit_roleids" class="form-control" style="width: 100%"></select>
                    </div>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button type="submit" class="btn btn-success" onclick="edit()">保存</button>
            <button class="btn btn-info" type="button" data-dismiss="modal">关闭</button>
        </div>
    </div>
</div>
<script>
    function edit() {
        //校验表单数据
        if (!edit_form_validate()) return false;
        //提交表单请求
        $.ajax({
            url: "${pageContext.request.contextPath}/sys/user/edit.action",
            type: "post",
            data: {
                id: $("#edit_id").val(),
                name: $("#edit_name").val(),
                status: $("#edit_status").val(),
                password: $("#edit_password").val(),
                roleids: $("#edit_roleids").val().join(",")
            },
            dataType: "json",
            success: function (data) {
                if (data.success) {
                    $("#editModal").modal("hide");
                    query();
                } else {
                    layer.msg(data.message);
                }
            }
        });
    }

    function edit_form_validate() {
        let validate = $("#editForm").validate({
            rules: {
                edit_id: {
                    required: true,
                    minlength: 2,
                    maxlength: 20
                },
                edit_name: {
                    required: true,
                    minlength: 2,
                    maxlength: 20
                },
                edit_password: {
                    minlength: 6,
                    maxlength: 8
                },
                edit_repPassword: {
                    equalTo: "#add_password"
                }
            }
        });
        return validate.form();
    }

    function loadEditData(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/sys/user/query.action",
            type: "post",
            data: {
                id: id,
            },
            dataType: "json",
            success: function (data) {
                $("#edit_id").val(data.id);
                $("#edit_name").val(data.name);
                $("#edit_status").val(data.status);
                initEditRole(data.roleids);
            }
        });
    }

    function initEditRole(roles) {
        $("#edit_roleids").empty();
        $("#edit_roleids").append(' <select id="edit_roleids" name="edit_roleids" class="form-control" style="width: 100%"></select>');
        $.ajax({
            url: "${pageContext.request.contextPath}/sys/role/select.action",
            type: "post",
            dataType: "json",
            success: function (data) {
                $("#edit_roleids").select2({
                    "data": data,
                    placeholder: '请选择',
                    multiple: true
                });
                $('#edit_roleids').val(roles.split(",")).trigger("change");
            }
        });
    }
</script>
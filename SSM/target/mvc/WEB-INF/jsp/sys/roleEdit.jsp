<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title" id="NoPermissionModalLabel">角色修改</h4>
        </div>
        <div class="modal-body">
            <form id="editForm" data-parsley-validate class="form-horizontal form-label-left">
                <div class="item form-group">
                    <input type="hidden" id="edit_id"><!--隐藏id，传后台-->
                    <label class="col-form-label col-md-3 col-sm-3 label-align">角色名称</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="edit_name" name="edit_name" class="form-control">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">角色备注</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="edit_mark" name="edit_mark" class="form-control">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">拥有权限</label>
                    <div class="col-md-6 col-sm-6 ">
                        <ul id="edit_tree"></ul>
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
    let editTree;

    function edit() {
        //校验表单数据
        if (!edit_form_validate()) return false;
        //提交表单请求
        $.ajax({
            url: "${pageContext.request.contextPath}/sys/role/edit.action",
            type: "post",
            data: {
                id: $("#edit_id").val(),
                name: $("#edit_name").val(),
                mark: $("#edit_mark").val(),
                authids : getEditTreeData()
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
                edit_name: {
                    required: true,
                    minlength: 2,
                    maxlength: 20
                },
                edit_mark: {
                    minlength: 2,
                    maxlength: 20
                }
            }
        });
        return validate.form();
    }

    function loadEditData(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/sys/role/query.action",
            type: "post",
            data: {
                id: id,
            },
            dataType: "json",
            success: function (data) {
                $("#edit_id").val(data.id);
                $("#edit_name").val(data.name);
                $("#edit_mark").val(data.mark);
                loadEditTree(data.authids);
            }
        });
    }

    function loadEditTree(authids) {
        $.ajax({
            url: "${pageContext.request.contextPath}/sys/auth/tree.action?authids=" + authids,
            type: "post",
            dataType: "json",
            success: function (data) {
                editTree = layui.tree.render({
                    elem: '#edit_tree',  //绑定元素
                    contentType: 'application/json',
                    data: data,
                    showCheckbox: true,
                    click: function (obj) {
                    }
                });
            }
        });
    }

    function getEditTreeData() {
        let ids = [];
        let checkedData = editTree.getChecked('edit_tree');
        for(let i = 0 ; i < checkedData.length; i++){
            ids.push(checkedData[i].id);
            let children = checkedData[i].children;
            for(let j = 0; j < children.length; j++){
                ids.push(children[j].id);
            }
        }
        return ids.join(",");
    }
</script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title" id="NoPermissionModalLabel">角色新增</h4>
        </div>
        <div class="modal-body">
            <form id="addForm" data-parsley-validate class="form-horizontal form-label-left">
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">角色名称</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="add_name" name="add_name" class="form-control">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">角色备注</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input id="add_mark" name="add_mark" class="form-control" type="text">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">拥有权限</label>
                    <div class="col-md-6 col-sm-6 ">
                        <ul id="add_tree"></ul>
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
    let addTree;
    function add() {
        //校验表单数据
        if (!add_form_validate()) return false;
        //提交表单请求
        $.ajax({
            url: "${pageContext.request.contextPath}/sys/role/add.action",
            type: "post",
            data: {
                name: $("#add_name").val(),
                mark: $("#add_mark").val(),
                authids : getAddTreeData()
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
                    minlength: 2,
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

    function loadAddTree() {
        $.ajax({
            url: "${pageContext.request.contextPath}/sys/auth/tree.action",
            type: "post",
            dataType: "json",
            success: function (data) {
                addTree = layui.tree.render({
                    elem: '#add_tree',  //绑定元素
                    contentType: 'application/json',
                    data: data,
                    showCheckbox: true,
                    click: function (obj) {

                    }
                })
            }
        });
    }

    function getAddTreeData() {
        let ids = [];
        let checkedData = addTree.getChecked('add_tree');
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
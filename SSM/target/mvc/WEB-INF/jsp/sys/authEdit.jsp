<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title" id="NoPermissionModalLabel">权限修改</h4>
        </div>
        <div class="modal-body">
            <form id="editForm" data-parsley-validate class="form-horizontal form-label-left">
                <input type="hidden" id="edit_id" name="edit_id">
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">权限名称</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="edit_name" name="edit_name" class="form-control">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">图标样式</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="edit_icon" name="edit_icon" class="form-control">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">访问地址</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="edit_url" name="edit_url" class="form-control">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">排序序号</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="edit_seq" name="edit_seq" class="form-control">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">权限备注</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input id="edit_mark" name="edit_mark" class="form-control" type="text">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">上级菜单</label>
                    <div id="tree_div" class="col-md-6 col-sm-6 ">
                        <input id="edit_pid" name="edit_pid" lay-filter="tree" class="layui-input" type="text">
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
    function loadEditData(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/sys/auth/query.action",
            type: "post",
            data: {
                id: id
            },
            dataType: "json",
            success: function (data) {
                $("#edit_id").val(data.id);
                $("#edit_name").val(data.name);
                $("#edit_icon").val(data.icon);
                $("#edit_url").val(data.url);
                $("#edit_seq").val(data.seq);
                $("#edit_mark").val(data.mark);
                $("#edit_pid").val(data.pid);
                initEdit(data.pid);
            }
        });
    }

    function edit() {
        //校验表单数据
        if (!edit_form_validate()) return false;
        //提交表单请求
        $.ajax({
            url: "${pageContext.request.contextPath}/sys/auth/edit.action",
            type: "post",
            data: {
                id: $("#edit_id").val(),
                name: $("#edit_name").val(),
                icon: $("#edit_icon").val(),
                url: $("#edit_url").val(),
                seq: $("#edit_seq").val(),
                mark: $("#edit_mark").val(),
                pid: $("#edit_pid").val()
            },
            dataType: "json",
            success: function (data) {
                if (data.success) {
                    $("#editModal").modal("hide");
                    loadTree();
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
                edit_url: {
                    maxlength: 50
                }
            }
        });
        return validate.form();
    }

    function initEdit(pid) {
        $("#tree_div").empty();
        $("#tree_div").append('<input id="edit_pid" name="edit_pid" lay-filter="tree" class="layui-input" type="text">');
        $("#edit_pid").val(pid)
        layui.use(['treeSelect', 'form'], function () {
            let treeSelect = layui.treeSelect;
            treeSelect.render({
                // 选择器
                elem: '#edit_pid',
                // 数据
                data: '${pageContext.request.contextPath}/sys/auth/treeSelect.action',
                // 异步加载方式：get/post，默认get
                type: 'get',
                // 占位符
                placeholder: '请选择上级菜单',
                // 是否开启搜索功能：true/false，默认false
                search: true,
                // 点击回调
                click: function (d) {
                    $("#edit_pid").val(d.current.id);
                },
                success: function (d){
                    treeSelect.checkNode('tree', pid);
                }
            });
        });
    }

</script>
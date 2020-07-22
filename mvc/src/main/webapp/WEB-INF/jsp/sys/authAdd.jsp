<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title" id="NoPermissionModalLabel">权限新增</h4>
        </div>
        <div class="modal-body">
            <form id="addForm" data-parsley-validate class="form-horizontal form-label-left">
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">权限名称</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="add_name" name="add_name" class="form-control">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">图标样式</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="add_icon" name="add_icon" class="form-control">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">访问地址</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="add_url" name="add_url" class="form-control">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">排序序号</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="add_seq" name="add_seq" class="form-control">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">权限备注</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input id="add_mark" name="add_mark" class="form-control" type="text">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">上级菜单</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input id="add_pid" name="add_pid" lay-filter="tree" class="layui-input" type="text">
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
            url: "${pageContext.request.contextPath}/sys/auth/add.action",
            type: "post",
            data: {
                name: $("#add_name").val(),
                icon: $("#add_icon").val(),
                url: $("#add_url").val(),
                seq: $("#add_seq").val(),
                mark: $("#add_mark").val(),
                pid: $("#add_pid").val()
            },
            dataType: "json",
            success: function (data) {
                if (data.success) {
                    $("#addModal").modal("hide");
                    loadTree();
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
                add_url: {
                    maxlength: 50
                }
            }
        });
        return validate.form();
    }

    function initAdd() {
        layui.use(['treeSelect', 'form'], function () {
            let treeSelect = layui.treeSelect;
            treeSelect.render({
                // 选择器
                elem: '#add_pid',
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
                    $("#add_pid").val(d.current.id);
                }
            });
        });
    }
</script>
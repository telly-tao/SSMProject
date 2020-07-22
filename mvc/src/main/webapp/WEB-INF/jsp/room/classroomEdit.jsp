<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title" id="NoPermissionModalLabel">教室修改</h4>
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
                    <label class="col-form-label col-md-3 col-sm-3 label-align">教室名称</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="edit_name" name="edit_name" class="form-control">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">教室地址</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="edit_address" name="edit_address" class="form-control">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">选择公司</label>
                    <div class="col-md-6 col-sm-6 ">
                        <select id ="edit_companyid" name="edit_companyid" class="form-control" >

                        </select>
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
                    <label class="col-form-label col-md-3 col-sm-3 label-align">可容纳人数</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="edit_num" name="edit_num" class="form-control">
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
            url: "${pageContext.request.contextPath}/room/classroom/edit.action",
            type: "post",
            data: {
                id: $("#edit_id").val(),
                name: $("#edit_name").val(),
                address: $("#edit_address").val(),
                status: $("#edit_status").val(),
                companyid: $("#edit_companyid").val(),
                num: $("#edit_num").val()
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
                    minlength: 1,
                    maxlength: 20
                },
                edit_name: {
                    required: true,
                    minlength: 2,
                    maxlength: 20
                }
            }
        });
        return validate.form();
    }

    function  loadEditData(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/room/classroom/query.action",
            type: "post",
            data: {
                id: id,
            },
            dataType: "json",
            success: function (data) {
                $("#edit_id").val(data.id);
                $("#edit_name").val(data.name);
                $("#edit_status").val(data.status);
                $("#edit_address").val(data.address);
                $("#edit_num").val(data.num);
            }
        });
    }
    function  loadCompanyDataEdit() {
        $.ajax({
            url: "${pageContext.request.contextPath}/area/company/queryCompany.action",
            type: "post",
            data: {
            },
            dataType: "json",
            success: function (data) {
                var bb =$(document).find("#edit_companyid");
                for ( var i = 0; i < data.length; i++) {
                    bb.append("<option value='"+data[i].id+"'>"+ data[i].name+ "</option>");
                }
            }
        });
    }
</script>
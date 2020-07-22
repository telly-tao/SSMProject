<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title" id="NoPermissionModalLabel">教室新增</h4>
        </div>
        <div class="modal-body">
            <form id="addForm" data-parsley-validate class="form-horizontal form-label-left">

                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">教室名称</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="add_name" name="add_name" class="form-control">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">地址</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input id="add_address" name="add_address" class="form-control" type="text">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">所在公司</label>
                    <div class="col-md-6 col-sm-6 ">
                        <select id ="add_companyid" name="add_companyid" class="form-control" id="edit_status" name="edit_status">

                        </select>
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">容纳人数</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input id="add_num" name="add_num" class="form-control" type="text">
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
            url: "${pageContext.request.contextPath}/room/classroom/add.action",
            type: "post",
            data: {
                name: $("#add_name").val(),
                address: $("#add_address").val(),
                companyid: $("#add_companyid").val(),
                num: $("#add_num").val()
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
    function  loadCompanyDataAdd() {
        $.ajax({
            url: "${pageContext.request.contextPath}/area/company/queryCompany.action",
            type: "post",
            data: {
            },
            dataType: "json",
            success: function (data) {
                var bb =$(document).find("#add_companyid");
                for ( var i = 0; i < data.length; i++) {
                    bb.append("<option value='"+data[i].id+"'>"+ data[i].name+ "</option>");
                }
            }
        });

    }
</script>
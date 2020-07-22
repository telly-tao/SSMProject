<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title" id="NoPermissionModalLabel">员工修改</h4>
        </div>
        <div class="modal-body">
            <form id="editForm" data-parsley-validate class="form-horizontal form-label-left">
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">工号</label>
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
                    <label class="col-form-label col-md-3 col-sm-3 label-align">性别</label>
                    <div class="col-md-6 col-sm-6 ">
                        <select id ="edit_sex" name="edit_sex" class="form-control" >
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">所属公司</label>
                    <div class="col-md-6 col-sm-6 ">
                        <select id ="edit_companyid" name="edit_companyid" class="form-control" >

                        </select>
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">部门</label>
                    <div class="col-md-6 col-sm-6 ">
                        <select id ="edit_deptid" name="edit_companyid" class="form-control" >

                        </select>
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">职位</label>
                    <div class="col-md-6 col-sm-6 ">
                        <select id ="edit_positionid" name="edit_positionid" class="form-control" >

                        </select>
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">技术方向</label>
                    <div class="col-md-6 col-sm-6 ">
                        <select id ="edit_setupid" name="edit_setupid" class="form-control" >

                        </select>
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">等级</label>
                    <div class="col-md-6 col-sm-6 ">
                        <select id ="edit_lev" name="edit_lev" class="form-control" >
                            <option value="初级">初级</option>
                            <option value="中级">中级</option>
                            <option value="高级">高级</option>
                            <option value="专家">专家</option>
                        </select>
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">是否接受出差</label>
                    <div class="col-md-6 col-sm-6 ">
                        <select id ="edit_away" name="edit_away" class="form-control" >
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select>
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">QQ号码</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="edit_qq" name="edit_qq" class="form-control">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">微信</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="edit_wechart" name="edit_wechart" class="form-control">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">电子邮件</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="edit_email" name="edit_email" class="form-control">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">住址</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="edit_address" name="edit_address" class="form-control">
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
            url: "${pageContext.request.contextPath}/area/emp/edit.action",
            type: "post",
            data: {
                id: $("#edit_id").val(),
                name: $("#edit_name").val(),
                sex: $("#edit_sex").val(),
                companyid: $("#edit_companyid").val(),
                deptid: $("#edit_deptid").val(),
                positionid: $("#edit_positionid").val(),
                setupid: $("#edit_setupid").val(),
                lev: $("#edit_lev").val(),
                away: $("#edit_away").val(),
                qq: $("#edit_qq").val(),
                wechat: $("#edit_wechat").val(),
                email: $("#edit_email").val(),
                address: $("#edit_address").val()
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
                    minlength: 1,
                    maxlength: 20
                },
                edit_sex: {
                    required: true,
                    minlength: 1,
                    maxlength: 20
                },
                edit_email: {
                    required: true,
                    email: true
                },
            }
        });
        return validate.form();
    }

    function  loadEditData(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/area/emp/query.action",
            type: "post",
            data: {
                id: id,
            },
            dataType: "json",
            success: function (data) {
                $("#edit_id").val(data.id);
                $("#edit_name").val(data.name),
                $("#edit_sex").val(data.sex),
                 $("#edit_companyid").val(data.companyid),
                 $("#edit_deptid").val(data.deptid),
                 $("#edit_positionid").val(data.positionid),
                 $("#edit_setupid").val(data.setupid),
                 $("#edit_lev").val(data.lev),
                 $("#edit_away").val(data.away),
                 $("#edit_qq").val(data.qq),
                 $("#edit_wechart").val(data.wechart),
                 $("#edit_email").val(data.email),
                 $("#edit_address").val(data.address)
            }
        });
    }
    function  loadDataEdit() {
        $.ajax({
            url: "${pageContext.request.contextPath}/area/company/queryCompany.action",
            type: "post",
            data: {
            },
            dataType: "json",
            success: function (data) {
                let bb =$(document).find("#edit_companyid");
                for ( let i = 0; i < data.length; i++) {
                    bb.append("<option value='"+data[i].id+"'>"+ data[i].name+ "</option>");
                }
            }
        });
        $("#edit_companyid").change(function () {
            let companyid=$("#edit_companyid").val();
            $("#edit_deptid").find("option").remove();
            $.ajax({
                url: "${pageContext.request.contextPath}/area/dept/queryDept.action",
                type: "post",
                data: {
                    companyid: companyid
                },
                dataType: "json",
                success: function (data) {
                    let bb =$(document).find("#edit_deptid");
                    for ( let i = 0; i < data.length; i++) {
                        bb.append("<option value='"+data[i].id+"'>"+ data[i].name+ "</option>");
                    }
                }
            });
            $("#edit_setupid").find("option").remove();
            $.ajax({
                url: "${pageContext.request.contextPath}/setup/setup/querySetup.action",
                type: "post",
                data: {
                    companyid:companyid
                },
                dataType: "json",
                success: function (data) {
                    let bb =$(document).find("#edit_setupid");
                    for ( let i = 0; i < data.length; i++) {
                        bb.append("<option value='"+data[i].id+"'>"+ data[i].name+ "</option>");
                    }
                }
            });
        })

        $("#edit_deptid").change(function () {
            let deptid=$("#edit_deptid").val();
            $("#edit_positionid").find("option").remove();
            $.ajax({
                url: "${pageContext.request.contextPath}/area/position/queryPosition.action",
                type: "post",
                data: {
                    deptid:deptid
                },
                dataType: "json",
                success: function (data) {
                    let bb =$(document).find("#edit_positionid");
                    for ( let i = 0; i < data.length; i++) {
                        bb.append("<option value='"+data[i].id+"'>"+ data[i].name+ "</option>");
                    }
                }
            });
        })
    }
</script>
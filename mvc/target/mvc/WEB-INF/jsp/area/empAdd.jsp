<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title" id="NoPermissionModalLabel">人员新增</h4>
        </div>
        <div class="modal-body">
            <form id="addForm" data-parsley-validate class="form-horizontal form-label-left">
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">名称</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="add_name" name="add_name" class="form-control">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">性别</label>
                    <div class="col-md-6 col-sm-6 ">
                        <select id ="add_sex" name="add_sex" class="form-control" >
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">所属公司</label>
                    <div class="col-md-6 col-sm-6 ">
                        <select id ="add_companyid" name="add_companyid" class="form-control" >

                        </select>
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">部门</label>
                    <div class="col-md-6 col-sm-6 ">
                        <select id ="add_deptid" name="add_companyid" class="form-control" >

                        </select>
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">职位</label>
                    <div class="col-md-6 col-sm-6 ">
                        <select id ="add_positionid" name="add_positionid" class="form-control" >

                        </select>
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">技术方向</label>
                    <div class="col-md-6 col-sm-6 ">
                        <select id ="add_setupid" name="add_setupid" class="form-control" >

                        </select>
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">等级</label>
                    <div class="col-md-6 col-sm-6 ">
                        <select id ="add_lev" name="add_lev" class="form-control" >
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
                        <select id ="add_away" name="add_away" class="form-control" >
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select>
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">QQ号码</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="add_qq" name="add_qq" class="form-control">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">微信</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="add_wechart" name="add_wechart" class="form-control">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">电子邮件</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="add_email" name="add_email" class="form-control">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">住址</label>
                    <div class="col-md-6 col-sm-6 ">
                        <input type="text" id="add_address" name="add_address" class="form-control">
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
            url: "${pageContext.request.contextPath}/area/emp/add.action",
            type: "post",
            data: {
                name: $("#add_name").val(),
                sex: $("#add_sex").val(),
                companyid: $("#add_companyid").val(),
                deptid: $("#add_deptid").val(),
                positionid: $("#add_positionid").val(),
                setupid: $("#add_setupid").val(),
                lev: $("#add_lev").val(),
                away: $("#add_away").val(),
                qq: $("#add_qq").val(),
                wechart: $("#add_wechart").val(),
                email: $("#add_email").val(),
                address: $("#add_address").val()

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
                add_sex: {
                    required: true,
                    minlength: 1,
                    maxlength: 20
                },
                add_email: {
                    required: true,
                    email: true
                },
            }
        });
        return validate.form();
    }

    function  loadDataAdd() {
        $.ajax({
            url: "${pageContext.request.contextPath}/area/company/queryCompany.action",
            type: "post",
            data: {
            },
            dataType: "json",
            success: function (data) {
                let bb =$(document).find("#add_companyid");
                for ( let i = 0; i < data.length; i++) {
                    bb.append("<option value='"+data[i].id+"'>"+ data[i].name+ "</option>");
                }
            }
        });
        $("#add_companyid").change(function () {
            let companyid=$("#add_companyid").val();
            $("#add_deptid").find("option").remove();
            $.ajax({
                url: "${pageContext.request.contextPath}/area/dept/queryDept.action",
                type: "post",
                data: {
                    companyid: companyid
                },
                dataType: "json",
                success: function (data) {
                    let bb =$(document).find("#add_deptid");
                    for ( let i = 0; i < data.length; i++) {
                        bb.append("<option value='"+data[i].id+"'>"+ data[i].name+ "</option>");
                    }
                }
            });
            $("#add_setupid").find("option").remove();
            $.ajax({
                url: "${pageContext.request.contextPath}/setup/setup/querySetup.action",
                type: "post",
                data: {
                    companyid:companyid
                },
                dataType: "json",
                success: function (data) {
                    let bb =$(document).find("#add_setupid");
                    for ( let i = 0; i < data.length; i++) {
                        bb.append("<option value='"+data[i].id+"'>"+ data[i].name+ "</option>");
                    }
                }
            });
        })

        $("#add_deptid").change(function () {
            let deptid=$("#add_deptid").val();
            $("#add_positionid").find("option").remove();
            $.ajax({
                url: "${pageContext.request.contextPath}/area/position/queryPosition.action",
                type: "post",
                data: {
                    deptid:deptid
                },
                dataType: "json",
                success: function (data) {
                    let bb =$(document).find("#add_positionid");
                    for ( let i = 0; i < data.length; i++) {
                        bb.append("<option value='"+data[i].id+"'>"+ data[i].name+ "</option>");
                    }
                }
            });
        })
    }

</script>
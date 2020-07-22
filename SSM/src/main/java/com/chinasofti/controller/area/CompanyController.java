package com.chinasofti.controller.area;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.chinasofti.model.DataTables;
import com.chinasofti.model.area.Company;
import com.chinasofti.model.sys.User;
import com.chinasofti.service.area.CompanyService;
import com.chinasofti.util.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/area/company")
public class CompanyController {

    @Autowired
    CompanyService companyService;

    @RequestMapping("/company.action")
    public String company(){
        return "area/company";
    }

    @RequestMapping("/dataTables.action")
    @ResponseBody
    public String dataTables(Company company){

        DataTables dataTables = companyService.DataTables(company);
        return JSON.toJSONString(dataTables, SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/add.action")
    @ResponseBody
    public String add(Company company, HttpSession session) {
        JsonUtil json = new JsonUtil();
        try {
            int count = companyService.add(company, session);
            json.setSuccess(true);
        } catch (Exception e) {
            json.setSuccess(false);
            json.setMessage("新增失败:" + e.getMessage());
            e.printStackTrace();
        }
        return JSON.toJSONString(json);
    }

    @RequestMapping("/query.action")
    @ResponseBody
    public String query(Integer id) {
        Company company = companyService.query(id);
        return JSON.toJSONString(company, SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/edit.action")
    @ResponseBody
    public String edit(Company company, HttpSession session) {
        JsonUtil json = new JsonUtil();
        try {
            int count = companyService.edit(company, session);
            json.setSuccess(true);
        } catch (Exception e) {
            json.setSuccess(false);
            json.setMessage("修改失败:" + e.getMessage());
            e.printStackTrace();
        }
        return JSON.toJSONString(json);
    }

    @RequestMapping("/remove.action")
    @ResponseBody
    public String remove(Integer id) {
        JsonUtil json = new JsonUtil();
        try {
            int count = companyService.remove(id);
            json.setSuccess(true);
            json.setMessage("删除成功");
        } catch (Exception e) {
            json.setSuccess(false);
            json.setMessage("删除失败:" + e.getMessage());
            e.printStackTrace();
        }
        return JSON.toJSONString(json);
    }
    @RequestMapping("/queryCompany.action")
    @ResponseBody
    public String queryCompany(){
        List<Company> companies = companyService.queryCompany();
        return JSON.toJSONString(companies, SerializerFeature.WriteMapNullValue);
    }
}

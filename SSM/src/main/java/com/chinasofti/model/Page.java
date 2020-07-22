package com.chinasofti.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Page {

    private Integer draw;

    private Integer start;//分页开始

    private Integer length;//分页结束

    private Map<Search, String> search = new HashMap<Search, String>();//默认查询值

    private List<Map<Order, String>> order = new ArrayList<Map<Order, String>>();//排序列索引值和排序规则

    private List<Map<Column, String>> columns = new ArrayList<Map<Column, String>>();

    private String orderName;//排序列名

    private String orderDesc;//排序规则

    public Integer getDraw() {
        return draw;
    }

    public void setDraw(Integer draw) {
        this.draw = draw;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getLength() {
        return length;
    }

    public void setLength(Integer length) {
        this.length = length;
    }

    public Map<Search, String> getSearch() {
        return search;
    }

    public void setSearch(Map<Search, String> search) {
        this.search = search;
    }

    public List<Map<Order, String>> getOrder() {
        return order;
    }

    public void setOrder(List<Map<Order, String>> order) {
        this.order = order;
    }

    public String getOrderName() {
        if(this.order != null && this.order.size() != 0) {
            String index = this.order.get(0).get(Order.column);
            orderName = columns.get(Integer.parseInt(index)).get(Column.data);
        }
        return orderName;
    }

    public void setOrderName(String orderName) {
        this.orderName = orderName;
    }

    public String getOrderDesc() {
        if(this.order != null  && this.order.size() != 0) {
            orderDesc = this.order.get(0).get(Order.dir);
        }
        return orderDesc;
    }

    public void setOrderDesc(String orderDesc) {
        this.orderDesc = orderDesc;
    }

    public List<Map<Column, String>> getColumns() {
        return columns;
    }

    public void setColumns(List<Map<Column, String>> columns) {
        this.columns = columns;
    }

}

package com.chinasofti.model;

import java.util.List;

public class DataTables<T>  {

	private List<T> data;//分页查询的数据
	
	private long iTotalDisplayRecords;//过滤后记录条数
	
	private long iTotalRecords;//记录总数

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	public long getiTotalDisplayRecords() {
		return iTotalDisplayRecords;
	}

	public void setiTotalDisplayRecords(long iTotalDisplayRecords) {
		this.iTotalDisplayRecords = iTotalDisplayRecords;
	}

	public long getiTotalRecords() {
		return iTotalRecords;
	}

	public void setiTotalRecords(long iTotalRecords) {
		this.iTotalRecords = iTotalRecords;
	}

}

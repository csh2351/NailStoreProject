package com.kh.spring.reserve.model.vo;

import java.util.Date;

public class Payment {
	private int payment_pk;
	private String payment_num;
	private int member_pk;
	private String member_name;
	private int store_pk;
	private String payment_check;
	private int reserve_pk;
	private Date payment_date;
	private int payment_price;
	
	public Payment() {}

	public Payment(int payment_pk, String payment_num, int member_pk, String member_name, int store_pk,
			String payment_check, int reserve_pk, Date payment_date, int payment_price) {
		super();
		this.payment_pk = payment_pk;
		this.payment_num = payment_num;
		this.member_pk = member_pk;
		this.member_name = member_name;
		this.store_pk = store_pk;
		this.payment_check = payment_check;
		this.reserve_pk = reserve_pk;
		this.payment_date = payment_date;
		this.payment_price = payment_price;
	}

	@Override
	public String toString() {
		return "Payment [payment_pk=" + payment_pk + ", payment_num=" + payment_num + ", member_pk=" + member_pk
				+ ", member_name=" + member_name + ", store_pk=" + store_pk + ", payment_check=" + payment_check
				+ ", reserve_pk=" + reserve_pk + ", payment_date=" + payment_date + ", payment_price=" + payment_price
				+ "]";
	}

	public int getPayment_pk() {
		return payment_pk;
	}

	public void setPayment_pk(int payment_pk) {
		this.payment_pk = payment_pk;
	}

	public String getPayment_num() {
		return payment_num;
	}

	public void setPayment_num(String payment_num) {
		this.payment_num = payment_num;
	}

	public int getMember_pk() {
		return member_pk;
	}

	public void setMember_pk(int member_pk) {
		this.member_pk = member_pk;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public int getStore_pk() {
		return store_pk;
	}

	public void setStore_pk(int store_pk) {
		this.store_pk = store_pk;
	}

	public String getPayment_check() {
		return payment_check;
	}

	public void setPayment_check(String payment_check) {
		this.payment_check = payment_check;
	}

	public int getReserve_pk() {
		return reserve_pk;
	}

	public void setReserve_pk(int reserve_pk) {
		this.reserve_pk = reserve_pk;
	}

	public Date getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}

	public int getPayment_price() {
		return payment_price;
	}

	public void setPayment_price(int payment_price) {
		this.payment_price = payment_price;
	}

	
		
	
	
	
	
}

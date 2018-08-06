package com.kh.spring.member.model.vo;

public class Member {
	
	private int memberPk;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberPhone;
	private String memberEmail;
	private String memberAddress;
	private String memberOriImg;
	private String memberReImg;
	private String memberLevel;
	
	public Member( ) {}

	public Member(int memberPk, String memberId, String memberPw, String memberName, String memberPhone,
			String memberEmail, String memberAddress, String memberOriImg, String memberReImg, String memberLevel) {
		super();
		this.memberPk = memberPk;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberEmail = memberEmail;
		this.memberAddress = memberAddress;
		this.memberOriImg = memberOriImg;
		this.memberReImg = memberReImg;
		this.memberLevel = memberLevel;
	}

	public int getMemberPk() {
		return memberPk;
	}

	public void setMemberPk(int memberPk) {
		this.memberPk = memberPk;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberOriImg() {
		return memberOriImg;
	}

	public void setMemberOriImg(String memberOriImg) {
		this.memberOriImg = memberOriImg;
	}

	public String getMemberReImg() {
		return memberReImg;
	}

	public void setMemberReImg(String memberReImg) {
		this.memberReImg = memberReImg;
	}

	public String getMemberLevel() {
		return memberLevel;
	}

	public void setMemberLevel(String memberLevel) {
		this.memberLevel = memberLevel;
	}

	@Override
	public String toString() {
		return "Member [memberPk=" + memberPk + ", memberId=" + memberId + ", memberPw=" + memberPw + ", memberName="
				+ memberName + ", memberPhone=" + memberPhone + ", memberEmail=" + memberEmail + ", memberAddress="
				+ memberAddress + ", memberOriImg=" + memberOriImg + ", memberReImg=" + memberReImg + ", memberLevel="
				+ memberLevel + "]";
	}

	
	

}

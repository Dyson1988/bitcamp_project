package com.board.vo;

public class CommVO {
	private int step, lev;
	private String c_idx, bname, writer, content, pwd,
			write_date, ip, b_idx;
	
	public CommVO() {}

	public CommVO(String c_idx, int step, int lev, String bname, String writer, String content, String pwd,
			String write_date, String ip, String b_idx) {
		this.c_idx = c_idx;
		this.step = step;
		this.lev = lev;
		this.bname = bname;
		this.writer = writer;
		this.content = content;
		this.pwd = pwd;
		this.write_date = write_date;
		this.ip = ip;
		this.b_idx = b_idx;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public String getC_idx() {
		return c_idx;
	}

	public void setC_idx(String c_idx) {
		this.c_idx = c_idx;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getB_idx() {
		return b_idx;
	}

	public void setB_idx(String b_idx) {
		this.b_idx = b_idx;
	}

	@Override
	public String toString() {
		return "CommVO [step=" + step + ", lev=" + lev + ", c_idx=" + c_idx + ", bname=" + bname + ", writer=" + writer
				+ ", content=" + content + ", pwd=" + pwd + ", write_date=" + write_date + ", ip=" + ip + ", b_idx="
				+ b_idx + "]";
	}
}

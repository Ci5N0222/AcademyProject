package kr.co.dong.board;

import lombok.Data;

@Data
public class BoardReply {
	
	private int comm_num;
	private String m_id;
	private String m_ename;
	private String comm_con;
	private String comm_dt;
	private int bd_num;
	
	public int getComm_num() {
		return comm_num;
	}
	public void setComm_num(int comm_num) {
		this.comm_num = comm_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_ename() {
		return m_ename;
	}
	public void setM_ename(String m_ename) {
		this.m_ename = m_ename;
	}
	public String getComm_con() {
		return comm_con;
	}
	public void setComm_con(String comm_con) {
		this.comm_con = comm_con;
	}
	public String getComm_dt() {
		return comm_dt;
	}
	public void setComm_dt(String comm_dt) {
		this.comm_dt = comm_dt;
	}
	public int getBd_num() {
		return bd_num;
	}
	public void setBd_num(int bd_num) {
		this.bd_num = bd_num;
	}
	
	@Override
	public String toString() {
		return "BoardReply [comm_num=" + comm_num + ", m_id=" + m_id + ", m_ename=" + m_ename + ", comm_con=" + comm_con
				+ ", comm_dt=" + comm_dt + ", bd_num=" + bd_num + "]";
	}
	
	
	
	
	
}

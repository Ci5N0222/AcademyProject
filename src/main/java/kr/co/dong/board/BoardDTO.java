package kr.co.dong.board;

public class BoardDTO {
	
	private int bd_num;
	private String bd_tl;
	private String bd_con;
	private int bd_ref;
	private int bd_recomm;
	private String bd_dt;
	private int bd_group;
	private int bd_ste;
	private int q_end;	
	private String m_id;
	private String m_ename;
	
	public int getBd_num() {
		return bd_num;
	}
	public void setBd_num(int bd_num) {
		this.bd_num = bd_num;
	}
	public String getBd_tl() {
		return bd_tl;
	}
	public void setBd_tl(String bd_tl) {
		this.bd_tl = bd_tl;
	}
	public String getBd_con() {
		return bd_con;
	}
	public void setBd_con(String bd_con) {
		this.bd_con = bd_con;
	}
	public int getBd_ref() {
		return bd_ref;
	}
	public void setBd_ref(int bd_ref) {
		this.bd_ref = bd_ref;
	}
	public int getBd_recomm() {
		return bd_recomm;
	}
	public void setBd_recomm(int bd_recomm) {
		this.bd_recomm = bd_recomm;
	}
	public String getBd_dt() {
		return bd_dt;
	}
	public void setBd_dt(String bd_dt) {
		this.bd_dt = bd_dt;
	}
	public int getBd_group() {
		return bd_group;
	}
	public void setBd_group(int bd_group) {
		this.bd_group = bd_group;
	}
	public int getBd_ste() {
		return bd_ste;
	}
	public void setBd_ste(int bd_ste) {
		this.bd_ste = bd_ste;
	}
	public int getQ_end() {
		return q_end;
	}
	public void setQ_end(int q_end) {
		this.q_end = q_end;
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
	
	
	@Override
	public String toString() {
		return "BoardDTO [bd_num=" + bd_num + ", bd_tl=" + bd_tl + ", bd_con=" + bd_con + ", bd_ref=" + bd_ref
				+ ", bd_recomm=" + bd_recomm + ", bd_dt=" + bd_dt + ", bd_group=" + bd_group + ", bd_ste=" + bd_ste
				+ ", q_end=" + q_end + ", m_id=" + m_id + ", m_ename=" + m_ename + "]";
	}
	

	
	
	
	
	
	
}

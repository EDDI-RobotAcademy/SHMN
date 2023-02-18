package com.kh.saeha.vo;

import java.util.Date;

//sae_pdreply
//상품 문의게시판(댓글형식)
//create table sae_pdreply(
// py_bno number not null,
// py_pno number not null,
// py_writer varchar2(200) not null,
// py_content varchar2(4000) not null,
// py_date date default sysdate,
// PRIMARY KEY(py_bno,py_pno));

public class PdReplyVO {
		
		public int py_bno;
		public int py_pno;
		public String py_writer;
		public String py_content;
		public Date py_date;
		
		public int getPy_bno() {
			return py_bno;
		}
		public void setPy_bno(int py_bno) {
			this.py_bno = py_bno;
		}
		public int getPy_pno() {
			return py_pno;
		}
		public void setPy_pno(int py_pno) {
			this.py_pno = py_pno;
		}
		public String getPy_writer() {
			return py_writer;
		}
		public void setPy_writer(String py_writer) {
			this.py_writer = py_writer;
		}
		public String getPy_content() {
			return py_content;
		}
		public void setPy_content(String py_content) {
			this.py_content = py_content;
		}
		public Date getPy_date() {
			return py_date;
		}
		public void setPy_date(Date py_date) {
			this.py_date = py_date;
		}
		@Override
		public String toString() {
			return "PdReplyVO [py_bno=" + py_bno + ", py_pno=" + py_pno + ", py_writer=" + py_writer + ", py_content="
					+ py_content + ", py_date=" + py_date + "]";
		}
		
		
		

}
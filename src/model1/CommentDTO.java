package model1;

public class CommentDTO {
	// 멤버 변수 선언
	private String commentNum;
	private String comment;
	private String id;
	private java.sql.Date regidate;
	private java.sql.Date updateRegidate;

	public String getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(String commentNum) {
		this.commentNum = commentNum;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public java.sql.Date getRegidate() {
		return regidate;
	}

	public void setRegidate(java.sql.Date regidate) {
		this.regidate = regidate;
	}

	public java.sql.Date getUpdateRegidate() {
		return updateRegidate;
	}

	public void setUpdateRegidate(java.sql.Date updateRegidate) {
		this.updateRegidate = updateRegidate;
	}
}

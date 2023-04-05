package model1;

import java.sql.PreparedStatement;
import java.util.ArrayList;

import javax.servlet.ServletContext;

import db.JDBConnect;

public class CommentDAO extends JDBConnect {

	public CommentDAO(ServletContext application) {
		super(application);
	}

	public CommentDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}

	public ArrayList<CommentDTO> getList(int bbsID, int pageNumber) {
		String SQL = "SELECT * FROM REPLY WHERE replyID<? AND replyAvailable=1 AND bbsID=? ORDER BY replyID DESC LIMIT 10";
		ArrayList<CommentDTO> list = new ArrayList<CommentDTO>();
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			pstmt.setInt(2, bbsID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CommentDTO reply = new CommentDTO();
				reply.setId(rs.getString(1));
				reply.setComment(rs.getString(3));
				list.add(reply);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int getNext() {
		String SQL = "select replyID FROM REPLY ORDER BY replyID DESC";
		try {

			PreparedStatement pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println(rs.getInt(1)); // select문에서 첫번째 값
				return rs.getInt(1) + 1; // 현재 인덱스(현재 게시글 개수) +1 반환
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int write(int bbsID, String replyContent, String userID) {
		String SQL = "INSERT INTO REPLY VALUES(?,?,?,?,?)";

		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setInt(2, getNext());
			pstmt.setString(3, replyContent);
			pstmt.setInt(4, bbsID);
			pstmt.setInt(5, 1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}

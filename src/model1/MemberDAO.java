package model1;

import javax.servlet.ServletContext;

import db.JDBConnect;

public class MemberDAO extends JDBConnect {
	public MemberDAO(ServletContext application) {
		super(application);
	}

	public MemberDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}

	// 명시한 아이디/패스워드와 일치하는 회원 정보를 반환합니다.
	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO(); // 회원 정보 DTO 객체 생성
		String query = "SELECT * FROM board.member WHERE id=? AND pass=?"; // 쿼리문 템플릿

		try {
			// 쿼리 실행
			psmt = con.prepareStatement(query); // 동적 쿼리문 준비
			psmt.setString(1, uid); // 쿼리문의 첫 번째 인파라미터에 값 설정
			psmt.setString(2, upass); // 쿼리문의 두 번째 인파라미터에 값 설정
			rs = psmt.executeQuery(); // 쿼리문 실행

			// 결과 처리
			if (rs.next()) {
				// 쿼리 결과로 얻은 회원 정보를 DTO 객체에 저장
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto; // DTO 객체 반환
	}

	public int insertMember(MemberDTO dto) {
		// 성공하면 반환값을 1을 가짐!! boolean이 아니라 inteager 값의 1을 가진다
		// 실패하면 0을 가진다 그렇기 때문에 반환타입을 int형으로 잡아둔다.

		int result = 0;

		String query = "INSERT INTO board.member(id,pass,name) values(?,?,?)";

		try {
			// 쿼리 실행

			psmt = con.prepareStatement(query); // 동적 쿼리
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());

			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("회원 가입중 에러 발생");
			e.printStackTrace();
		}

		return result;
	}

	public int deleteMember(MemberDTO dto) {
		int result = 0;

		String query = "DELETE FROM board.member WHERE id = ?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());

			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("회원 삭제중 에러 발생");
			e.printStackTrace();
		}

		return result;
	}

	public int duplecateID(String id) {// id 중복 체크 첫번째 방법
		int cnt = 0; 
		try {
			StringBuilder sql = new StringBuilder();

			// 아이디 중복 확인
			sql.append(" SELECT count(id) as cnt ");
			sql.append(" FROM board.member ");
			sql.append(" WHERE id = ? ");

			psmt = con.prepareStatement(sql.toString());
			psmt.setString(1, id);

			rs = psmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} catch (Exception e) {
			System.out.println("아이디 중복 확인 실패 : " + e);
		} // try end
		return cnt;
	}// duplecateID end

	// 아이디 중복검사
	public boolean checkId(String id) { // id 중복 체크 두번째 방법
		String query = "SELECT COUNT(ID) FROM board.member WHERE id = ?";
		boolean check = false;
		try {
			// DBMS 연결 객체 가져오기
			// String으로 선언된 쿼리를 pstm객체에 전달하기
			psmt = con.prepareStatement(query);
			// SQL 쿼리에 ?가 있다면 알맞는 값으로 지정해주기
			psmt.setString(1, id);
			// 쿼리 실행 후 결과를 rs객체에 담기
			rs = psmt.executeQuery();

			// 행가져오기
			rs.next();
			// 위에서 가져온 행의 열을 타입에 맞춰서 가져오기
			check = rs.getInt(1) == 1; // 0일 때 중복 없음(false), 1일 때 중복 있음(true)

		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}
}

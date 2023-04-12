package club;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class clubmgr {

	private DBConnectionMgr pool;
	
	public clubmgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//1.Member 매니저
	
	//ID 중복 확인
	public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "select id from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			flag = pstmt.executeQuery().next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
		
	//회원가입
	public boolean insertMember(MemBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "insert member(id, pw, club, name, tel, gender, birth, mail, zip, post, post2, hobby, job, grnum) "
					+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPw());
			pstmt.setString(3, bean.getClub());
			pstmt.setString(4, bean.getName());
			pstmt.setString(5, bean.getTel());
			pstmt.setString(6, bean.getGender());
			pstmt.setString(7, bean.getBirth());
			pstmt.setString(8, bean.getMail());
			pstmt.setString(9, bean.getZip());
			pstmt.setString(10, bean.getPost());
			pstmt.setString(11, bean.getPost2());
			String hobby[] = bean.getHobby();
			char hob[] = { '0', '0', '0', '0', '0' };
			String lists[] = { "인터넷", "여행", "게임", "영화", "운동" };
			for (int i = 0; i < hobby.length; i++) {
				for (int j = 0; j < lists.length; j++) {
					if (hobby[i].equals(lists[j]))
						hob[j] = '1';
				}
			}
			pstmt.setString(12, new String(hob));
			pstmt.setString(13, bean.getJob());
			pstmt.setString(14, bean.getGrnum());
			
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
		
	//로그인
	public boolean loginMember(String id, String pw) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "select id from member where id = ? and pw = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	//회원정보 가져오기
	public MemBean getMember1(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemBean bean = null;
		try {
			con = pool.getConnection();
			String sql = "select * from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				bean = new MemBean();
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setPw(rs.getString("pw"));
				bean.setMemship(rs.getString("memship"));
				bean.setAppro(rs.getString("appro"));
				bean.setCode(rs.getString("code"));
				bean.setClub(rs.getString("club"));
				bean.setName(rs.getString("name"));
				bean.setTel(rs.getString("tel"));
				bean.setGender(rs.getString("gender"));
				bean.setBirth(rs.getString("birth"));
				bean.setMail(rs.getString("mail"));
				bean.setZip(rs.getString("zip"));
				bean.setPost(rs.getString("post"));
				bean.setPost2(rs.getString("post2"));
				String hob[] = new String[5];
				String hobby = rs.getString("hobby");
				for (int i = 0; i < hob.length; i++) {
					hob[i] = hobby.substring(i, i + 1);
				}
				bean.setHobby(hob);
				bean.setJob(rs.getString("job"));
				bean.setGrnum(rs.getString("grnum"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}
	
	//회원정보 가져오기(num)
	public MemBean getMember(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemBean bean = null;
		try {
			con = pool.getConnection();
			String sql = "select * from member where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				bean = new MemBean();
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setPw(rs.getString("pw"));
				bean.setMemship(rs.getString("memship"));
				bean.setAppro(rs.getString("appro"));
				bean.setCode(rs.getString("code"));
				bean.setClub(rs.getString("club"));
				bean.setName(rs.getString("name"));
				bean.setTel(rs.getString("tel"));
				bean.setGender(rs.getString("gender"));
				bean.setBirth(rs.getString("birth"));
				bean.setMail(rs.getString("mail"));
				bean.setZip(rs.getString("zip"));
				bean.setPost(rs.getString("post"));
				bean.setPost2(rs.getString("post2"));
				String hob[] = new String[5];
				String hobby = rs.getString("hobby");
				for (int i = 0; i < hob.length; i++) {
					hob[i] = hobby.substring(i, i + 1);
				}
				bean.setHobby(hob);
				bean.setJob(rs.getString("job"));
				bean.setGrnum(rs.getString("grnum"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}
	
	//회원정보 가져오기(3)
	public MemBean getMember3(String id, int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MemBean bean = null;
		try {
			con = pool.getConnection();
			if (num > 0) {
				sql = "select * from member where num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
			} else {
				sql = "select * from member where id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
			}
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				bean = new MemBean();
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setPw(rs.getString("pw"));
				bean.setMemship(rs.getString("memship"));
				bean.setAppro(rs.getString("appro"));
				bean.setCode(rs.getString("code"));
				bean.setClub(rs.getString("club"));
				bean.setName(rs.getString("name"));
				bean.setTel(rs.getString("tel"));
				bean.setGender(rs.getString("gender"));
				bean.setBirth(rs.getString("birth"));
				bean.setMail(rs.getString("mail"));
				bean.setZip(rs.getString("zip"));
				bean.setPost(rs.getString("post"));
				bean.setPost2(rs.getString("post2"));
				String hob[] = new String[5];
				String hobby = rs.getString("hobby");
				for (int i = 0; i < hob.length; i++) {
					hob[i] = hobby.substring(i, i + 1);
				}
				bean.setHobby(hob);
				bean.setJob(rs.getString("job"));
				bean.setGrnum(rs.getString("grnum"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}
	
	// 회원 정보 수정(회원)
	public boolean updateMember(MemBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			String sql = "update member set pw=?, club=?, name=?, tel=?, "
					+ "gender=?, birth=?, mail=?, zip=?, post=?, post2=?, hobby=?, job=?, grnum=? where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getPw());
			pstmt.setString(2, bean.getClub());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getTel());
			pstmt.setString(5, bean.getGender());
			pstmt.setString(6, bean.getBirth());
			pstmt.setString(7, bean.getMail());
			pstmt.setString(8, bean.getZip());
			pstmt.setString(9, bean.getPost());
			pstmt.setString(10, bean.getPost2());
			char hobb[] = { '0', '0', '0', '0', '0' };
			if (bean.getHobby() != null) {
				String hobbys[] = bean.getHobby();
				String lists[] = { "인터넷", "여행", "게임", "영화", "운동" };
				for (int i = 0; i < hobbys.length; i++) {
					for (int j = 0; j < lists.length; j++)
						if (hobbys[i].equals(lists[j]))
							hobb[j] = '1';
				}
			}
			pstmt.setString(11, new String(hobb));
			pstmt.setString(12, bean.getJob());
			pstmt.setString(13, bean.getId());
			pstmt.setString(14, bean.getGrnum());
			int count = pstmt.executeUpdate();
			if (count > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	// 회원 정보 수정
	public boolean updateMember1(MemBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			String sql = "update member set pw=?, memship=?, appro=?, code=?, club=?, name=?, tel=?, "
					+ "gender=?, birth=?, mail=?, zip=?, post=?, post2=?, hobby=?, job=?, grnum=? where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getPw());
			pstmt.setString(2, bean.getMemship());
			pstmt.setString(3, bean.getAppro());
			pstmt.setString(4, bean.getCode());
			pstmt.setString(5, bean.getClub());
			pstmt.setString(6, bean.getName());
			pstmt.setString(7, bean.getTel());
			pstmt.setString(8, bean.getGender());
			pstmt.setString(9, bean.getBirth());
			pstmt.setString(10, bean.getMail());
			pstmt.setString(11, bean.getZip());
			pstmt.setString(12, bean.getPost());
			pstmt.setString(13, bean.getPost2());
			char hobb[] = { '0', '0', '0', '0', '0' };
			if (bean.getHobby() != null) {
				String hobbys[] = bean.getHobby();
				String lists[] = { "인터넷", "여행", "게임", "영화", "운동" };
				for (int i = 0; i < hobbys.length; i++) {
					for (int j = 0; j < lists.length; j++)
						if (hobbys[i].equals(lists[j]))
							hobb[j] = '1';
				}
			}
			pstmt.setString(14, new String(hobb));
			pstmt.setString(15, bean.getJob());
			pstmt.setString(16, bean.getGrnum());
			pstmt.setString(17, bean.getId());
			int count = pstmt.executeUpdate();
			if (count > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	// 회원 총 수
	public int getTotalCount(String memship, String check) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			if (memship.equals("admin") && check.equals("a")) {
		       sql = "select count(num) from member";
			   pstmt = con.prepareStatement(sql);
			} 
//			else if (memship.equals("gradmin") && check.equals("a")) {
//				sql = "select count(num) from member where code like 'A%'";
//				pstmt = con.prepareStatement(sql);
//			}
			else if (memship.equals("admin") && check.equals("o")) {
			   sql = "select count(num) from member where appro = '승인'";
			   pstmt = con.prepareStatement(sql);
			} else if (memship.equals("admin") && check.equals("x")) {
			   sql = "select count(num) from member where appro = '미승인'";
			   pstmt = con.prepareStatement(sql);
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
	// 해당 조건의 회원 조회
	public Vector<MemBean> getMemberList(String memship, String check) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<MemBean> vlist = new Vector<MemBean>();
		try {
			con = pool.getConnection();
			if (memship.equals("admin") && check.equals("a")) {
				sql = "select * from member";
				pstmt = con.prepareStatement(sql);
			} 
//			else if (memship.equals("gradmin") && check.equals("a")) {
//				sql = "select * from member where code like 'A%'";
//				pstmt = con.prepareStatement(sql);
//			} 
			else if (memship.equals("admin") && check.equals("o")) {
				sql = "select * from member where appro = '승인'";
				pstmt = con.prepareStatement(sql);
			} else if (memship.equals("admin") && check.equals("x")) {
				sql = "select * from member where appro = '미승인'";
				pstmt = con.prepareStatement(sql);
			}
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				MemBean bean = new MemBean();
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setPw(rs.getString("pw"));
				bean.setMemship(rs.getString("memship"));
				bean.setAppro(rs.getString("appro"));
				bean.setCode(rs.getString("code"));
				bean.setClub(rs.getString("club"));
				bean.setName(rs.getString("name"));
				bean.setTel(rs.getString("tel"));
				bean.setMail(rs.getString("mail"));
				bean.setGrnum(rs.getString("grnum"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	// 같은 모임에 해당하는 회원 조회
	public Vector<MemBean> getAdminList(String grnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<MemBean> vlist = new Vector<MemBean>();
		try {
			con = pool.getConnection();
		    sql = "select * from member where grnum = ?";
		    pstmt = con.prepareStatement(sql);
		    pstmt.setString(1, grnum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemBean bean = new MemBean();
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setPw(rs.getString("pw"));
				bean.setMemship(rs.getString("memship"));
				bean.setAppro(rs.getString("appro"));
				bean.setName(rs.getString("name"));
				bean.setTel(rs.getString("tel"));
				bean.setGrnum(rs.getString("grnum"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	// 회원 정보 삭제
	public void deleteMember(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "delete from member where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	// 회원 승인 여부 
	public boolean updatePerm(int recnum, String perm) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			if (perm.equals("미승인")) {
				String sql = "update member set appro='승인' where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, recnum);
			} else {
				String sql = "update member set appro='미승인' where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, recnum);
			}
			int count = pstmt.executeUpdate();
			if (count > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	
	//2. 코드
	//코드 조회
	public Vector<CodeBean> getCodeList(String check) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<CodeBean> vlist = new Vector<CodeBean>();
		try {
			con = pool.getConnection();
			if (check.equals("all")) {
				sql = "select * from code";
				pstmt = con.prepareStatement(sql);
			} else if (check.equals("job")) {
				sql = "select * from code where substr(code, 1, 1) = 'D'";
				pstmt = con.prepareStatement(sql);
			} else if (check.equals("club")) {
				sql = "select * from code where substr(code, 1, 1) = 'A'";
				pstmt = con.prepareStatement(sql);
			} else if (check.equals("inorex")) {
				sql = "select * from code where substr(etc, 1, 1) = 'B' or substr(etc, 1, 1) = 'C'";
				pstmt = con.prepareStatement(sql);
			} else if (check.equals("inco")) {
				sql = "select * from code where substr(code, 1, 1) = 'B'";
				pstmt = con.prepareStatement(sql);
			} else if (check.equals("expe")) {
				sql = "select * from code where substr(code, 1, 1) = 'C'";
				pstmt = con.prepareStatement(sql);
			} else if (check.equals("cash")) {
				sql = "select * from code where substr(code, 1, 1) = 'E'";
				pstmt = con.prepareStatement(sql);
			} else if (check.equals("card")) {
				sql = "select * from code where substr(code, 1, 1) = 'F'";
				pstmt = con.prepareStatement(sql);
			} else if (check.equals("bank")) {
				sql = "select * from code where substr(code, 1, 1) = 'G'";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "select * from code where substr(code, 1, 1) = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, check);
			}
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CodeBean bean = new CodeBean();
				bean.setNum(rs.getInt("num"));
				bean.setDisc(rs.getString("disc"));
				bean.setCode(rs.getString("code"));
				bean.setAssort(rs.getString("assort"));
				bean.setEtc(rs.getString("etc"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//코드 조회(검색)
	public Vector<CodeBean> getCodeSearch(String check, String keyWord, String keyField) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<CodeBean> vlist = new Vector<CodeBean>();
		try {
			con = pool.getConnection();
			if (check.equals("all")) {
				sql = "select * from code order by code asc";
				pstmt = con.prepareStatement(sql);
			} else if (check.equals("search")) {
				sql = "select * from code where "  + keyField + " like ? order by code asc";
			    pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CodeBean bean = new CodeBean();
				bean.setNum(rs.getInt("num"));
				bean.setDisc(rs.getString("disc"));
				bean.setCode(rs.getString("code"));
				bean.setAssort(rs.getString("assort"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//코드입력
	public boolean insertCode(CodeBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert code(disc, code, assort) values (?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getDisc());
			pstmt.setString(2, bean.getCode());
			pstmt.setString(3, bean.getAssort());
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//3. 모임 group
	//새 모임 입력
	public boolean insertGroup(GrBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "insert groupp (code, grnum, grname, grplace, gradmid, gradmname, gradmtel) values (?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getCode());
			pstmt.setString(2, bean.getGrnum());
			pstmt.setString(3, bean.getGrname());
			pstmt.setString(4, bean.getGrplace());
			pstmt.setString(5, bean.getGradmid());
			pstmt.setString(6, bean.getGradmname());
			pstmt.setString(7, bean.getGradmtel());

			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//새 모임 입력
	public boolean insertGr (GrBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "insert groupp (code, grnum, grname, grplace, gradmid, gradmname, gradmtel) values (?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getCode());
			pstmt.setString(2, bean.getGrnum());
			pstmt.setString(3, bean.getGrname());
			pstmt.setString(4, bean.getGrplace());
			pstmt.setString(5, bean.getGradmid());
			pstmt.setString(6, bean.getGradmname());
			pstmt.setString(7, bean.getGradmtel());

			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	// 모임 카운트
	public int getTotalGroup() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			sql = "select count(num) from groupp";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
	//모임 정보 가져오기
	public GrBean getGroup1(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		GrBean bean = null;
		try {
			con = pool.getConnection();
			String sql = "select * from groupp where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				bean = new GrBean();
				bean.setNum(rs.getInt("num"));
				bean.setCode(rs.getString("code"));
				bean.setGrnum(rs.getString("grnum"));
				bean.setGrname(rs.getString("grname"));
				bean.setGrplace(rs.getString("grplace"));
				bean.setGradmid(rs.getString("gradmid"));
				bean.setGradmname(rs.getString("gradmname"));
				bean.setGradmtel(rs.getString("gradmtel"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}
	
	//모임정보 가져오기(num)
	public GrBean getGroup2(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		GrBean bean = null;
		try {
			con = pool.getConnection();
			String sql = "select * from groupp where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				bean = new GrBean();
				bean.setNum(rs.getInt("num"));
				bean.setCode(rs.getString("code"));
				bean.setGrnum(rs.getString("grnum"));
				bean.setGrname(rs.getString("grname"));
				bean.setGrplace(rs.getString("grplace"));
				bean.setGradmid(rs.getString("gradmid"));
				bean.setGradmname(rs.getString("gradmname"));
				bean.setGradmtel(rs.getString("gradmtel"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}
	
	// 모임 정보 수정(회원)
	public boolean updateGroup(GrBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			String sql = "update groupp set code=?, grnum=?, grname=?, grplace=?, "
					+ "gradmid=?, gradmname=?, gradmtel=? where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getCode());
			pstmt.setString(2, bean.getGrnum());
			pstmt.setString(3, bean.getGrname());
			pstmt.setString(4, bean.getGrplace());
			pstmt.setString(5, bean.getGradmid());
			pstmt.setString(6, bean.getGradmname());
			pstmt.setString(7, bean.getGradmtel());
			pstmt.setInt(8, bean.getNum());
			int count = pstmt.executeUpdate();
			if (count > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	// 모임 리스트 조회
	public Vector<GrBean> getGroupList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<GrBean> vlist = new Vector<GrBean>();
		try {
			con = pool.getConnection();
			sql = "select * from groupp";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				GrBean bean = new GrBean();
				bean.setNum(rs.getInt("num"));
				bean.setCode(rs.getString("code"));
				bean.setGrnum(rs.getString("grnum"));
				bean.setGrname(rs.getString("grname"));
				bean.setGrplace(rs.getString("grplace"));
				bean.setGradmid(rs.getString("gradmid"));
				bean.setGradmname(rs.getString("gradmname"));
				bean.setGradmtel(rs.getString("gradmtel"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
		
	// 회원 정보 삭제
	public void deleteGroup(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "delete from groupp where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	//4. 출납
	//출납내역 입력
	public boolean insertPayment(PayBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert paymentt (id, date, inorex, c_inco, c_expe, cash, card, bank, inco, expe, expe_list, note) "
					+ "values (?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getDate());
			pstmt.setString(3, bean.getInorex());
			pstmt.setString(4, bean.getC_inco());
			pstmt.setString(5, bean.getC_expe());
			pstmt.setString(6, bean.getCash());
			pstmt.setString(7, bean.getCard());
			pstmt.setString(8, bean.getBank());
			pstmt.setInt(9, bean.getInco());
			pstmt.setInt(10, bean.getExpe());
			pstmt.setString(11, bean.getExpe_list());
			pstmt.setString(12, bean.getNote());
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//출납정보 가져오기
	public Vector<PayBean> getPayment(String check, String id, String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<PayBean> vlist = new Vector<PayBean>();
		
		try {
			con = pool.getConnection();
			if (check.equals("admin") || check.equals("gradmin")) {
				sql = "select * from paymentt ";
			    pstmt = con.prepareStatement(sql);
			} else if (check.equals("all")) {
				sql = "select * from paymentt where usid=? ";
			    pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
			} else if (check.equals("search")) {
				sql = "select * from paymentt where "  + keyField + " like ? ";
			    pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				PayBean bean = new PayBean();
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setDate(rs.getString("date"));
				bean.setInorex(rs.getString("inorex"));
				bean.setC_inco(rs.getString("c_inco"));
				bean.setC_expe(rs.getString("c_expe"));
				bean.setCash(rs.getString("cash"));
				bean.setCard(rs.getString("card"));
				bean.setBank(rs.getString("bank"));
				bean.setExpe_list(rs.getString("expe_list"));
				bean.setInco(rs.getInt("inco"));
				bean.setExpe(rs.getInt("expe"));
				bean.setBalan(rs.getInt("balan"));
				bean.setNote(rs.getString("note"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	// 출납내역 가져오기(num)
	public PayBean getPayment1(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PayBean bean = null;
		try {
			con = pool.getConnection();
			String sql = "select * from paymentt where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = new PayBean();
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setDate(rs.getString("date"));
				bean.setInorex(rs.getString("inorex"));
				bean.setC_inco(rs.getString("c_inco"));
				bean.setC_expe(rs.getString("c_expe"));
				bean.setCash(rs.getString("cash"));
				bean.setCard(rs.getString("card"));
				bean.setBank(rs.getString("bank"));
				bean.setExpe_list(rs.getString("expe_list"));
				bean.setInco(rs.getInt("inco"));
				bean.setExpe(rs.getInt("expe"));
				bean.setBalan(rs.getInt("balan"));
				bean.setNote(rs.getString("note"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}
	
	//출납 자료수
	public int getPayCount(String check, String id, String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		
		try {
			con = pool.getConnection();
			if (check.equals("admin") || check.equals("gradmin")) {
				sql = "select count(num) from paymentt ";
			    pstmt = con.prepareStatement(sql);
			} else if (check.equals("all")) {
				sql = "select count(num) from paymentt where usid=? ";
			    pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
			} else if (check.equals("search")) {
				sql = "select count(num) from paymentt where "  + keyField + " like ? ";
			    pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
	// 출납 잔액 계산
	public boolean updateBalan(int num, int balan) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			String sql = "update paymentt set balan = ? where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, balan);
			pstmt.setInt(2, num);
			int count = pstmt.executeUpdate();
			if (count > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	// 출납 내역 수정
	public boolean updatePayment(PayBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update paymentt set id=?, date=?, inorex=?, c_inco=?, c_expe=?, "
					+ "cash=?, card=?, bank=?, expe_list=?, inco=?, expe=?, balan=?, note=? where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getDate());
			pstmt.setString(3, bean.getInorex());
			pstmt.setString(4, bean.getC_inco());
			pstmt.setString(5, bean.getC_expe());
			pstmt.setString(6, bean.getCash());
			pstmt.setString(7, bean.getCard());
			pstmt.setString(8, bean.getBank());
			pstmt.setString(9, bean.getExpe_list());
			pstmt.setInt(10, bean.getInco());
			pstmt.setInt(11, bean.getExpe());
			pstmt.setInt(12, bean.getBalan());
			pstmt.setString(13, bean.getNote());
			pstmt.setInt(14, bean.getNum());
			int count = pstmt.executeUpdate();
			if (count > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	// 출납 정보 삭제
	public void deletePayment(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "delete from paymentt where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	
	//5. 명소
	//새 명소 입력
	public boolean insertSight(SightBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "insert sight (club, id, name, sight, place, note) values (?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getClub());
			pstmt.setString(2, bean.getId());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getSight());
			pstmt.setString(5, bean.getPlace());
			pstmt.setString(6, bean.getNote());

			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//명소 정보 가져오기
	public SightBean getsight(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		SightBean bean = null;
		try {
			con = pool.getConnection();
			String sql = "select * from sight where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				bean = new SightBean();
				bean.setNum(rs.getInt("num"));
				bean.setClub(rs.getString("club"));
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setSight(rs.getString("sight"));
				bean.setPlace(rs.getString("place"));
				bean.setNote(rs.getString("note"));
				bean.setS_code(rs.getString("s_code"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}
	
	//명소 정보 가져오기
	public SightBean getsight(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		SightBean bean = null;
		try {
			con = pool.getConnection();
			String sql = "select * from sight where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				bean = new SightBean();
				bean.setNum(rs.getInt("num"));
				bean.setClub(rs.getString("club"));
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setSight(rs.getString("sight"));
				bean.setPlace(rs.getString("place"));
				bean.setNote(rs.getString("note"));
				bean.setS_code(rs.getString("s_code"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}
	
	// 명소 카운트
	public int getTotalSight() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			sql = "select count(num) from sight";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
	// 명소 리스트 조회
	public Vector<SightBean> getSightList(String check, String keyWord, String keyField) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<SightBean> vlist = new Vector<SightBean>();
		try {
			con = pool.getConnection();
			if (check.equals("all")) {
				sql = "select * from sight order by num asc";
				pstmt = con.prepareStatement(sql);
			} else if (check.equals("search")) {
				sql = "select * from sight where "  + keyField + " like ? order by num asc";
			    pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				SightBean bean = new SightBean();
				bean.setNum(rs.getInt("num"));
				bean.setClub(rs.getString("club"));
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setSight(rs.getString("sight"));
				bean.setPlace(rs.getString("place"));
				bean.setNote(rs.getString("note"));
				bean.setS_code(rs.getString("s_code"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	// 명소 리스트 조회2
	public Vector<SightBean> getSight1() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<SightBean> vlist = new Vector<SightBean>();
		try {
			con = pool.getConnection();
			sql = "select * from sight";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				SightBean bean = new SightBean();
				bean.setNum(rs.getInt("num"));
				bean.setClub(rs.getString("club"));
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setSight(rs.getString("sight"));
				bean.setPlace(rs.getString("place"));
				bean.setNote(rs.getString("note"));
				bean.setS_code(rs.getString("s_code"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	// 명소 내역 수정
	public boolean updateSight(SightBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update sight set club=?, id=?, name=?, sight=?, place=?, note=? where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getClub());
			pstmt.setString(2, bean.getId());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getSight());
			pstmt.setString(5, bean.getPlace());
			pstmt.setString(6, bean.getNote());
			pstmt.setInt(7, bean.getNum());
			int count = pstmt.executeUpdate();
			if (count > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	// 출납 정보 삭제
	public void deleteSight(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "delete from sight where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	//5. 모임
	//새 모임 입력
	public boolean insertMeeting(MeetBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "insert meet (id, code, freq, s_code, date, place, note) values (?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getCode());
			pstmt.setString(3, bean.getFreq());
			pstmt.setString(4, bean.getS_code());
			pstmt.setString(5, bean.getDate());
			pstmt.setString(6, bean.getPlace());
			pstmt.setString(7, bean.getNote());

			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//모임 정보 가져오기
	public MeetBean getMeeting() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MeetBean bean = null;
		try {
			con = pool.getConnection();
			String sql = "select * from meet";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				bean = new MeetBean();
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setCode(rs.getString("code"));
				bean.setFreq(rs.getString("freq"));
				bean.setS_code(rs.getString("s_code"));
				bean.setDate(rs.getString("date"));
				bean.setPlace(rs.getString("place"));
				bean.setNote(rs.getString("note"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}
	
	//모임 정보 가져오기(num)
	public MeetBean getMeeting1(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MeetBean bean = null;
		try {
			con = pool.getConnection();
			String sql = "select * from meet where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = new MeetBean();
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setCode(rs.getString("code"));
				bean.setFreq(rs.getString("freq"));
				bean.setS_code(rs.getString("s_code"));
				bean.setDate(rs.getString("date"));
				bean.setPlace(rs.getString("place"));
				bean.setNote(rs.getString("note"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}
	
	//모임 자료에서 그룹명칭 가져오기
	public GrBean getMeet(String grnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		GrBean bean = null;
		try {
			con = pool.getConnection();
			String sql = "select * from groupp where grnum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, grnum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = new GrBean();
				bean.setNum(rs.getInt("num"));
				bean.setCode(rs.getString("code"));
				bean.setGrnum(rs.getString("grnum"));
				bean.setGrname(rs.getString("grname"));
				bean.setGrplace(rs.getString("grplace"));
				bean.setGradmid(rs.getString("gradmid"));
				bean.setGradmname(rs.getString("gradmname"));
				bean.setGradmtel(rs.getString("gradmtel"));	
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}

	//모임 자료에서 명소명칭 가져오기
	public SightBean getMeet1(String s_code) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		SightBean bean = null;
		try {
			con = pool.getConnection();
			String sql = "select * from sight where s_code = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, s_code);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = new SightBean();
				bean.setNum(rs.getInt("num"));
				bean.setClub(rs.getString("club"));
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setSight(rs.getString("sight"));
				bean.setPlace(rs.getString("place"));
				bean.setNote(rs.getString("note"));
				bean.setS_code(rs.getString("s_code"));
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}
	
	// 명소 카운트
	public int getTotalMeet() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			sql = "select count(num) from meet";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
	// 모임 리스트 조회
	public Vector<MeetBean> getMeet() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<MeetBean> vlist = new Vector<MeetBean>();
		try {
			con = pool.getConnection();
			sql = "select * from meet";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MeetBean bean = new MeetBean();
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setCode(rs.getString("code"));
				bean.setFreq(rs.getString("freq"));
				bean.setS_code(rs.getString("s_code"));
				bean.setDate(rs.getString("date"));
				bean.setPlace(rs.getString("place"));
				bean.setNote(rs.getString("note"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	// 명소 내역 수정
	public boolean updateMeet(MeetBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update meet set id=?, code=?, freq=?, s_code=?, date=?, place=?, note=? where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getCode());
			pstmt.setString(3, bean.getFreq());
			pstmt.setString(4, bean.getS_code());
			pstmt.setString(5, bean.getDate());
			pstmt.setString(6, bean.getPlace());
			pstmt.setString(7, bean.getNote());
			pstmt.setInt(8, bean.getNum());
			int count = pstmt.executeUpdate();
			if (count > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//6. 리스트
	// 참석자 명단 생성 
	public boolean InsertList(String grnum, String freq, String id, String name, String tel) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert list (grnum, freq, id, name, tel, parti) "
				+ "values (?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, grnum);
			pstmt.setString(2, freq);
			pstmt.setString(3, id);
			pstmt.setString(4, name);
			pstmt.setString(5, tel);
			pstmt.setString(6, "미참석");
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	// 참석자 명단 생성
	public boolean PartiList(String grnum, String freq, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from list where grnum=? and freq=? and id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, grnum);
			pstmt.setString(2, freq);
			pstmt.setString(3, id);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;		
	}
	
	// 참석자 내역 아이디 조건으로 조회
	public Vector<ListBean> getPartiList(String grnum, String freq) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ListBean> vlist = new Vector<ListBean>();
		try {
			con = pool.getConnection();
			sql = "select * from list where grnum=? and freq=? ";
		    pstmt = con.prepareStatement(sql);
			pstmt.setString(1, grnum);
			pstmt.setString(2, freq);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ListBean bean = new ListBean();
				bean.setNum(rs.getInt("num"));
				bean.setGrnum(rs.getString("grnum"));
				bean.setFreq(rs.getString("freq"));
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setTel(rs.getString("tel"));
				bean.setParti(rs.getString("parti"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//참석여부 수정
	public boolean updateParti(int num, String perm) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			if (perm.equals("미참석")) {
				String sql = "update list set parti='참석' where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
			} else {
				String sql = "update list set parti='미참석' where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
			}
			int count = pstmt.executeUpdate();
			if (count > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//7. 회비
	// 회비 납부 대상자 명단 생성 (존재여부) 
	public boolean DuesList(String grnum, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from dues where grnum = ? and id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, grnum);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}

	// 회비 납부 대상자 명단 생성
	public boolean DuessInsert(String grnum, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert dues(grnum, id) values (?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, grnum);
			pstmt.setString(2, id);

			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	// 회비 납부 내역 아이디 조건으로 조회
	public Vector<DueBean> getDuesList(String grnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<DueBean> vlist = new Vector<DueBean>();
		try {
			con = pool.getConnection();
			sql = "select * from dues where grnum=? ";
		    pstmt = con.prepareStatement(sql);
			pstmt.setString(1, grnum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				DueBean bean = new DueBean();
				bean.setNum(rs.getInt("num"));
				bean.setGrnum(rs.getString("grnum"));
				bean.setId(rs.getString("id"));
				bean.setDu01(rs.getInt("du01"));
				bean.setDu02(rs.getInt("du02"));
				bean.setDu03(rs.getInt("du03"));
				bean.setDu04(rs.getInt("du04"));
				bean.setDu05(rs.getInt("du05"));
				bean.setDutot(rs.getInt("dutot"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	// 회비 납부자 합계 금액 계산
	public boolean DuesUpdate(int num, int dutot) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			String sql = "update dues set dutot = ? where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dutot);
			pstmt.setInt(2, num);
			int count = pstmt.executeUpdate();
			if (count > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	// 회비 납부 내역 레코드 번호 조건으로 조회(수정 화면)
	public DueBean getDues(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DueBean bean = null;
		try {
			con = pool.getConnection();
			String sql = "select * from dues where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = new DueBean();
				bean.setNum(rs.getInt("num"));
				bean.setGrnum(rs.getString("grnum"));
				bean.setId(rs.getString("id"));
				bean.setDu01(rs.getInt("du01"));
				bean.setDu02(rs.getInt("du02"));
				bean.setDu03(rs.getInt("du03"));
				bean.setDu04(rs.getInt("du04"));
				bean.setDu05(rs.getInt("du05"));
				bean.setDutot(rs.getInt("dutot"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}
	
	// 회비 납부 내역  추가
	public boolean InsertDues(DueBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert dues(grnum, id, du01, du02, du03, "
				+ "du04, du05, dutot) values (?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getGrnum());
			pstmt.setString(2, bean.getId());
			pstmt.setInt(3, bean.getDu01());
			pstmt.setInt(4, bean.getDu02());
			pstmt.setInt(5, bean.getDu03());
			pstmt.setInt(6, bean.getDu04());
			pstmt.setInt(7, bean.getDu05());
			pstmt.setInt(8, bean.getDutot());
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	// 회비 납부 내역 수정
	public boolean updateDues(DueBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update dues set grnum=?, id=?, du01=?, du02=?, "
				+ "du03=?, du04=?, du05=?, dutot=? where num=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getGrnum());
			pstmt.setString(2, bean.getId());
			pstmt.setInt(3, bean.getDu01());
			pstmt.setInt(4, bean.getDu02());
			pstmt.setInt(5, bean.getDu03());
			pstmt.setInt(6, bean.getDu04());
			pstmt.setInt(7, bean.getDu05());
			pstmt.setInt(8, bean.getDutot());
			pstmt.setInt(9, bean.getNum());
			int count = pstmt.executeUpdate();
			if (count > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
}
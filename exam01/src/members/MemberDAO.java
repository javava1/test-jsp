package members;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "jsp", pwd="1234";
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	public MemberDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<MemberDTO> memberView() {
		String sql = "select * from members";
		ArrayList<MemberDTO> members = new ArrayList<MemberDTO>();
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				MemberDTO m = new MemberDTO();
				m.setId(rs.getString("id"));
				m.setPwd(rs.getString("pwd"));
				m.setName(rs.getString("name"));
				m.setRank(rs.getString("rank"));
				m.setDep(rs.getString("dep"));
				members.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return members;
	}
	public int userCheck(String id,String pwd){
		String sql = "select * from members where id=?";
		int chk=-1;
		try {
			con = DriverManager.getConnection(url,user,this.pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()){
				if(rs.getString("pwd").equals(pwd)){  chk = 0; }
				else{ chk = 1; }
			}else{ chk = -1; }
		} catch (SQLException e) {	e.printStackTrace(); }
		
		return chk;	
	}
	public MemberDTO memberView(String id){
		String sql = "select * from members where id=?";
		MemberDTO dto = new MemberDTO();
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, id); rs = ps.executeQuery();
			if(rs.next()){
				dto.setId(rs.getString(1));	dto.setPwd(rs.getString(2));
				dto.setName(rs.getString(3)); dto.setRank(rs.getString(4));
				dto.setDep(rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close(); if(ps != null) ps.close(); if(con != null) con.close();
			} catch (SQLException e) { }
		}
		return dto;
	}
	public int register(MemberDTO user){
		String sql = "insert into members values(?,?,?,?,?)";
		int howRow=0;
		PreparedStatement pstmt;
		try {
			con = DriverManager.getConnection(url,this.user,pwd);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getId());   pstmt.setString(2, user.getPwd());
			pstmt.setString(3, user.getName());  pstmt.setString(4, user.getRank());
			pstmt.setString(5, user.getDep());   howRow = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();  if(ps != null) ps.close();
				if(con != null) con.close();
			} catch (SQLException e) { }
		}
		return howRow;
	}

}


















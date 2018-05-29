package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import jdk.nashorn.internal.runtime.regexp.joni.constants.OPSize;

//오라클에 연결 -> select, insert,upate, delete 작업실행
public class MemberDAO {
	
	String id ="scott";
	String pass = "tiger";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
	
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	//1.오라클레 연결하는 메서드
	public void getCon() {
		
		try {
			//오라클 데이터베이스 사용 선언(오라클 드라이버 로드)
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//오라클 접속
			con = DriverManager.getConnection(url, id, pass);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}//end getCon()
		
	//2.오라클에 회원 한명을 insert하는 메서드
	
	public void insertMember(MemberBean mbean) {
		try {
		//오라클에 접속
			getCon();
		//쿼리 준비(PreparedStatment 개체 사용)
			String sql ="insert into MEMBER values (?,?,?,?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, mbean.getId());
			ps.setString(2, mbean.getPass1());
			ps.setString(3, mbean.getEmail());
			ps.setString(4, mbean.getTel());
			ps.setString(5, mbean.getHobby());
			ps.setString(6, mbean.getJob());
			ps.setString(7, mbean.getAge());
			ps.setString(8, mbean.getInfo());
			
			ps.executeUpdate();
			
			ps.close();
			con.close();
			
		}catch(Exception e) {
			e.getStackTrace();
		}
	}//end insertMember()
	
	public Vector<MemberBean> SelectAllMember() {
		
		Vector<MemberBean> vec = new Vector<MemberBean>();
		
		try {
				//오라클 접속
				getCon();
				
				//쿼리준비
				String sql = "select * from MEMBER";
				
				ps= con.prepareStatement(sql);
				
				//오라클에서 쿼리 실행 -> 실행결과를 리턴받아 ResultSet 객체에 저장
				//테이블(MEMBER) 검색 결과를 받아서 ResultSet객체에 저징
				//쿼리 실행
				rs = ps.executeQuery(sql);//select 시 사용하는 메서드
				
			//반복문을 이용하여 ResultSet객체에 저장된 건수 만큼 MemberBean객체를 생성 및 셋팅
				
				while(rs.next()) {
					MemberBean mbean = new MemberBean();
					mbean.setId(rs.getString(1));
					mbean.setPass1(rs.getString(2));
					mbean.setEmail(rs.getString(3));
					mbean.setTel(rs.getString(4));
					mbean.setHobby(rs.getString(5));
					mbean.setJob(rs.getString(6));
					mbean.setAge(rs.getString(7));
					mbean.setInfo(rs.getString(8));
					
					vec.add(mbean);
				}
				
				//자원반납
				ps.close();
				rs.close();
				con.close();
				
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vec;
	}
	



public MemberBean selectMember(String id) {
	
	MemberBean bean = new MemberBean();
	try {
	
		getCon();
		System.out.println(id);
		String sql = "select * from member where id=?";
		ps = con.prepareStatement(sql);
		
		ps.setString(1, id);//안됨.
		
		rs = ps.executeQuery();
	
		if(rs.next()) {
			
			bean.setId(rs.getString("id"));
			bean.setEmail(rs.getString("email"));
			bean.setTel(rs.getString("Tel"));
			bean.setHobby(rs.getString("hobby"));
			bean.setJob(rs.getString("Job"));
			bean.setAge(rs.getString("age"));
			bean.setInfo(rs.getString("info"));
		}
		
		rs.close();
		ps.close();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}

	return bean;
	}

//5.회원 한명의 비밀번호를 조회하여 리턴하는 메서드
	public String getPass(String id) {
		String pass="";
		try {
			getCon();
			String sql = "select pass1 from member where id=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			
			rs=ps.executeQuery();
			
			if(rs.next()) {
				pass=rs.getString(1);
			}
			
			ps.close();
			rs.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return pass;
	}
	
	//6. 테이블에 한명의 회원 정보를 업데이트하는 메서드
	public void UpdateMember(MemberBean bean) {
		
		try {
			getCon();
			
			String sql = "update member set email=?, tel=?, hobby=?, job=?, age=?, info=? where id=?";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, bean.getEmail());
			ps.setString(2, bean.getTel());
			ps.setString(3, bean.getHobby());
			ps.setString(4,  bean.getJob());
			ps.setString(5, bean.getAge());
			ps.setString(6, bean.getInfo());
			ps.setString(7, bean.getId());
			
			ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}//6.end

	//7.테이블에 한명의 회원 정보를 삭제하는 메서드
	public void deleteMember(String id) {
		
		try {
				getCon();
				String sql = "delete from member where id=?";
				ps = con.prepareStatement(sql);
				
				// ? 셋팅 (쿼리 구조 완성)
				ps.setString(1, id);
				
				ps.executeUpdate();
				
				ps.close();
				rs.close();
				con.close();
				
		}catch(Exception  e) {
			e.printStackTrace();
		}
	}
	
}

package hospital.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.JDBCTemplate;
import hospital.model.vo.Hospital;

public class HospitalDAO {
	
	//환자 이름 검색 > LIST 뜨기!
	public ArrayList<Hospital> searchHosList(Connection conn, String hpName){
		ArrayList<Hospital> hlist = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT DISTINCT HP_NAME, HP_NUMBER, HP_PHONE FROM HOSPITAL WHERE HP_NAME LIKE ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+hpName+"%");
			rset = pstmt.executeQuery();
			hlist = new ArrayList<Hospital>();
			while(rset.next()) {
				Hospital hospital = new Hospital();
				hospital.setHpName(rset.getString("HP_NAME"));
				hospital.setHpNumber(rset.getString("HP_NUMBER"));
				hospital.setHpPhone(rset.getString("HP_PHONE"));
				hlist.add(hospital);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return hlist;
	}
	
	//상세정보
	public ArrayList<Hospital> selectHospital(Connection conn, String hpNumber){
		ArrayList<Hospital> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT * FROM HOSPITAL WHERE HP_NUMBER = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, hpNumber);
			rset = pstmt.executeQuery();
			list = new ArrayList<Hospital>();
			while(rset.next()) {
				Hospital hospital = new Hospital();
				hospital.setHpNo(rset.getInt("HP_NO"));
				hospital.setHpName(rset.getString("HP_NAME"));
				hospital.setHpNumber(rset.getString("HP_NUMBER"));
				hospital.setHpPhone(rset.getString("HP_PHONE"));
				hospital.setHpAddr(rset.getString("HP_ADDR"));
				hospital.setHpDate(rset.getDate("HP_DATE"));
				hospital.setHpDis(rset.getString("HP_DIS"));
				hospital.setHpCheck(rset.getString("HP_CHECK"));
				hospital.setHpMedi(rset.getString("HP_MEDI"));
				list.add(hospital);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	
	//정보입력
	public int insertHospital(Connection conn, Hospital hospital) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "INSERT INTO HOSPITAL VALUES (SEQ_HP_CODE.NEXTVAL,?,?,?,?,SYSDATE,?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, hospital.getHpName());
			pstmt.setString(2, hospital.getHpNumber());
			pstmt.setNString(3, hospital.getHpPhone());
			pstmt.setNString(4, hospital.getHpAddr());
			pstmt.setNString(5, hospital.getHpDis());
			pstmt.setNString(6, hospital.getHpCheck());
			pstmt.setNString(7, hospital.getHpMedi());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}

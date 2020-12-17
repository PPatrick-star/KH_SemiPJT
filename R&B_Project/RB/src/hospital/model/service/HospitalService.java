package hospital.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import hospital.model.dao.HospitalDAO;
import hospital.model.vo.Hospital;

public class HospitalService {
	
	//멤버변수
	private JDBCTemplate factory;
	
	//생성자
	public HospitalService() {
		factory = JDBCTemplate.getConnection();
	}
	
	//환자이름찾기
	public ArrayList<Hospital> searchHosList(String hpName) {
		ArrayList<Hospital> hlist = null;
		try {
			Connection conn = factory.createConnection();
			hlist = new HospitalDAO().searchHosList(conn, hpName);
			JDBCTemplate.close(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return hlist;
	}
	
	//기존환자 입력
	public ArrayList<Hospital> selectHospital(String hpNumber) {
		//변수선언
		ArrayList<Hospital> list = null;
		try {
			Connection conn = factory.createConnection();
			list = new HospitalDAO().selectHospital(conn, hpNumber);
			JDBCTemplate.close(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//진료기록 입력
	public int insertHospital(Hospital hospital) {
		int result = 0;
		try {
			Connection conn = factory.createConnection();
			result = new HospitalDAO().insertHospital(conn, hospital);
			JDBCTemplate.close(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
}

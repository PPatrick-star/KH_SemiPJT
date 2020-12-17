package hospital.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hospital.model.service.HospitalService;
import hospital.model.vo.Hospital;

@WebServlet("/select")
public class selectHosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   public selectHosServlet() {
        super();
   }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 인코딩
		request.setCharacterEncoding("UTF-8");
		//SELECT
		//변수 저장
		String hpNumber = request.getParameter("hpNumber");
		//SELECT * FROM HOSPITAL WHERE HPNUMBER = ?;
		ArrayList<Hospital> list = new HospitalService().selectHospital(hpNumber);
		//DB에서 데이터 가져오면
		if(!list.isEmpty()) {
			//request에 객체저장
			request.setAttribute("list", list);
			request.getRequestDispatcher("/WEB-INF/views/hospital/HospitalMain.jsp").forward(request, response);
		} else {
			response.sendRedirect("");
		}
		
		//INSERT
		//객체저장
		Hospital hospital = new Hospital();
		hospital.setHpName(request.getParameter("hpName"));
		hospital.setHpNumber(request.getParameter("hpNumber"));
		hospital.setHpPhone(request.getParameter("hpPhone"));
		hospital.setHpAddr(request.getParameter("hpAddr"));
		hospital.setHpDis(request.getParameter("hpDis"));
		hospital.setHpCheck(request.getParameter("hpCheck"));
		hospital.setHpMedi(request.getParameter("hpMedi"));
		int result = new HospitalService().insertHospital(hospital);
		if(result > 0) {
			request.getRequestDispatcher("/WEB-INF/views/hospital/HospitalMain.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}







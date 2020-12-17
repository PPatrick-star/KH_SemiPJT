package hospital.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hospital.model.service.HospitalService;
import hospital.model.vo.Hospital;

@WebServlet("/insert")
public class insertHosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public insertHosServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//변수저장
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
		} else {
			response.sendRedirect("");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

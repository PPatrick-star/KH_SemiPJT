package hospital.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hospital.model.service.HospitalService;
import hospital.model.vo.Hospital;

@WebServlet("/search")
public class searchHosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public searchHosServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 인코딩
		request.setCharacterEncoding("UTF-8");
		//변수저장
		String hpName = request.getParameter("hpName");
		//사용자 이름으로 리스트 가져오기
		ArrayList<Hospital> hlist = new HospitalService().searchHosList(hpName);
		//null체크
		if(!hlist.isEmpty()) {
			request.setAttribute("hlist", hlist);
			request.getRequestDispatcher("/WEB-INF/views/hospital/HospitalMain.jsp").forward(request, response);
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter(); 
            writer.println("<script>alert('일치하는 환자가 없습니다.'); location.href='/main';</script>");
            writer.close();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

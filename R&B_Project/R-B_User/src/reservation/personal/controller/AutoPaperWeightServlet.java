package reservation.personal.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import reservation.personal.model.service.ReservationPersonalService;

/**
 * Servlet implementation class AutoPaperWeightServlet
 */
@WebServlet("/auto/paper/weight")
public class AutoPaperWeightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReservationPersonalService reservationService;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AutoPaperWeightServlet() {
		super();
		if ( reservationService == null) {
			reservationService = new ReservationPersonalService();
		}
		// TODO Auto-generated constructor stub
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		String numberfront = request.getParameter("numberfront");// 앞자리
		String numberback = request.getParameter("numberback"); // 뒷자리
		String number = numberfront + "-" + numberback;
		String name = request.getParameter("name");
		String onLine = request.getParameter("onLine");
		String reservation = request.getParameter("reservation");

		String disease = reservationService.autoDisease(name, number);
		//금지검사(검사) inspection
		String inspection = reservationService.autoInspection(name, number);
		//금지약물(약처방) drug
		String drug = reservationService.autoDrug(name, number);

		int totalResult = reservationService.autoTotalResult(disease, inspection, drug);

		//개인예약 (YY)
		//자가문진-헌혈의집(NN)
		//자가문진-온라인(YN)

		if(totalResult > 0) { // 자동문진에서 안됨
			if(reservation.equals("N") && onLine.equals("Y")) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script>alert('헌혈을 할 수 없습니다.');location.href='"+"/index.jsp"+"';</script>");
				writer.close();
			}
			else {
				//로그인 여부확인
				//이유는 로그인이 되어있을 때는 헌혈이 안될 경우 데이터를 저장해주기 위함.
				if(session.getAttribute("member") != null) { // 로그인이 되어있을 때
					String userId = ((Member)session.getAttribute("member")).getUserId();
					int result = reservationService.autoPaperInput(userId);
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter writer = response.getWriter();

					if(result > 0) {
						writer.println("<script>alert('헌혈을 할 수 없습니다.');location.href='"+"/index.jsp"+"';</script>");
						writer.close();
					}
					else { // 서버오류
						writer.println("<script>alert('헌혈을 할 수 없습니다.');location.href='"+"/index.jsp"+"';</script>");
						writer.close();
					}

				}
				else { // 로그인이 되어있지 않을때
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter writer = response.getWriter();
					writer.println("<script>alert('헌혈을 할 수 없습니다.');location.href='"+"/index.jsp"+"';</script>");
					writer.close();
				}

			}
		}

		else { // 자동문진에서 됌
			request.setAttribute("memberName", name);
			request.setAttribute("memberNum", number);
			request.setAttribute("onLine", onLine);
			request.setAttribute("reservation", reservation);
			request.getRequestDispatcher("/WEB-INF/views/reservation/personal/selfPaperWeight.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

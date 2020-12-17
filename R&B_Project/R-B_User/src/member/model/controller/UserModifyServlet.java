package member.model.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.UserService;
import member.model.vo.Member;

/**
 * Servlet implementation class ModifyServlet
 */
@WebServlet("/member/update")
public class UserModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserModifyServlet() {
        super();
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Member user = new Member();

		user.setUserId(request.getParameter("userId"));
		user.setUserPwd(request.getParameter("userPwd"));
		user.setUserName(request.getParameter("userName"));
		user.setUserBD(request.getParameter("BD"));
		user.setUserPhone(request.getParameter("phone"));
		user.setUserAddrPost(request.getParameter("postAddr"));
		user.setUserAddrRoad(request.getParameter("roadAddr"));
		user.setUserAddrDetail(request.getParameter("detailAddr"));
		user.setUserEmail(request.getParameter("email"));
		user.setUserGender(request.getParameter("gender"));
		user.setUserABO(request.getParameter("abo"));
		int result = new UserService().updateUser(user);
		if(result > 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter(); 
			writer.println("<script>alert('정보가 수정되었습니다.');location.href='/modify/form';</script>");
			writer.close();
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter(); 
			writer.println("<script>alert('항목을 전부 입력해주세요'); "
			+"location.href='/WEB-INF/views/login/usermodify.jsp';</script>"); writer.close();
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

package member.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.UserService;
import member.model.vo.Member;

/**
 * Servlet implementation class UserModifyForm
 */
@WebServlet("/modify/form")
public class UserModifyForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserModifyForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		if(session.getAttribute("member") != null ) {
			String userId = ((Member)session.getAttribute("member")).getUserId();
			Member member = new UserService().selectMemberList(userId);
			request.setAttribute("memberInfo", member);
			request.getRequestDispatcher("/WEB-INF/views/login/usermodify.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("/ResList").forward(request, response);
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

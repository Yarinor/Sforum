package Bean;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserHdao userHdao= new UserHdao();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(password);
		if(userHdao.isUsernameExists(username))
		{
			if(userHdao.getUserPassword(username).equals(password))
			{
				
				
				request.getRequestDispatcher("/Forum Page.jsp?un="+username).include(request, response);
			}
			else
			{
				request.setAttribute("LoginError","Invalid username or password");
				RequestDispatcher Em = request.getRequestDispatcher("/LoginForm.jsp");
				Em.forward(request,response);
			}
		}
		else
		{
			request.setAttribute("LoginError","Invalid username or password");
			RequestDispatcher Em = request.getRequestDispatcher("/LoginForm.jsp");
			Em.forward(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

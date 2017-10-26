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
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserHdao userHdao = new UserHdao();
		String username = request.getParameter("username");
		
		String password = request.getParameter("password");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		User user = new User(username,password,firstname,lastname);
       if(userHdao.isUsernameExists(username)){
    	   request.setAttribute("RegistrationError","Username is already taken.Please choose a diffrent one.");
			RequestDispatcher Em = request.getRequestDispatcher("/RegistrationForm.jsp");
			Em.forward(request,response);
		}
       else{
    	userHdao=new UserHdao();
		userHdao.save(user);
		request.getRequestDispatcher("/LoginForm.jsp").include(request, response);
       }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}

package yeohangout.servlet.dashboard.manager;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import yeohangout.javabeans.EmployeeJude;
import yeohangout.mysql.DBUtils;
import yeohangout.mysql.MySQLAccess;

/**
 * Servlet implementation class EditEmployeeServlet
 */
@WebServlet(name = "edit-employee", urlPatterns = { "/edit-employee" })
public class EditEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PreparedStatement ps;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditEmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		int SSN = Integer.parseInt(request.getParameter("SSN"));
		boolean isManager = Boolean.parseBoolean(request.getParameter("isManager"));
		double hourlyRate = Double.parseDouble(request.getParameter("hourlyRate"));
		String userName = request.getParameter("userName");
		String pwd = request.getParameter("pwd");
		//int keySSN = Integer.parseInt(request.getParameter("keySSN"));
		int keySSN = Integer.parseInt(request.getParameter("edited_ssn"));

		String errorMsg = null;
//		Date startDate = null;
//		java.sql.Date  sqlDate = null;
//		DateFormat format = new SimpleDateFormat("yyyy-mm-dd", Locale.ENGLISH);
		
		if (firstName == null || firstName.equals("")) {
			errorMsg = "Input Null";
		}
		if (lastName == null || lastName.equals("")) {
			errorMsg = "Input Null";
		}
		if (SSN == 0) {
			errorMsg = "Input 0";
		}
		if (userName == null || userName.equals("")) {
			errorMsg = "Input Null";
		}
		if (pwd == null || pwd.equals("")) {
			errorMsg = "Input Null";
		}
//		try {
//			startDate = (Date) format.parse(request.getParameter("startDate"));
//			sqlDate = new java.sql.Date(startDate.getTime());
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		if (errorMsg != null){
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.html");
			PrintWriter out= response.getWriter();
			out.println("<font color=red>"+errorMsg+"</font>");
			rd.include(request, response);
		}
		else {
			// This will load the MySQL driver, each DB has its own driver
			try {
				MySQLAccess dao = new MySQLAccess();
				dao.readDataBase();
				Connection connect = null;
				connect = dao.getConnection();
				//try {
				// Execute SQL query
				EmployeeJude updatedEmployee = new EmployeeJude();
				
				updatedEmployee.setSSN(SSN);
				updatedEmployee.setHourlyRate(hourlyRate);
				updatedEmployee.setManager(isManager);
				//updatedEmployee.setStartDate(startDate);
				updatedEmployee.setUserName(userName);
				updatedEmployee.setPwd(pwd);
				
				//UpdateEmp
				DBUtils.updateEmployee(connect, updatedEmployee, keySSN);
				
				updatedEmployee = DBUtils.searchEmployeeBySSN(connect, SSN);
				updatedEmployee.setFirstName(firstName);
				updatedEmployee.setLastName(lastName);
				
				DBUtils.updatePerson(connect, updatedEmployee.getFirstName(), updatedEmployee.getLastName(), updatedEmployee.getId());
				// Insert new employee info to BackUp Database 
				
				PrintWriter out= response.getWriter();
				out.println("Add successful, please check table.");
				
				response.sendRedirect("view-employee");
				
				connect.close();
//				} finally {
//					try {
//						ps.close();
//					} catch (SQLException e) {
//						PrintWriter out= response.getWriter();
//						out.println("SQLException in closing PreparedStatement or ResultSet");
//					}
//				}

//				try {
//					// Execute SQL query
//					ps = connect.prepareStatement("INSERT into Employee(Id, SSN, IsManager, StartDate, "
//							+ "HourlyRate, UserName, Pwd)"
//							+ "values(?, ?, ?, now(), ?, ?, ?)");
//					ps.setInt(1, 6);
//					ps.setInt(2, SSN);
//					ps.setBoolean(3, isManager);
//					ps.setDouble(4, hourlyRate);
//					ps.setString(5, userName);
//					ps.setString(6, pwd);
//					ps.execute();
//
//					PrintWriter out= response.getWriter();
//					out.println("Add successful, please check table.");
//					
////					String contextPath = request.getContextPath();
////					response.sendRedirect(contextPath + "/dashboard-manager/dashboard-manager-overview.jsp");
//					response.sendRedirect("view-employee");
//					
//					connect.close();
//				} finally {
//					try {
//						ps.close();
//					} catch (SQLException e) {
//						PrintWriter out= response.getWriter();
//						out.println("SQLException in closing PreparedStatement or ResultSet");
//					}
//				}

			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		 
	}

}

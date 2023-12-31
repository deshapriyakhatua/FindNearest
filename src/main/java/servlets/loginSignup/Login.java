package servlets.loginSignup;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.UUID;

import databaseConnector.DatabaseConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Login extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("-->>> Servlet: login servlet started running...");
		
		HttpSession session = req.getSession();

		String email = req.getParameter("email");
		String password = req.getParameter("password");

		System.out.println("input email: " + email + " input password: " + password);

		if (email == null || password == null) {
			System.out.println("email/password is null ");
			System.out.println("<<<-- Servlet: Login servlet redirected...");
			session.setAttribute("login_status", "Failed: Empty input fields");
			resp.sendRedirect("login.jsp");
			return;
		}
		// connecting to Database

		try {

			// connecting to database

			Connection con = DatabaseConnect.getConnection();

			if (con.isClosed()) {
				System.out.println(" DB connection closed logIn");
			} else {
				System.out.println(" DB connection created logIn");
			}

			// Accessing Data from users table
			PreparedStatement stmt = con
					.prepareStatement("select useruid, email, password from users where email = ? and password = ?");
			stmt.setString(1, email);
			stmt.setString(2, password);
			ResultSet set = stmt.executeQuery();

			if (set.next()) {

				System.out.println("DBemail: " + set.getString(2) + " DBpassword: " + set.getString(3));
				System.out.println("user is registered");
				System.out.println("updating/inserting access token to database");

				String loginToken = UUID.randomUUID().toString();
				String userid = set.getString(1);
				Timestamp currTime = new Timestamp(System.currentTimeMillis());

				// Inserting Data to login_token table
				PreparedStatement ptst = con
						.prepareStatement("replace into login_token(tokenid, useruid, validity) values(?,?,?)");

				ptst.setString(1, loginToken);
				ptst.setString(2, userid);
				ptst.setTimestamp(3, currTime);
				ptst.executeUpdate();

				System.out.println("updated/inserted access token to database");

				Cookie cookie1 = new Cookie("loginToken", loginToken);
				cookie1.setMaxAge(24 * 60 * 60);
				resp.addCookie(cookie1);
				Cookie cookie2 = new Cookie("userid", userid);
				cookie2.setMaxAge(24 * 60 * 60);
				resp.addCookie(cookie2);

				con.close();
				System.out.println("<<<-- Servlet: Login servlet redirected...");
				resp.sendRedirect("index.jsp");
				return;

			}else {
				System.out.println("<<<-- Servlet: Login servlet redirected...");
				session.setAttribute("login_status", "Failed: Wrong credintials");
				resp.sendRedirect("login.jsp");
			}

			con.close();

			

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("<<<-- Servlet: Login servlet redirected...");
			session.setAttribute("login_status", "Failed: Error ocurs try again");
			resp.sendRedirect("login.jsp");

		}

	}

}

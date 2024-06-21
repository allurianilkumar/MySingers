package com.mysingers.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysingers.db.DatabaseObj;

public class CreateEventCoOrdinator extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = -8761216343499782231L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        PrintWriter out=response.getWriter();
        
        String event_co_name=request.getParameter("event_co_name");
        System.out.println("event_co_name is "+event_co_name);
        
        String event_co_mobile=request.getParameter("event_co_mobile");
        System.out.println("event_co_mobile is "+event_co_mobile);
        
        String event_co_email=request.getParameter("event_co_email");
        System.out.println("event_co_email is "+event_co_email);
        
        String event_co_password=request.getParameter("event_co_password");
        System.out.println("event_co_password is "+event_co_password);
        
        String event_co_gender=request.getParameter("event_co_gender");
        System.out.println("event_co_gender is "+event_co_gender);
        
        String event_co_dob=request.getParameter("event_co_dob");
        System.out.println("event_co_dob is "+event_co_dob);
        
        String event_co_address=request.getParameter("event_co_address");
        System.out.println("event_co_address is "+event_co_address);
        try{
        	if(event_co_name != null && event_co_mobile != null && event_co_email != null && event_co_password!= null && event_co_gender != null && event_co_dob != null && event_co_address != null){
        	    Statement st=DatabaseObj.getConnect().createStatement();
                ResultSet rs=st.executeQuery("SELECT `A_NAME`, `A_MOBILE`, `A_EMAIL`, `A_PASSWORD`, `A_GENDER`, `A_DOB`, `A_ADDRESS`, `A_TYPE` FROM `admin` WHERE `A_EMAIL`='"+event_co_email+"'");
                if(rs.next()){
                    out.println("<script type='text/javascript'>"); 
                    out.println("alert('Event Co-Ordinator Already Registered')"); 
                    out.println("window.location= 'admin.jsp'");
                    out.println("</script>");    
                }else{
    	        	PreparedStatement pst=DatabaseObj.getConnect().prepareStatement("insert into admin(A_NAME, A_MOBILE, A_EMAIL, A_PASSWORD, A_GENDER, A_DOB, A_ADDRESS, A_TYPE) values(?,?,?,?,?,?,?,?)");
    	            pst.setString(1,event_co_name);
    	            pst.setString(2,event_co_mobile);
    	            pst.setString(3,event_co_email);
    	            pst.setString(4,event_co_password);
    	            pst.setString(5,event_co_gender);
    	            pst.setString(6,event_co_dob);
    	            pst.setString(7,event_co_address);
    	            pst.setString(8,"Co-Ordinator");
    	            pst.executeUpdate();
    		        out.println("<script type='text/javascript'>"); 
    		        out.println("alert('Event Co-Ordinator Created Successfully')"); 
    		        out.println("window.location= 'admin.jsp'");
    		        out.println("</script>");   
                }
        	}
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}

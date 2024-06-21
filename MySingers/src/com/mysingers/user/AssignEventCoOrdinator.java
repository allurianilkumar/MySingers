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

public class AssignEventCoOrdinator extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        PrintWriter out=response.getWriter();
        
        String adminID=request.getParameter("co_ordinator_name");
        int coOrdinatorNameID=Integer.parseInt(adminID); 
        System.out.println("co_ordinator_name is "+coOrdinatorNameID);

        String eventId=request.getParameter("co_event_name");
        int coEventNameID=Integer.parseInt(eventId); 
        System.out.println("co_event_name is "+coEventNameID);
        
        try{
            Statement st=DatabaseObj.getConnect().createStatement();
            ResultSet rs=st.executeQuery("SELECT `EC_ADMIN_ID`, `EC_EVENT_ID` FROM `eventcoordinator` WHERE `EC_ADMIN_ID`="+coOrdinatorNameID+" AND `EC_EVENT_ID`="+coEventNameID);
            if(rs.next()){
                out.println("<script type='text/javascript'>"); 
                out.println("alert('Already Assigned to Some Event')"); 
                out.println("window.location= 'admin.jsp'");
                out.println("</script>");    
            }else{
	        	PreparedStatement pst=DatabaseObj.getConnect().prepareStatement("insert into eventcoordinator(EC_ADMIN_ID, EC_EVENT_ID) values(?,?)");
	            pst.setInt(1,coOrdinatorNameID);
	            pst.setInt(2,coEventNameID);
	            pst.executeUpdate();
		        out.println("<script type='text/javascript'>"); 
		        out.println("alert('Successfully Assigned the Registered')"); 
		        out.println("window.location= 'admin.jsp'");
		        out.println("</script>");   
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}

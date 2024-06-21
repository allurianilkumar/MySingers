package com.mysingers.user;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysingers.db.DatabaseObj;

public class CreateEvent extends HttpServlet {

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
        
        String event_name=request.getParameter("event_name");
        System.out.println("event_name is "+event_name);
        
        String event_info=request.getParameter("event_info");
        System.out.println("event_info is "+event_info);
        
        String event_start_date=request.getParameter("event_start_date");
        System.out.println("event_start_date is "+event_start_date);
        
        String event_end_date=request.getParameter("event_end_date");
        System.out.println("user mobile is "+event_end_date);
        
        String event_mobile=request.getParameter("event_mobile");
        System.out.println("event_mobile is "+event_mobile);
        
        String event_email=request.getParameter("event_email");
        System.out.println("event_email is "+event_email);
        
        try{
        	if(event_name != null && event_info != null && event_start_date != null && event_end_date!= null && event_mobile!=null && event_email!=null){
        	    Statement st=DatabaseObj.getConnect().createStatement();
                ResultSet rs=st.executeQuery("SELECT `E_NAME`, `E_INFO`, `E_START_DATE`, `E_END_DATE`, `E_MOBILE`, `E_EMAIL` FROM `events` WHERE `E_NAME`='"+event_name+"'");
                if(rs.next()){
                    out.println("<script type='text/javascript'>"); 
                    out.println("alert('Event Already Registered')"); 
                    out.println("window.location= 'admin.jsp'");
                    out.println("</script>");    
                }else{
    	        	PreparedStatement pst=DatabaseObj.getConnect().prepareStatement("insert into events(E_USER_ID, E_NAME, E_INFO, E_START_DATE, E_END_DATE, E_MOBILE, E_EMAIL) values(?,?,?,?,?,?,?)");
    	        	int ID=1;
    	        	pst.setInt(1,ID);
    	        	pst.setString(2,event_name);
    	            pst.setString(3,event_info);
    	            pst.setString(4,event_start_date);
    	            pst.setString(5,event_end_date);
    	            pst.setString(6,event_mobile);
    	            pst.setString(7,event_email);
    	            pst.executeUpdate();
    		        out.println("<script type='text/javascript'>"); 
    		        out.println("alert('Event Created Successfully')"); 
    		        out.println("window.location= 'admin.jsp'");
    		        out.println("</script>");   
                }
        	}
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}

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

public class Register extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        PrintWriter out=response.getWriter();
        
        String user_name=request.getParameter("user_name");
        System.out.println("user name is "+user_name);

        String user_email=request.getParameter("user_email");
        System.out.println("user email is "+user_email);
        
        String mobile=request.getParameter("mobile");
        System.out.println("user mobile is "+mobile);
        
        String password=request.getParameter("password");
        System.out.println("user password is "+password);
        String user_type=request.getParameter("user_type");
        System.out.println("user_type is "+user_type);
        if(user_name!=null && user_email!=null && mobile!= null && password!=null && user_type!=null){
        	try{
                Statement st=DatabaseObj.getConnect().createStatement();
                ResultSet rs=st.executeQuery("SELECT * FROM `user` where `U_EMAIL`='"+user_email+"'");
                if(rs.next()){
                    out.println("<script type='text/javascript'>"); 
                    out.println("alert('Student Already Registered')"); 
                    out.println("window.location= 'login.jsp'");
                    out.println("</script>");    
                }else{
    	        	PreparedStatement pst=DatabaseObj.getConnect().prepareStatement("insert into user(U_NAME, U_EMAIL, U_MOBILE, U_PASSWORD, U_TYPE) values(?,?,?,?,?)");
    	            pst.setString(1,user_name);
    	            pst.setString(2,user_email);
    	            pst.setString(3,mobile);
    	            pst.setString(4,password);
    	            pst.setString(5,user_type);
    	            pst.executeUpdate();
    		        out.println("<script type='text/javascript'>"); 
    		        out.println("alert('Successfully Registered')"); 
    		        out.println("window.location= 'login.jsp'");
    		        out.println("</script>");   
                }
            }catch(Exception e){
                e.printStackTrace();
            }
        }else{
        	System.out.println("Not getting the values from the form");
        	out.println("<script type='text/javascript'>"); 
	        out.println("alert('Please Retry Again!!!')"); 
	        out.println("window.location= 'login.jsp'");
	        out.println("</script>");
        }
    }
}

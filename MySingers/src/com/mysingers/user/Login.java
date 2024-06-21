package com.mysingers.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysingers.db.DatabaseObj;

public class Login extends HttpServlet {


	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //getting current date and time using Date class
    	System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
        DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
        Date dateobj = new Date();
        String myDate=df.format(dateobj);
        System.out.println("Today Year:"+myDate);
/*        String[] date=df.format(dateobj).toString().split("-");
        String todayDay=date[0];
        String todayMonth=date[1];
        String todayYear=date[2];*/
        System.out.println(df.format(dateobj));
        try{
        	Statement stmtEvent=DatabaseObj.getConnect().createStatement();
            ResultSet rsEvent=stmtEvent.executeQuery("select * from events where E_END_DATE='"+myDate+"'");
            while(rsEvent.next()){
            	int eventID=rsEvent.getInt(1);
            	String endDate=rsEvent.getString("E_END_DATE");
                System.out.println("the end date is "+endDate);
                String[] data=endDate.split("-");
                System.out.println("Today Date:"+data[0]);
                System.out.println("Today Month:"+data[1]);
                System.out.println("Today Year:"+data[2]);
                	Statement stmtSongs=DatabaseObj.getConnect().createStatement();
                	ResultSet rsMaxLikes=stmtSongs.executeQuery("SELECT MAX(S_LIKES), S_USER_ID, S_EVENT_ID FROM songs WHERE S_EVENT_ID="+eventID);
                	if(rsMaxLikes.next()) {
                		int maxLikes = rsMaxLikes.getInt(1);
                		int maxUserID=rsMaxLikes.getInt(2);
                		int maxEventID=rsMaxLikes.getInt(3);
                		System.out.println("Max likes are "+maxLikes);
                		System.out.println("Max likes User ID "+maxUserID);
                		System.out.println("Max likes Event ID "+maxEventID);
                		if(maxLikes != 0 && maxUserID != 0 && maxEventID != 0){
                    	    Statement st=DatabaseObj.getConnect().createStatement();
                            ResultSet rs=st.executeQuery("SELECT `W_ID`, `W_USER_ID`, `W_EVENT_ID` FROM `winner` WHERE `W_EVENT_ID`="+maxEventID+"");
                            if(rs.next()){
                            	System.out.println("Allready Available");
                            }else{
                	        	PreparedStatement pst=DatabaseObj.getConnect().prepareStatement("insert into winner(W_USER_ID,W_EVENT_ID) values(?,?)");
                	        	pst.setInt(1,maxUserID);
                	            pst.setInt(2,maxEventID);
                	            pst.executeUpdate();
                	            System.out.println("Updated Successfully");
                            }
                    	}
                	}
            }
            rsEvent.close();
            stmtEvent.close();
            
        }catch(Exception e){
        	e.printStackTrace();
        }
        System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
        PrintWriter out=response.getWriter();
        HttpSession session=request.getSession();
        String email=request.getParameter("email");
        System.out.println("the email is "+email);
        String pwd=request.getParameter("password");
        System.out.println("the pwd is "+pwd);
        String a="admin";
        try{
            //String userType="Singer";
            Statement st=DatabaseObj.getConnect().createStatement();
            ResultSet rs=st.executeQuery("select * from user where U_EMAIL='"+email+"' and U_PASSWORD='"+pwd+"'");
            boolean test =rs.next();
            if(test){
	            System.out.println("the rs is "+test);
	            String user_ID = rs.getString(1);
	            session.setAttribute("User_ID", user_ID);
	            System.out.println("the User ID is "+user_ID);
	            
	            String user_Name=rs.getString(2);
	            session.setAttribute("User_Name",user_Name);
	            String userType=rs.getString(9);
	            session.setAttribute("UserType",userType);
	            System.out.println("the User  type is "+userType);
	                        	
                if(userType.equals("Singer")){
	                out.println("<script type='text/javascript'>"); 
	                out.println("alert('User Successfully Logged In')"); 
	                out.println("window.location= 'index.jsp'");
	                out.println("</script>");
                }else{
		            if(userType.equals("Admin")){
		                out.println("<script type='text/javascript'>"); 
		                out.println("alert('Admin Has Successfully Logged In')"); 
		                out.println("window.location= 'admin.jsp'");
		                out.println("</script>");
		            }else{
		            	if(userType.equals("User")){
		            		out.println("<script type='text/javascript'>"); 
			                out.println("alert('User Successfully Logged In')"); 
			                out.println("window.location= 'index.jsp'");
			                out.println("</script>");
		            	}else{
		            		out.println("<script type='text/javascript'>"); 
		                    out.println("alert('Please Check Your Student ID and Password')"); 
		                    out.println("window.location= 'login.jsp'");
		                    out.println("</script>");
		            	}
	                    
		            }
                }
            }
            rs.close();
            st.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}

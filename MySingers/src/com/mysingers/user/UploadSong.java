package com.mysingers.user;

import com.mysingers.db.DatabaseObj;
import com.oreilly.servlet.MultipartRequest;

import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UploadSong extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        HttpSession session=request.getSession();
        String filedata=null;
        String filename=null;
        String paramname=null;
        ArrayList list=new ArrayList();
        java.util.Date now = new java.util.Date();
        String DATE_FORMAT1 = "yyyy-MM-dd";
        SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
        String str = sdf1.format(now);
        String s="UNCHANGED";
        String eventName=null,songName=null;
        String line=null;
        //int admin_id=1;
        FileInputStream fis=null;
        MultipartRequest multi = new MultipartRequest(request, getServletContext().getRealPath("/")+"//file",	10 * 1024 * 1024); // 10MB
        Enumeration params = multi.getParameterNames();
			while (params.hasMoreElements()) 
			{
				paramname = (String) params.nextElement();
				System.out.println("the param values are "+paramname);
				if(paramname.equalsIgnoreCase("event_name")){
					eventName=multi.getParameter(paramname);
				}
				
			}
				int f = 0;
	Enumeration files = multi.getFileNames();	
	while (files.hasMoreElements()) 
	{
		paramname = (String) files.nextElement();
		System.out.println("the files name is "+paramname);
		if(paramname != null)
		{
			f = 1;
			filename = multi.getFilesystemName(paramname);
			songName=filename;
			String fPath = getServletContext().getRealPath("/")+"/file/"+filename;
			System.out.println("the file path is "+fPath);
			File file1 = new File(fPath);
			 fis = new FileInputStream(file1);
			list.add(fis);
		}		
	}
	FileInputStream fs1 = null;		
	String userID=(String)session.getAttribute("User_ID");
	//admin_id="1";
    if(userID !=null && eventName!=null && songName!=null){
    	try
        {
            Statement st=DatabaseObj.getConnect().createStatement();
            ResultSet rs=st.executeQuery("select * from songs where S_USER_ID="+userID+" AND S_EVENT_ID="+eventName+"");
            if(rs.next())
            {
            	PreparedStatement pst=DatabaseObj.getConnect().prepareStatement("update songs set S_NAME='"+filename+"' where S_USER_ID="+userID+" AND S_EVENT_ID="+eventName+"");
                pst.executeUpdate();
                out.println("<script type='text/javascript'>"); 
                out.println("alert('Successfully Uploaded')"); 
                out.println("window.location='songs.jsp'");
                out.println("</script>");
            }else{
	        	PreparedStatement pst=DatabaseObj.getConnect().prepareStatement("insert into songs(S_USER_ID, S_EVENT_ID, S_NAME, S_LIKES) values(?,?,?,?)");
	        	pst.setString(1,userID);
	            pst.setString(2,eventName);
	            pst.setString(3,songName);
	            pst.setInt(4,0);
	            pst.executeUpdate();
		        out.println("<script type='text/javascript'>"); 
		        out.println("alert('Song Uploaded Successfully')"); 
		        out.println("window.location= 'songs.jsp'");
		        out.println("</script>"); 
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }else{
        out.println("<script type='text/javascript'>"); 
        out.println("alert('Error!!!')"); 
        out.println("window.location='songs.jsp'");
        out.println("</script>");
    }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

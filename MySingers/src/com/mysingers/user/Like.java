package com.mysingers.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysingers.db.DatabaseObj;

public class Like extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        String order=request.getQueryString();
        HttpSession session=request.getSession();
        PrintWriter out=response.getWriter();
        String songID=null,songUserID=null,songEventID=null;
        StringTokenizer str=new StringTokenizer(order,",");
        while(str.hasMoreElements()){
        	songID=str.nextToken();
        	songUserID=str.nextToken();
        	songEventID=str.nextToken();
        }
        int likes=0;
        System.out.println("the songID is "+songID);
        System.out.println("the songUserID is "+songUserID);
        System.out.println("the songEventID is "+songEventID);
        if(songID !=null && songUserID!=null && songEventID!=null){
        	try
            {
                Statement st=DatabaseObj.getConnect().createStatement();
                ResultSet rs=st.executeQuery("select * from songs where S_ID="+songID+"");
                while(rs.next())
                {
                    likes=rs.getInt(5);
                }
                int uLikes=likes+1;
                System.out.println("Updated total like value is "+uLikes);
                PreparedStatement pst=DatabaseObj.getConnect().prepareStatement("update songs set S_LIKES="+uLikes+" where S_ID="+songID+" AND S_USER_ID="+songUserID+" AND S_EVENT_ID="+songEventID+"");
                pst.executeUpdate();
                out.println("<script type='text/javascript'>"); 
                //out.println("alert('Success')"); 
                out.println("window.location='songs.jsp'");
                out.println("</script>");
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }else{
            out.println("<script type='text/javascript'>"); 
            out.println("alert('Error!!!')"); 
            out.println("window.location='songs.jsp'");
            out.println("</script>");
        }
        /*try
        {
            Statement stmt=com.bawcom.db.DB.getConnect().createStatement();
            ResultSet rs=stmt.executeQuery("select i_quantity from categories where i_name='"+i_name+"'");
            if(rs.next())
            {
                int k=Integer.parseInt(rs.getString(1));
                System.out.println("k="+k);
                int j=k-Integer.parseInt(i_quantity);
                if(j<0)
                {
                    out.println("<script type='text/javascript'>"); 
                    out.println("alert('Sorry Items are Sold Out')"); 
                    out.println("window.location= 'HomePage.jsp'");
                    out.println("</script>");
                }
                else
                {
                    PreparedStatement pst=com.bawcom.db.DB.getConnect().prepareStatement("update categories set i_quantity='"+j+"' where i_name='"+i_name+"'");
                    pst.executeUpdate();
                    PreparedStatement st=com.bawcom.db.DB.getConnect().prepareStatement("insert into orderdetails(order_id,std_id,i_pic,i_type,i_name,i_price,i_quantity,timeanddate,confirmtime,status,item_status) values(?,?,?,?,?,?,?,?,?,?,?)");
                    st.setInt(1,od);
                    st.setString(2, student_id);
                    st.setString(3, i_pic);
                    st.setString(4, i_type);
                    st.setString(5, i_name);
                    st.setString(6, i_price);
                    st.setString(7, i_quantity);
                    st.setString(8,d.toString());
                    st.setString(9,"Not Ready");
                    st.setString(10,"Pending");
                    st.setString(11,"Que");
                    st.executeUpdate();
                    out.println("<script type='text/javascript'>"); 
                    out.println("alert('Order is successfully added to Cart')"); 
                    out.println("window.location= 'HomePage.jsp'");
                    out.println("</script>");
                }
            } 
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }*/
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
}

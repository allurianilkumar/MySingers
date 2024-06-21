package com.mysingers.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class DatabaseObj {
public static Connection con;
    
    public static Connection getConnect()
    {
        try
        {
           Class.forName("com.mysql.jdbc.Driver");
           con=DriverManager.getConnection("jdbc:mysql://localhost/my_singers","root","password");
           /*getting current date time using calendar class 
           * An Alternative of above*/
           //Calendar calobj = Calendar.getInstance();
           //System.out.println(df.format(calobj.getTime()));
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
}

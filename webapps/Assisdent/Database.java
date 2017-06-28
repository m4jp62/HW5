package com.database;
import java.sql.*;
public class Database{
  private Connection con = null;
  private Statement stmt = null;
  private ResultSet rs = null;
  private String ip = "";
  private String port = "";
  private String url = "";
  private String db = "";
  private String user = "";
  private String password = "";
  private String driver = "com.mysql.jdbc.Driver";

  public Database(){

  }
  public void connectDB(){
    try{
      url = "jdbc:mysql://" + ip + ":" + port + "/" + db + "?useUnicode=true&characterEncoding=utf-8";
      Class.forName(driver);
      con = DriverManager.getConnection(url,user,password);
      stmt = con.createStatement();
    }catch(Exception ex){
      System.out.println(ex);
    }
  }
  public void closeDB(){
    try{
      con.close();
      stmt.close();
    }catch(Exception ex){
      System.out.println(ex);
    }
  }
  public void query(String sql){
    try{
      rs = stmt.executeQuery(sql);
    }catch(Exception ex){
      System.out.println(ex);
    }
  }

  public void insertData(String username,String password,String name,String phone,String email){
    try{
      String sql = "insert into student(username,password,name,phone,email) value(?,?,?,?,?)";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1,username);
      ps.setString(2,password);
      ps.setString(3,name);
      ps.setString(4,phone);
      ps.setString(5,email);
      int a = ps.executeUpdate();
    }catch(Exception ex){
      System.out.println(ex);
    }
  }

  public void addCourse(String s_id,String time,String credit,String name,String classroom,String teacher,String color){
    try{
      String sql = "insert into course(s_id,time,credit,name,classroom,teacher,color) value(?,?,?,?,?,?,?)";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1,s_id);
      ps.setString(2,time);
      ps.setString(3,credit);
      ps.setString(4,name);
      ps.setString(5,classroom);
      ps.setString(6,teacher);
      ps.setString(7,color);
      int a = ps.executeUpdate();
    }catch(Exception ex){
      System.out.println(ex);
    }
  }

  public void addEvent(String s_id,String title,String start,String stime,String end,String etime,String color){
    try{
      String sql = "insert into event(s_id,title,start,stime,end,etime,color) value(?,?,?,?,?,?,?)";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1,s_id);
      ps.setString(2,title);
      ps.setString(3,start);
      ps.setString(4,stime);
      ps.setString(5,end);
      ps.setString(6,etime);
      ps.setString(7,color);
      int a = ps.executeUpdate();
    }catch(Exception ex){
      System.out.println(ex);
    }
  }

  public void delCourse(String c_id){
    try{
      String sql = "delete from course where c_id = '"+ c_id +"'";
      int a = stmt.executeUpdate(sql);
    }catch(Exception ex){
      System.out.println(ex);
    }
  }

  public void delEvent(String e_id){
    try{
      String sql = "delete from event where e_id = '"+ e_id +"'";
      int a = stmt.executeUpdate(sql);
    }catch(Exception ex){
      System.out.println(ex);
    }
  }

  public void editCourse(String c_id,String time,String credit,String name,String classroom,String teacher,String color){
    try{
      String sql = "update course set time = '"+ time + "',credit ='" + credit + "',name ='" + name + "',classroom ='" + classroom +"',teacher ='" + teacher +"',color ='" + color +"' where c_id = '" + c_id + "'";
      int a = stmt.executeUpdate(sql);
    }catch(Exception ex){
      System.out.println(ex);
    }
  }

  public void editEvent(String e_id,String start,String stime,String end,String etime){
    try{
      String sql = "update event set start = '"+ start + "',stime ='" + stime + "',end ='" + end + "',etime ='" + etime + "' where e_id = '" + e_id + "'";
      int a = stmt.executeUpdate(sql);
    }catch(Exception ex){
      System.out.println(ex);
    }
  }

  public void editEvent(String e_id,String start,String stime,String end,String etime,String color){
    try{
      String sql = "update event set start = '"+ start + "',stime ='" + stime + "',end ='" + end + "',etime ='" + etime + "',color = '" + color +"' where e_id = '" + e_id + "'";
      int a = stmt.executeUpdate(sql);
    }catch(Exception ex){
      System.out.println(ex);
    }
  }

  public void editProfile(String s_id,String password,String name,String phone,String email){
    try{
      String sql = "update student set password = '"+ password + "', name = '" + name + "',  phone = '" + phone + "' , email = '" + email + "' where s_id = '" + s_id + "'";
      int a = stmt.executeUpdate(sql);
    }catch(Exception ex){
      System.out.println(ex);
    }
  }

  public Connection getCon(){
    return con;
  }
  public ResultSet getRS(){
    return rs;
  }
  public void setIp(String ip){
    this.ip = ip;
  }
  public void setPort(String port){
    this.port = port;
  }
  public void setUrl(String ip,String port){
    this.url = "jdbc:mysql://" + ip + ":" + port + "/";
  }
  public void setDb(String dbName){
    this.db = dbName;
  }
  public void setUser(String username){
    this.user = username;
  }
  public void setPassword(String password){
    this.password = password;
  }
  public void setDriver(String driver){
    this.driver = driver;
  }
}

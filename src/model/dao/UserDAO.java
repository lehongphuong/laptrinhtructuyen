package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.User;



public class UserDAO 
{
	Connection con = null;

	public UserDAO() {
		super();
		this.con = DBConnect.getConnect();
	}

	/*
	 *get all User
	 */
	public ArrayList<User> getAllUser() {
		ArrayList<User> list = new ArrayList<>();
		String sql = "select * from User";
		try {
			
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				User l = new User();
				l.setUserId(rs.getInt(1));
				l.setUsername(rs.getString(2));
				l.setPassword(rs.getString(3));
				l.setAvatar(rs.getString(4));
				l.setUniversity(rs.getString(5));
				l.setPoint(rs.getFloat(6));
				l.setTypeUser(rs.getString(7));
				
				list.add(l);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	
	public void insertUser(User user) {
		String sql = "insert into User values(?,?,?,?,?,?)";
		try {
			PreparedStatement pr = con.prepareStatement(sql);
			
			pr.setString(1, user.getUsername());
			pr.setString(2, user.getPassword());
			pr.setString(3, user.getAvatar());
			pr.setString(4, user.getUniversity());
			pr.setFloat(5, user.getPoint());
			pr.setString(6, user.getTypeUser());
 
			pr.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// update
	public void updateUser(User user) {
		String sql = "update Userset username=?,password=?, avatar=?, university=?, point=?, typeUser=? where userId=?";
		try {
			PreparedStatement pr = con.prepareStatement(sql);
			
			pr.setString(1, user.getUsername());
			pr.setString(2, user.getPassword());
			pr.setString(3, user.getAvatar());
			pr.setString(4, user.getUniversity());
			pr.setFloat(5, user.getPoint());
			pr.setString(6, user.getTypeUser());
			pr.setInt(7, user.getUserId());
			 
			pr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// delete
	public void deleteUser(int userId) {
		String sql = "delete from User where userId='" + userId + "'";
		try {
			Statement st = con.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

package yeohangout.mysql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.jdbc.PreparedStatement;

import yeohangout.javabeans.Employee;
import yeohangout.javabeans.Person;
import yeohangout.javabeans.UserAccount;
public class DBUtils {
	
    	
    public static void insertPerson(Connection conn, Person person) throws SQLException {
       String sql = "Insert into howoo.Person (FirstName,LastName, Address, City, State, ZipCode, Telephone, Email) "
       		+ "values (?,?,?,?,?,?,?,?)";
       PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
       
       System.out.println(person.getFirstName()+" "+person.getLastName() +" "+ person.getAddress()
       	+" "+person.getCity()+ " "+ person.getEmail() + " "+person.getState() + " "+person.getZipcode() + " "+person.getTelephone());
       pstm.setString(1, person.getFirstName());
       pstm.setString(2, person.getLastName());
       pstm.setString(3, person.getAddress());
       pstm.setString(4, person.getCity());
       pstm.setString(5, person.getState());
       pstm.setInt(6, person.getZipcode());
       pstm.setString(7, person.getTelephone());
       pstm.setString(8, person.getEmail());
       
       
       pstm.executeUpdate();
       
       
       ResultSet personID = pstm.getGeneratedKeys();
       if(personID.next()) {		//To avoid error of 'Before start of result set'
       	  person.setId(personID.getInt(1));
       }

    }
    
    public static void insertUser(Connection conn, UserAccount user) throws SQLException {
    		String sql = "Insert into howoo.customer(Id, CreditCardNo, CreationDate, Rating, UserName, Pwd) " 
    				+ "values (?,?,?,?,?,?)";
    		
    		PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
    	   
    		pstm.setInt(1, user.getPersonID());
    		pstm.setInt(2, user.getCreditCardNo());
    		pstm.setDate(3, user.getAccountCreationDate());
    		pstm.setInt(4, user.getRating());
    		pstm.setString(5, user.getUserID());
    		pstm.setString(6, user.getPassword());
    		
    		pstm.executeUpdate();

    	    ResultSet userAccount = pstm.getGeneratedKeys();
    	    if(userAccount.next()) {
    	    		user.setAccountNo(userAccount.getInt(1));
    	    }
    }
    	    
    
    public static UserAccount searchUser(Connection conn, String userId) throws SQLException{
    		
    		String sql = "Select * FROM howoo.customer c Where c.UserName = ?";
    		
    		PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
    		
    		pstm.setString(1, userId);
    		System.out.println("USER NAME : "+userId);
    		ResultSet rs = pstm.executeQuery();

    		while(rs.next()) {
    			UserAccount searchedUser = new UserAccount();
    			searchedUser.setPersonID(rs.getInt("Id"));
    			searchedUser.setAccountNo(rs.getInt("AccountNo"));
    			searchedUser.setCreditCardNo(rs.getInt("CreditCardNo"));
    			searchedUser.setRating(rs.getInt("Rating"));
    			searchedUser.setAccountCreationDate(rs.getDate("CreationDate"));
    			searchedUser.setUserID(rs.getString("UserName"));
    			searchedUser.setPassword(rs.getString("Pwd"));

    			return searchedUser;
    		}
    		return null;

    }
    
    public static Employee searchEmployee(Connection conn, String userId) throws SQLException{
    		String sql = "Select * FROM howoo.employee e Where e.UserName = ?";
    		PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
    		
    		pstm.setString(1, userId);
    		System.out.println("USER NAME : "+userId);
    		ResultSet rs = pstm.executeQuery();

    		while(rs.next()) {
    			Employee searchedUser = new Employee();
    			
    			searchedUser.setPersonID(rs.getInt("Id"));
    			searchedUser.setSSN(rs.getInt("SSN"));
    			searchedUser.setManager(rs.getBoolean("IsManager"));
    			searchedUser.setStartDate(rs.getDate("startDate"));
    			searchedUser.setHourlyRate(rs.getDouble("hourlyRate"));
    			searchedUser.setUserID(rs.getString("userName"));
    			searchedUser.setPassword(rs.getString("pwd"));
    			
    			return searchedUser;
    		}
		
    		return null;
    }
    
    
}

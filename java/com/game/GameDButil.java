package com.game;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;



public class GameDButil {

	
	public static boolean InsertGame(String name,String genre,String des,Date date,InputStream icon,double price,boolean multi) {
		
		boolean Inserted=false;
		
		//MySQL database connection
		String url = "jdbc:mysql://localhost:3306/onlinegaming?useSSL=false";
		String user = "root";
		String password = "usalma715202";
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //load the MySQL jdbc driver
			
			Connection con = DriverManager.getConnection(url, user, password);//connects to database
			
			//Statement stmt = con.createStatement();<-- not support for binary data
			
			
			String checkSql = "SELECT COUNT(*) FROM game WHERE G_name = ?";
	        PreparedStatement checkStmt = con.prepareStatement(checkSql);
	        checkStmt.setString(1, name);
	        
	        ResultSet rs = checkStmt.executeQuery();
	        if (rs.next()) {
	            int count = rs.getInt(1);
	            if (count > 0) {
	                // Game with the same name already exists, return false
	                System.out.println("Game with the name '" + name + "' already exists.");
	                return Inserted;
	            }
	        }
			
			
			  String sql ="INSERT INTO game(G_name, genre, Description, release_date,G_icon, price, Multiplayer) "
			  + "VALUES (?, ?, ?, ?, ?, ?, ?)";
			 
			
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, name);        
			pstmt.setString(2, genre);           
			pstmt.setString(3, des);     
			pstmt.setDate(4, date);
			pstmt.setBlob(5, icon);   
			pstmt.setDouble(6, price);           
			pstmt.setBoolean(7, multi);    
			
			int Result=pstmt.executeUpdate(); 
			
			if(Result>0){
				Inserted=true;
			}else {
				
				Inserted=false;
			}

		} catch (Exception e) {
			
			e.printStackTrace(); //
		}
		
		return Inserted;
		
	}
	
	public static boolean checkIfGameExists(String gameName) {
	    boolean exists = false;
	    String url = "jdbc:mysql://localhost:3306/gamemanagement";
	    String user = "root";
	    String password = "";

	    try {
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection con = DriverManager.getConnection(url, user, password);

	        String query = "SELECT COUNT(*) FROM game WHERE G_name = ?";
	        PreparedStatement pstmt = con.prepareStatement(query);
	        pstmt.setString(1, gameName);

	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next() && rs.getInt(1) > 0) {
	            exists = true; // Game exists
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return exists;
	}
	
	
	
	
	
	
	
	public static List<Game> DisplayGameList(){
		
		List<Game> gamesList = new ArrayList<>();
		
		//MySQL database connection
		String url = "jdbc:mysql://localhost:3306/onlinegaming?useSSL=false";
		String user = "root";
		String password = "usalma715202";
		
				
		try {
            Class.forName("com.mysql.jdbc.Driver"); //load the MySQL jdbc driver
			Connection con = DriverManager.getConnection(url, user, password);
			
			
			String sql="SELECT * FROM game";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            
            
            if (!rs.isBeforeFirst()) { // Check if the ResultSet is empty
                System.out.println("No games found 1.");
            }
            
			
			while(rs.next()) {
				Game game = new Game();
				
				game.setGame_id(rs.getInt("Game_id"));
			    game.setG_name(rs.getString("G_name"));
			    game.setGenre(rs.getString("Genre"));
			    game.setDescription(rs.getString("Description")); 
			    
			    Date sqlDate = rs.getDate("release_date");
			    if (sqlDate != null && !sqlDate.toString().equals("0000-00-00")) {
			        game.setRelease_date(sqlDate.toLocalDate());
			    } else {
			        System.out.println("Release date is invalid for game: " + game.getG_name());
			       
			    }

			    
			    
			    
			    Blob blob = rs.getBlob("G_icon");
			    if (blob != null) {
	                byte[] imageBytes = blob.getBytes(1, (int) blob.length());
	                
	                
	                // Convert byte[] to Base64 string and set it
	                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
	                game.setG_icon(base64Image); // Store Base64 string in the Game object
	            } else {
	                System.out.println("Image not found for game: " + game.getG_name());
	            }
				
			    
			    game.setPrice(rs.getDouble("Price"));
			    game.setMultiplayer(rs.getBoolean("Multiplayer"));
			    
			    
			    System.out.println("in side Gamefound: " + game.getG_name());
	            System.out.println("in side GameID: " + game.getGame_id());
	            System.out.println("Genre: " + game.getGenre());
	            System.out.println("Description: " + game.getDescription());
	            System.out.println("Release Date: " + game.getRelease_date());
			    
			    
			    
			    
			    
			    
			    gamesList.add(game);
				
			}
			
			
			
		} catch (Exception e) {
			
			e.printStackTrace();

		}finally {
			System.out.println("Total games added to list: " + gamesList.size());
		}
		
		
		
		
		return gamesList;
		
		
		
	}
	
	
	
	  public static boolean UpdateGame(int id,String name,String genre,String des,Date date,InputStream icon,double price,boolean multi) {
	  
	  boolean updated = false;
	  
	  
	  
	  //MySQL database connection
	  String url = "jdbc:mysql://localhost:3306/onlinegaming?useSSL=false";
	  String user = "root";
	  String password = "usalma715202";
	  
	  try {
	  
	  Class.forName("com.mysql.jdbc.Driver"); //load the MySQL jdbc driver
	  
	  Connection con = DriverManager.getConnection(url, user, password);
	  
	  String sql="update game set G_name=?, Genre=?, Description=?, release_date=? ,G_icon=? ,Price=? ,Multiplayer=? where Game_id=?";
	  
	  PreparedStatement pstmt = con.prepareStatement(sql);
	  
	  
	    pstmt.setString(1, name);        
		pstmt.setString(2, genre);           
		pstmt.setString(3, des);     
		pstmt.setDate(4, date);
		pstmt.setBlob(5, icon);   
		pstmt.setDouble(6, price);           
		pstmt.setBoolean(7, multi);  
		pstmt.setInt(8, id);
		
		
		int Result=pstmt.executeUpdate(); 
		
		
		if(Result>0){
			updated=true;
		}else {
			
			updated=false;
		}
	  
	  } catch (Exception e) {
	  
	  e.printStackTrace(); }
	  
	  
	  return updated;
	  
	  }
	  
	  public static boolean Deletegame(int id) {
		  
		//MySQL database connection
		  String url = "jdbc:mysql://localhost:3306/onlinegaming?useSSL=false";
		  String user = "root";
		  String password = "usalma715202";
		  
		  boolean deleted=false;
		  
		  
		  try {
			  
			  Class.forName("com.mysql.jdbc.Driver"); //load the MySQL jdbc driver
			  
			  Connection con = DriverManager.getConnection(url, user, password);
			  
			  String sql="delete from game where Game_id=?";
			  
			  System.out.println("my delete id "+id);
			  
			  PreparedStatement pstmt = con.prepareStatement(sql);
			  
			  pstmt.setInt(1, id);
			  
			  int Result=pstmt.executeUpdate(); 
				
			  System.out.println("Delete result: " + Result);
				
				if(Result>0){
					deleted=true;
				}else {
					
					deleted=false;
				}

			  
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		  
		  return deleted;
		  
	  }
	  
	  
	  
	  public static List<Game> getGamesByGenre(String genre){
			
			List<Game> gamesList = new ArrayList<>();
			
			//MySQL database connection
			String url = "jdbc:mysql://localhost:3306/onlinegaming?useSSL=false";
			String user = "root";
			String password = "usalma715202";
			
					
			try {
	            Class.forName("com.mysql.jdbc.Driver"); //load the MySQL jdbc driver
				Connection con = DriverManager.getConnection(url, user, password);
				
				
				String sql="SELECT * FROM game WHERE genre = ?";
				
				PreparedStatement pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, genre);
				
	            ResultSet rs = pstmt.executeQuery();
	            
	            
	            if (!rs.isBeforeFirst()) { // Check if the ResultSet is empty
	                System.out.println("No games found 1.");
	            }
	            
				
				while(rs.next()) {
					Game game = new Game();
					
					game.setGame_id(rs.getInt("Game_id"));
				    game.setG_name(rs.getString("G_name"));
				    game.setGenre(rs.getString("Genre"));
				    game.setDescription(rs.getString("Description")); 
				    
				    Date sqlDate = rs.getDate("release_date");
				    if (sqlDate != null && !sqlDate.toString().equals("0000-00-00")) {
				        game.setRelease_date(sqlDate.toLocalDate());
				    } else {
				        System.out.println("Release date is invalid for game: " + game.getG_name());
				       
				    }
				    
				    Blob blob = rs.getBlob("G_icon");
				    if (blob != null) {
		                byte[] imageBytes = blob.getBytes(1, (int) blob.length());
		                
		                
		                // Convert byte[] to Base64 string and set it
		                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
		                game.setG_icon(base64Image); // Store Base64 string in the Game object
		            } else {
		                System.out.println("Image not found for game: " + game.getG_name());
		            }
				    
				    game.setPrice(rs.getDouble("Price"));
				    game.setMultiplayer(rs.getBoolean("Multiplayer"));
				    
				    
				    
				   
				    gamesList.add(game);
					
				}
				
				
				
			} catch (Exception e) {
				
				e.printStackTrace();

			}finally {
				System.out.println("Total games added to list: " + gamesList.size());
			}
			
			
			
			
			return gamesList;
			
			
			
		}
	  
	  
	  public static Game getGame(String id) {
		  
		  Game game = null;
		  
		//MySQL database connection
		String url = "jdbc:mysql://localhost:3306/onlinegaming?useSSL=false";
		String user = "root";
		String password = "usalma715202";
	      
	      try {
	    	  
	    	  Class.forName("com.mysql.jdbc.Driver"); //load the MySQL jdbc driver
	    	  
			  Connection con = DriverManager.getConnection(url, user, password);
	    	  
			  String sql = "SELECT * FROM game WHERE Game_id = ?";
			  
			  
			  PreparedStatement pstmt = con.prepareStatement(sql);

		      pstmt.setString(1, id);
		      ResultSet rs = pstmt.executeQuery();
		      
		      if(rs.next()) {
		    	  
		    	  game = new Game();
					
					game.setGame_id(rs.getInt("Game_id"));
				    game.setG_name(rs.getString("G_name"));
				    game.setGenre(rs.getString("Genre"));
				    game.setDescription(rs.getString("Description")); 
				    
				    Date sqlDate = rs.getDate("release_date");
				    if (sqlDate != null && !sqlDate.toString().equals("0000-00-00")) {
				        game.setRelease_date(sqlDate.toLocalDate());
				    } else {
				        System.out.println("Release date is invalid for game: " + game.getG_name());
				       
				    }
				    
				    Blob blob = rs.getBlob("G_icon");
				    if (blob != null) {
		                byte[] imageBytes = blob.getBytes(1, (int) blob.length());
		                
		                
		                // Convert byte[] to Base64 string and set it
		                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
		                game.setG_icon(base64Image); // Store Base64 string in the Game object
		            } else {
		                System.out.println("Image not found for game: " + game.getG_name());
		            }
					
				    
				    game.setPrice(rs.getDouble("Price"));
				    
				    System.out.println(rs.getDouble("Price"));
				    
				    game.setMultiplayer(rs.getBoolean("Multiplayer"));
				    
		    	  
		      }
	    	  
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		  
		  return game;
	  }
		
	 
	
}

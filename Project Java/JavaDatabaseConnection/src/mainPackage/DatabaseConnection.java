package mainPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class DatabaseConnection {

	public static void main(String[] args) throws SQLException {
		int option = 0;
		Scanner keyb = new Scanner(System.in);
		while(true) {
			System.out.println("Input 1 to see the View.\nInput 2 to input a record onto the Job Seeker table.");
			option = keyb.nextInt();
			if(option == 1) {
				viewJobsCurrentlyAppliedFor();
			} else if (option == 2) {
				insertNewJobSeeker();
			}
		}
	}
	
	public static void insertNewJobSeeker() {
		Scanner keyb = new Scanner(System.in);
		System.out.println("Please input the Forename for this new Job Seeker: ");
		String newForename = keyb.nextLine();
		System.out.println("Please input the Surname for this new Job Seeker: ");
		String newSurname = keyb.nextLine();
		System.out.println("Please input the Email for this new Job Seeker: ");
		String newEmail = keyb.nextLine();
		System.out.println("Please input the Phone Number for this new Job Seeker: ");
		String newPhoneNumber = keyb.nextLine();
		System.out.println("Please input the Street Address for this new Job Seeker: ");
		String newStreetAddress = keyb.nextLine();
		System.out.println("Please input the City for this new Job Seeker: ");
		String newCity = keyb.nextLine();
		System.out.println("Please input the Postcode for this new Job Seeker: ");
		String newPostcode = keyb.nextLine();
		
		// String host = "web hosting address you cannot reach";
		// String port = "fake port";
		// String DB = "fake database";
		// String username = "fake username";
		// String password = "fake password ;)";
		String urlDB = host + port + DB;

		String query = "INSERT INTO JobSeekers(`Forename`, `Surname`, `Email`, `Phone`, `StreetAddress`, `City`, `Postcode`) VALUES ('" + newForename + "','" + newSurname + "','" + newEmail + "','" + newPhoneNumber + "','" + newStreetAddress + "','" + newCity + "','" + newPostcode + "');";
		System.out.println("Loading...");
		try {
			Connection con = DriverManager.getConnection(urlDB, username, password);
			Statement stmt = con.createStatement();
			stmt.executeUpdate(query);
			System.out.println("Successfully inserted this record.");
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	public static void viewJobsCurrentlyAppliedFor() {
		// String host = "web hosting address you cannot reach";
		// String port = "fake port";
		// String DB = "fake database name";
		// String username = "fake username ;)";
		// String password = "fake password ;)";
		String urlDB = host + port + DB;

		String query = "SELECT * FROM JobsCurrentlyAppliedFor;";
		System.out.println("Loading...");
		try {
			Connection con = DriverManager.getConnection(urlDB, username, password);
			Statement stmt = con.createStatement();

			ResultSet rs = stmt.executeQuery(query);
			ResultSetMetaData rsmd = rs.getMetaData();
			int numColumns = rsmd.getColumnCount();
			while (rs.next()) {
				for (int i = 1; i <= numColumns; i++) {
					System.out.print(rs.getString(i) + " ");
				}
				System.out.println();
			}

			stmt.close();
			con.close();
			System.out.println();

		} catch (SQLException e) {
			System.out.println(e);
		}
	}
}

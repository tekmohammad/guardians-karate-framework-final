package api.utility.data;

public class GenerateData {
	
	
	public static String getEmail() {
		String prefix = "instructor_email";
		String provider = "@tekschool.us";		
		int random = (int) (Math.random() * 10000);
		String email = prefix + random + provider; 
		return email;
	}
}

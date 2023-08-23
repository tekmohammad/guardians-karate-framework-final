package api.utility.data;

public class GenerateData {
	
	
	public static String getEmail() {
		String prefix = "auto_generate";
		String provider = "@tekschool.us";		
		int random = (int) (Math.random() * 1000000);
		String email = prefix + random + provider; 
		return email;
	}
	
	/**
	 * Generate Random Phone number 10 digit
	 * @return String random phone number
	 * If you can improve it to better solution do it 
	 * 20 Minute break
	 */
	public static String getPhoneNumber() {
		String phoneNumber = "2";
		for (int i = 0; i < 9 ; i ++) {
			phoneNumber += (int) (Math.random() * 10);
		}
		return phoneNumber;
	}
	
	public static String getLicensePlate() {
        String prefix = "xyz";
        String suffix = "abc";
        int random = (int)(Math.random()*10000);
        String licensePlate  = prefix + random + suffix;
        return licensePlate;

    }
	
	public static String getUsername() {
		String prefix = "auto_user";
		int random = (int)(Math.random()*10000);
		return prefix.concat(String.valueOf(random));
	}
}

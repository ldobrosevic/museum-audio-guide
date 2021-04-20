package hr.fer.apptownfunk.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Class <code>Crypto</code> defines a method toSHA1 which
 * provides string hashing with SHA1 algorithm of a given
 * String. 
 * 
 * @author Lovro Dobrošević
 *
 */
public class Crypto {
	
	/**
	 * Method is used to hash a String instance
	 * with SHA1 algorithm.
	 * 
	 * @param password	String you want to hash
	 * @return			String representation of hex hashed byte array
	 */
	public static String toSHA1(String password) {
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA-1");
		} catch (NoSuchAlgorithmException e) {}
		
		return byteToHex(md.digest(password.getBytes()));
	}
	
	public static String byteToHex(byte[] byteArray) {
		if(byteArray == null) {
			throw new IllegalArgumentException("Byte array can't be null!");
		}
		if(byteArray.length == 0) {
			return "";
		}
		
		StringBuilder sb = new StringBuilder();
		for(byte by : byteArray) {
			sb.append(String.format("%02x", by));		//print at least 2 digits, prepend with 0
		}
		
		return sb.toString();
	}
}

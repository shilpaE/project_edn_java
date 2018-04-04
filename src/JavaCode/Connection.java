package JavaCode;

import java.nio.file.DirectoryNotEmptyException;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Paths;
import java.io.*;
import edn_validator_cljcode.compare;

public class Connection {
	
	
	public String data(String x, String y) {
		//Deleting a existing text file and creating a new one 
		 String path1="C:\\Users\\se056529\\Documents\\ednvalidator-result.txt";
	        
			try {
					Files.deleteIfExists(Paths.get(path1));
				} catch (NoSuchFileException e) {
					System.out.println("No such file/directory exists");
				} catch (DirectoryNotEmptyException e) {
					System.out.println("Directory is not empty.");
				} catch (IOException e) {
					System.out.println("Invalid permissions."+e);
				}
				try {
					File file = new File(path1);
					boolean fvar = file.createNewFile();
					if (fvar) {
						System.out.println("File has been created successfully");

					}
				} catch (IOException e) {
					System.out.println("Exception Occurred:");
					e.printStackTrace();
				}
			
				
			

				//calling Clojure function
		String b = compare.codding(x, y);
		System.out.println(b);
		return (b);
      }
	
 
}
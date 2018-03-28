package JavaCode;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class editing {

	public static void main (String[] args)
	{
		editing.data();
	}
	public static void data()
	{
	String line = null;
	String fname="C:\\Users\\se056529\\Documents\\json-result.txt";
	
    try
    {
    	FileReader fileReader = new FileReader(fname);
        BufferedReader bufferedReader = new BufferedReader(fileReader);
  
       String data="";
        while((line = bufferedReader.readLine()) != null)
        {
        	line = line.replace("#{", "");
        	line = line.replace("}", "");
           	data= data.concat(line);
                    
        }
       
       data=data.replace(" ","\n  ");
       String[] words =data.split("\\s+");
      
    	   
    		   for(int j=0;j<(words.length);j++)
    		   {
    			   try {
    	   System.out.print((j+1)+".  ");
    	   System.out.println(words[j]);   
    			   }
    			   catch(Exception e) {
    				  // System.out.println(e);
    			   }

    		   }
        bufferedReader.close();
    }
    catch(IOException ex)
    {
      
		System.out.println("Error reading file named '" + fname + "'");
    }
    
	}
}


package JavaCode;

import java.io.*;

public class Calling_2 {
	public static void main(String[] args) {
		Calling_2.editi();
	}

	public static void editi() {
				// printing the edn-result
		
		System.out.println("edn result is");
		String input1 = "C:\\Users\\se056529\\Documents\\ednvalidator-result.txt";
		try {
			FileReader fileReader1 = new FileReader(input1);
			BufferedReader bufferedReader1 = new BufferedReader(fileReader1);
			String data = "";
			String line = null;
			while ((line = bufferedReader1.readLine()) != null) {
				line = line.replace("#{", "");
				line = line.replace("}", "");
				data = data.concat(line);
			}
			data = data.replace(" ", "\n  ");
			String[] words = data.split("\\s+");
			for (int i = 1; i < words.length; i++) {
				if (i != 5)
					System.out.print(words[i] + " ");
				else {
					for (int j = 1; j <= (words.length) - 5; j++) {
						try {
							if (j == 1)
								System.out.println("<br>");
							// System.out.print("<br>");
							System.out.print(j + ".  ");
							System.out.println(words[i + j - 1]);

						} catch (Exception e) {
							// System.out.println(e);
						}

					}
				}

				if (i == 5)
					break;
			}

			bufferedReader1.close();
		} catch (IOException ex) {
			System.out.println("Error reading file named '" + input1 + "'");
		}
		
		// printing the json-result
		        System.out.println("json result is");
				String line1 = null;
				String fname = "C:\\Users\\se056529\\Documents\\json-result.txt";

				try {
					FileReader fileReader = new FileReader(fname);
					BufferedReader bufferedReader = new BufferedReader(fileReader);

					String data = "";
					while ((line1 = bufferedReader.readLine()) != null) {
						line1 = line1.replace("#{", "");
						line1 = line1.replace("}", "");
						data = data.concat(line1);

					}

					data = data.replace(" ", "\n  ");
					String[] words = data.split("\\s+");

					for (int j = 0; j < (words.length); j++) {
						try {
							System.out.print((j + 1) + ".  ");
							System.out.println(words[j]);
						} catch (Exception e) {
							// System.out.println(e);
						}

					}
					bufferedReader.close();
				} catch (IOException ex) {

					System.out.println("Error reading file named '" + fname + "'");
				}



	}
}
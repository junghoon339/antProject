package com.ant.chat.service;

import java.io.BufferedWriter;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;

import org.springframework.stereotype.Service;

@Service
public class ChatServiceImpl implements ChatService {
/*
	@Override
	public void readChat(int projectNo) {
		// The name of the file to open.
		String pNo = Integer.toString(projectNo);
		String fileName = "/chat/chat_room_no_" + pNo + ".txt";

		// This will reference one line at a time
		String line = null;
		try {
			// FileReader reads text files in the default encoding.
			FileReader fileReader = new FileReader(fileName);
			
			// Always wrap FileReader in BufferedReader.
			BufferedReader bufferedReader = new BufferedReader(fileReader);
			
			
			while ((line = bufferedReader.readLine()) != null) {
				System.out.println(line);
			}

			// Always close files.
			bufferedReader.close();
		} catch (FileNotFoundException ex) {
			System.out.println("Unable to open file '" + fileName + "'");
		} catch (IOException ex) {
			System.out.println("Error reading file '" + fileName + "'");
			// Or we could just do this:
			// ex.printStackTrace();
		}
	}
*/
	@Override
	public void writeChat(int projectNo, String payload) {
		// The name of the file to open.
		String pNo = Integer.toString(projectNo);
		String fileName = "/chat/chat_room_no_" + pNo + ".txt";
		
		BufferedWriter bufferedWriter = null;
		try {
			FileOutputStream fileOutputStream = new FileOutputStream(fileName, true);	
			OutputStreamWriter OutputStreamWriter = new OutputStreamWriter(fileOutputStream, "UTF-8");
			bufferedWriter = new BufferedWriter(OutputStreamWriter);
			
			// Always wrap FileWriter in BufferedWriter.
			// Note that write() does not automatically
			// append a newline character.
			bufferedWriter.append(payload+"\r\n");
			bufferedWriter.flush();
			
			// Always close files.
			bufferedWriter.close();
		} catch (IOException ex) {
			System.out.println("Error writing to file '" + fileName + "'");
			// Or we could just do this:
			// ex.printStackTrace();
		} finally {
			try {
				if (bufferedWriter != null)
					bufferedWriter.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}

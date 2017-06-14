package com.ant.chat.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import javax.servlet.jsp.PageContext;

import org.springframework.stereotype.Service;

@Service
public class ChatServiceImpl implements ChatService {

	@Override
	public void readChat(int projectNo) {
		// The name of the file to open.
		String pNo = Integer.toString(projectNo);
		String fileName = "/chat/chat_room_no_"+pNo+".txt";
		
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

	@Override
	public void writeChat(int projectNo, String payload) {
		// The name of the file to open.
		String pNo = Integer.toString(projectNo);
		String fileName = "/chat/chat_room_no_"+pNo+".txt";
		BufferedWriter bufferedWriter=null;
		
		try {
			// Assume default encoding.
			FileWriter fileWriter = new FileWriter(fileName, true); 
			// Always wrap FileWriter in BufferedWriter.
			bufferedWriter = new BufferedWriter(fileWriter);
			
			// Note that write() does not automatically
			// append a newline character.
			bufferedWriter.append(payload);
			bufferedWriter.newLine();
			
			// Always close files.
			bufferedWriter.close();
			
		} catch (IOException ex) {
			System.out.println("Error writing to file '" + fileName + "'");
			// Or we could just do this:
			// ex.printStackTrace();
		} finally{
			try {
				if(bufferedWriter!=null)
				bufferedWriter.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}

package repository;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.HashMap;

public privileged aspect Serializer {
	private String fileName = "repository";
	
	pointcut constructor() :
		execution(Repository.new()) && !within(Serializer);
	
	pointcut modification() :
		(execution(* Repository.addProject(..)) || 
				execution(* Repository.updateProject(..)) ||
				execution(* Repository.deleteProject(..)) ) &&
				!within(Serializer);
	
	
	after() : constructor()
	{
		try {
			FileInputStream fileIn = new FileInputStream(fileName);
			ObjectInputStream in = new ObjectInputStream(fileIn);
			((Repository)thisJoinPoint.getTarget()).projects = 
					((HashMap<String, Project>) in.readObject());
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// Do nothing database empty
			;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	after() : modification()
	{
		try {
			File f = new File(fileName);
			f.delete();
			FileOutputStream fileOut = new FileOutputStream(fileName);
			ObjectOutputStream out = new ObjectOutputStream(fileOut);
			out.writeObject(((Repository)thisJoinPoint.getTarget()).projects);
		}  catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

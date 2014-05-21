package repository;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

public aspect ExportFaster {
	public String Project.stream;
	public boolean Project.valid = false;
	
	pointcut export(Project project, PrintStream printStream) :
		call(public void ProjectExporter.export(Project, PrintStream)) &&
		args(project, printStream) &&
		!within(ExportFaster);
	
	void around(Project project, PrintStream printStream) :
		export(project, printStream)
	{
		if (!project.valid) {
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			PrintStream ps = new PrintStream(baos);
			proceed(project, ps);
			project.valid = true;
			project.stream = baos.toString();
		}
		
		printStream.print(project.stream);
	}
	
	after(): (execution(* Project.addTask(..)) ||
			execution(* Project.updateTask(..)) ||
			execution(* Project.deleteTask(..)) ||
			execution(* Project.addDocument(..)) ||
			execution(* Project.updateDocument(..)) ||
			execution(* Project.deleteDocument(..)) ) &&
			!within(ExportFaster)
			{
				((Project)thisJoinPoint.getTarget()).valid = false;
			}
			
}

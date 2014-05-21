package repository;

import java.io.PrintStream;
import java.util.List;

public class ProjectExporter
{
	public void export(Project project, PrintStream printStream) {
		printStream.println("Projekt: " + project.getName());
		exportTasks(printStream, project.getTaks());
		exportDocuments(printStream, project.getDocuments());
	}
	
	private void exportTasks(PrintStream printStream, List<Task> tasks) {
		printStream.println("Liczba zada�: " + tasks.size());
		for (Task task : tasks)
		{
			printStream.println("Zadanie: " + task.getId());
			printStream.println("Opis: " + task.getDescription());
			printStream.println("Zg�aszaj�cy: " + task.getReporter().getName() + " " + task.getReporter().getLastName());
			printStream.println("Przypisany: "  + task.getAssignee().getName() + " " + task.getAssignee().getLastName());
			printStream.println("Status: " + task.getStatus());
		}
	}
	
	private void exportDocuments(PrintStream printStream, List<Document> documents) {
		printStream.println("Liczba dokument�w: " + documents.size());
		for (Document document : documents)
		{
			printStream.println("Dokument: " + document.getName());
		}
	}
}

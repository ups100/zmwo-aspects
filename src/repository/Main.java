package repository;

public class Main 
{
	
	public static void main(String[] args) 
	{
		Employee employee1 = new Employee("user1", "user1");
		Employee employee2 = new Employee("user2", "user2");
		
		Repository repository = new Repository();
		
		Project project1 = new Project("project1");
		Project project2 = new Project("Project2");
		
		Task task1 = new Task(1, "task1", employee1, employee1);
		Task task2 = new Task(2, "task2", employee2, employee1);
		Task task3 = new Task(3, "task3", employee2, employee2);
		
		project1.addTask(task1);
		project1.addTask(task2);
		project2.addTask(task3);
		
		repository.addProject(project1);
		repository.addProject(project2);
		
		ProjectExporter projectExporter = new ProjectExporter();
		projectExporter.export(project1, System.out);
	}
}

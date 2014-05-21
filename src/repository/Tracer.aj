package repository;

import java.util.ArrayDeque;
import java.util.Calendar;
import java.util.Deque;
import java.util.Queue;
import java.util.concurrent.LinkedTransferQueue;

import org.aspectj.lang.reflect.MethodSignature;

public aspect Tracer {
	/*Deque<Long> times = new ArrayDeque<Long>();
	pointcut  wywolanie() :
		execution(* *.*(..)) && !within(Tracer)
		&& (target(Document) || target(Employee) || target(Main) || target(Project) || target(ProjectExporter) || target(Repository)
				|| target(Task));
	
	before() : wywolanie()
	{
		System.out.println("Call for: " + thisJoinPoint.getTarget().getClass() + " Method: " + thisJoinPoint.getSignature().getName());
		MethodSignature signature = (MethodSignature)thisJoinPoint.getSignature();
		String names[] = signature.getParameterNames();
		Object args[] = thisJoinPoint.getArgs();
		
		String argsString = new String();
		for(int i = 0; i < args.length; ++ i)
		{
			argsString += "Name: " + names[i] + " Type: " + args[i].getClass() + " Value: " + args[i].toString() + "\n";
		}
		
		System.out.print(argsString);
		times.addLast(Calendar.getInstance().getTimeInMillis());
	}
	
	after() returning(Object ret) : wywolanie()
	{
		Long time = Calendar.getInstance().getTimeInMillis() - times.pollLast();
		System.out.println("Call for: " + thisJoinPoint.getTarget().getClass() + " Method: " + thisJoinPoint.getSignature().getName() +
				" Returned: " + ret + " Time: " + time);
	}*/
}

package gcu.backend.classroomservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;


// This is the main class for the Classroom Service
@SpringBootApplication
@EnableDiscoveryClient
public class ClassroomServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(ClassroomServiceApplication.class, args);
	}

}

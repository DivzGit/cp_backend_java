package cavinspro.cavins_pro;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class CavinsProApplication {

	public static void main(String[] args) {
		SpringApplication.run(CavinsProApplication.class, args);
		System.out.println("running");
	}

}

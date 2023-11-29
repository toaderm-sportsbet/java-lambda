package sportsbet.com.au.lambda;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;


@SpringBootApplication
public class LambdaApplication implements RequestHandler<String, String> {

    private static ConfigurableApplicationContext applicationContext;

    public static void main(String[] args) {
        applicationContext = SpringApplication.run(LambdaApplication.class, args);
    }

    @Override
    public String handleRequest(String s, Context context) {
        System.out.println("Im doing a lambda request");
        return "Im doing a lambda request";
    }
}
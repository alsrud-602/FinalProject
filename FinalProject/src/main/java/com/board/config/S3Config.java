package com.board.config;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3AsyncClient;
import software.amazon.awssdk.services.s3.internal.crt.S3CrtAsyncClient;




@Configuration
public class S3Config {

    @Value("${aws.credentials.access-key}")
    private String accessKey;

    @Value("${aws.credentials.secret-key}")
    private String secretKey;

    @Value("${aws.region}")
    private String regionString;

    @Bean
    public S3AsyncClient  amazonS3() {
    	Region region = Region.of(regionString);
    	AwsBasicCredentials  credentials = AwsBasicCredentials.create(accessKey, secretKey);
        return S3CrtAsyncClient.builder()
				.credentialsProvider(StaticCredentialsProvider.create(credentials))
				.region(region)
			.build();
    }
}

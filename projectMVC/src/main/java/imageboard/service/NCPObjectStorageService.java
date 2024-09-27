package imageboard.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class NCPObjectStorageService {
	private String accessKey = "1D6D87596CD683D35CEB";
	private String secretKey = "8A4AB31CDB908EC478D8C76AFC563335234B6BE4";
	private String regionName = "kr-standard";
	private String endPoint = "https://kr.object.ncloudstorage.com";
	
	final AmazonS3 s3;
	public NCPObjectStorageService() {
		s3 = AmazonS3ClientBuilder
				.standard()
				.withEndpointConfiguration(new AwsClientBuilder.EndpointConfiguration(endPoint, regionName))
				.withCredentials(new AWSStaticCredentialsProvider(new BasicAWSCredentials(accessKey, secretKey)))
				.build();
	}
	public String uploadFile(String bucketName, String directoryPath, File file) {
		//String fileName = file.getName();
		String fileName = UUID.randomUUID().toString();
		FileInputStream fileIn = null;
		try {
			fileIn = new FileInputStream(file);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
		ObjectMetadata om = new ObjectMetadata();
		
		Path path = Paths.get(file.getAbsolutePath());	//파일의 타입을 알아냄
		String contentType = null;
		try {
			contentType = Files.probeContentType(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		om.setContentType(contentType);
		om.setContentLength(file.length());
		
		PutObjectRequest putObjectRequest = 
				new PutObjectRequest(bucketName,
									 directoryPath + fileName,
									 fileIn,
									 om)
				.withCannedAcl(CannedAccessControlList.PublicRead);	//리소스에 대한 접근 권한
		//모든 사용자가 객체를 읽을 수 있지만 수정/삭제 불가능
		
		s3.putObject(putObjectRequest);	//업로드
		
		return fileName;
	}
}
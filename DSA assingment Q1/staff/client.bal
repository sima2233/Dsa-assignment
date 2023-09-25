import ballerina/http;
import ballerina/openapi;
import gen/service;

public function main() {
    // Create an HTTP client configuration
    http:ClientConfiguration clientConfig = {};

    // Create a client instance using the generated stub
service.Clientclient  = new (clientConfig, "http://localhost:2023");

    // Call the API endpoints using the client

service.lecturer    lecturerToAdd = {
        lecturerNumber: "L001",
        officeNumber: "O001",
        lecturerName: "John Doe",
        title: "Professor"
    };
    var addResponse = client->addLecturer(lecturerToAdd);
    io:println("Add Lecturer Response: " + addResponse);

}

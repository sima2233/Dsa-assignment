import ballerina/graphql;
import ballerina/sql;
import ballerinax/mysql;
import ballerinax/mysql.driver as _;




type Employee record{|
    string firstname;
    string lastname;
    string jobTitle;
    int total_score;
    |};


    type Objective record{|
    string objectiveName;
    string department;
    |};
    

    private final mysql:Client db;
    configurable string USER = ?;
    configurable string PASSWORD = ?;
    configurable string HOST = ?;
    configurable int PORT = ?;
    configurable string DATABASE = ?;

final mysql:Client dbClient = check new(
    host=HOST, user=USER, password=PASSWORD, port=PORT, database="fci_db");

service /graphql on new graphql:Listener(9000){

    //HOD Services
 resource function create objective(int id,string objectivename,string department) returns int|error{
   sql:ExecutionResult result = check dbClient->execute(`
        INSERT INTO objectives (ID, Department, Name )
        VALUES ( ${id}, ${objectivename}, ${department})`);
    int|string? lastInsertId = result.lastInsertId;
    if lastInsertId is int {
        return lastInsertId;
    } else {
        return error("Unable to insert successfully");
    }
 }

  resource function delete objective(int id) returns int|error{
    sql:ExecutionResult result = check dbClient->execute(`
        DELETE FROM objectives WHERE ID = ${id}`);
    int? affectedRowCount = result.affectedRowCount;
    if affectedRowCount is int {
        return affectedRowCount;

    } else {
        return error("Unable to obtain the affected row count");
    }
  }
   resource function view employee() returns Employee[]|error{
     stream<Employee, sql:Error?> employeeStream = self.db->query("SELECT * FROM employee");
      Employee[] employee = [];
      return employee;
      }
    resource function assign employee(string employeeID,string supervisorName) returns int|error{
        sql:ExecutionResult result = check dbClient->execute(`
        UPDATE employee SET
            Supervisor = ${supervisorName}
        WHERE employee_id = ${employeeID}`);
    int|string? lastInsertId = result.lastInsertId;
    if lastInsertId is int {
        return lastInsertId;
    } else {
        return error("Unable to obtain last insert ID");
    }
    }
    //Supervisor services



    //Employee services
}

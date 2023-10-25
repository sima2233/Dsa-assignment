import ballerina/io;
import ballerinax/mysql;
import ballerina/sql;

   final mysql:Client dbClient = check new(
    host=HOST, user=USER, password=PASSWORD, port=PORT, database="fci_db"
);

public function main() {

}

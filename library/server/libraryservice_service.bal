import ballerina/grpc;
import ballerina/io;



 type  Book record {
    string isbn;
    string name;
    string author;
    string opt_author;
    string location;
    string status;
    };

 map<Book> bookshelf;

listener grpc:Listener ep = new (9090);



@grpc:Descriptor {value: LIBRARY_DESC}

service "LibraryService" on ep {

    remote function add_book(book value) returns book|error {
       Book newbook = {name: value.name, author: value.author, isbn: value.isbn,opt_author: value.opt_author,location: value.location, status: value.status};
       if(bookshelf[value.isbn]!=()){
        return error("Book with isbn " +value.isbn +" already exists");
       }
       else if(bookshelf[value.isbn]!=null){
       bookshelf[value.isbn] = newbook;
       io:println("Book with isbn: " +value.isbn + " added successfully!");
        }
        else {return error("Error has occured");
        }
    }
    remote function update_book(book value) returns book|error {
        //if the book exists
        if(bookshelf[value.isbn]!=()){
        io:println("Enter new isbn for book");
        string newisbn = io:readln();

        
        io:print("Please enter new/old Book Name: ");
        string namb = io:readln();

        io:print("Please enter new/old Author: ");
        string authorb = io:readln(); 

        io:print("Please enter new/old Optional Author: ");
        string opt_authorb = io:readln(); 

        io:print("Please enter new/old Book Location: ");
        string locationb = io:readln(); 

        io:print("Please enter new/old Book Status: ");
        string statusb = io:readln(); 
      
        Book newbookk = {isbn: newisbn, name: namb, author: authorb , opt_author: opt_authorb, location: locationb, status: statusb};
        bookshelf[value.isbn] = newbookk;

        io:print("Book updated successfully!");
        }
        else{
            io:println("Book does not exits!");
        }
    }
    remote function remove_book(book value) returns book|error {
        string copy = value.isbn;
       //if the book exists then
       if(bookshelf[copy]!=()){
          //here
            bookshelf.remove(copy);
            io:println("Book has been deleted!");
            io:println(bookshelf);
         return {};
       }
       //if the book does not exist
       else if (bookshelf[value.isbn]==()){
        io:println("That Book does not exist in the library!");
       }
       else{
        io:print("Error!");
       }
    }
    remote function locate_book(book value) returns booklocation|error {
        string chec = value.isbn;
        if(bookshelf[chec]!=()){
            io:println( bookshelf[chec]);
        }else {
            io:println("Book is not available or doesnt exist");
        }
    }
    remote function borrow_book(book value) returns borrowBookResponse|error {
        string stat = value.status;
        string isb = value.isbn;
        if(bookshelf[value.isbn]!=() &&  stat== "Available"){
           string borrowBookResponse = "Succesfully borrowed!";
           bookshelf[isb].status = "Unavailable";
           io:print(borrowBookResponse);
            
    }else{
        io:println("An error has occured! Book doesnt exist or isnt available");
    }
    }

    remote function create_user(stream<user, grpc:Error?> clientStream) returns user|error {
       
    
    }

    remote function list_available_books(Empty value) returns stream<book, error?>|error {
        io:println(bookshelf);
        }
   
}


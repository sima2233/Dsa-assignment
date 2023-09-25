import ballerina/io;

LibraryServiceClient ep = check new ("http://localhost:9090");

public function main() returns error? {

    
    io:println("Welcome! What would you like to do? Enter a number: ");
    io:println("1.Add_Book  2.Update_Book 3.Remove_Book 4.Locate_Book 5.Borrow_Book");
    io:println("6.List_Available_Books 7.Create_Users");
    string choice = io:readln();
 
if(choice=="1"){
     io:print("Please enter new Book Name: ");
        string namb = io:readln();

        io:print("Please enter new isbn: ");
        string isbnb = io:readln(); 

        io:print("Please enter new Author: ");
        string authorb = io:readln(); 

        io:print("Please enter new Optional Author: ");
        string opt_authorb = io:readln(); 

        io:print("Please enter new Book Location: ");
        string locationb = io:readln(); 

        io:print("Please enter new Book Status: ");
        string statusb = io:readln(); 

    book add_bookRequest = {isbn: isbnb , name: namb, author: authorb , opt_author: opt_authorb, location: locationb, status: statusb};
    book add_bookResponse = check ep->add_book(add_bookRequest);
    io:println(add_bookResponse);

}
if(choice=="2"){
 
   io:print("Please enter isbn of book to update: ");
        string isbnb = io:readln(); 
        
        
    book update_bookRequest = {isbn: isbnb};
    book update_bookResponse = check ep->update_book(update_bookRequest);
    io:println(update_bookResponse);
}

 if(choice=="3"){
    io:print("Please enter isbn of book to delete: ");
    string isbnb = io:readln(); 

    bookremove remove_bookRequest = {isbn: isbnb};
    book remove_bookResponse = check ep->remove_book(remove_bookRequest);
    io:println(remove_bookResponse);
 }
 if(choice=="4"){
      io:print("Please enter isbn of book to Locate: ");
    string isbnb = io:readln();

    book locate_bookRequest = {isbn: isbnb};
    booklocation locate_bookResponse = check ep->locate_book(locate_bookRequest);
    io:println(locate_bookResponse);
 }
 if(choice=="5"){
     io:print("Please enter UserName: ");
    string usernameb = io:readln();

 io:print("Please enter UserID: ");
    string pwb = io:readln();

  io:print("Please enter UserID: ");
    string useridb = io:readln();
 
 io:print("Please enter new isbn: ");
    string isbnbo = io:readln(); 


     io:print("Please enter new Book Name: ");
        string namb = io:readln();

        io:print("Please enter new Author: ");
        string authorb = io:readln(); 

        io:print("Please enter new Optional Author: ");
        string opt_authorb = io:readln(); 

        io:print("Please enter new Book Location: ");
        string locationb = io:readln(); 

        io:print("Please enter new Book Status: ");
        string statusb = io:readln(); 

        io:print("Please enter isbn of book to Borrow: ");
    string isbnb = io:readln();
    

    borrowedbook borrow_bookRequest = {userid: {username: usernameb, userid: useridb, pw: pwb}, isbn: {isbn: isbnb , name: namb, author: authorb , opt_author: opt_authorb, location: locationb, status: statusb}, name: {isbn: isbnbo , name: namb, author: authorb , opt_author: opt_authorb, location: locationb, status: statusb}, status:{isbn: isbnbo , name: namb, author: authorb , opt_author: opt_authorb, location: locationb, status: statusb}};
    borrowBookResponse borrow_bookResponse = check ep->borrow_book(borrow_bookRequest);
    io:println(borrow_bookResponse);
 }
 if(choice=="6"){
    Empty list_available_booksRequest = {};
    stream<book, error?> list_available_booksResponse = check ep->list_available_books(list_available_booksRequest);
    check list_available_booksResponse.forEach(function(book value) {
        io:println(value);
    });
 }
 if(choice=="7"){

    io:print("Enter username: ");
    string usernameb = io:readln();

    io:print("Enter UserID: ");
    string useridb = io:readln();

    io:print("Enter password: ");
    string pwb = io:readln();

    user create_userRequest = {username: usernameb, userid: useridb, pw: pwb};
    Create_userStreamingClient create_userStreamingClient = check ep->create_user();
    check create_userStreamingClient->sendUser(create_userRequest);
    check create_userStreamingClient->complete();
    user? create_userResponse = check create_userStreamingClient->receiveUser();
    io:println(create_userResponse);
 }
 else{
    io:println("Wrong input! ");
 }
}

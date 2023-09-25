import ballerina/grpc;
import ballerina/protobuf;

public const string LIBRARY_DESC = "0A0D6C6962726172792E70726F746F12076C696272617279225E0A04626F6F6B12120A046973626E18012001280952046973626E12120A046E616D6518022001280952046E616D6512160A06617574686F721803200128095206617574686F7212160A06737461747573180420012808520673746174757322070A05456D70747922350A0B6372656174655F7573657212160A067573657269641801200128095206757365726964120E0A0270771802200128095202707722530A0B7570646174655F626F6F6B12210A046973626E18012001280B320D2E6C6962726172792E626F6F6B52046973626E12210A046E616D6518022001280B320D2E6C6962726172792E626F6F6B52046E616D6522770A086164645F626F6F6B12210A046973626E18012001280B320D2E6C6962726172792E626F6F6B52046973626E12210A046E616D6518022001280B320D2E6C6962726172792E626F6F6B52046E616D6512250A06617574686F7218032001280B320D2E6C6962726172792E626F6F6B5206617574686F7222530A0B72656D6F76655F626F6F6B12210A046973626E18012001280B320D2E6C6962726172792E626F6F6B52046973626E12210A046E616D6518022001280B320D2E6C6962726172792E626F6F6B52046E616D6522160A146C6973745F617661696C61626C655F626F6F6B7322640A0B6C6F636174655F626F6F6B12210A046973626E18012001280B320D2E6C6962726172792E626F6F6B52046973626E12160A06726573756C741802200128085206726573756C74121A0A086C6F636174696F6E18032001280952086C6F636174696F6E227B0A0C626F72726F776564626F6F6B12210A046973626E18012001280B320D2E6C6962726172792E626F6F6B52046973626E12210A046E616D6518022001280B320D2E6C6962726172792E626F6F6B52046E616D6512250A0673746174757318032001280B320D2E6C6962726172792E626F6F6B520673746174757322220A0475736572121A0A08757365726E616D651801200128095208757365726E616D65222A0A0C626F6F6B6C6F636174696F6E121A0A086C6F636174696F6E18012001280952086C6F636174696F6E22520A0A626F6F6B72656D6F766512210A046973626E18012001280B320D2E6C6962726172792E626F6F6B52046973626E12210A046E616D6518022001280B320D2E6C6962726172792E626F6F6B52046E616D6522390A12626F72726F77426F6F6B526573706F6E736512230A0D626F6F6B5F726573706F6E7365180120012809520C626F6F6B526573706F6E7365227A0A0B626F72726F775F626F6F6B12210A046973626E18012001280B320D2E6C6962726172792E626F6F6B52046973626E12210A046E616D6518022001280B320D2E6C6962726172792E626F6F6B52046E616D6512250A0673746174757318032001280B320D2E6C6962726172792E626F6F6B520673746174757332FA020A0E4C6962726172795365727669636512280A086164645F626F6F6B120D2E6C6962726172792E626F6F6B1A0D2E6C6962726172792E626F6F6B122D0A0B6372656174655F75736572120D2E6C6962726172792E757365721A0D2E6C6962726172792E757365722801122B0A0B7570646174655F626F6F6B120D2E6C6962726172792E626F6F6B1A0D2E6C6962726172792E626F6F6B12310A0B72656D6F76655F626F6F6B12132E6C6962726172792E626F6F6B72656D6F76651A0D2E6C6962726172792E626F6F6B12370A146C6973745F617661696C61626C655F626F6F6B73120E2E6C6962726172792E456D7074791A0D2E6C6962726172792E626F6F6B300112330A0B6C6F636174655F626F6F6B120D2E6C6962726172792E626F6F6B1A152E6C6962726172792E626F6F6B6C6F636174696F6E12410A0B626F72726F775F626F6F6B12152E6C6962726172792E626F72726F776564626F6F6B1A1B2E6C6962726172792E626F72726F77426F6F6B526573706F6E7365620670726F746F33";

public isolated client class LibraryServiceClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, LIBRARY_DESC);
    }

    isolated remote function add_book(book|ContextBook req) returns book|grpc:Error {
        map<string|string[]> headers = {};
        book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/add_book", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <book>result;
    }

    isolated remote function add_bookContext(book|ContextBook req) returns ContextBook|grpc:Error {
        map<string|string[]> headers = {};
        book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/add_book", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <book>result, headers: respHeaders};
    }

    isolated remote function update_book(book|ContextBook req) returns book|grpc:Error {
        map<string|string[]> headers = {};
        book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/update_book", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <book>result;
    }

    isolated remote function update_bookContext(book|ContextBook req) returns ContextBook|grpc:Error {
        map<string|string[]> headers = {};
        book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/update_book", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <book>result, headers: respHeaders};
    }

    isolated remote function remove_book(bookremove|ContextBookremove req) returns book|grpc:Error {
        map<string|string[]> headers = {};
        bookremove message;
        if req is ContextBookremove {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/remove_book", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <book>result;
    }

    isolated remote function remove_bookContext(bookremove|ContextBookremove req) returns ContextBook|grpc:Error {
        map<string|string[]> headers = {};
        bookremove message;
        if req is ContextBookremove {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/remove_book", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <book>result, headers: respHeaders};
    }

    isolated remote function locate_book(book|ContextBook req) returns booklocation|grpc:Error {
        map<string|string[]> headers = {};
        book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/locate_book", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <booklocation>result;
    }

    isolated remote function locate_bookContext(book|ContextBook req) returns ContextBooklocation|grpc:Error {
        map<string|string[]> headers = {};
        book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/locate_book", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <booklocation>result, headers: respHeaders};
    }

    isolated remote function borrow_book(borrowedbook|ContextBorrowedbook req) returns borrowBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        borrowedbook message;
        if req is ContextBorrowedbook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/borrow_book", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <borrowBookResponse>result;
    }

    isolated remote function borrow_bookContext(borrowedbook|ContextBorrowedbook req) returns ContextBorrowBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        borrowedbook message;
        if req is ContextBorrowedbook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/borrow_book", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <borrowBookResponse>result, headers: respHeaders};
    }

    isolated remote function create_user() returns Create_userStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("library.LibraryService/create_user");
        return new Create_userStreamingClient(sClient);
    }

    isolated remote function list_available_books(Empty|ContextEmpty req) returns stream<book, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        Empty message;
        if req is ContextEmpty {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("library.LibraryService/list_available_books", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        BookStream outputStream = new BookStream(result);
        return new stream<book, grpc:Error?>(outputStream);
    }

    isolated remote function list_available_booksContext(Empty|ContextEmpty req) returns ContextBookStream|grpc:Error {
        map<string|string[]> headers = {};
        Empty message;
        if req is ContextEmpty {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("library.LibraryService/list_available_books", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        BookStream outputStream = new BookStream(result);
        return {content: new stream<book, grpc:Error?>(outputStream), headers: respHeaders};
    }
}

public client class Create_userStreamingClient {
    private grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendUser(user message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextUser(ContextUser message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveUser() returns user|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return <user>payload;
        }
    }

    isolated remote function receiveContextUser() returns ContextUser|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: <user>payload, headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public class BookStream {
    private stream<anydata, grpc:Error?> anydataStream;

    public isolated function init(stream<anydata, grpc:Error?> anydataStream) {
        self.anydataStream = anydataStream;
    }

    public isolated function next() returns record {|book value;|}|grpc:Error? {
        var streamValue = self.anydataStream.next();
        if (streamValue is ()) {
            return streamValue;
        } else if (streamValue is grpc:Error) {
            return streamValue;
        } else {
            record {|book value;|} nextRecord = {value: <book>streamValue.value};
            return nextRecord;
        }
    }

    public isolated function close() returns grpc:Error? {
        return self.anydataStream.close();
    }
}

public client class LibraryServiceBooklocationCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendBooklocation(booklocation response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextBooklocation(ContextBooklocation response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class LibraryServiceUserCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendUser(user response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextUser(ContextUser response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class LibraryServiceBookCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendBook(book response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextBook(ContextBook response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class LibraryServiceBorrowBookResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendBorrowBookResponse(borrowBookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextBorrowBookResponse(ContextBorrowBookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public type ContextBookStream record {|
    stream<book, error?> content;
    map<string|string[]> headers;
|};

public type ContextUserStream record {|
    stream<user, error?> content;
    map<string|string[]> headers;
|};

public type ContextEmpty record {|
    Empty content;
    map<string|string[]> headers;
|};

public type ContextBooklocation record {|
    booklocation content;
    map<string|string[]> headers;
|};

public type ContextBorrowedbook record {|
    borrowedbook content;
    map<string|string[]> headers;
|};

public type ContextBook record {|
    book content;
    map<string|string[]> headers;
|};

public type ContextBorrowBookResponse record {|
    borrowBookResponse content;
    map<string|string[]> headers;
|};

public type ContextBookremove record {|
    bookremove content;
    map<string|string[]> headers;
|};

public type ContextUser record {|
    user content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type borrow_book record {|
    user userid = {};
    book isbn = {};
    book name = {};
    book status = {};
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type list_available_books record {|
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type book record {|
    string isbn = "";
    string name = "";
    string author = "";
    string opt_author = "";
    string location = "";
    string status = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type locate_book record {|
    book isbn = {};
    boolean result = false;
    string location = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type add_book record {|
    book isbn = {};
    book name = {};
    book author = {};
    book opt_author = {};
    book location = {};
    book status = {};
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type borrowBookResponse record {|
    string book_response = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type Empty record {|
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type booklocation record {|
    string location = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type borrowedbook record {|
    string isbn = "";
    book name = {};
    book status = {};
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type update_book record {|
    book isbn = {};
    book name = {};
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type create_user record {|
    string userid = "";
    string username = "";
    string pw = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type remove_book record {|
    book isbn = {};
    book name = {};
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type bookremove record {|
    book isbn = {};
    book name = {};
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type user record {|
    string username = "";
    string userid = "";
    string pw = "";
|};


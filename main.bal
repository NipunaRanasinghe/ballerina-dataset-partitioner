import ballerina/io;

# Description  
class Partitioner {

    # Description
    #
    # + datasetFilePath - file path of the input dataset (in CSV format) 
    # + criterias - Parameter Description    
    # + return - Return Value Description
    public function partition(string datasetFilePath, function... criterias) returns error? {
        stream<string[], io:Error>|error csvStream = io:fileReadCsvAsStream(datasetFilePath);
        // Loop through the stream and print the content.
        if (csvStream is stream<string[], io:Error>) {
            error? e = csvStream.forEach(function(string[] val) {
                                              io:println(val);
                                          });
            // criterias.forEach(function(function criteria) {
            //     error? e = csvStream.forEach(function(string[] val) {
            //                                   io:println(val);
            //                               });
            //                   });
        } else {
            return error("Error occurred when reading dataset (.csv) file from: " + datasetFilePath + ". Error:" + 
            csvStream.message());
        }
    }
}

# Description
# + return - Return Value Description  
public function main() returns error? {

}

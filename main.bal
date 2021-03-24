import ballerina/io;

# Dataset partitioner implementation
class Partitioner {

    # Description
    #
    # + criterias - the list of partition criterias, as anonymous functions      
    # + datasetFilePath - file path of the input dataset (in CSV format) 
    # + return - error if any error occurred during the process ,or else returns nil
    public function partition(string datasetFilePath, function... criterias) returns error? {
        stream<string[], io:Error>|error csvStream = io:fileReadCsvAsStream(datasetFilePath);
        // Loop through the stream and print the content.
        if (csvStream is stream<string[], io:Error>) {
            foreach var criteria in criterias {
                error? e = csvStream.forEach(function(string[] val) {
                                             });
            }
        } else {
            return error("Error occurred when reading dataset (.csv) file from: " + datasetFilePath + ". Error:" + 
            csvStream.message());
        }
    }
}

# Description
# + return - Return Value Description  
public function main() returns error? {

    Partitioner partitioner = new Partitioner();
    error? partition = partitioner.partition("datasets/dataset1.csv", function(string[] items) returns boolean {
                                                                          float probablility = checkpanic 
                                                                          float:fromString(items[9]);
                                                                          return probablility < 0.3;
                                                                      }, function(string[] items) returns boolean {
                                                                             float probablility = checkpanic 
                                                                             float:fromString(items[9]);
                                                                             return probablility > 0.6;
                                                                         });

}

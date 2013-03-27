#import "AFIncrementalStore.h"
#import "AFRestClient.h"

@interface YelpWorksAPIClient : AFRESTClient <AFIncrementalStoreHTTPClient>

+ (YelpWorksAPIClient *)sharedClient;

@end

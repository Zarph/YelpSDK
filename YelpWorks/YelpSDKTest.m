//
//  YelpSDKTest.m
//  YelpWorks
//
//  Created by Ramiro Guerrero on 26/03/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//
#import "YelpSDKTest.h"


static NSString * const kOAuth1BaseURLString = @"http://api.yelp.com/v2/";
static NSString * const kConsumerKeyString = @"";
static NSString * const kConsumerSecretString = @"";
static NSString * const kTokenString = @"";
static NSString * const kTokenSecretString = @"-mvw";


@implementation YelpSDKTest

+ (YelpSDKTest *)sharedClient {
    static YelpSDKTest *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedClient = [[YelpSDKTest alloc] initWithBaseURL:[NSURL URLWithString:kOAuth1BaseURLString] key:kConsumerKeyString secret:kConsumerSecretString];
        
    });
    
    return _sharedClient;
}

-(void)authorizeWorks{
    AFOAuth1Token *token = [[AFOAuth1Token alloc] initWithKey:kTokenString secret:kTokenSecretString session:nil expiration:nil renewable:NO];
    
    [self acquireOAuthAccessTokenWithPath:@"http://api.yelp.com/v2/search?term=restaurants&location=new%20york" requestToken:token accessMethod:@"GET" success:^(AFOAuth1Token *accessToken) {
        
        NSLog(@"SUCCESS");
        
        [self getPath:@"http://api.yelp.com/v2/search?term=restaurants&location=new%20york" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSLog(@"SEARCH REQUEST");
            NSLog(@"Response object: %@", responseObject);
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
            
            NSLog(@"Response array: %@", json);

            //Complete with delegate call
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            
        }];
        
        
    } failure:^(NSError *error) {
    
    }];
    
    
}


//helpers
- (void)getPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
	NSMutableURLRequest *request = [self requestWithMethod:@"GET" path:path parameters:parameters];
   // [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request success:success failure:failure];
    [self enqueueHTTPRequestOperation:operation];
}



@end

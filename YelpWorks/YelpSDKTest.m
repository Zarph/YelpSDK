//
//  YelpSDKTest.m
//  YelpWorks
//
//  Created by Ramiro Guerrero on 26/03/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import "YelpSDKTest.h"

@implementation YelpSDKTest

+ (YelpSDKTest *)sharedClient {
    static YelpSDKTest *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedClient = [[YelpSDKTest alloc] initWithBaseURL:[NSURL URLWithString:@"http://api.yelp.com/v2/"] key:@"CCWA9Km2t8lC7BFRVi2IkA" secret:@"IRdQKHOEvJJGcuHz_j0zYsZaLg8"];
        
    });
    
    return _sharedClient;
}

-(void)authorizeWorks{
    AFOAuth1Token *token = [[AFOAuth1Token alloc] initWithKey:@"e7nKgPCRAIAAEts_q0YcbK_gKYDnJF5C" secret:@"CN8R7f1YA3l30GdQl1cQB7a-mvw" session:nil expiration:nil renewable:NO];
    
    [self acquireOAuthAccessTokenWithPath:@"http://api.yelp.com/v2/search?term=restaurants&location=new%20york" requestToken:token accessMethod:@"GET" success:^(AFOAuth1Token *accessToken) {
        
        NSLog(@"SUCCESS");
        
    } failure:^(NSError *error) {
        
        
        
    }];
}


@end

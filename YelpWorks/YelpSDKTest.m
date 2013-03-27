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
static NSString * const kTokenSecretString = @"";


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
        
    } failure:^(NSError *error) {
        
        
        
    }];
}


@end

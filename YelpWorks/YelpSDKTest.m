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

//General Search.

-(void)getSearchWithTerm:(NSString *)term AndLocation:(NSString *)location AndParams:(NSDictionary *)params AndWithDelegate:(NSObject <YelpDelegate> *)delegate{
    
    AFOAuth1Token *token = [[AFOAuth1Token alloc] initWithKey:kTokenString secret:kTokenSecretString session:nil expiration:nil renewable:NO];
    
    [self acquireOAuthAccessTokenWithPath:@"http://api.yelp.com/v2/search?term=restaurants&location=new%20york" requestToken:token accessMethod:@"GET" success:^(AFOAuth1Token *accessToken) {
        
        NSLog(@"SUCCESS");
        
        NSMutableDictionary *mutableParameters = [NSDictionary dictionary];
        
        if (params) 
            mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
            
        
        [mutableParameters setValue:term forKey:@"term"];
        [mutableParameters setValue:location forKey:@"location"];
        
        NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];

        [self getPath:@"http://api.yelp.com/v2/search" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
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

-(void)getSearchWithTerm:(NSString *)term AndBounds:(NSDictionary *)boundsParams AndParams:(NSDictionary *)params AndWithDelegate:(NSObject <YelpDelegate> *)delegate{
    
    AFOAuth1Token *token = [[AFOAuth1Token alloc] initWithKey:kTokenString secret:kTokenSecretString session:nil expiration:nil renewable:NO];
    
    [self acquireOAuthAccessTokenWithPath:@"http://api.yelp.com/v2/search?term=restaurants&location=new%20york" requestToken:token accessMethod:@"GET" success:^(AFOAuth1Token *accessToken) {
        
        NSLog(@"SUCCESS");
        
        NSMutableDictionary *mutableParameters = [NSDictionary dictionary];
        
        if (params)
            mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
        
        
        [mutableParameters setValue:term forKey:@"term"];
        
        NSString *boundsString = [NSString stringWithFormat:@"%@,%@|%@,%@", [boundsParams objectForKey:@"sw_latitude"],[boundsParams objectForKey:@"sw_longitude"],[boundsParams objectForKey:@"ne_latitude"],[boundsParams objectForKey:@"ne_longitude"]];
        
        [mutableParameters setValue:boundsString forKey:@"bounds"];
        
        NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
        
        [self getPath:@"http://api.yelp.com/v2/search" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
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

-(void)getSearchWithTerm:(NSString *)term AndCoordinates:(NSDictionary *)coordParams AndParams:(NSDictionary *)params AndWithDelegate:(NSObject <YelpDelegate> *)delegate{
    
    AFOAuth1Token *token = [[AFOAuth1Token alloc] initWithKey:kTokenString secret:kTokenSecretString session:nil expiration:nil renewable:NO];
    
    [self acquireOAuthAccessTokenWithPath:@"http://api.yelp.com/v2/search?term=restaurants&location=new%20york" requestToken:token accessMethod:@"GET" success:^(AFOAuth1Token *accessToken) {
        
        NSLog(@"SUCCESS");
        
        NSMutableDictionary *mutableParameters = [NSDictionary dictionary];
        
        if (params)
            mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
        
        
        [mutableParameters setValue:term forKey:@"term"];
        
        NSMutableArray *locationArray = [NSMutableArray array];
        
        [locationArray addObject:[coordParams objectForKey:@"latitude"]];
        [locationArray addObject:[coordParams objectForKey:@"longitude"]];

        if ([coordParams objectForKey:@"accuracy"])
            [locationArray addObject:[coordParams objectForKey:@"accuracy"]];
        if ([coordParams objectForKey:@"altitude"])
            [locationArray addObject:[coordParams objectForKey:@"altitude"]];
        if ([coordParams objectForKey:@"altitude_accuracy"])
                [locationArray addObject:[coordParams objectForKey:@"altitude_accuracy"]];
        
        NSString *coordinateString = [locationArray componentsJoinedByString:@","];
        
        [mutableParameters setValue:coordinateString forKey:@"ll"];
        
        NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
        
        [self getPath:@"http://api.yelp.com/v2/search" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
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

-(void)getSearchWithTerm:(NSString *)term AndLocation:(NSString *)location AndLatitude:(NSString *)latitude AndLongitude:(NSString *)longitude AndParams:(NSDictionary *)params AndWithDelegate:(NSObject <YelpDelegate> *)delegate{
    
    AFOAuth1Token *token = [[AFOAuth1Token alloc] initWithKey:kTokenString secret:kTokenSecretString session:nil expiration:nil renewable:NO];
    
    [self acquireOAuthAccessTokenWithPath:@"http://api.yelp.com/v2/search?term=restaurants&location=new%20york" requestToken:token accessMethod:@"GET" success:^(AFOAuth1Token *accessToken) {
        
        NSLog(@"SUCCESS");
        
        NSMutableDictionary *mutableParameters = [NSDictionary dictionary];
        
        if (params)
            mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
        
        
        [mutableParameters setValue:term forKey:@"term"];
        
        NSString *coordinateString = [NSString stringWithFormat:@"%@,%@", latitude, longitude];
        
        [mutableParameters setValue:coordinateString forKey:@"cll"];
        
        NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
        
        [self getPath:@"http://api.yelp.com/v2/search" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
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

-(void)getBusinessWithBusinessId:(NSString *)businessId AndParams:(NSDictionary *)params AndWithDelegate:(NSObject <YelpDelegate> *)delegate{
    
    AFOAuth1Token *token = [[AFOAuth1Token alloc] initWithKey:kTokenString secret:kTokenSecretString session:nil expiration:nil renewable:NO];
    
    [self acquireOAuthAccessTokenWithPath:@"http://api.yelp.com/v2/search?term=restaurants&location=new%20york" requestToken:token accessMethod:@"GET" success:^(AFOAuth1Token *accessToken) {
        
        NSLog(@"SUCCESS");
        
        NSMutableDictionary *mutableParameters = [NSDictionary dictionary];
        
        if (params)
            mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
            
        NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
        
        NSString *path = [NSString stringWithFormat:@"http://api.yelp.com/v2/business/%@", businessId];
        
        [self getPath:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
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

@end

//
//  YelpSDKTest.h
//  YelpWorks
//
//  Created by Ramiro Guerrero on 26/03/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import "AFOAuth1Client.h"

@interface YelpSDKTest : AFOAuth1Client

+ (YelpSDKTest *)sharedClient;
-(void)authorizeWorks;

@end

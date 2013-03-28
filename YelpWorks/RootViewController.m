//
//  RootViewController.m
//  YelpWorks
//
//  Created by Ramiro Guerrero on 27/03/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import "RootViewController.h"
#import "YelpSDKTest.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
  //  NSDictionary *bounds = [NSDictionary dictionaryWithObjectsAndKeys:@"37.900000",@"sw_latitude", @"-122.500000", @"sw_longitude", @"37.788022", @"ne_latitude", @"-122.399797", @"ne_longitude", nil];
    
    //NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:@"10", @"limit", @"1", @"offset", @"2", @"sort", @"argentine", @"category_filter", @"20000", @"radius_filter", @"false", @"deals_filter", nil];
    
    //[[YelpSDKTest sharedClient] getSearchWithTerm:@"restaurants" AndBounds:bounds AndParams:params AndWithDelegate:nil];
    
    // [[YelpSDKTest sharedClient] getSearchWithTerm:@"restaurants" AndLocation:@"Hayes" AndLatitude:@"37.77493" AndLongitude:@"-122.419415" AndParams:nil AndWithDelegate:nil];
    
    // [[YelpSDKTest sharedClient] getBusinessWithBusinessId:@"yelp-san-francisco" AndParams:nil AndWithDelegate:nil];
    
    //  [[YelpSDKTest sharedClient] getSearchWithTerm:@"food" AndLocation:@"new york" AndParams:params AndWithDelegate:nil];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

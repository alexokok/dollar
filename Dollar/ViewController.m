//
//  ViewController.m
//  Dollar
//
//  Created by user on 18.03.17.
//  Copyright © 2017 HelloWorld. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

/* получаем курс валют */
- (IBAction)getCourse:(id)sender {
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: self delegateQueue: [NSOperationQueue mainQueue]];
    
    
    NSURL * url = [NSURL URLWithString:@"https://query.yahooapis.com/v1/public/yql?q=select+*+from+yahoo.finance.xchange+where+pair+=+%22USDRUB,EURRUB%22&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback="];
    
    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithURL:url
        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                 if(error == nil)
                 {
                     NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                     
                     NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options: 0 error:&error];
                     
                     NSDictionary *results = [json objectForKey:@"query"];
                     
                     NSDictionary *rates = [results objectForKey:@"results"];
                     
                     NSArray *rate = [rates objectForKey: @"rate"];
                     
                     for(int i = 0; i < [rate count]; i++)
                     {
                         
                     }
                     
                     
                     //NSDictionary *rate = [NSJSONSerialization JSONObjectWithData:results options: 0 error:&error];
                     //NSString *rates = [rate objectForKey:@"resutls"];
                     
                     NSLog(@"Data = %@", rate);
                 }
    }];
    
    [dataTask resume];
}


@end

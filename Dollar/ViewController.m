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
    
    NSURL * url = [NSURL URLWithString:@"http://www.cbr.ru/scripts/XML_daily.asp?"];
    
    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithURL:url
                 completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                 if(error == nil)
                 {
                   NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                   NSLog(@"Data = %@", text);
                 }
    }];
    
    [dataTask resume];
}


@end

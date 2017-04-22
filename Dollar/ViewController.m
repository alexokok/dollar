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

/** индикатор при загрузке данных */
UIActivityIndicatorView *indicator;


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.RefreshButton setTitle:NSLocalizedString(@"refresh", @"to refresh") forState:UIControlStateNormal];
    
    self.dateTitle.text = NSLocalizedString(@"lastrefresh", @"to refresh");
    
    self.dollarLabel.text = NSLocalizedString(@"dollar", @"to dollar");
    
    self.euroLabel.text = NSLocalizedString(@"euro", @"to euro");
    
    [self loadCourses];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


/* получаем курс валют */
-(void)loadCourses{
    //spinner для окошка ожидания
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc]
                                        initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.center = CGPointMake(160, 240);
    spinner.hidesWhenStopped = YES;
        
    [self.view addSubview:spinner];
    [spinner startAnimating];

    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: self delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURL * url = [NSURL URLWithString:@""];
    
    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithURL:url
        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if(error != nil){
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Wait" message:@"Отсутствует подключение к сети" delegate:self cancelButtonTitle:@"Попробовать еще раз" otherButtonTitles:@"Отмена", nil];
                [alert show];
            }
            else{
                  NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options: 0 error:&error];
                  NSDictionary *results = [json objectForKey:@"query"];
                  NSDictionary *rates = [results objectForKey:@"results"];
                  NSArray *rate = [rates objectForKey: @"rate"];
                                                            
                  for(int i = 0; i < [rate count]; i++)
                  {
                    NSString *a  = [[rate objectAtIndex:i] objectForKey:@"Rate"];
                      switch (i) {
                          case 0:
                              self.dollarValue.text = a ;
                              break;
                          case 1:
                              self.euroValueLabel.text = a;
                              break;
                          default:
                              break;
                      }
                  }
                  
                 
                  NSDate *date = [NSDate date];
                  
                  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                  [formatter setDateFormat:@"dd.mm.yyyy hh:mm:ss"];
                  [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"..."]];
                  
                  self.dateValue.text = [formatter stringFromDate:date];
               }
            
               dispatch_async(dispatch_get_main_queue(), ^{
                 [spinner stopAnimating];
               });
        }];
    
    [dataTask resume];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0){
        [self loadCourses];
    }
}
- (IBAction)getCourse:(id)sender {
    [self loadCourses];
}

@end

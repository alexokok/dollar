//
//  ViewController.h
//  Dollar
//
//  Created by user on 18.03.17.
//  Copyright © 2017 HelloWorld. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *dateValue;
@property (weak, nonatomic) IBOutlet UILabel *dateTitle;
@property (weak, nonatomic) IBOutlet UILabel *dollarValue;

@property (weak, nonatomic) IBOutlet UILabel *euroLabel;

@property (weak, nonatomic) IBOutlet UILabel *euroValueLabel;

@property (weak, nonatomic) IBOutlet UILabel *dollarLabel;
@property (weak, nonatomic) IBOutlet UIButton *RefreshButton;

- (IBAction)getCourse:(id)sender;
- (void) loadCourses;
@end


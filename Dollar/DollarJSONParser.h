//
//  DollarJsonParser.h
//  Dollar
//
//  Created by user on 01.04.17.
//  Copyright © 2017 HelloWorld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DollarJsonParser : NSObject

    -(NSMutableArray *) getMoneysArray : (NSString *) json;

@end

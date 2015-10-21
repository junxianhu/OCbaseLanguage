//
//  Car.h
//  OCbaseLanguage
//
//  Created by cipher on 15/9/28.
//  Copyright (c) 2015年 com.lab1411.cipher. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
{
    int year;
    NSString *make;
    NSString *model;
}
-(void) setMake:(NSString *)aMake andModel:(NSString *)aModel andYear:(int) aYear;
-(void) printfInfo;
-(int) year;

@end

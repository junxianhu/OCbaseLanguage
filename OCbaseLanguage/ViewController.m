//
//  ViewController.m
//  OCbaseLanguage
//
//  Created by cipher on 15/9/28.
//  Copyright (c) 2015年 com.lab1411.cipher. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// 主要练习oc的各个语法


- (void)viewDidLoad {
    [super viewDidLoad];
 
    NSObject *object = [[NSObject alloc] init];
    Car *myCar = [[Car alloc] init];
    NSLog(@"object %d",sizeof(object));//8
    NSLog(@"Car %d",sizeof(myCar));//8
    
    NSLog(@"retain Count:%d",[myCar retainCount]);//关闭arc 1
    [myCar retain];
    NSLog(@"retain Count:%d",[myCar retainCount]);//2
    [myCar release];
    NSLog(@"retain Count:%d",[myCar retainCount]);//1
    
    
    
    //Foundation类 非界面类
    //NSString
    NSString *myString = @"A string constant";
    //构建
    NSString *myString2 = [NSString stringWithFormat:@"The number is %d",5];
    NSLog(@"%@",[myString2 stringByAppendingString:@"22"]);
    NSLog(@"%@",[myString2 stringByAppendingFormat:@"%d",23]);
    //长度和索引
    NSLog(@"%d",myString2.length);
    NSLog(@"%c",[myString2 characterAtIndex:5]);
    //与c字符串相互转化
    printf("%s\n",[myString2 UTF8String]);//不带时间戳
    printf("%s\n",[myString2 cStringUsingEncoding:NSUTF8StringEncoding]);
    NSLog(@"%@",[NSString stringWithCString:"hello world" encoding:NSUTF8StringEncoding]);
    //写入文件 和 从文件读取字符串
    NSString *myString3 = @"Helloworld write to file";
    NSError *error;
    NSString *path=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/file.txt"];
    if (![myString3 writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:error]) {
        NSLog(@"Error writing to file %@",[error localizedDescription]);
    }
    
    NSString *inString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:error];
    NSLog(@"%@",inString);
    
    //字符串转为数组
    NSString *myString4 =@"one two three four five six seven eight nine ten";
    NSArray *wordArray = [myString4 componentsSeparatedByString:@" "];
    NSLog(@"%@",wordArray);
    
    //根据索引子字符串
    NSString *sub1=[myString3 substringToIndex:7];
    NSString *sub2=[myString3 substringFromIndex:4];
    NSLog(@"%@\n%@",sub1,sub2);
    
    NSRange r;
    r.location = 4;
    r.length = 3;
    NSString *sub3=[myString3 substringWithRange:r];
    NSLog(@"%@",sub3);
    
    //搜索与替换字符串
    NSRange searchRange =[myString3 rangeOfString:@"to"];
    if (searchRange.location!=NSNotFound) {
        NSLog(@"range location:%d length :%d",searchRange.location,searchRange.length);
    }
    NSLog(@"%@",[myString4 stringByReplacingOccurrencesOfString:@" " withString:@"*"]);
    
    //改变大小写
    NSLog(@"%@\n%@\n%@",[myString3 uppercaseString],[myString3 lowercaseString],[myString3 capitalizedString]);
    
    //测试字符串
    NSString *s1=@"Hello World";
    NSString *s2=@"Hello Mom";
    NSLog(@"%@ %@ %@",s1,[s1 isEqualToString:s2]? @"equal":@"different",s2);
    NSLog(@"%@ %@ %@",s1,[s1 hasPrefix:@"Hello"]?@"start with":@"does not start with",@"Hello");
    NSLog(@"%@ %@ %@",s1,[s1 hasSuffix:s2]?@"end with":@"does not end with",s2);
    
    //字符串提取数字
    NSString *s3=@"3.1415926";
    NSLog(@"%d %f",[s3 intValue],[s3 doubleValue]);
    
    
    
    //数字和日期
    //使用数字 NsNumber包装类
    NSNumber *number=[NSNumber numberWithFloat:3.1415];
    NSLog(@"%d",[number intValue]);
    NSLog(@"%@",[number stringValue]);
    
    //使用日期
    NSDate *date=[NSDate date];
    NSLog(@"date:%@",[date description]);
    date = [NSDate dateWithTimeIntervalSinceNow:10.0f];//秒
    NSLog(@"date:%@",[date description]);
    
    //[NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:5.0f]];
    //延时
    //NSLog(@"slept %f seconds",[[NSDate date]timeIntervalSinceDate:date]);
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"MM/dd/YY HH:mm:ss";//注意表示
    NSString *timestamp = [formatter stringFromDate:[NSDate date]];
    NSLog(@"%@",timestamp);
    
    
    
    //集合
    //数组 字典 集
    //构建和访问数组
    NSArray *array= [NSArray arrayWithObjects:@"one",@"two",@"three",nil];
    NSLog(@"%d",array.count);
    NSLog(@"%@",[array objectAtIndex:0]);
    //可变数组
    NSMutableArray *marray=[NSMutableArray arrayWithArray:array];
    [marray addObject:@"four"];
    [marray removeObjectAtIndex:2];
    NSLog(@"%@",marray);
    //检查数组
    if ([marray containsObject:@"four"]) {
        NSLog(@"the index is %d",[marray indexOfObject:@"four"]);
    }
    //数组转字符串
    NSLog(@"%@",[array componentsJoinedByString:@" "]);
    
    
    //构建和访问字典
    //创建字典
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    [dict setObject:@"1" forKey:@"A"];
    [dict setObject:@"2" forKey:@"B"];
    [dict setObject:@"3" forKey:@"C"];
    [dict setObject:@"4" forKey:@"D"];
     NSLog(@"%@",dict);
    //搜索字典
    NSLog(@"%@",[dict objectForKey:@"A"]);
    NSLog(@"%@",[dict objectForKey:@"F"]);
    //替换删除对象
    [dict setObject:@"foo" forKey:@"C"];
    NSLog(@"%@",dict);
    [dict removeObjectForKey:@"B"];
    NSLog(@"%@",dict);
    //列出关键字
    NSLog(@"the dictionary has %d objects",[dict count]);
    NSLog(@"%@",[dict allKeys]);
    //集合写入文件
    //同字符串
    
    //构建URL
    NSString *path1=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/foo.txt"];
    NSURL *url1=[NSURL fileURLWithPath:path1];
    NSLog(@"%@",url1);
    
    NSString *urlPath=@"http://ericasadun.com";
    NSURL *url2=[NSURL URLWithString:urlPath];
    NSLog(@"%d characters read",[[NSString stringWithContentsOfURL:url2 encoding:NSUTF8StringEncoding error:error] length]);
    
    //使用NSData
    NSData *data=[NSData dataWithContentsOfURL:url2];
    NSLog(@"%d",[data length]);
    
    //文件管理
    NSFileManager *fm=[NSFileManager defaultManager];
    
    //list the file in the sandbox documents folder
    NSString *path3=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSLog(@"%@",[fm directoryContentsAtPath:path3]);
    
    //application bundle
    path3=[[NSBundle mainBundle] bundlePath];
    NSLog(@"%@",[fm directoryContentsAtPath:path]);
    
    
    //文件管理
    //create file
    NSString *docsPath=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *filePath=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/testfile"];
    NSArray *array2=[@"one two three" componentsSeparatedByString:@" "];
    [array writeToFile:filePath atomically:YES];
    NSLog(@"array2:%@",[fm directoryContentsAtPath:docsPath]);
    
    //copy file
    NSString *copyPath=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/copied"];
    if (![fm copyItemAtPath:filePath toPath:copyPath error:&error]) {
        NSLog(@"copy error:%@",[error localizedDescription]);
    }
    NSLog(@"copy:%@",[fm directoryContentsAtPath:docsPath]);
    
    //move the file
    NSString *newPath=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/renamed"];
    if (![fm moveItemAtPath:filePath toPath:newPath error:&error]) {
        NSLog(@"move error:%@",[error localizedDescription]);
    }
    NSLog(@"move:%@",[fm directoryContentsAtPath:docsPath]);
    
    //remove the file
    if (![fm removeItemAtPath:copyPath error:&error]) {
        NSLog(@"remove error:%@",[error localizedDescription]);
    }
    NSLog(@"remove:%@",[fm directoryContentsAtPath:docsPath]);
    
    
}

@end

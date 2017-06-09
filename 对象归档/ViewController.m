//
//  ViewController.m
//  对象归档
//
//  Created by 刘怀轩 on 2017/6/9.
//  Copyright © 2017年 刘怀轩. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}
/////////////////// 第一种归档方式 /////////////////////////
// 缺点:一个对象一个归档文件,不方便
// 归档
- (void)text {
    NSArray *array = @[@"123" , @"abc" , @"132"];
    // 拿到创建用户的根路径
    NSString *homePath = NSHomeDirectory();
    NSLog(@"%@" , homePath);
    NSString *path = [homePath stringByAppendingPathComponent:@"text.yaalv"];
    BOOL success = [NSKeyedArchiver archiveRootObject:array toFile:path];
    if (success) {
        NSLog(@"归档成功");
    }
}

// 解归档
- (void)text2 {
    NSString *homePath = NSHomeDirectory();
    NSLog(@"%@" , homePath);
    NSString *path = [homePath stringByAppendingPathComponent:@"text.yaalv"];
    NSArray *data = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSLog(@"%@" , data[0]);
}

// ---------------------- 第二种方法 --------------------------------
- (void)text3 {
    NSString *homePath = NSHomeDirectory();
    NSLog(@"%@" , homePath);
    NSString *filePath = [homePath stringByAppendingPathComponent:@"custom.text"];
    NSMutableData *data = [NSMutableData data];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeFloat:50.0 forKey:@"weight"];
    [archiver encodeObject:@"李四" forKey:@"name"];
    [archiver encodeInt:12 forKey:@"age"];
    [archiver finishEncoding];
    
    BOOL success = [data writeToFile:filePath atomically:YES];
    if (success) {
        NSLog(@"------归档成功");
    }
}
// 解归档
- (void)text4 {
    NSString *homePath = NSHomeDirectory();
    NSLog(@"%@" , homePath);
    NSString *filePath = [homePath stringByAppendingPathComponent:@"custom.text"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    NSString *name = [unarchiver decodeObjectForKey:@"name"];
    NSLog(@"name:%@" , name);
}

@end

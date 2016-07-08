//
//  ViewController.m
//  HGSetingBundle
//
//  Created by  易述宏 on 16/7/7.
//  Copyright © 2016年 湖南同禾. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//获取数据
-(void)getTestValue{
    
    NSUserDefaults * userDefaults =[NSUserDefaults standardUserDefaults];
    //获取修改后的文本内容(唯一标识符)
    NSString * string =[userDefaults objectForKey:@"name_preference"];
    NSLog(@"%@",string);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

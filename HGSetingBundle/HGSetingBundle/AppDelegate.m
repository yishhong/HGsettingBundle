//
//  AppDelegate.m
//  HGSetingBundle
//
//  Created by  易述宏 on 16/7/7.
//  Copyright © 2016年 湖南同禾. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self registerDefaultsFromSettingsBundle];
    [self getTestValue];
    return YES;
}

//写入默认值
-(void)registerDefaultsFromSettingsBundle{

    //获取setting.bundle
    NSString * settingsBundle =[[NSBundle mainBundle]pathForResource:@"Settings" ofType:@"bundle"];
    //判断有无setting.bundle
    if (!settingsBundle) {
        NSLog(@"Could not find Settings.bundle");
        return;
    }
    //获取setting.bundle中的plist文件
    NSDictionary * settings =[NSDictionary dictionaryWithContentsOfFile:[settingsBundle stringByAppendingPathComponent:@"Root.plist"]];
    //获取Root.plist的数据
    NSArray * Preference =[settings objectForKey:@"PreferenceSpecifiers"];
    NSMutableDictionary *defaultsToRegister =[[NSMutableDictionary alloc]initWithCapacity:[Preference count]];
    for (NSDictionary * prefSpecification in Preference) {
        NSString * key =[prefSpecification objectForKey:@"Key"];
        if (key) {
            
            [defaultsToRegister setObject:[prefSpecification objectForKey:@"DefaultValue"] forKey:@"key"];
        }
    }
    [[NSUserDefaults standardUserDefaults]registerDefaults:defaultsToRegister];
}

//获取数据
-(void)getTestValue{
    
    NSUserDefaults * userDefaults =[NSUserDefaults standardUserDefaults];
    //获取修改后的文本内容
    NSString * string =[userDefaults objectForKey:@"name_preference"];
    NSString * key =[userDefaults objectForKey:@"key"];
    NSLog(@"%@",string);
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self getTestValue];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

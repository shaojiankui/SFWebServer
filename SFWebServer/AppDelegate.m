//
//  AppDelegate.m
//  SFWebServer
//
//  Created by www.skyfox.org on 2017/6/19.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "AppDelegate.h"
#import "SFWebServer.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    SFWebServer *server = [SFWebServer startWithPort:55555];
    [server router:@"GET" path:@"/" handler:^SFWebServerRespone *(SFWebServerRequest *request) {
        NSString *index = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
        SFWebServerRespone *response = [[SFWebServerRespone alloc]initWithFile:index];
        return response;
    }];
    
    [server router:@"GET" path:@"/show.do" handler:^SFWebServerRespone *(SFWebServerRequest *request) {
        SFWebServerRespone *response = [[SFWebServerRespone alloc]initWithHTML:@"success"];
        return response;
    }];
    
    [server router:@"GET" path:@"/file/test.zip" handler:^SFWebServerRespone *(SFWebServerRequest *request) {
        NSString *index = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"zip"];
        SFWebServerRespone *response = [[SFWebServerRespone alloc]initWithDownFileName:index];
        return response;
    }];
    
    [server router:@"GET" extension:@".css" handler:^SFWebServerRespone *(SFWebServerRequest *request) {
        //        NSLog(@"request header:%@",request.headers);
        SFWebServerRespone *response = [[SFWebServerRespone alloc]initWithFileName:request.path];
        return response;
    }];
    
    [server router:@"GET" extension:@".png" handler:^SFWebServerRespone *(SFWebServerRequest *request) {
        //        NSLog(@"request header:%@",request.headers);
        SFWebServerRespone *response = [[SFWebServerRespone alloc]initWithFileName:request.path];
        return response;
    }];
    [server router:@"POST" path:@"recive.do" handler:^SFWebServerRespone *(SFWebServerRequest *request) {
        //        NSLog(@"request header:%@",request.headers);
        NSData *post = request.rawData;
        SFWebServerRespone *response = [[SFWebServerRespone alloc]initWithFileName:request.path];
        return response;
    }];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

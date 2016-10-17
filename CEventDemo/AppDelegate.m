//
//  AppDelegate.m
//  CEventDemo
//
//  Created by roshan on 11/08/15.
//  Copyright (c) 2015 Pankanis Technologies. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "EventViewController.h"
@interface AppDelegate (){
    NSString *_bar;
}
@end

@implementation AppDelegate

@dynamic foo;

-(void)setFoo:(NSString *)foo{
    _bar = foo;
}

-(NSString*)foo{
    return _bar;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSString *test = _bar;
    test = self.foo;
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    ViewController * eventVC = [[ViewController alloc]initWithNibName:NSStringFromClass([ViewController class]) bundle:nil];
/*    For UINavigation COntroller Below Code
    UINavigationController * eventNavigation = [[UINavigationController alloc]initWithRootViewController:eventVC];
    self.window.rootViewController = eventNavigation; */
    
    self.window.rootViewController = eventVC;
    
    [self getAccessToCalendar];
    
    //Below code Taken from Allegion
    if ([launchOptions objectForKey:UIApplicationLaunchOptionsURLKey]!= nil) {
        NSLog(@"%@",[launchOptions objectForKey:UIApplicationLaunchOptionsURLKey]);
    }
    
    return YES;
}
//Below method is for event url click from calendar
-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options {
    NSLog(@"%@ %@",url,options);
        EventViewController * vc = [[EventViewController alloc]init];
    
/*   Using navigation controller Below cade used
    UINavigationController * nav = (UINavigationController *)self.window.rootViewController;
    nav.viewControllers = [NSArray arrayWithObjects:nav.viewControllers[0],vc,nil]; */
    
    //For Simple Viewcontroller
    UIViewController * uvc = self.window.rootViewController;
    
    
    [uvc presentViewController:vc animated:YES completion:nil];
    return YES;
}


-(void)getAccessToCalendar
{
     self.eventStore = [[EKEventStore alloc]init];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    if ([userDefaults valueForKey:@"eventkit_events_access_granted"] != nil) {
        self.eventsAccessGranted = [[userDefaults valueForKey:@"eventkit_events_access_granted"] intValue];
    }
    else{
        self.eventsAccessGranted = NO;
    }
    
    [self.eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
        if (error == nil) {
            self.eventsAccessGranted = granted;
            }
        else{
            // In case of error, just log its description to the debugger.
            NSLog(@"%@", [error localizedDescription]);
        }
    }];
}

+(AppDelegate *)sharedInstance
{
    return [UIApplication sharedApplication].delegate;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
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

//
//  AppDelegate.m
//  Computop-demo
//
//  Created by Thomas Segkoulis on 13/09/16.
//  Copyright © 2016 Exozet Berlin GmbH. All rights reserved.
//

#import "AppDelegate.h"
#import<Computop/Computop.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    CMPConfiguration.merchantID      = @"YOUR_MERCHANT_ID";
    CMPConfiguration.merchantAppleID = @"YOUR_APPLE_MERCHANT_ID";
    CMPConfiguration.authURL         = @"YOUR_AUTH_URL";
    
    CMPConfiguration.WeChat->applicationID = @"YOUR_APP_ID";
    CMPConfiguration.WeChat->key = @"YOUR_WECHAT_KEY";
    CMPConfiguration.WeChat->mchID = @"YOUR_WECHAT_MERCHANTID";
    CMPConfiguration.WeChat->subMchID = @"YOUR_WECHAT_SUBMERCHANTID";
    
    return YES;
}


- init
{
    self = [super init];
    if (!self) return nil;

    
    return self;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return  [CMPConfiguration handleOpenURL: url];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return  [CMPConfiguration handleOpenURL: url];
}


- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
 
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end

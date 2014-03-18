//
//  AppDelegate.m
//  National Parks
//
//  Created by Student on 3/17/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "AppDelegate.h"
#import "Park.h"
#import "DataStore.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self loadParks];
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


-(void) loadParks{
    NSMutableArray *locations = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"nps_parks" ofType:@"csv"];
    
    
    
    NSError *error;
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    
    if(error){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error loading CSV file"
                                                    message: [error description]
                                                    delegate:self
                                                    cancelButtonTitle:nil
                                                    otherButtonTitles:@":-(", nil];
        [alert show];
    }else{
       // NSLog(@"%@",content);
        // "split" - make each line an element in an array
        NSArray *lines = [content componentsSeparatedByString:@"\n"];
        
        // make the array mutable
        NSMutableArray *lines2 = [NSMutableArray arrayWithArray: lines];
        
        // get rid of the first element (it has field names)
        [lines2 removeObjectAtIndex:0];
        NSMutableDictionary *dictionary;
        
        // loop through array of strings
        for (NSString *string in lines2) {
            // "split" again to get an array of strings
            // for the current line (record)
            NSArray *line = [string componentsSeparatedByString:@","];
            // create a new dictionary
            // dictionaries are handy for keyed ("named") data
            dictionary = [NSMutableDictionary dictionary];
            // add keys and values to the dictionary
            dictionary[@"name"] = line[0];
            dictionary[@"latitude"] = line[1];
            dictionary[@"longitude"] =line[2];
            dictionary[@"state"] =line[3];
            // we’re ignoring the rest of the fields
            // add dictionary to array
            [locations addObject: dictionary];
            
            // loop and read the next line
        }
        
        //NSLog(@"locations = %@", locations);
        NSMutableArray *parks = [NSMutableArray array];
        Park *park;
        
        // loop through the locations array
        // this "for-in" loop is called "fast enumeration"
        for (NSDictionary *dictionary in locations) {
            NSString *name = dictionary[@"name"];
            float latitude = [dictionary[@"latitude"] floatValue];
            float longitude = [dictionary[@"longitude"] floatValue];
            NSString *state = dictionary[@"state"];
            park = [[Park alloc] initWithName: name latitude: latitude
                                    longitude: longitude state: state];
            
            [parks addObject: park];
        }
        
        //NSLog(@"parks = %@", parks);
        [DataStore sharedStore].allItems  = parks;
    }
    
}











@end

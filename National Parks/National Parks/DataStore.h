//
//  DataStore.h
//  National Parks
//
//  Created by Student on 3/18/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface DataStore : NSObject
@property (nonatomic) NSMutableArray *allItems;

+ (instancetype)sharedStore;
@end

//
//  AZDataSource.m
//  Alan
//
//  Created by Alan on 2/05/13.
//  Copyright (c) 2013 Alan Zeino. All rights reserved.
//

#import "AZDataSource.h"

#import "AZSection.h"

#define kJSONFileName @"sections"
#define kJSONType @"json"

@interface AZDataSource ()

+ (NSArray *)_convertedSectionsFromArray:(NSArray *)jsonArray;

@end

@implementation AZDataSource

#pragma mark - Private

+ (NSArray *)_convertedSectionsFromArray:(NSArray *)jsonArray
{
    NSMutableArray *ma = [[NSMutableArray alloc] initWithCapacity:jsonArray.count];
    for (NSDictionary *d in jsonArray)
    {
        [ma addObject:[[AZSection alloc] initWithJSON:d]];
    }
    
    return ma;
}

#pragma mark - Public

+ (NSArray *)sections
{
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:kJSONFileName ofType:kJSONType];
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    
    NSError *cachedJSONError = nil;
    NSArray *json = [NSJSONSerialization JSONObjectWithData:jsonData
                                                    options:0
                                                      error:&cachedJSONError];
    
    if (!json)
    {
        NSLog(@"cachedJSONError: %@", [cachedJSONError localizedDescription]); return nil;
    }
    else
    {
        return [AZDataSource _convertedSectionsFromArray:json];
    }
}

@end

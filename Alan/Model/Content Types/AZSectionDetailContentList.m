//
//  AZSectionDetailContentList.m
//  Alan
//
//  Created by Alan on 2/05/13.
//  Copyright (c) 2013 Alan Zeino. All rights reserved.
//

#import "AZSectionDetailContentList.h"

@implementation AZSectionDetailContentListObject

- (id)initWithJSON:(id)json
{
    self = [super init];
    if (self)
    {
        _title = [json valueForKey:@"title"];
        _subtitle = [json valueForKey:@"subtitle"];
        _supplementary = [json valueForKey:@"supplementary"];
    }
    return self;
}


@end

@interface AZSectionDetailContentList ()

+ (NSArray *)_convertedContentObjectsFromArray:(NSArray *)jsonArray;

@end

@implementation AZSectionDetailContentList

#pragma mark - Private

+ (NSArray *)_convertedContentObjectsFromArray:(NSArray *)jsonArray
{
    NSMutableArray *ma = [[NSMutableArray alloc] initWithCapacity:jsonArray.count];
    for (NSDictionary *d in jsonArray)
    {
        [ma addObject:[[AZSectionDetailContentListObject alloc] initWithJSON:d]];
    }
    
    return ma;
}

#pragma mark - Public

- (id)initWithJSON:(id)json
{
    self = [super init];
    if (self)
    {
        _listObjects = [AZSectionDetailContentList _convertedContentObjectsFromArray:json];
    }
    return self;
}

@end

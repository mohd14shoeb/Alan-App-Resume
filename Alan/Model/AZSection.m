//
//  AZSection.m
//  Alan
//
//  Created by Alan on 2/05/13.
//  Copyright (c) 2013 Alan Zeino. All rights reserved.
//

#import "AZSection.h"

#import "AZSectionDetail.h"

@implementation AZSection

- (id)initWithJSON:(id)json
{
    self = [super init];
    if (self)
    {
        _title = [json valueForKey:@"title"];
        _sectionDetail = [[AZSectionDetail alloc] initWithJSON:json];
        _sectionDetail.section = self;
    }
    return self;
}

@end

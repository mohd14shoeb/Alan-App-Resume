//
//  AZSectionDetailContentApps.m
//  Alan
//
//  Created by Alan on 2/05/13.
//  Copyright (c) 2013 Alan Zeino. All rights reserved.
//

#import "AZSectionDetailContentApps.h"

@implementation AZSectionDetailContentApps

- (id)initWithJSON:(id)json
{
    self = [super init];
    if (self)
    {
        _appIds = (NSArray *)json;
    }
    return self;
}

@end

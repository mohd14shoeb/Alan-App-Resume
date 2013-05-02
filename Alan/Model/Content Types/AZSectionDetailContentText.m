//
//  AZSectionDetailContentText.m
//  Alan
//
//  Created by Alan on 2/05/13.
//  Copyright (c) 2013 Alan Zeino. All rights reserved.
//

#import "AZSectionDetailContentText.h"

@implementation AZSectionDetailContentText

- (id)initWithJSON:(id)json
{
    self = [super init];
    if (self)
    {
        _text = (NSString *)json;
    }
    return self;
}

@end

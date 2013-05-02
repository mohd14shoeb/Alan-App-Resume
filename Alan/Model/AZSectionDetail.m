//
//  AZSectionDetail.m
//  Alan
//
//  Created by Alan on 2/05/13.
//  Copyright (c) 2013 Alan Zeino. All rights reserved.
//

#import "AZSectionDetail.h"

#import "AZSectionDetailContentApps.h"
#import "AZSectionDetailContentList.h"
#import "AZSectionDetailContentText.h"

@interface AZSectionDetail ()

+ (AZSectionType)sectionTypeForNumber:(NSNumber *)number;
+ (id)detailForType:(AZSectionType)type withContent:(id)content;

@end

@implementation AZSectionDetail

#pragma mark - Private

+ (AZSectionType)sectionTypeForNumber:(NSNumber *)number
{
    switch (number.integerValue)
    {
        case AZSectionTypeApps: return AZSectionTypeApps;
        case AZSectionTypeText: return AZSectionTypeText;
        case AZSectionTypeList: return AZSectionTypeList;
        default: return AZSectionTypeUnknown;
    }
}

+ (id)detailForType:(AZSectionType)type withContent:(id)content
{
    switch (type)
    {
        case AZSectionTypeApps: return [[AZSectionDetailContentApps alloc] initWithJSON:content];
        case AZSectionTypeText: return [[AZSectionDetailContentText alloc] initWithJSON:content];
        case AZSectionTypeList: return [[AZSectionDetailContentList alloc] initWithJSON:content];
        default: return nil;
    }
}

#pragma mark - Instance

- (id)initWithJSON:(id)json
{
    self = [super init];
    if (self)
    {
        _type = [AZSectionDetail sectionTypeForNumber:[json valueForKey:@"type"]];
        _detail = [AZSectionDetail detailForType:_type withContent:[json valueForKey:@"content"]];
    }
    return self;
}


@end

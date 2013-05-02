//
//  AZSectionDetail.h
//  Alan
//
//  Created by Alan on 2/05/13.
//  Copyright (c) 2013 Alan Zeino. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AZSection;

typedef NS_ENUM(NSUInteger, AZSectionType)
{
    AZSectionTypeApps = 0,
    AZSectionTypeText,
    AZSectionTypeList,
    AZSectionTypeUnknown
};

@interface AZSectionDetail : NSObject

@property (assign, nonatomic) AZSectionType type;
@property (strong, nonatomic) id detail;

@property (weak, nonatomic) AZSection *section;

- (id)initWithJSON:(id)json;

@end

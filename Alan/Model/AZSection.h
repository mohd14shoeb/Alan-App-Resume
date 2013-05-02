//
//  AZSection.h
//  Alan
//
//  Created by Alan on 2/05/13.
//  Copyright (c) 2013 Alan Zeino. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AZSectionDetail;

@interface AZSection : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) AZSectionDetail *sectionDetail;

- (id)initWithJSON:(id)json;

@end

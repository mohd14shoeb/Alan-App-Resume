//
//  AZSectionDetailContentList.h
//  Alan
//
//  Created by Alan on 2/05/13.
//  Copyright (c) 2013 Alan Zeino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AZSectionDetailContentListObject : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *subtitle;
@property (strong, nonatomic) NSString *supplementary;

- (id)initWithJSON:(id)json;

@end

@interface AZSectionDetailContentList : NSObject

@property (strong, nonatomic) NSArray *listObjects; // NSArray<AZSectionDetailContentListObject>

- (id)initWithJSON:(id)json;

@end

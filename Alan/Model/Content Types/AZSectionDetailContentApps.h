//
//  AZSectionDetailContentApps.h
//  Alan
//
//  Created by Alan on 2/05/13.
//  Copyright (c) 2013 Alan Zeino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AZSectionDetailContentApps : NSObject

@property (strong, nonatomic) NSArray *appIds; // NSArray<NSNumber>

- (id)initWithJSON:(id)json;

@end

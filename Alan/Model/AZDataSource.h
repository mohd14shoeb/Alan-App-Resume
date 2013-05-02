//
//  AZDataSource.h
//  Alan
//
//  Created by Alan on 2/05/13.
//  Copyright (c) 2013 Alan Zeino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AZSection : NSObject

@property (strong, nonatomic) NSString *title;

- (id)initWithTitle:(NSString *)title;

@end

@interface AZDataSource : NSObject

+ (NSArray *)sections;

@end

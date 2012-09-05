//
//  Result.h
//  Netmera
//
//  Created by Serhat SARI on 9/3/12.
//  Copyright (c) 2012 Serhat SARI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Result : NSObject

@property(nonatomic,setter = setMin:)double min;

@property(nonatomic,setter = setMax:)double max;

@property(nonatomic,setter = setAverage:)double average;

@property(nonatomic,retain)NSMutableArray *allResults;





@end

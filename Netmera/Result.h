//
//  Result.h
//  Netmera
//
//  Created by metin ogtem on 17.07.2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Result : NSObject

@property(nonatomic,setter = setMin:)double min;

@property(nonatomic,setter = setMax:)double max;

@property(nonatomic,setter = setAverage:)double average;

@property(nonatomic,retain)NSMutableArray *allResults;





@end

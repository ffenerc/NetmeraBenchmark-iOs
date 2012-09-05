//
//  Result.m
//  Netmera
//
//  Created by Serhat SARI on 9/3/12.
//  Copyright (c) 2012 Serhat SARI. All rights reserved.
//

#import "Result.h"

@implementation Result

@synthesize max,min,average,allResults;

-(void)setMax:(double)max{
    self->max=[[[NSString stringWithFormat:@"%f",max] substringToIndex:5] doubleValue];
    
}

-(void)setMin:(double)min{

    self->min=[[[NSString stringWithFormat:@"%f",min] substringToIndex:5] doubleValue];

}

-(void)setAverage:(double)average{

    self->average=[[[NSString stringWithFormat:@"%f",average] substringToIndex:5] doubleValue];


}

@end

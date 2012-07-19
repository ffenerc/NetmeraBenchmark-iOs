//
//  BenchmarkResult.h
//  Netmera
//
//  Created by metin ogtem on 19.07.2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BenchmarkResult : UIViewController<UITextFieldDelegate>

@property (retain, nonatomic) IBOutlet UILabel *searchType;
@property (retain, nonatomic) IBOutlet UILabel *netmeraMin;
@property (retain, nonatomic) IBOutlet UILabel *netmeraMax;
@property (retain, nonatomic) IBOutlet UILabel *netmeraAverage;
@property (retain, nonatomic) IBOutlet UILabel *parseMin;
@property (retain, nonatomic) IBOutlet UILabel *parseMax;
@property (retain, nonatomic) IBOutlet UILabel *parseAverage;
@property (retain, nonatomic) IBOutlet UILabel *stackmobMin;
@property (retain, nonatomic) IBOutlet UILabel *stackmobMax;
@property (retain, nonatomic) IBOutlet UILabel *stackmobAverage;
@property (retain, nonatomic) IBOutlet UITextField *mail;

@property(nonatomic,retain)NSDictionary *resultDictionary;

-(void)setBenckmarkResults:(NSDictionary*)dictionary;
- (IBAction)saveResults:(id)sender;
- (IBAction)back:(id)sender;

@end

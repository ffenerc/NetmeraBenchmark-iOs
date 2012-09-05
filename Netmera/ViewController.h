//
//  ViewController.h
//  Netmera
//
//  Created by Serhat SARI on 9/3/12.
//  Copyright (c) 2012 Serhat SARI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Netmera/Netmera.h"
#import "Parse/Parse.h"
#import "Result.h"

@interface ViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>

@property(nonatomic,retain)IBOutlet UIProgressView *progresView;
@property(nonatomic,retain)IBOutlet UIPickerView *pickerView;

@property (retain, nonatomic) IBOutlet UITextField *callNumberTextField;
@property (retain,nonatomic)IBOutlet UILabel *workingOnLabel;
@property (retain, nonatomic) IBOutlet UISwitch *netmeraSwitch;
@property (retain, nonatomic) IBOutlet UISwitch *parseSwitch;
@property (retain, nonatomic) IBOutlet UISwitch *stackmobSwitch;
- (IBAction)submit:(id)sender;
- (IBAction)cancel:(id)sender;
@property(nonatomic,retain)NSArray *functionTypeArray;
@property(nonatomic,retain)NSString *functionType;

@property(nonatomic,retain)NSString *platform;

@property(nonatomic)BOOL isNetmera;
@property(nonatomic)BOOL isParse;
@property(nonatomic)BOOL isStackmob;

@property(nonatomic)int callNumber;

@property(nonatomic)BOOL startProgres;

@property(nonatomic)float progressBarStatus;


-(void)publishProgress:(float)progres;

-(Result*)netmeraSearch;
-(Result*)parseSearch;
-(Result*)stackmobSearch;

-(Result*)netmeraGET;
-(Result*)parseGET;
-(Result*)stackmobGET;

-(Result*)netmeraCreate;
-(Result*)parseCreate;
-(Result*)stackmobCreate;




@end

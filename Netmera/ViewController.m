//
//  ViewController.m
//  Netmera
//
//  Created by Serhat SARI on 9/3/12.
//  Copyright (c) 2012 Serhat SARI. All rights reserved.
//

#import "ViewController.h"

#import "Parse/Parse.h"
#import "TestConstants.h"
#import "BenchmarkConstants.h"
#import "Netmera/Netmera.h"
#import "Result.h"
#import "StackMob.h"
#import "BenchmarkResult.h"


@implementation ViewController
@synthesize callNumberTextField;
@synthesize netmeraSwitch;
@synthesize parseSwitch;
@synthesize stackmobSwitch;
@synthesize progresView;
@synthesize pickerView;
@synthesize functionTypeArray;
@synthesize functionType;
@synthesize isParse;
@synthesize isNetmera;
@synthesize isStackmob;
@synthesize callNumber;
@synthesize platform;
@synthesize startProgres;
@synthesize progressBarStatus;
@synthesize workingOnLabel;

- (IBAction)submit:(id)sender {
    
    isNetmera = netmeraSwitch.isOn;
    isParse = parseSwitch.isOn;
    isStackmob = stackmobSwitch.isOn;
   
    BOOL iscallnumber = NO;
    
    @try {
        callNumber = [[callNumberTextField text] intValue];
        iscallnumber = YES;
    }
    @catch (NSException *exception) {
        callNumber = 10;
        [callNumberTextField setText:@"10"];
    }
    
    [progresView setProgress:0 animated:NO];
    startProgres = NO;

    
    
    if ((isNetmera || isParse || isStackmob ) && iscallnumber) {
        startProgres = YES;
        [self doBenchmark];
        
    }
    

}

-(void)doBenchmark{

    NSLog(@"do Benchmark");
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       
        dispatch_async(dispatch_get_main_queue(), ^{
           
            if (startProgres) {
                NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init]; 
            
                if (functionType == SEARCH) {
                    
                    if (isNetmera) {//NETMERA SEARCH
                        
                        Result *result = [self netmeraSearch];
                       [dictionary setValue:result forKey:NETMERA];
                    
                    }

                                       
                    if (isParse) {//PARSE SEARCH
                        
                        Result *result = [self parseSearch];
                        [dictionary setValue:result forKey:PARSE];

                    }
                   
                    
                    if (isStackmob) {//STACKMOB SEARCH
                        
                       Result *result = [self stackmobSearch];
                        [dictionary setValue:result forKey:STACKMOB];
                        
                    }
                    
                }else if (functionType == GETT){
                
                    if (isNetmera) {//NETMERA GET
                        
                       Result *result = [self netmeraGET];
                        [dictionary setValue:result forKey:NETMERA];                         
                    }
                    
                    if (isParse) {//PARSE GET
                        
                       Result *result = [self parseGET];
                        [dictionary setValue:result forKey:PARSE];                     
                    }
                    
                    if (isStackmob) {//STACKMOB GET
                        
                       Result *result = [self stackmobGET];
                        [dictionary setValue:result forKey:STACKMOB];
                        
                    }
                    
                }else if (functionType == CREATE){
                    
                    if (isNetmera) {//NETMERA CREATE
                        
                       Result *result = [self netmeraCreate];
                        [dictionary setValue:result forKey:NETMERA];
                        
                    }
                    
                    if (isParse) {//PARSE CREATE
                        
                        //Result *result=[[Result alloc]init];
                       Result *result = [self parseCreate];
                        [dictionary setValue:result forKey:PARSE];
                        
                    }
                    
                    if (isStackmob) {//STACKMOB CREATE
                        
                       Result *result = [self stackmobCreate];
                        [dictionary setValue:result forKey:STACKMOB];
                        
                    }
                    
                }else if (functionType == MEDIA){
                    
                    if (isNetmera) {//NETMERA CREATE
                        
                        Result *result = [self netmeraMedia];
                        [dictionary setValue:result forKey:NETMERA];
                        
                    }
                    
                    if (isParse) {//PARSE CREATE
                        
                        //Result *result=[[Result alloc]init];
                        Result *result = [self parseMedia];
                        [dictionary setValue:result forKey:PARSE];
                        
                    }
                    
                    if (isStackmob) {//STACKMOB CREATE
                        
                        Result *result = [self stackmobMedia];
                        [dictionary setValue:result forKey:STACKMOB];
                        
                    }
                    
                }
                
                [dictionary setValue:[NSNumber numberWithInt:callNumber] forKey:NUMBER_OF_CALLS];
                [dictionary setValue:functionType forKey:FUNCTION_TYPE];
                
                if (startProgres) {
                    BenchmarkResult *benchmarkResult = [[BenchmarkResult alloc]init];
                    [benchmarkResult setResultDictionary:dictionary];
                    [self presentModalViewController:benchmarkResult animated:YES];
                    [benchmarkResult release];
                }
                [dictionary release];
            }
           
        });
    });
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    isParse = NO;
    isNetmera = NO;
    isStackmob = NO;
    callNumber = 0;
    startProgres = NO;
    progressBarStatus = 0;
    
    platform = [[NSString alloc]init];
    functionTypeArray = [[NSArray alloc]initWithObjects:@"Search",@"Get",@"Create",@"Media", nil];
    functionType = [[NSString alloc]initWithString:[functionTypeArray objectAtIndex:0]];
    
    [Parse setApplicationId:@"bP6qfqMGd1C2AgAVITHMzxtYkaqlb7dnJYRIlNe4"
                  clientKey:@"vAP8sVehg56B5qenVrzqJbhxDYlDILgbR729yKBT"];
       

}



-(Result*)stackmobCreate{
    
    Result *result = [[[Result alloc]init] autorelease];
    double totalDifference = 0, max = 0, min = 9999, difference = 0;
    NSMutableArray *allTotalResults = [[[NSMutableArray alloc] init] autorelease];
    platform = STACKMOB ;
    
    for (int i = 0; i < callNumber; i++) {
        
        if (startProgres == NO) {
            return nil;
        }
        
        progressBarStatus = (float)i / callNumber;
        
        [progresView setProgress:progressBarStatus animated:YES];
         
        [self publishProgress:progressBarStatus];
        
        
         NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
         
         [dictionary setValue:[NSNumber numberWithInt:22] forKey:@"age"];
         [dictionary setValue:@"metin" forKey:@"name"];
         [dictionary setValue:[NSNumber numberWithInt:11] forKey:@"order"];
         [dictionary setValue:@"user" forKey:@"type"];
         [dictionary setValue:[NSNumber numberWithInt:1332] forKey:@"userid"];
         
        
        
        double startTime = CFAbsoluteTimeGetCurrent();
        __block double endTime = 0;
        
        __block  BOOL stackmobDone = NO;
        
        
        [[StackMob stackmob] post:@"testobjectios"
                    withArguments:dictionary andCallback:^(BOOL success, id result){
                        
                        
                        endTime = CFAbsoluteTimeGetCurrent();
                        stackmobDone = YES;
                        
                        
                    }];
        
        
        while (stackmobDone == NO) {
            
            NSDate* futureDate = [NSDate dateWithTimeInterval:0.001 sinceDate:[NSDate date]];
            [[NSRunLoop currentRunLoop] runUntilDate:futureDate];            
        }
        
        difference = endTime - startTime;
        [allTotalResults addObject:[NSNumber numberWithDouble:difference]];
        totalDifference += difference;
        
        if (difference < min) {
            min = difference;
        }
        if (difference > max) {
            max = difference;
        }
        NSLog(@"%i .Stackmob-CREATE : %f",i,difference);
        
    }
    [self publishProgress:1];  
    
    NSLog(@"Genereal Stackmob CREATE Result : %f",totalDifference);
    result.average = totalDifference / callNumber;
    result.max = max;
    result.min = min;
    result.allResults = allTotalResults;
        
    return result;
    
    
}

-(Result*)parseCreate{
    
    Result *result = [[[Result alloc]init] autorelease];
    double totalDifference = 0, max = 0, min = 9999, difference = 0;
    NSMutableArray *allTotalResults=[[[NSMutableArray alloc] init] autorelease];
    platform = PARSE ;
    
    
    for (int i=0; i < callNumber; i++) {
        
        if (startProgres == NO) {
            return nil;
        }
        
        progressBarStatus =(float)i/callNumber;
        
        [progresView setProgress:progressBarStatus animated:YES];
         
        [self publishProgress:progressBarStatus];
        
        
        PFObject *parseObject = [PFObject objectWithClassName:CREATE_OBJECT_NAME];
        [parseObject setObject:[NSNumber numberWithInt:222] forKey:@"userId"];
        [parseObject setObject:@"Metin" forKey:@"name"];
        [parseObject setObject:[NSNumber numberWithInt:33] forKey:@"age"];
        [parseObject setObject:@"user" forKey:@"type"];
        [parseObject setObject:[NSNumber numberWithInt:11] forKey:@"order"];
       
        NSError *error = nil;
        
        double startTime = CFAbsoluteTimeGetCurrent();
        
        [parseObject save:&error];
        
        double endTime = CFAbsoluteTimeGetCurrent();
        
        if (error) {
            return nil;
        }
        
        difference = endTime - startTime;
        [allTotalResults addObject:[NSNumber numberWithDouble:difference]];
        totalDifference += difference;
        
        if (difference < min) {
            min = difference;
        }
        if (difference > max) {
            max = difference;
        }
        NSLog(@"%i .Parse-CREATE : %f",i,difference);
        
    }
    [self publishProgress:1];  
    
    NSLog(@"Genereal Parse CREATE Result : %f",totalDifference);
    result.average = totalDifference / callNumber;
    result.max = max;
    result.min = min;
    result.allResults = allTotalResults;

    return result;
    
}


-(Result*)netmeraCreate{
  
    Result *result = [[[Result alloc]init] autorelease];
    double totalDifference = 0, max = 0, min = 9999, difference = 0;
    NSMutableArray *allTotalResults=[[[NSMutableArray alloc] init] autorelease];
    platform = NETMERA ;
    
    
    for (int i=0; i < callNumber; i++) {
        
        if (startProgres == NO) {
            return nil;
        }
        
        progressBarStatus = (float)i / callNumber;
        
        [progresView setProgress:progressBarStatus animated:YES];
         
        [self publishProgress:progressBarStatus];
        
        NetmeraContent *content = [[[NetmeraContent alloc]initWithObjectName:CREATE_OBJECT_NAME] autorelease];
        [content add:@"age" object:[NSNumber numberWithInt:10]];
        [content add:@"name" object:@"metin"];
        [content add:@"order" object:[NSNumber numberWithInt:3]];
        [content add:@"type" object:@"user"];
        [content add:@"userid" object:@"metin"];
        
        NSError *error = nil;
                
        double startTime = CFAbsoluteTimeGetCurrent();
        [content create:&error];
        
        double endTime = CFAbsoluteTimeGetCurrent();
        
        if (error) {
            return nil;
        }
        
        difference = endTime - startTime;
        [allTotalResults addObject:[NSNumber numberWithDouble:difference]];
        totalDifference += difference;
        
        if (difference < min) {
            min = difference;
        }
        if (difference > max) {
            max = difference;
        }
        NSLog(@"%i .Netmera-CREATE : %f",i,difference);
    }
    [self publishProgress:1];  
    
    NSLog(@"Genereal Netmera CREATE Result : %f",totalDifference);
    result.average = totalDifference / callNumber;
    result.max = max;
    result.min = min;
    result.allResults = allTotalResults;
    
    return result;

}


-(Result*)stackmobGET{
    
    Result *result = [[[Result alloc]init] autorelease];
    double totalDifference = 0, max = 0, min = 9999, difference = 0;
    NSMutableArray *allTotalResults=[[[NSMutableArray alloc] init] autorelease];
    platform = STACKMOB ;
    
    for (int i=0; i < callNumber; i++) {
        
        if (startProgres == NO) {
            return nil;
        }
        
        progressBarStatus =(float)i/callNumber;
        
        [progresView setProgress:progressBarStatus animated:YES];
         
        [self publishProgress:progressBarStatus];
      
        
        double startTime = CFAbsoluteTimeGetCurrent();
        __block double endTime = 0;
        
        __block  BOOL stackmobDone = NO;
        
        [[StackMob stackmob]get:STACKMOB_GET_ID withCallback:^(BOOL success, id result) {
           
            
            endTime=CFAbsoluteTimeGetCurrent();
            stackmobDone = YES;
            

        }];
        
       
    
        while (stackmobDone == NO) {
            
            NSDate* futureDate = [NSDate dateWithTimeInterval:0.001 sinceDate:[NSDate date]];
            [[NSRunLoop currentRunLoop] runUntilDate:futureDate];            
        }
        
        difference = endTime - startTime;
        [allTotalResults addObject:[NSNumber numberWithDouble:difference]];
        totalDifference += difference;
        
        if (difference < min) {
            min = difference;
        }
        if (difference > max) {
            max = difference;
        }
        NSLog(@"%i .Stackmob-GET : %f",i,difference);
        
    }
    [self publishProgress:1];  
    
    NSLog(@"Genereal Stackmob GET Result : %f",totalDifference);
    result.average = totalDifference / callNumber;
    result.max = max;
    result.min = min;
    result.allResults = allTotalResults;
    
    return result;
    
}


-(Result*)netmeraGET{
    
    Result *result = [[[Result alloc]init] autorelease];
    double totalDifference = 0, max = 0, min = 9999, difference = 0;
    NSMutableArray *allTotalResults=[[[NSMutableArray alloc] init] autorelease];
    platform = NETMERA ;
    
    
    for (int i=0; i < callNumber; i++) {
        
        if (startProgres == NO) {
            return nil;
        }
        
        progressBarStatus = (float)i / callNumber;
        
        [progresView setProgress:progressBarStatus animated:YES];
         
        [self publishProgress:progressBarStatus];
        
        
        NetmeraService *service=[[[NetmeraService alloc]initWithName:GET_SERVICE_NAME] autorelease];
        service.path=NETMERA_GET_PATH;
        
        NSError *error = nil;
        
        double startTime = CFAbsoluteTimeGetCurrent();
        [service get:&error];
        
        double endTime = CFAbsoluteTimeGetCurrent();
        
        if (error) {
            return nil;
        }
        
        difference = endTime - startTime;
        [allTotalResults addObject:[NSNumber numberWithDouble:difference]];
        totalDifference += difference;
        
        if (difference < min) {
            min = difference;
        }
        if (difference > max) {
            max = difference;
        }
        NSLog(@"%i .Netmera-GET : %f",i,difference);
    }
    [self publishProgress:1];  
    
    NSLog(@"Genereal Netmera GET Result : %f",totalDifference);
    result.average = totalDifference / callNumber;
    result.max = max;
    result.min = min;
    result.allResults = allTotalResults;

    return result;

}



-(Result*)parseGET{
    
    Result *result = [[[Result alloc]init] autorelease];
    double totalDifference = 0, max = 0, min = 9999, difference = 0;
    NSMutableArray *allTotalResults=[[[NSMutableArray alloc] init] autorelease];
    platform = PARSE ;

    
    for (int i=0; i < callNumber; i++) {
        
        if (startProgres == NO) {
            return nil;
        }
        
        progressBarStatus = (float)i / callNumber;
        
        [progresView setProgress:progressBarStatus animated:YES];
         
        [self publishProgress:progressBarStatus];
        
        
        PFQuery *query=[PFQuery queryWithClassName:GET_SERVICE_NAME];
        
        NSError *error = nil;
        
        double startTime = CFAbsoluteTimeGetCurrent();
        
        [query getObjectWithId:PARSE_GET_ID error:&error];  
        
         
        double endTime = CFAbsoluteTimeGetCurrent();
        
        if (error) {
            return nil;
        }
             
        difference = endTime - startTime;
        [allTotalResults addObject:[NSNumber numberWithDouble:difference]];
        totalDifference += difference;
        
        if (difference < min) {
            min = difference;
        }
        if (difference > max) {
            max = difference;
        }
        NSLog(@"%i .Parse-GET : %f",i,difference);
        
    }
    [self publishProgress:1];  
    
    NSLog(@"Genereal Parse GET Result : %f",totalDifference);
    result.average = totalDifference / callNumber;
    result.max = max;
    result.min = min;
    result.allResults = allTotalResults;
        
    return result;

}

-(Result*)stackmobSearch{
    
    Result *result = [[[Result alloc]init] autorelease];
    double totalDifference = 0, max = 0, min = 9999, difference = 0;
    NSMutableArray *allTotalResults=[[[NSMutableArray alloc] init] autorelease];
    platform = STACKMOB ;
    
    for (int i=0; i < callNumber; i++) {
        
        if (startProgres == NO) {
            return nil;
        }
        
        progressBarStatus =(float)i/callNumber;
        
        [progresView setProgress:progressBarStatus animated:YES];
         
        [self publishProgress:progressBarStatus];
        
        
        StackMobQuery *query=[StackMobQuery query];
        [query field:@"age" mustBeGreaterThanValue:[NSNumber numberWithInt:1]];

                
        double startTime = CFAbsoluteTimeGetCurrent();
        __block double endTime = 0;
        
      __block  BOOL stackmobDone = NO;
        
        [[StackMob stackmob]get:SEARCH_SERVICE_NAME withQuery:query andCallback:^(BOOL success, id result) {
            
            endTime=CFAbsoluteTimeGetCurrent();
            stackmobDone = YES;
            
        }];
        
        while (stackmobDone == NO) {
           //[NSThread sleepForTimeInterval:0.1];
            
            NSDate* futureDate = [NSDate dateWithTimeInterval:0.001 sinceDate:[NSDate date]];
            [[NSRunLoop currentRunLoop] runUntilDate:futureDate];
        }
         
        
        difference = endTime - startTime;
        [allTotalResults addObject:[NSNumber numberWithDouble:difference]];
        totalDifference += difference;
        
        if (difference < min) {
            min = difference;
        }
        if (difference > max) {
            max = difference;
        }
        NSLog(@"%i .Stackmob-Search : %f",i,difference);
        
    }
    [self publishProgress:1];  
    
    NSLog(@"Genereal Stackmob Search Result : %f",totalDifference);
    result.average = totalDifference / callNumber;
    result.max = max;
    result.min = min;
    result.allResults = allTotalResults;
        
    return result;
}

-(Result*)parseSearch{
    
    Result *result = [[[Result alloc]init] autorelease];
    double totalDifference = 0, max = 0, min = 9999, difference = 0;
    NSMutableArray *allTotalResults=[[[NSMutableArray alloc] init] autorelease];
    platform = PARSE ;
    
    for (int i=0; i < callNumber; i++) {
        
        if (startProgres == NO) {
            return nil;
    }
        
        progressBarStatus =(float)i/callNumber;
        
        [progresView setProgress:progressBarStatus animated:YES];
         
        [self publishProgress:progressBarStatus];
        
        PFQuery *query=[PFQuery queryWithClassName:@"TestObject"];
        [query whereKey:@"age" greaterThan:[NSNumber numberWithInt:20]];
        
        NSError *error = nil;
        
        double startTime = CFAbsoluteTimeGetCurrent();
        
        [query findObjects:&error];

        double endTime = CFAbsoluteTimeGetCurrent();
        
        if (error) {
            return nil;
        }
        
        difference = endTime - startTime;
        [allTotalResults addObject:[NSNumber numberWithDouble:difference]];
        totalDifference += difference;
        
        if (difference < min) {
            min = difference;
        }
        if (difference > max) {
            max = difference;
        }
        NSLog(@"%i .Parse-Search : %f",i,difference);
        
    }
    [self publishProgress:1];  
    
    NSLog(@"Genereal Parse Search Result : %f",totalDifference);
    result.average = totalDifference / callNumber;
    result.max = max;
    result.min = min;
    result.allResults = allTotalResults;
        
    return result;

}


-(Result*)netmeraSearch{
                               
        Result *result = [[[Result alloc]init] autorelease];
        double totalDifference = 0, max = 0, min = 9999, difference = 0;
        NSMutableArray *allTotalResults=[[[NSMutableArray alloc] init] autorelease];
        platform = NETMERA ;
    
    for (int i=0; i < callNumber; i++) {
        if (startProgres == NO) {
            return nil;
        }
        
        progressBarStatus =(float)i/callNumber;
        
        [progresView setProgress:progressBarStatus animated:YES];
        
        
        [self publishProgress:progressBarStatus];
        NetmeraService *servis = [[[NetmeraService alloc]initWithName:SEARCH_SERVICE_NAME] autorelease];
        [servis whereGreatherThanWithKey:@"age" andValue:[NSNumber numberWithInt:34]];
        [servis setMax:10];
        
        NSError *error = nil;
        
        double startTime = CFAbsoluteTimeGetCurrent();
        
        [servis search:&error];
        
        double endTime = CFAbsoluteTimeGetCurrent();
        
        if (error) {
            return nil;
        }
        
        difference = endTime - startTime;
        [allTotalResults addObject:[NSNumber numberWithDouble:difference]];
        totalDifference += difference;
        
        if (difference < min) {
            min = difference;
        }
        if (difference > max) {
            max = difference;
        }
        NSLog(@"%i .Netmera-Search : %f",i,difference);
    
    }
   [self publishProgress:1];  

    NSLog(@"Genereal Netmera Search Result : %f",totalDifference);
    result.average = totalDifference / callNumber;
    result.max = max;
    result.min = min;
    result.allResults = allTotalResults;
    
    return result;

}

-(Result*) netmeraMedia{
    Result *result = [[[Result alloc]init] autorelease];
    double totalDifference = 0, max = 0, min = 9999, difference = 0;
    NSMutableArray *allTotalResults=[[[NSMutableArray alloc] init] autorelease];
    platform = NETMERA ;
    
    
    for (int i=0; i < callNumber; i++) {
        
        if (startProgres == NO) {
            return nil;
        }
        
        progressBarStatus = (float)i / callNumber;
        
        [progresView setProgress:progressBarStatus animated:YES];
        
        [self publishProgress:progressBarStatus];
        
        UIImage *image = [UIImage imageNamed:IMAGE_NAME];
        NetmeraMedia *media = [[NetmeraMedia alloc] initWithData:UIImagePNGRepresentation(image)];
        NetmeraContent *content=[[NetmeraContent alloc]initWithObjectName:CREATE_MEDIA_OBJECT_NAME];
        [content add:@"netmeraLogo" object:media];
        [media release];
        NSError *error = nil;
        
        double startTime = CFAbsoluteTimeGetCurrent();
        [content create:&error];
        
        double endTime = CFAbsoluteTimeGetCurrent();
        [content release];
        if (error) {
            return nil;
        }
        
        difference = endTime - startTime;
        [allTotalResults addObject:[NSNumber numberWithDouble:difference]];
        totalDifference += difference;
        
        if (difference < min) {
            min = difference;
        }
        if (difference > max) {
            max = difference;
        }
        NSLog(@"%i .Netmera-CREATE : %f",i,difference);
    }
    [self publishProgress:1];
    
    NSLog(@"Genereal Netmera CREATE Result : %f",totalDifference);
    result.average = totalDifference / callNumber;
    result.max = max;
    result.min = min;
    result.allResults = allTotalResults;
    return result;
}
-(Result*) stackmobMedia{
    Result *result = [[[Result alloc]init] autorelease];
    //stackmob media requests here
    return result;
}
-(Result*) parseMedia{
    Result *result = [[[Result alloc]init] autorelease];
    double totalDifference = 0, max = 0, min = 9999, difference = 0;
    NSMutableArray *allTotalResults=[[[NSMutableArray alloc] init] autorelease];
    platform = PARSE ;
    
    for (int i=0; i < callNumber; i++) {
        
        if (startProgres == NO) {
            return nil;
        }
        
        progressBarStatus = (float)i / callNumber;
        
        [progresView setProgress:progressBarStatus animated:YES];
        
        [self publishProgress:progressBarStatus];

        UIImage *image = [UIImage imageNamed:IMAGE_NAME];
        NSData *imageData = UIImagePNGRepresentation(image);
        PFFile *imageFile = [PFFile fileWithName:IMAGE_NAME data:imageData];

        NSError *error = nil;
        
        double startTime = CFAbsoluteTimeGetCurrent();
        [imageFile save];
        PFObject *userPhoto = [PFObject objectWithClassName:CREATE_OBJECT_NAME];
        [userPhoto setObject:imageFile forKey:@"imageFile"];
        [userPhoto save];
        
        double endTime = CFAbsoluteTimeGetCurrent();
        
        if (error) {
            return nil;
        }
        
        difference = endTime - startTime;
        [allTotalResults addObject:[NSNumber numberWithDouble:difference]];
        totalDifference += difference;
        
        if (difference < min) {
            min = difference;
        }
        if (difference > max) {
            max = difference;
        }
        NSLog(@"%i .Parse-CREATE : %f",i,difference);
    }
    [self publishProgress:1];
    
    NSLog(@"Genereal Parse CREATE Result : %f",totalDifference);
    result.average = totalDifference / callNumber;
    result.max = max;
    result.min = min;
    result.allResults = allTotalResults;
    return result;
}

-(void)publishProgress:(float)progres{
   
    if (progres == 1) {
        
        [workingOnLabel setHidden:YES];
    }else{
        if (workingOnLabel.hidden) {
            [workingOnLabel setHidden:NO];
            
        }
        workingOnLabel.text = [NSString stringWithFormat:@"Working on : %@",platform];
        
    }
         NSDate* futureDate = [NSDate dateWithTimeInterval:0.001 sinceDate:[NSDate date]];
        [[NSRunLoop currentRunLoop] runUntilDate:futureDate];
  
    
    [progresView setProgress:progres animated:YES];

}

- (void)viewDidUnload
{
    [self setCallNumberTextField:nil];
    [self setNetmeraSwitch:nil];
    [self setParseSwitch:nil];
    [self setStackmobSwitch:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [callNumberTextField release];
    [netmeraSwitch release];
    [parseSwitch release];
    [stackmobSwitch release];
    [super dealloc];
}

- (IBAction)cancel:(id)sender {
    startProgres = NO; 
    [progresView setProgress:0 animated:YES];
}


// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [functionTypeArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [functionTypeArray objectAtIndex:row];

}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    functionType = [functionTypeArray objectAtIndex:row];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;

}

@end

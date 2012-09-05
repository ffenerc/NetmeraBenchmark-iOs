//
//  BenchmarkResult.m
//  Netmera
//
//  Created by Serhat SARI on 9/3/12.
//  Copyright (c) 2012 Serhat SARI. All rights reserved.
//

#import "BenchmarkResult.h"
#import "Result.h"
#import "BenchmarkConstants.h"
#import "Netmera/Netmera.h"
#import "TestConstants.h"

@implementation BenchmarkResult
@synthesize searchType;
@synthesize netmeraMin;
@synthesize netmeraMax;
@synthesize netmeraAverage;
@synthesize parseMin;
@synthesize parseMax;
@synthesize parseAverage;
@synthesize stackmobMin;
@synthesize stackmobMax;
@synthesize stackmobAverage;
@synthesize mail;
@synthesize resultDictionary;

-(void)setBenckmarkResults:(NSDictionary*)dictionary{
    
    int callNumber = [[dictionary objectForKey:NUMBER_OF_CALLS] intValue];
    NSString *functionType = [dictionary objectForKey:FUNCTION_TYPE];
    
    NSString *benchmarkType = [[NSString alloc] initWithFormat:@"%i %@",callNumber,functionType];
    [searchType setText:benchmarkType];
    [benchmarkType release];
    
    Result *netmeraResult = [dictionary objectForKey:NETMERA];
    Result *parseResult = [dictionary objectForKey:PARSE];
    Result *stackmobResult = [dictionary objectForKey:STACKMOB];
    
    
    [self setNetmeraResult:netmeraResult];
    [self setParseResult:parseResult];
    [self setStackmobResult:stackmobResult];
    

}


-(void)setStackmobResult:(Result*)result{
    
    if (result != nil) {
        
        NSNumber *stackmobResultMin = [NSNumber numberWithDouble:result.min];
        NSNumber *stackmobResultMax = [NSNumber numberWithDouble:result.max];
        NSNumber *stackmobResultAverage = [NSNumber numberWithDouble:result.average];
        
        
        
        [stackmobMin setText:[NSString stringWithFormat:@"%@",stackmobResultMin]];
        [stackmobMax setText:[NSString stringWithFormat:@"%@",stackmobResultMax]];
        [stackmobAverage setText:[NSString stringWithFormat:@"%@",stackmobResultAverage]];
        
    }
    
    
}



-(void)setParseResult:(Result*)result{
    
    if (result != nil) {
        
        NSNumber *parseResultMin = [NSNumber numberWithDouble:result.min];
        NSNumber *parseResultMax = [NSNumber numberWithDouble:result.max];
        NSNumber *parseResultAverage = [NSNumber numberWithDouble:result.average];
        
        
        
        [parseMin setText:[NSString stringWithFormat:@"%@",parseResultMin]];
        [parseMax setText:[NSString stringWithFormat:@"%@",parseResultMax]];
        [parseAverage setText:[NSString stringWithFormat:@"%@",parseResultAverage]];
        
    }
    
    
}


-(void)setNetmeraResult:(Result*)result{
    
    if (result != nil) {

        NSNumber *netmeraResultMin = [NSNumber numberWithDouble:result.min];
        NSNumber *netmeraResultMax = [NSNumber numberWithDouble:result.max];
        NSNumber *netmeraResultAverage = [NSNumber numberWithDouble:result.average];


        
        [netmeraMin setText:[NSString stringWithFormat:@"%@",netmeraResultMin]];
        [netmeraMax setText:[NSString stringWithFormat:@"%@",netmeraResultMax]];
        [netmeraAverage setText:[NSString stringWithFormat:@"%@",netmeraResultAverage]];
        
    }


}


-(void)viewDidAppear:(BOOL)animated{
    
    [self setBenckmarkResults:resultDictionary];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setSearchType:nil];
    [self setNetmeraMin:nil];
    [self setNetmeraMax:nil];
    [self setNetmeraAverage:nil];
    [self setParseMin:nil];
    [self setParseMax:nil];
    [self setParseAverage:nil];
    [self setStackmobMin:nil];
    [self setStackmobMax:nil];
    [self setStackmobAverage:nil];
    [self setMail:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [searchType release];
    [netmeraMin release];
    [netmeraMax release];
    [netmeraAverage release];
    [parseMin release];
    [parseMax release];
    [parseAverage release];
    [stackmobMin release];
    [stackmobMax release];
    [stackmobAverage release];
    [mail release];
    [super dealloc];
}
- (IBAction)saveResults:(id)sender {
    
    
    NetmeraContent *content = [[NetmeraContent alloc]initWithObjectName:RESULT_OBJECT_NAME];
    [content add:FUNCTION_TYPE object:[resultDictionary objectForKey:FUNCTION_TYPE]];
    [content add:NUMBER_OF_CALLS object:[resultDictionary objectForKey:NUMBER_OF_CALLS]];
    [content add:@"email" object:mail.text];
    
   Result *netmeraResult = [resultDictionary objectForKey:NETMERA];
    
    NSMutableString *netmeraResultString=[[NSMutableString alloc]init];    
    if (netmeraResult != nil) {
        
        for (int i=0; i < netmeraResult.allResults.count; i++) {
            [netmeraResultString appendFormat:@" , %@",[netmeraResult.allResults objectAtIndex:i]];
        }
        
    }
    
    Result *parseResult=[resultDictionary objectForKey:PARSE];
    
    NSMutableString *parseResultString = [[NSMutableString alloc]init];    
    if (parseResult != nil) {
        
        for (int i=0; i < parseResult.allResults.count; i++) {
            [netmeraResultString appendFormat:@" , %@",[parseResult.allResults objectAtIndex:i]];
        }
        
    }
    
    Result *stackmobResult=[resultDictionary objectForKey:STACKMOB];
    
    NSMutableString *stackmobResultString = [[NSMutableString alloc]init];    
    if (stackmobResult != nil) {
        
        for (int i=0; i < stackmobResult.allResults.count; i++) {
            [netmeraResultString appendFormat:@" , %@",[stackmobResult.allResults objectAtIndex:i]];
        }
        
    }
    
    
    
    [content add:NETMERA_RESULTS object:netmeraResultString];
    [content add:PARSE_RESULTS object:parseResultString];
    [content add:STACKMOB_RESULTS object:stackmobResultString];
     NSError *error = nil;
    [content create:&error];
    
    NSLog(@"Save Result Error : %@",error);
    [netmeraResultString release];
    [parseResultString release];
    [stackmobResultString release];
    [content release];
    
    
}

- (IBAction)back:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
    
}

@end

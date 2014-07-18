//
//  TextViewController.m
//  NSMutableAttributedStringExample
//
//  Created by Bradley Robert Schmidt on 7/17/14.
//  Copyright (c) 2014 Bradley Robert Schmidt. All rights reserved.
//

#import "TextViewController.h"

@interface TextViewController ()

@end

@implementation TextViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *string = @"Purpose: add attributes to strings.  When: anytime you want to.  How: look at the code";
    
    //1. Create a NSMutableAttributedString from a string
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    
    //2. What parts of the string would you like to have attributes?  Create strings for substrings
    NSString *subPurpose = @"Purpose:";
    NSString *subWhen = @"When:";
    NSString *subHow = @"How:";
    
    //3. Get the position of the subsrings
    NSRange rString = [[attributedString string] rangeOfString:string]; //The entire string, optional
    NSRange r1 = [[attributedString string] rangeOfString:subPurpose];
    NSRange r2 = [[attributedString string] rangeOfString:subWhen];
    NSRange r3 = [[attributedString string] rangeOfString:subHow];
    
    //4. What attributes would you like to add to the substrings?  Add them to a dictionary
    NSDictionary *dictionary1 = @{NSFontAttributeName: [UIFont systemFontOfSize:8]};
    NSDictionary *dictionary2 = @{NSFontAttributeName: [UIFont italicSystemFontOfSize:12], NSForegroundColorAttributeName : [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0]};
    NSDictionary *dictionary3 = @{NSFontAttributeName: [UIFont italicSystemFontOfSize:14], NSForegroundColorAttributeName : [UIColor greenColor]};
    
    //5. Add the attributes to the attributed string at the postion/range
    [attributedString setAttributes:dictionary1 range:rString];  //Optional-otherwise the font size is set to the defualt
    
    [attributedString setAttributes:dictionary2 range:r1];
    [attributedString setAttributes:dictionary3 range:r2];
    [attributedString setAttributes:dictionary2 range:r3];
    
    //6. Create the UITextView, set the text porperty with the NSMutableAttributedString, add the view to the subview
    textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 100, 250, 300)];
    textView.attributedText = attributedString;
    textView.selectable = false;
    [self.view addSubview:textView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

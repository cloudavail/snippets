//
//  AddViewController.m
//  SimpleMath
//
//  Created by Colin Johnson on 8/23/15.
//  Copyright (c) 2015 CloudAvail. All rights reserved.
//
// written using https://www.youtube.com/watch?v=0iUBO5MN_ZU as a reference

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)CalculateButtonPressed:(id)sender {
    NSLog(@"Calculate Button Pressed");
    
    int Augend = [[ self.AugendTextField text] intValue];
    int Addend = [[ self.AddendTextField text] intValue];

    NSLog(@"Augend: %i", Augend);
    NSLog(@"Addend: %i", Addend);
    
    int Sum = Augend + Addend;
    NSLog(@"Sum: %i", Sum);
    
    NSString *SumText = [ NSString stringWithFormat:@"%i", Sum ];
    
    self.SumTextField.text = SumText;
    
}

@end

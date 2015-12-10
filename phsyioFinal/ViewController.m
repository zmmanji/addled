//
//  ViewController.m
//  LoginUser
//
//  Created by Zeeshaan Manji on 06/11/2015.
//  Copyright © 2015 Zeeshaan Manji. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Background.jpg"]];
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    if (![defaults boolForKey:@"registered"])
    {
        NSLog(@"No user is registered");
    }
    else
    {
        NSLog(@"User is Registered");
        _confirmPassword.hidden=YES;
        _registerBtn.hidden=YES;
    }
    [self.usernameField resignFirstResponder];
    
    // Do any additional setup after loading the view, typically from a nib.
    CAGradientLayer *btnGradient = [CAGradientLayer layer];
    btnGradient.frame = _registerBtn.bounds;
    btnGradient.colors = [NSArray arrayWithObjects:
                          (id)[[UIColor colorWithRed:46.0f / 255.0f green:180.0f / 255.0f blue:213.0f / 255.0f alpha:1.0f] CGColor],
                          (id)[[UIColor colorWithRed:46.0f / 255.0f green:180.0f / 255.0f blue:213.0f / 255.0f alpha:1.0f] CGColor],
                          nil];
    [_registerBtn.layer insertSublayer:btnGradient atIndex:0];
    CALayer *btnLayer = [_registerBtn layer];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:5.0f];
    
}

-(IBAction) RegisterUser:(id)sender{
    if ([_usernameField.text isEqualToString:@""] || [_passwordField.text isEqualToString:@""] || [_confirmPassword.text isEqualToString:@""] ||[_AccountType.text isEqualToString:@""])
    {
        UIAlertView *error =[[UIAlertView alloc] initWithTitle:(@"Login Error") message:(@"You must complete all the fields") delegate:(self) cancelButtonTitle:(@"OK") otherButtonTitles:nil];
        [error show];
    }
    else
    {
        [self CheckifPasswordMatch];
    }
}

- (IBAction)BackgroundTouch:(id)sender {
    
}



- (void) CheckifPasswordMatch
{
    if ([_passwordField.text isEqualToString:_confirmPassword.text])
    {
        NSLog(@"Passwords Match");
        [self Registernewuser];
    }
    else
    {
        UIAlertView *error =[[UIAlertView alloc] initWithTitle:(@"Login Error") message:(@"Passwords dont match,Please try again") delegate:(self) cancelButtonTitle:(@"OK") otherButtonTitles:nil];
        
        
        
        [error show];
    }
    
}

-(void) Registernewuser
{
    NSUserDefaults * defaults= [NSUserDefaults standardUserDefaults];
    [defaults setObject: _usernameField.text forKey:@"Username"];
    [defaults setObject: _passwordField.text forKey:@"Password"];
    [defaults setObject: _FirstName.text forKey:@"FirstName"];
    [defaults setObject: _LastName.text forKey:@"LastName"];
    [defaults setObject: _Age.text forKey:@"Age"];
    [defaults setObject: _AccountType.text forKey:@"AccountType"];
    
    [self.view endEditing:TRUE];
    
    [defaults setBool:YES forKey:@"Registered"];
    
    
  
    UIAlertView *passed =[[UIAlertView alloc] initWithTitle:(@"Completed") message:(@"You have succesfully added a user") delegate:(self) cancelButtonTitle:(@"OK") otherButtonTitles:nil];
    
    [defaults synchronize];
    
    [ passed show];
    [self performSegueWithIdentifier:@"Login" sender:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

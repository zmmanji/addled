//
//  LoginMain.m
//  phsyioFinal
//
//  Created by Zeeshaan Manji on 07/11/2015.
//  Copyright © 2015 Zeeshaan Manji. All rights reserved.
//

#import "LoginMain.h"


@interface LoginMain ()

@end

@implementation LoginMain

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Background.jpg"]];
   
    
    
    

    
    
  
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Register:(id)sender {
    [self performSegueWithIdentifier:@"Back" sender:self];
}

- (IBAction)LoginUser:(id)sender {
     NSUserDefaults * defaults= [NSUserDefaults standardUserDefaults];
     _AccountType.text=[defaults objectForKey :@"AccountType"];
    if ([_username.text isEqualToString: [defaults objectForKey :@"Username"]]&& [_password.text isEqualToString :[defaults objectForKey :@"Password"]]&&[_AccountType.text isEqualToString:@"PA"])
        
    {
    
    UIAlertView *error =[[UIAlertView alloc] initWithTitle:(@"Physio Assist") message:(@"Welcome") delegate:(self) cancelButtonTitle:(@"OK") otherButtonTitles:nil];
        [error show];
        [self performSegueWithIdentifier:@"Home" sender:self];
    }
    else if ([_username.text isEqualToString: [defaults objectForKey :@"Username"]]&& [_password.text isEqualToString :[defaults objectForKey :@"Password"]]&&[_AccountType.text isEqualToString:@"PY"])
    {
        UIAlertView *error =[[UIAlertView alloc] initWithTitle:(@"Welcome") message:(@"Welcome") delegate:(self) cancelButtonTitle:(@"OK") otherButtonTitles:nil];
        [error show];

        [self performSegueWithIdentifier:@"Physician" sender:self];
        
    }
    else
    {
        UIAlertView *fail =[[UIAlertView alloc] initWithTitle:(@"Login Credentials Failed") message:(@"Please Re-enter your username and password") delegate:(self) cancelButtonTitle:(@"OK") otherButtonTitles:nil];
        [ fail show];
        
    }

    

}
@end

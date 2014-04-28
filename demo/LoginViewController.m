//
//  LoginViewController.m
//  demo
//
//  Created by Xu Deng on 3/28/14.
//  Copyright (c) 2014 Xu Deng. All rights reserved.
//

#import "LoginViewController.h"
#import "NetWorkApi.h"
#import "Helper.h"
@interface LoginViewController ()
- (IBAction)login:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *uname;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation LoginViewController

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
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];

    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:self.view.window];
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:self.view.window];
	
	self.uname.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
	self.uname.leftViewMode = UITextFieldViewModeAlways;
	self.password.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
	self.password.leftViewMode = UITextFieldViewModeAlways;
    
    

}

-(void) getNotification
{
    NSLog(@"getNotification");
    [NetWorkApi EventByStatus:COMING completion:^(NSMutableArray *events) {
        [Helper setNotification:events];
    }];
    
    [self performSelector:@selector(getNotification) withObject:self afterDelay:15.0f];
}

- (void)keyboardWillHide:(NSNotification *)n
{
    [self animateTextField:_uname up:NO];
    
}

- (void)keyboardWillShow:(NSNotification *)n
{
    [self animateTextField:_uname up:YES];

}

-(void)animateTextField:(UITextField*)textField up:(BOOL)up
{
    const int movementDistance = -25; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? movementDistance : -movementDistance);
    
    [UIView beginAnimations: @"animateTextField" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void)dismissKeyboard {
    [self.view endEditing:YES]; //make the view end editing!

}



- (IBAction)login:(id)sender {
    
//    [NetWorkApi candidatesList:25
//                    completion:^(NSMutableArray *candidates){
//                        
//                    }];
    
    [NetWorkApi signInAccountWithUserName:self.uname.text
                           password:self.password.text
                         completion:^(BOOL success, NSString* desc) {
                             if (success) {
                                 [self performSelector:@selector(getNotification) withObject:self];
                                [self performSegueWithIdentifier:@"segue_login" sender:self];
                             } else {
                                 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"user name or password dismatch"
                                                                                 message:@"You need to type your user name or password again."
                                                                                delegate:nil
                                                                       cancelButtonTitle:@"OK"
                                                                       otherButtonTitles:nil];
                                 [alert show];
                             }
                         }];
    

   // [alert release];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
  //  NSLog(@"12");
  //  return [textField resignFirstResponder];
    [self login:self];
    [textField resignFirstResponder];
    return true;
}

@end

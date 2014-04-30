//
//  MessangerViewController.h
//  TableView
//
//  Created by Macos on 4/23/14.
//  Copyright (c) 2014 macos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Account.h"


@interface MessangerViewController : UIViewController <UITextFieldDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *cancelMessageButton;
@property (weak, nonatomic) IBOutlet UITextField *messageTextField;

@property (weak, nonatomic) IBOutlet UITextView *conversationTextView;
@property (weak, nonatomic) IBOutlet UIImageView *accountPhoto;
@property (weak, nonatomic) Account* currentAccount;
@property (weak, nonatomic) IBOutlet UIButton *sendMessageButton;




-(IBAction)sendMessage:(id)sender;
-(IBAction)cancelMessage:(id)sender;



@end

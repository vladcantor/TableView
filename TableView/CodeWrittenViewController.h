//
//  CodeWrittenViewController.h
//  TableView
//
//  Created by Macos on 4/17/14.
//  Copyright (c) 2014 macos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Account.h"
#import "AddAccountViewController.h"
#import "MyViewController.h"


@protocol SaveData <NSObject>

-(void)saveDatasFromSlideShow;

@end

@interface CodeWrittenViewController : UIViewController <UIImagePickerControllerDelegate>



@property (nonatomic) Account* currentAccount;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addImageToAccountDataSourceButton
;
@property (weak, nonatomic) IBOutlet UIButton *addPicturesutton;

@property (weak, nonatomic) IBOutlet UIImageView *testUIImage;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *showPhotoLibraryButton;
@property (weak, nonatomic) id<SaveData> saveDelegate;



-(IBAction)takeAPicture:(id)sender;
-(IBAction)addPictureToDatas:(id)sender;
-(IBAction)allowAdding:(id)sender;

@end

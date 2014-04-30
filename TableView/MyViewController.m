//
//  MyViewController.m
//  TableView
//
//  Created by Macos on 4/16/14.
//  Copyright (c) 2014 macos. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController{
    UIImagePickerController *uiImgPick;
}

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
    self.nameTextField.text = self.currentAccount.name;
    self.nameTextField.userInteractionEnabled = NO;
    self.choosePhotoButton.hidden = YES;
    self.choosePhotoButton.userInteractionEnabled = NO;
    self.saveAccountEditingButton.hidden = YES;
    self.myImageView.image = self.currentAccount.accountImage;
    uiImgPick = [[UIImagePickerController alloc]init];
    // Do any additional setup after loading the view.
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)editAccount:(id)sender{
    self.nameTextField.userInteractionEnabled = YES;
    self.choosePhotoButton.hidden = NO;
    self.choosePhotoButton.userInteractionEnabled = YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    self.myImageView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    self.saveAccountEditingButton.userInteractionEnabled = YES;
    self.saveAccountEditingButton.hidden = NO;
    [picker dismissViewControllerAnimated:YES completion:nil];
}


-(UIStoryboardSegue*)segueForIdentifier:(NSString*)identifier{
    NSString* destIdentifier;
    if([identifier isEqualToString:@"detailsSegue"])
    {
        destIdentifier = @"MyViewController";
    }
    UIStoryboardSegue* segue = [[UIStoryboardSegue alloc]initWithIdentifier:identifier source:self destination:[self.storyboard instantiateViewControllerWithIdentifier:destIdentifier]];
                                return segue;
}

-(IBAction)choosePhoto:(id)sender{
    uiImgPick.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    uiImgPick.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    uiImgPick.allowsEditing = NO;
    uiImgPick.delegate = self;
    [self presentViewController:uiImgPick animated:YES completion:nil];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.nameTextField endEditing:YES];
}



-(IBAction)saveChanges:(id)sender{
    self.currentAccount.name = self.nameTextField.text;
    self.currentAccount.accountImage = self.myImageView.image;
    
    if(![self.currentAccount.slideshowImages containsObject:self.myImageView.image])
        [self.currentAccount.slideshowImages addObject:self.myImageView.image];
    
    [self.delegate saveDatasFromMyViewController];
    
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    
}


@end

//
//  MyTableViewCell.m
//  TableView
//
//  Created by Macos on 4/17/14.
//  Copyright (c) 2014 macos. All rights reserved.
//

#import "MyTableViewCell.h"
#import "SharedData.h"

@implementation MyTableViewCell{
    CGPoint _originalCenter;
    BOOL _completeOnDragRelease;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        
    }
    return self;
}

-(void)performSwipeLeftGesture{
    UIGestureRecognizer* recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    recognizer.delegate = self;
    [self addGestureRecognizer:recognizer];
}




-(BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    CGPoint translation = [gestureRecognizer translationInView:[self superview]];
    // Check for horizontal gesture
    if (fabsf(translation.x) > fabsf(translation.y)) {
        return YES;
    }
    return NO;
}
-(void)handlePan:(UIPanGestureRecognizer *)recognizer {
    if (recognizer.state == UIGestureRecognizerStateBegan) {
		// if the gesture has just started, record the current centre location
        _originalCenter = self.center;
    }
    
    if (recognizer.state == UIGestureRecognizerStateChanged) {
        // translate the center
        CGPoint translation = [recognizer translationInView:self];
        self.center = CGPointMake(_originalCenter.x + translation.x, _originalCenter.y);
        // determine whether the item has been dragged far enough to initiate a delete / complete
        _completeOnDragRelease = self.frame.origin.x > self.frame.size.width / 3;
       		// Context cues
        }
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        // the frame this cell would have had before being dragged
        CGRect originalFrame = CGRectMake(0, self.frame.origin.y,
                                          self.bounds.size.width, self.bounds.size.height);
        if (_completeOnDragRelease) {
            // if the item is not being deleted, snap back to the original location
            [UIView animateWithDuration:0.2
                             animations:^{
                                 self.frame = originalFrame;
                             }
             ];
            
            UIActionSheet* _actionSheet = [[UIActionSheet alloc] initWithTitle:@"AnotherView" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"SlideShow", @"Messenger",nil];
            _actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
            [_actionSheet showInView:self];
            

        }
    }
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    [SharedData sharedInstance].index = self.cuurentIndexInTableView;
    [SharedData sharedInstance].cellIndex = self.currentIndexPath;
    if(buttonIndex == 0)
    {
        [self.gestureDelegate userMadeLeftSwipe:self.cuurentIndexInTableView :YES];
    }else if(buttonIndex == 1)
    {
                [self.gestureDelegate userWantsToSendMessages:self.cuurentIndexInTableView];
    }
}



- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  AllCommentsTableViewController.h
//  demo
//
//  Created by 聂 路明 on 14-4-22.
//  Copyright (c) 2014年 Xu Deng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Comment.h"

@interface AllCommentsTableViewController : UITableViewController<UITextViewDelegate, UITextFieldDelegate>

@property int userIdComment;

@end

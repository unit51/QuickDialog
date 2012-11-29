//
//  QPhotoElement.m
//  QuickDialog
//
//  Created by Florian Strauß on 06.02.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "QPhotoElement.h"
#import <QuartzCore/QuartzCore.h>


NSString* const QPhotoElementImageChangedNotification = @"QPhotoElementImageChanged";

@interface QPhotoElement() 

@property (nonatomic, unsafe_unretained) QuickDialogController *controller;


@end

@implementation QPhotoElement
@synthesize image = _image;
@synthesize controller = _controller;
@synthesize imageView = _imageView;

- (QPhotoElement *)initWithTitle:(NSString *)title {
    self = [super init];
    _title = title;
    
    return self;
}

- (UITableViewCell *)getCellForTableView:(QuickDialogTableView *)tableView controller:(QuickDialogController *)controller {
    UITableViewCell *cell = [super getCellForTableView:tableView controller:controller];
    cell.accessoryType  = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = _title;
    

    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 46, 46)];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    if(self.image != nil) {
        self.imageView.image = self.image;
    } else {
        self.imageView.image = [UIImage imageNamed:@"PicturePerson-Square.png"];
    }

    self.imageView.contentMode = UIViewContentModeScaleToFill;  
    self.imageView.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.imageView.layer.borderWidth = 2.0;
    self.imageView.layer.shadowColor = [UIColor grayColor].CGColor;
    self.imageView.layer.shadowOffset = CGSizeMake(0, 1);
    self.imageView.layer.shadowOpacity = 1;
    self.imageView.layer.shadowRadius = 1.0;
    
    cell.accessoryView = self.imageView;
    cell.accessoryType = UITableViewCellAccessoryNone;

    return cell;
}


- (CGFloat)getRowHeightForTableView:(QuickDialogTableView *)tableView {
    return 75.0f;
}

- (void)fetchValueIntoObject:(id)obj {
	if (_key==nil)
		return;
	[obj setValue:_imageView.image forKey:_key];
}

@end

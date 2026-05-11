#import <UIKit/UIKit.h>

@interface SakrMenu : UIView
@property (nonatomic, strong) UIView *bgView;
@end

@implementation SakrMenu
- (instancetype)init {
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        // تصميم القائمة السوداء
        self.bgView = [[UIView alloc] initWithFrame:CGRectMake(50, 150, 260, 320)];
        self.bgView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.9];
        self.bgView.layer.cornerRadius = 20;
        self.bgView.layer.borderWidth = 2;
        self.bgView.layer.borderColor = [UIColor whiteColor].CGColor;
        [self addSubview:self.bgView];

        // اسمك في العالي
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, 260, 40)];
        title.text = @"🦅 SAKR MENU 🦅";
        title.textColor = [UIColor whiteColor];
        title.textAlignment = NSTextAlignmentCenter;
        title.font = [UIFont boldSystemFontOfSize:22];
        [self.bgView addSubview:title];

        // زرار للتجربة
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(30, 80, 200, 45);
        [btn setTitle:@"Magic Bullet (Soon)" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor darkGrayColor]];
        btn.layer.cornerRadius = 12;
        [self.bgView addSubview:btn];
        
        UILabel *status = [[UILabel alloc] initWithFrame:CGRectMake(0, 270, 260, 30)];
        status.text = @"Waiting for Offsets...";
        status.textColor = [UIColor grayColor];
        status.textAlignment = NSTextAlignmentCenter;
        status.font = [UIFont systemFontOfSize:12];
        [self.bgView addSubview:status];
    }
    return self;
}
@end

%hook UnityAppController
- (void)applicationDidBecomeActive:(id)application {
    %orig;
    SakrMenu *menu = [[SakrMenu alloc] init];
    [[[UIApplication sharedApplication] keyWindow] addSubview:menu];
}
%end

//
//  MyDogs.m
//  Adopt-A-Friend
//
//  Created by Elias Vltaliano Vidaurre Davila on 8/22/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import "MyDogs.h"
#import "AddDog.h"
#import "DogDetails.h"
#import "Declarations.h"
#import "cellDog.h"

@interface MyDogs ()

@end

@implementation MyDogs

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated // new
{
    NSLog(@"viewDidAppear");
    [super viewDidAppear:animated];
    
    [self.tabla reloadData];
    
}

-(void)initController {
    //save the NSArray to disk to reuse
    //Creating a file path under iOS:
    //Search for the app's documents directory (copy+paste from Documentation)
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    // Create the full file path by appending the desired file name
    //Initialize arrays
    
    NSString *arrayFilemaNames = [documentsDirectory stringByAppendingPathComponent:@"maNames.dat"];
    maNames =  [[NSMutableArray alloc] initWithContentsOfFile: arrayFilemaNames];
    if(maNames == nil)
    {
        //Array file didn't exist... create a new one
        maNames = [[NSMutableArray alloc] initWithCapacity:100];
        //Fill with default values
        maNames         = [[NSMutableArray alloc] initWithObjects:
                           @"Pups",
                           @"Fluffy",
                           @"Airbud",
                           @"Sleddy",
                           @"Brownie",
                           nil];
    }
    else{
        maNames = [NSMutableArray arrayWithContentsOfFile:arrayFilemaNames];
    }
    [maNames writeToFile:arrayFilemaNames atomically:YES];
    
    maAges          = [[NSMutableArray alloc] initWithObjects:
                       @"17",
                       @"18",
                       @"35",
                       @"14",
                       @"25",
                       nil];
    maImgs          = [[NSMutableArray alloc] initWithObjects:
                       @"intro_01.jpg",
                       @"fluffy.jpg",
                       @"golden.jpg",
                       @"husky.jpg",
                       @"brown.jpg",
                       nil];
    maBreeds       = [[NSMutableArray alloc] initWithObjects:
                       @"Black",
                       @"Fluffy",
                       @"Golden",
                       @"Husky",
                       @"Golden",
                       nil];
    maDescriptions = [[NSMutableArray alloc] initWithObjects:
                      @"Daenerys is the only daughter and youngest child of King Aerys II Targaryen, the Mad King, and his sister-wife Rhaella.",
                      @"Jon is the bastard son of Lord Eddard Stark of Winterfell, the head of House Stark and Lord Paramount of the North.", @"He is a dwarf, causing him probems and persecution. His size has led him to being referred to derisively by various names, such as the Imp and The Halfman. This is mitigated by his intellect and his family's wealth and power. ",
                      @"Joffrey is believed to be the oldest son and heir of King Robert Baratheon and Queen Cersei Lannister, both of whom entered into a political marriage alliance after Robert took the throne by force from the Mad King Aerys II Targaryen. In reality, his father is Jaime Lannister, the queen's brother and the Lord Commander of the Kingsguard.",
                      @"Drogo is a powerful warlord and feared warrior. He marries Daenerys Targaryen and subsequently grows to love her. He promises to retake the Seven Kingdoms for her after she survives an assassination attempt. ",
                      nil];
}
/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return maNames.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Initialize cells
    cellDog *cell = (cellDog *)[tableView dequeueReusableCellWithIdentifier:@"cellDog"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellDog" bundle:nil] forCellReuseIdentifier:@"cellSimpsons"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellSimpsons"];
    }
    //Fill cell with info from arrays
    cell.lblName.text   = maNames[indexPath.row];
    cell.lblBreed.text  = maBreeds[indexPath.row];
    cell.lblAge.text    = maAges[indexPath.row];
    //check if thre arent any images in the cell and load it from memory
    if ([UIImage imageNamed:maImgs[indexPath.row]]== nil) {
        NSString *cachedFolderPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
        NSString *cachedImagePath = [cachedFolderPath stringByAppendingPathComponent:maImgs[indexPath.row]];
        cell.imgDog.image = [UIImage imageWithData:[NSData dataWithContentsOfFile: cachedImagePath]];
    }
    else{
        cell.imgDog.image  = [UIImage imageNamed:maImgs[indexPath.row]];
    }
    
    cell.clipsToBounds  = YES;
    [cell.contentView.superview setClipsToBounds:YES];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    miCharacterIndex = (int)indexPath.row;
    DogDetails *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"DogDetails"];
    
    [self presentViewController:viewController animated:YES completion:nil];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnBackPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

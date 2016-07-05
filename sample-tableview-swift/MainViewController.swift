import UIKit

class MainViewController: UIViewController, MainTableDelegate {
    
    var modelList : ModelList   = ModelList()
    let mainTableViewController = MainTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let mainTableViewController        =
        mainTableViewController.view.frame = CGRectMake( 0, 15, self.view.bounds.size.width, self.view.bounds.size.height - 50 )
        mainTableViewController.model_list = modelList.getList()
        mainTableViewController.delegate   = self
        
        
        let toolbar   = UIToolbar()
        toolbar.frame = CGRectMake(0, 15, self.view.bounds.width, 50 )
        let labelBtn : UIBarButtonItem = UIBarButtonItem( title: "Sample Test", style : .Plain, target: self, action : nil )
        labelBtn.setTitleTextAttributes( [NSFontAttributeName: UIFont(name:"Helvetica-Bold",size:14)!] , forState: UIControlState.Normal )
        
        let speceBtn = UIBarButtonItem( barButtonSystemItem : UIBarButtonSystemItem.FlexibleSpace, target : self, action: nil )
        let addBtn   = UIBarButtonItem( barButtonSystemItem : UIBarButtonSystemItem.Add, target : self, action:#selector( self.addTap ) )
        
        toolbar.items               = [ mainTableViewController.editButtonItem(), speceBtn, labelBtn, speceBtn, addBtn ]
        
        mainTableViewController.view.frame = CGRectMake(0, toolbar.frame.size.height + toolbar.frame.origin.y, self.view.bounds.size.width, self.view.bounds.size.height - (toolbar.frame.size.height + toolbar.frame.origin.y) );
        
        self.addChildViewController( mainTableViewController )
        self.view.addSubview( mainTableViewController.view )
        self.view.addSubview( toolbar )

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addTap( sender: AnyObject ) {
        mainTableViewController.model_list =  modelList.addItem()
        mainTableViewController.tableView.reloadData()
    }
    
    func deleteSelectCell( i : Int ) {
        mainTableViewController.model_list =  modelList.delItem( i )
        mainTableViewController.tableView.reloadData()
        
    }
    
    func didSelectCell( model_detail : ModelDetail) {
        let detailView = DetailViewController( model: model_detail )
        self.presentViewController( detailView, animated:true, completion:nil )
    }
    
    

}
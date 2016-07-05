import UIKit

protocol MainTableDelegate :class {
    func didSelectCell( model_detail : ModelDetail )
    func deleteSelectCell( i : Int )
}


class MainTableViewController: UITableViewController
{
    
    weak var delegate: MainTableDelegate?
    
    var model_list : NSArray!
    
    let cell_identifer = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.registerClass( UITableViewCell.self, forCellReuseIdentifier: cell_identifer )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NSLog( "高さ = \(model_list.count)" )
        return model_list.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cell_identifer )
        
        let model : ModelDetail = model_list[ indexPath.row ] as! ModelDetail
        cell.textLabel?.text = model.detailTitle
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        
        let dateText : String = formatter.stringFromDate(model.detailCreateDatetime)
        
        cell.detailTextLabel?.text = dateText
        cell.imageView?.image       = UIImage( named:model.detailImage )
        return cell
    }

    override func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        self.delegate!.didSelectCell( model_list[ indexPath.row ] as! ModelDetail )
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            self.delegate!.deleteSelectCell( indexPath.row )
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
}
import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    var modelDetail : ModelDetail!
    
    init( model : ModelDetail )
    {
        super.init( nibName: nil, bundle: nil )
        modelDetail = model
    }
    
    required init(coder:NSCoder) {
        super.init(coder:coder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let toolbar       = UIToolbar()
        toolbar.frame     = CGRectMake(0, 15, self.view.bounds.width, 50 )
        
        let backBtn       = UIBarButtonItem( barButtonSystemItem : UIBarButtonSystemItem.Reply, target: self, action: #selector( self.backView ) )
        
        let titleLabel    = UILabel()
        titleLabel.frame  = CGRectMake( 0, 0, 150, 50 )
        titleLabel.text   = modelDetail.detailTitle;
  
        let titleBtn      = UIBarButtonItem( customView:titleLabel )
        let speceBtn      = UIBarButtonItem( barButtonSystemItem : UIBarButtonSystemItem.FlexibleSpace, target : self, action: nil )
        
        toolbar.items        = [ backBtn, speceBtn, titleBtn ];
        
        let descriptionLabel = UILabel( frame : CGRectMake( 10, 100, 300, 200 ) )
        let imageView        = UIImageView( image:UIImage (named: modelDetail.detailImage ) )
        imageView.center     = CGPointMake( self.view.bounds.size.width / 2 , self.view.bounds.size.height / 2);
        
        self.view.backgroundColor = UIColor.whiteColor();
        
        self.view.addSubview( toolbar )
        self.view.addSubview( descriptionLabel )
        self.view.addSubview( imageView )
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backView()
    {
        self.dismissViewControllerAnimated( true, completion : nil )
    }
}
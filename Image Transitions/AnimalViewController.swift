//
//  AnimalViewController.swift
//  Image Transitions
//
//  Created by Scott Tong on 2/28/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class AnimalViewController: UIViewController {
	@IBOutlet weak var textLabel: UILabel!
	@IBOutlet weak var imageView: UIImageView!
	
	
	// 4. must create other outlets to store their values since you can't directly access the IBOutlets above from the previous view controller
	var name: String!
	var petImage: UIImage!
	
	// 5. the next step is back on the fromViewController "FarmViewController"
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		textLabel.text = name
		imageView.image = petImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func didPressDismissButton(sender: AnyObject) {
		dismissViewControllerAnimated(true, completion: nil)
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  FarmViewController.swift
//  Image Transitions
//
//  Created by Scott Tong on 2/28/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class FarmViewController: UIViewController {
	
	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var scrollView: UIScrollView!
	
	
	// 8. set a class variable to capture the image that was tapped on
	var selectedImageView: UIImageView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		scrollView.contentSize = CGSize(width: view.frame.width, height: 1000)
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func onTap(sender: UITapGestureRecognizer) {
		println("tap")
		
		// 9. capture the image that was tapped on
		selectedImageView = sender.view as UIImageView
		
		performSegueWithIdentifier("animalSegue", sender: self)

	}
	
	
		
	

	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
	
	//  1. this is a special function that sets up the next screen
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		println("preparing segue")
		
		// 2. tell iOS that the next screen is a SPECIFIC view controller named "AnimalViewController" and gives me access to the outlets on that next screen
		var destinationViewController = segue.destinationViewController as AnimalViewController
		
		
		// 3. The next steps (4 & 5) are on the next destination view controller "AnimalViewController"
		
		// 6.  To set the textLabel on the destination view controller, one would think to set it by saying "destinationViewController.textLabel = textField.text", but unfortunately textLabel is not yet ready. Therefore we must use the variable name "name" we created in the other file instead of "textLabel" like so:
		destinationViewController.name = textField.text
		
		// 7. in order to do pass the image you tapped on in this view controller to the destinationViewController, we have to get that image from from the tap gesture recognizer. Before we do that though, we want to create a class variable at the top called "selectedImageView" which we'll use to capture it, store it, then use it here to access it, and pass it off to the destinationViewController.
		
		// 10. set the image on the destinationViewController to the image that was tapped on in this view controller.
		destinationViewController.petImage = selectedImageView.image
		
		// Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
	

}

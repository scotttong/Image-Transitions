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
	
	// 12. create a new variable that holds the special transition "FadeTransition"
	var fadeTransition: FadeTransition!
	
	// 18. create a new variable that holds the special transition "ImageTransition"
	var imageTransition: ImageTransition!
	
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
		
		// 10. set the image on the destinationViewController to the image that was tapped on in this view controller. At this point, the file should pass both the text from the textField and selectedImage over to the placeholders on the toViewController.
		
		destinationViewController.petImage = selectedImageView.image
		
		// 11. next, we need to add .swift files created by Tim called "BaseTransition.swift" and "FadeTransition.swift" to our XCode project to help us with animating the transition. Step 12 is above near the outlets.
		
		// 13. this is where we take over the standard transition (initialize the transition, set the presentation style to custom, and set the delegate to this new instance of the fade transition. I'm going to comment this out because we want to do a more complicated transition.
		/*
		fadeTransition = FadeTransition()
		destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
		destinationViewController.transitioningDelegate = fadeTransition
		*/
		
		// 14. Now we want to create a more complicated transition where we move and scale the thumbnail image to a bigger size on the destination view controller. Create a new .swift file called "ImageTransition" and copy the code from Fade transition into it. Step 15 is inside ImageTransition.swift
		
		// 19. take over the standard transition with an image transition. step 20 is back in the ImageTransition.swift file
		imageTransition = ImageTransition()
		imageTransition.duration = 3
		destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
		destinationViewController.transitioningDelegate = imageTransition
		
		

		
		
		// Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
	

}

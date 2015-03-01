//
//  ImageTransition.swift
//  Image Transitions
//
//  Created by Scott Tong on 3/1/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
	
	var frame: CGRect!
	
	override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
		
		
		//15. cast the fromViewController to access its properties
		var farmViewController = fromViewController as FarmViewController
		
		//16. hide the selectedImageView before we make a copy it and change its size, scale, and position to match it's final size, scale, and position in the toViewController
		farmViewController.selectedImageView.hidden = true
		
		// 17. cast the toViewController to access its properties. Step 18 is near the outlets on the FarmViewController
		var animalViewController = toViewController as AnimalViewController
		animalViewController.imageView.hidden = true
		
		// 20. create a copy of the selected image so you can animate it. set all the properties of the moving image to be the same as the original selected image.
		var movingImageView = UIImageView()
		movingImageView.image = farmViewController.selectedImageView.image
		// 26b. -- movingImageView.frame = farmViewController.selectedImageView.frame
		movingImageView.contentMode = farmViewController.selectedImageView.contentMode
		movingImageView.clipsToBounds = farmViewController.selectedImageView.clipsToBounds
		
		// 21. add the movingImageView to the containerView
		containerView.addSubview(movingImageView)
		
		// 24b. convert the coordinates of the selectedImageView (which may be very far down in a scroll view), to a new coordinate system, inside the containerView. Then store that into a variable called "frame". globalize that "frame" variable so you can access it in the dismiss function later
		
		frame = containerView.convertRect(farmViewController.selectedImageView.frame, fromView: farmViewController.scrollView)
		
		// 25b. set the movingImageView frame to the new coordinate system within the containerView. Then comment out the previous setting for the frame in step 26b.
		movingImageView.frame = frame
	
		
		toViewController.view.alpha = 0
		UIView.animateWithDuration(duration, animations: {
			// 22. make the copy's frame the same size as the final image size frame
			movingImageView.frame = animalViewController.imageView.frame
			println("resting position: \(movingImageView.frame)")

			toViewController.view.alpha = 1
			}) { (finished: Bool) -> Void in
				self.finish()
				
				// 23. show the REAL imageView on the destinationViewController called "animalViewController", and remove the temporary copy of the image "movingImageView"
				animalViewController.imageView.hidden = false
				movingImageView.removeFromSuperview()
		}
	}
	
	override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
		
		println("dismissing segue")

		// 24a. cast the two view controllers we want to access. here we switch the fromViewController to be the detail view "AnimalViewController" and the toViewController to be the destination view "farmViewController"
		
		var animalViewController = fromViewController as AnimalViewController
		var farmViewController = toViewController as FarmViewController

		// 25a. hide the big image
		animalViewController.imageView.hidden = true

		
		// 26a. create a copy called "movingImageView" and set all the properties to be the same as the big image
		var movingImageView = UIImageView()
		movingImageView.image = animalViewController.imageView.image
		movingImageView.frame = animalViewController.imageView.frame
		movingImageView.clipsToBounds = animalViewController.imageView.clipsToBounds
		movingImageView.contentMode = animalViewController.imageView.contentMode
		containerView.addSubview(movingImageView)

		
		// 27a. animate the moving image's frame to be the same as the selected image frame
		fromViewController.view.alpha = 1
		UIView.animateWithDuration(duration, animations: {
			println("before animating: \(movingImageView.frame)")
			movingImageView.frame = self.frame
			println("after animating: \(movingImageView.frame)")
			fromViewController.view.alpha = 0
			}) { (finished: Bool) -> Void in
				self.finish()
				farmViewController.selectedImageView.hidden = false
				movingImageView.removeFromSuperview()
		}
	}

}

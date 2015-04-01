# RHAnimatedTitleView

Animate two titles when scrolling.

See in action

![RHAnimatedTitleView](http://i.imgur.com/dy5EKuQ.gif)

##How to use it?

Create a new view.

	let titleView = RHAnimatedTitleView(oldTitle: "AAAA", newTitle: "BBBB")

add it to title view of navigationItem of view controller

	navigationItem.titleView = titleView
	
You can set color of title you want 

(Default is black.)

	titleView.titleColor = UIColor.redColor()

Disable fade in/out transition is easy

(Default is true.)

	titleView.transition = false
	
Change content offset of custom title view to trigger move action

(Note: the maximum distance that custom title view can move is same as the height of custom title view itself)

	titleView.contentOffset = CGPointMake(0.0, y)
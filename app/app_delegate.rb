class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = $vc = MyViewController.new
    @window.makeKeyAndVisible
    true
  end
end

module MyModule
  def viewWillAppear(animated)
    super
  end

  def viewDidDisappear(animated)
    super
  end
end

class MyViewController < UIViewController
  include MyModule

  def viewDidLoad
    self.view.addSubview button
  end

  def button
    button = UIButton.new
    button.frame = [[ 50, 50 ], [ 100, 100 ]]
    button.backgroundColor = UIColor.blueColor
    button.setTitle("Crash me", forState: UIControlStateNormal)
    button.addTarget(self, action: :crasherize, forControlEvents: UIControlEventTouchUpInside)
    button
  end

  def crasherize
    self.presentModalViewController(OtherViewController.new, animated:true)
  end
end

class OtherViewController < UIViewController
  def viewDidLoad
    self.view.addSubview button
  end

  def button
    button = UIButton.new
    button.frame = [[ 50, 50 ], [ 100, 100 ]]
    button.backgroundColor = UIColor.blueColor
    button.setTitle("Go back", forState: UIControlStateNormal)
    button.addTarget(self, action: :back, forControlEvents: UIControlEventTouchUpInside)
    button
  end

  def back
    $vc.dismissViewControllerAnimated(true, completion:nil)
  end
end

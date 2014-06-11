class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    # @window.rootViewController = TapController.alloc.initWithNibName(nil, bundle: nil)

    # controller = TapController.alloc.initWithNibName(nil, bundle: nil)
    # @window.rootViewController = UINavigationController.alloc.initWithRootViewController(controller)

    tap_controller = TapController.alloc.initWithNibName(nil, bundle: nil)
    nav_controller = UINavigationController.alloc.initWithRootViewController(tap_controller)

    opportunities_controller = OpportunitiesController.alloc.initWithNibName(nil, bundle: nil)

    tab_controller = UITabBarController.alloc.initWithNibName(nil, bundle: nil)
    tab_controller.viewControllers = [opportunities_controller, nav_controller]
    @window.rootViewController = tab_controller
  end
end

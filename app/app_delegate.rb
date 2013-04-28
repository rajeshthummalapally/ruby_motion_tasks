class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    tabbar = UITabBarController.alloc.init
    tabbar.viewControllers = [
      UINavigationController.alloc.initWithRootViewController(AllTasksController.alloc.init),
      UINavigationController.alloc.initWithRootViewController(TodaysTasksController.alloc.init)
    ]
    tabbar.selectedIndex = 0
    #@window.rootViewController = UINavigationController.alloc.initWithRootViewController(TasksController.alloc.init)
    #@window.rootViewController.wantsFullScreenLayout = true
    @window.rootViewController = tabbar
    @window.makeKeyAndVisible
  end

  def task_details_controller
    @task_details_controller = TaskDetailsController.alloc.init
  end
end

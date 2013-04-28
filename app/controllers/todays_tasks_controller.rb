class TodaysTasksController < TasksController
  def init
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTitle('Today', image:'calendar.png'.uiimage, tag:1)
    self.title = 'Today'
    self
  end
  
  def viewDidLoad
    navigationItem.title = "Today's Tasks"
    @tasks = Task.today
    $global_tasks = @tasks 
    view.dataSource = view.delegate = self
  end
  
end

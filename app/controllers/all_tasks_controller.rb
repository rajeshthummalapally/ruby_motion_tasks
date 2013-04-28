class AllTasksController < TasksController
  def init
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTitle('All', image:'map.png'.uiimage, tag:1)
    self.title = 'All'
    self
  end
  
  def viewDidLoad
    navigationItem.title = "All Tasks"
    @tasks = Task.all
    $global_tasks = @tasks 
    view.dataSource = view.delegate = self
  end
  
end

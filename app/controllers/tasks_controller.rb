class TasksController < UITableViewController
    
  #def viewDidLoad
  #  navigationItem.title = 'Tasks'
  #  @tasks = Task.load
  #  $global_tasks = @tasks 
  #  view.dataSource = view.delegate = self
  #end

  def tableView(tableView,numberOfRowsInSection:section)
    @tasks.count
  end

  CellID = 'CellIdentifier'
  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CellID) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:CellID)
    resource = @tasks[indexPath.row]
    cell.textLabel.text = resource.name
    cell.detailTextLabel.text = resource.category
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton

    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath: indexPath)
    resource = @tasks[indexPath.row]
    controller = load_controller(resource)
    $global_self = self
    self.navigationController.pushViewController(controller, animated:true)

    tableView.deselectRowAtIndexPath(indexPath, animated:true)
    #alert = UIAlertView.alloc.init
    #alert.message = "#{resource} tapped!"
    #alert.addButtonWithTitle "OK"
    #alert.show
  end

  def load_controller(resource)
    TaskDetailsController.alloc.initWithTask(resource)
  end
  #def tableView(tableView, accessoryButtonTappedForRowWithIndexPath:indexPath)
  #  resource = @tasks[indexPath.row]
  #  controller = UIApplication.sharedApplication.delegate.task_details_controller
  #  navigationController.pushViewController(controller, animated:true)
  #  controller.showDetailsForTask(resource)
  #end 
end

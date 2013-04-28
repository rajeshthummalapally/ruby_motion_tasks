class TaskDetailsController < UITableViewController
  
  def initWithTask(task)
    initWithStyle(UITableViewStyleGrouped)
    @task = task
    $global_task = task
    self
  end

  def viewDidLoad
    navigationItem.title = @task.name
    view.dataSource = view.delegate = self
  end

  def numberOfSectionsInTableView(tableView)
    1
  end

  def tableView(tableView, numberOfRowsInSection: indexPath)
   3 
  end

  SECTION = 0
  START_ON = 0 
  ALERT = 1
  NOTE = 2 

  CellID = 'CellIdentifier'
  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CellID) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:CellID)
    case indexPath.section
    when SECTION
      case indexPath.row
      when START_ON
        cell.textLabel.text = 'Start On'
        cell.detailTextLabel.text = @task.start_on
      when ALERT
        cell.textLabel.text = 'Alert'
        cell.detailTextLabel.text = (@task.alert ? "Yes" : "No")
      when NOTE    
        cell.textLabel.text = 'Note'
        cell.detailTextLabel.text = @task.note
      end
    end

    cell
  end

end

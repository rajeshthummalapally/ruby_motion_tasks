class Task
  attr_reader :name, :category, :start_on, :alert, :note

  def initialize(attrs)
    @name = attrs['name']
    @category = attrs['category']
    @start_on = formatted_date(attrs['start_on'])
    @alert = attrs['alert']
    @note = attrs['note']
  end

  def self.all
    ResourceAPI.get('tasks.json').map { |r| Task.new(r) }
  end

  def self.today
    ResourceAPI.get("tasks.json/?date=#{NSDate.new.to_s.split(" ").first}").map { |r| Task.new(r) }
  end

  private
  def formatted_date(date)
    date_string = date.split("T").first
    ymd = date_string.split("-")
    NSDate.from_components(year: ymd[0], month: ymd[1], day: ymd[2]).string_with_style(:short)
  end

end

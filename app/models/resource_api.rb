class ResourceAPI
  HOST="localhost:3000"
  BASE_URL="http://#{HOST}"

  def self.get(url)
    error = Pointer.new(:object)
    raw_data = NSData.alloc.initWithContentsOfURL(NSURL.URLWithString("#{BASE_URL}/#{url}"))
    NSJSONSerialization.JSONObjectWithData(raw_data, options:NSJSONReadingMutableContainers, error:error)
  end
end

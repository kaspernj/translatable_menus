class TranslatableMenus::Connections
  def self.instance
    @instance ||= TranslatableMenus::Connections.new
    @instance
  end
  
  def initialize
    clear
  end
  
  def clear
    @connects = {}
  end
  
  def connect(event, &blk)
    @connects[event] = [] unless @connects.key?(event)
    @connects[event] << {
      :event => event,
      :block => blk
    }
  end
  
  def call(event, controller, menu)
    return false unless @connects.key?(event)
    
    @connects[event].each do |connect_data|
      result = connect_data[:block].call(
        :controller => controller,
        :event => event,
        :menu => menu
      )
      
      return result unless result == true
    end
    
    return true
  end
end

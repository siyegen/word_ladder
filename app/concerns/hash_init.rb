module HashInit
  extend ActiveSupport::Concern

  def initialize(attributes = {})
    attributes.each do |name, value|
      instance_variable_set("@#{name}", value) if self.respond_to?(name.to_sym)
    end
  end
end

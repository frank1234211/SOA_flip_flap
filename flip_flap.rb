require_relative 'tsv_buddy'
require 'yaml'

# Needs top level documentation
class FlipFlap
  include TsvBuddy # Have to include the module to mix-it-in

  # Do NOT create an initialize method
  def take_yaml(yml)
    @data = YAML.load(yml) # Use dot not ::
  end

  def to_yaml
    @data.to_yaml # Avoid using return keyword
  end
end

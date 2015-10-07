require 'yaml'

module YamlBuddy


  def take_yaml(yml)
  	@data = YAML::load(yml)
  end
  def to_yaml
	return @data.to_yaml
  end
end

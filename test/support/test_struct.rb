class TestStruct
  attr_accessor :raw_hash

  delegate :[], to: :raw_hash

  def self.from_yaml(path)
    new(YAML.load(path))
  end

  def initialize(hash)
    self.raw_hash = hash || {}
  end

  def method_missing(name, *args, &block)
    super unless raw_hash.key?(name)

    if raw_hash[name].is_a?(Hash)
      raw_hash[name] = TestStruct.new(raw_hash[name])
    else
      raw_hash[name]
    end
  end
end

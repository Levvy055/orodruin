class Pipeline
  def initialize(filters)
    @filters = [*filters]
  end

  def call(data)
    @filters.reduce(data) { |a, e| e.parse(a) }
  end
end

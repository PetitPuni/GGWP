class ApplicationService
  def self.call(...)
    new(...).send(:call, &)
  end
end

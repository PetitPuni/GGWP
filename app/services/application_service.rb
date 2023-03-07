class ApplicationService
  def self.call(*args, **kwargs, &)
    new(*args, **kwargs, &).send(:call, &)
  end
end

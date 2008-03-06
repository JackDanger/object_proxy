$:.unshift File.dirname(__FILE__)

require 'object_proxy_safe_hash'

class ObjectProxy
  
  VERSION = '1.0.1'

  SAFE_METHODS = [:__id__, :__send__, :nil, :nil?, :send, :send!, :proxy_class, :proxy_respond_to?]
  
  alias_method :proxy_class, :class
  alias_method :proxy_respond_to?, :respond_to?
  
  instance_methods.each do |method|
    undef_method method unless SAFE_METHODS.include?(method.to_sym)
  end
  
  def initialize(target)
    @target = target
  end
  
  def is_object_proxy?
    true
  end
  
  def target
    @target
  end
  
  def respond_to?(*args)
    proxy_respond_to?(*args) || @target.respond_to?(*args)
  end

  protected

    # delegate nearly all method calls to the @target object
    def method_missing(method, *args, &block)
      @target.send(method, *args, &block)
    end
end
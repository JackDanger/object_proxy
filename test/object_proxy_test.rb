require 'test/unit'
require File.dirname(__FILE__) + '/../lib/object_proxy'

class OneHundredProxy < ObjectProxy
  def initialize
    @target = 100
  end
end

class ObjectProxyTest < Test::Unit::TestCase
  def test_does_not_respond_to_target
    assert_raises(NoMethodError) { ObjectProxy.new('some_value').responds_to?(:target) }
  end
  
  def test_has_target_method_that_returns_the_provided_value
    assert_equal 'target', ObjectProxy.new('target')
  end
  
  def test_target_object_does_not_have_identity_with_initialized_object
    object = Object.new
    assert !object.equal?(ObjectProxy.new(object))
  end
  
  def test_class_method_is_passed_to_target
    assert_equal String, ObjectProxy.new('some value').class
  end
  
  def test_send_is_passed_to_target
    object = 'ABCDEF'
    assert_equal object.send(:length), ObjectProxy.new(object).send(:length)
  end
  
  def test_proxy_class_accesses_the_class_of_the_object_proxy
    assert_equal ObjectProxy, ObjectProxy.new('value').proxy_class
  end
  
  def test_proxy_class_allows_methods_added_to_the_proxy_class
    object = 'ABCDEF'
    proxy = ObjectProxy.new(object)
    proxy.proxy_class.class_eval do
      define_method :return_target do
        @target
      end
    end
    assert_equal object, proxy.return_target
  end
  
  def test_method_missing_errors_are_raised_from_the_target_object
    begin
      ObjectProxy.new(12345).howzitgoin
    rescue => e
      assert_equal %Q(undefined method `howzitgoin' for 12345:Fixnum), e.message
    end
  end
  
  def test_subclass_of_object_proxy_can_set_target_however_it_wants
    assert_equal 100, OneHundredProxy.new.target
  end
end
require 'test/unit'
require File.dirname(__FILE__) + '/../lib/object_proxy'

class ObjectProxySafeHashTest < Test::Unit::TestCase
  def test_object_proxy_identifies_as_target_for_hash_lookup
    object = 'a string'
    hash = {object => true}
    assert hash[ObjectProxy.new(object)]
  end
end
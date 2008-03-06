# This extension fixes that object proxies aren't interchangeable with their target
# value for the purposes of hash lookup
# The following becomes true in MRI:
# 
# {'some_string' => true}[ObjectProxy.new('some_string')]
# 

module ObjectProxySafeHash
  def self.included(klass)
    klass.class_eval do

      define_method "[]_with_object_proxy" do |value|
        if value.respond_to?(:is_object_proxy?) && value.is_object_proxy?
          value = value.target
        end
        send "[]_without_object_proxy", value
      end
      
      alias_method '[]_without_object_proxy', '[]'
      alias_method '[]', '[]_with_object_proxy'
    end

  end
end

class Hash
  unless included_modules.include?(ObjectProxySafeHash)
    include ObjectProxySafeHash
  end
end

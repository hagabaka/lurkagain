# A class which helps reduce code duplication in initializers
# From http://eigenclass.org/hiki/struct-alike+class+definition, slightly
# modified for Ruby 1.9 compatibility

# Copyright (C) 2006 Mauricio Fernandez <mfp@acm.org> http://eigenclass.org
# Use and distribution under the same terms as Ruby.

class InitializedClass
  def self.new_class(accessor_type, *args, &block)
    parent = args.pop if Class === args.last
    parent ||= Object
    unless args.size > 1
      raise ArgumentError, "No point in using InitializedClass for a single argument!" 
    end
    Class.new(parent) do
      case accessor_type
      when :ro ; attr_reader(*args)
      when :rw ; attr_accessor(*args)
      end
       
      define_method(:initialize) do |*a|
        args.each{|name| instance_variable_set("@#{name}", nil) }
        if a.size == 1 && Hash === a[0]
          args.each{|name| instance_variable_set("@#{name}", a[0][name.to_sym])}
        elsif a.size > 0 && a.size != args.size
          raise ArgumentError, 
                "wrong number of arguments (#{a.size} for #{args.size})"
        else
          args.each_with_index{|name, i| instance_variable_set("@#{name}", a[i])}
        end
        instance_eval(&block) if block
      end

      if block
        super_meth = parent.instance_method(:initialize)
        define_method(:initialize_super){|*a| super_meth.bind(self).call(*a) }
        private :initialize_super
      end
    end
  end

  def self.new(*args, &block); new_class(:ro, *args, &block) end
  def self.new_rw(*args, &block); new_class(:rw, *args, &block) end
end
SuperClass = InitializedClass


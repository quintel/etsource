# from http://rdoc.info/gems/activesupport/Class#subclasses-instance_method
class Class
  def subclasses
    subclasses, chain = [], descendants
    chain.each do |k|
      subclasses << k unless chain.any? { |c| c > k }
    end
    subclasses
  end
end

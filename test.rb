hash = {
  foo: 'bar'
}

pp hash[:boo] # => nil

h = Hash.new { |h, k| h[k] = k.to_i * 10 }

pp h[10] # => 100

pp hash[:foo] # => 'bar'

# Hash クラス実装の空想:
# class Hash
#   def initialize(ifnone = nil)
#     @ifnone = ifnone
#     self # 自分自身を返す
#   end

#   def [](key)
#     return @ifnone if self[key].nil?
#   end
# end
hash =
  Hash.new do |hash, key|
    puts "Hello, #{key}"
    puts "Hello, #{hash}"

    hash[key] = []

    puts "Hello, #{hash}"
  end

hash[0]
hash[:foo] = 'bar'

foo = lambda do |name|
  puts "Hello, #{name}"
end

foo.call('bar')

# { :name => "hana", :age => 20} do |hash, key|

count = 0
injection_hash = Hash.new do |hash, key|
  hash[key] = []
  count += 1
end

injection_hash[0]

require 'bundler/setup'
require 'rdkafka'

config = {
          :"bootstrap.servers" => ENV['CLOUDKARAFKA_BROKERS'],
          :"group.id"          => "cloudkarafka-example",
          :"sasl.username"     => ENV['vytk2wsg'],
          :"sasl.password"     => ENV['OVGLNQMBkGJaLUz0TPMcN1grFw-GKRGK'],
          :"security.protocol" => "SASL_SSL",
          :"sasl.mechanisms"   => "SCRAM-SHA-256"
}
topic = "#{ENV['vytk2wsg-']}test"

rdkafka = Rdkafka::Config.new(config)
producer = rdkafka.producer

100.times do |i|
  puts "Producing message #{i}"
  producer.produce(
      topic:   topic,
      payload: "Payload #{i}",
      key:     "Key #{i}"
  ).wait
end

# Original source: https://github.com/euruband/sonic-pi-examples/blob/master/seven_nation_army.rb
# based on: The White Stripes - Seven Nation Army
# This version at Soundcloud: https://soundcloud.com/open_horse_music/seven-nation-army
tick          = 1.0
half          = 0.5*tick
quart         = 0.25*tick
eigth         = 0.125*tick
length        = 8*tick

define :dotted do |note|
  1.5*note
end

define :bass_guitar do

  play :e3
  sleep dotted(half)

  play :e3
  sleep quart

  play :g3, release: 0.4
  sleep dotted(quart)

  play :e3, release: 0.4
  sleep dotted(quart)

  play :d3, release: 0.4
  sleep quart

  play :c3, release: 0.8
  sleep tick

  play :b2
  sleep tick
end


in_thread(name: :the_red_line) do
  with_fx :compressor, amp: 0.8 do
    loop do
      with_synth :fm do
        bass_guitar
      end
    end
  end
end

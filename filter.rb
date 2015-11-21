#!/usr/bin/env ruby

def print_xml(settings)
  puts '<?xml version="1.0"?>'
  puts '<items>'
  settings.each do |s|
    k = s.split(' ').collect(&:downcase).join('_')
    puts <<EOF
<item uid="#{k}" arg="#{s}" valid="YES" autocomplete="#{s}">
  <title>#{s}</title>
</item>
EOF
  end
  puts '</items>'
end

filter = ARGV[0]

settings = ["Invert colors", "Use grayscale", "Increase contrast", "Differentiate without color", "Reduce transparency", "Shake mouse pointer to locate"]

settings = settings.reject {|s| !/#{filter}/i.match(s)} if filter

print_xml settings
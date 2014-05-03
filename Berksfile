def dependencies(path)
  berks = "#{path}/Berksfile.in"
  instance_eval(File.read(berks)) if File.exists?(berks)
end

Dir.glob('./site-cookbooks/*').each do |path|
  dependencies path
  cookbook File.basename(path), :path => path
end

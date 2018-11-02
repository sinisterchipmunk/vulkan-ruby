desc 'recompile ./examples/shaders'
task :shaders do
  chdir 'examples/shaders' do
    Dir['*.{vert,frag}'].each do |shader|
      sh 'glslangValidator', '-V', shader, '-o', "#{shader}.spv"
    end
  end
end

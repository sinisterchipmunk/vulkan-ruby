desc 'regenerate everything'
task :generate => ['generate:types', 'generate:enums', 'generate:structs', 'generate:extensions']

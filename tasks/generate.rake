desc 'regenerate everything'
task :generate => %w( generate:types
                      generate:enums
                      generate:structs
                      generate:extensions
                      generate:commands
                      generate:version
                    )

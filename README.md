# `vulkan-ruby`

Exposes [Vulkan](https://www.khronos.org/vulkan/), the next-generation graphics library, to Ruby!

**NOTICE**: Vulkan is neither a small nor simple API to implement. While this library is rapidly reaching a point of usability, it's quite possible you will find that it is insufficient in some way. You are encouraged to open new issues for missing functionality that should otherwise be possible with Vulkan (bonus points for pull requests). The rule of thumb is that if it can be done with Vulkan in C, it should be equally doable using this library.

Higher level abstractions must be evaluated on a case by case basis and are not guaranteed to be added. For example, something explicitly specified in the Vulkan spec such as `vkCmdBindPipeline` or an official extension such as `vk_nv_external_memory` should definitely work in `vulkan-ruby` and support would absolutely be added for them if they don't already work. An implementation of cascading shadow maps, on the other hand, would be better implemented as a standalone ruby gem and at least at the time of this writing would likely be rejected unless a very good explanation could be given for having it.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'vulkan-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vulkan-ruby

## Usage

This library is intended to be a rather shallow wrapper around the Vulkan APIs. It does some things that are nifty (like tying garbage collection of Vulkan resources to the Ruby garbage collector), but mostly the design goal is to give you an interface into Vulkan without getting in the way. As with Vulkan itself, some things are possible to do in a number of different ways, depending on your specific use case. Nothing that is possible in Vulkan should prove _impossible_ to do with `vulkan-ruby`.

You are encouraged to [check out the examples](https://github.com/sinisterchipmunk/vulkan-ruby/tree/master/examples/) for some specific usage examples.

### Extensions and Layers

If the environment variable `DEBUG` is set, the following extensions and layers will be added (only if supported by the underlying implementation):

* Instance Extensions

```
    VK_EXT_debug_utils
    VK_EXT_debug_report
```

* Layers

```
    VK_LAYER_GOOGLE_threading
    VK_LAYER_GOOGLE_unique_objects
    VK_LAYER_LUNARG_api_dump
    VK_LAYER_LUNARG_assistant_layer
    VK_LAYER_LUNARG_core_validation
    VK_LAYER_LUNARG_demo_layer
    VK_LAYER_LUNARG_monitor
    VK_LAYER_LUNARG_object_tracker
    VK_LAYER_LUNARG_parameter_validation
    VK_LAYER_LUNARG_standard_validation
    VK_LAYER_LUNARG_starter_layer
```

In addition to the usual mechanisms for explicit and implicit Vulkan extensions, you can also provide the following environment variables to list extensions/layers to be activated. These get injected into the lists provided by the application to Vulkan, rather than interpreted by Vulkan itself. Multiple entries can be separated by spaces (` `) or by colons (`:`).

      LAYERS
      INSTANCE_EXTENSIONS
      DEVICE_EXTENSIONS


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

When running `rake`, you can pass `PATH_TO_VULKAN` to specify the Vulkan library to load during testing. Otherwise `NULL` will be passed into SDL2, indicating that it should search for the library.

Everything in `lib/vulkan/generated/` was automatically generated by processing the Vulkan `vk.xml` spec file. To (re)generate these files, first fetch `vk.xml` with `rake fetch`, and then generate the files with `rake generate`, or do it all in one command like so:

```bash
$ bundle exec rake fetch generate
```

After (re)generating the files, run `rake` with no arguments, which will invoke both the unit tests and the example files, to (a) check that nothing was broken by the new files, and (b) check that the generated files are correct.

If you discover that the generated files are not correct (for instance, lacking some structs or enums or some generated results just have wrong values), write a unit test to assert the expected result before modifying the generation Rake tasks in `tasks/**/*.rake`. Or at least write the test once you get the result you're looking for. The point is, since these rake tasks are both complicated and mission-critical, unit tests need to be written to be sure that there are no regressions as they evolve over time.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sinisterchipmunk/vulkan-ruby.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

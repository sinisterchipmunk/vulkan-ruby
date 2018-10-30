#!/bin/bash -e
which glslangValidator >/dev/null || (echo 'set PATH to include `glslangValidator`' && exit 1)
find . -name '*.vert' -exec glslangValidator -V {} -o {}.spv \;
find . -name '*.frag' -exec glslangValidator -V {} -o {}.spv \;

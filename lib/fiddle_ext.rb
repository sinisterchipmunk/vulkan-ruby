require 'fiddle'
require 'fiddle/import'

module Fiddle
  class Pointer
    # Copies data from the specified pointer into this one, starting at offset
    # 0 and ending at either this pointer's size or the size of `other`,
    # whichever is smaller.
    def copy_from(other)
      size = self.size > other.size ? other.size : self.size
      self[0, size] = other
      self
    end
  end
end

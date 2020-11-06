class LRUCache
    def initialize(size)
      raise "Size must be > 0" if size <= 0
      @size = size
      @cache = []
    end

    def count
      # returns number of elements currently in cache
      @cache.length
    end

    def add(el)
      # adds element to cache according to LRU principle
      if there_is_empty_place_in_cache && cache_doesnt_contain(el)
        push(el)
      elsif cache_contains(el)
        ind = @cache.index(el)
        @cache.delete_at(ind)
        push(el)
      else
        @cache.delete_at(0)
        push(el)
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      print @cache
    end

    private
    # helper methods go here!

  end
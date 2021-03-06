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
      if there_is_empty_place_in_cache? && cache_doesnt_contain?(el) # O(N)
        push(el) # O(1)
      elsif cache_contains?(el) # O(N)
        ind = @cache.index(el) # O(N)
        @cache.delete_at(ind) # O(N)
        push(el) # O(1)
      else
        @cache.delete_at(0) # O(1)
        push(el) # O(1)
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      print @cache
    end

    private
    # helper methods go here!
    def there_is_empty_place_in_cache?
      count < @size
    end

    def cache_doesnt_contain?(el)
      !cache_contains?(el)
    end

    def cache_contains?(el)
      @cache.include?(el)
    end

    def push(el)
      @cache << el
    end

  end
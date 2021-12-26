# frozen_string_literal: true

text = File.read('madlibs.txt')
adjectives = %w(quick lazy sleepy ugly)
nouns = %w(fox dog head leg)
verbs = %w(easily lazily noisily excitedly)

until !text.include?("%{adjective}")
  text.sub!("%{adjective}", adjectives.sample)
end

p text

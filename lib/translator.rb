# require modules here
require "yaml"


def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  emoticons.each { |key, value|
    emoticons[key] = {:english => emoticons[key][0], :japanese => emoticons[key][1]}
  }
  puts emoticons
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  emoticons = load_library(file_path)
  emoticons.each{|key, value|
    if emoticons[key][:english] == emoticon
      return emoticons[key][:japanese]
    end
  }
  return "Sorry, that emoticon was not found"
end


def get_english_meaning(file_path, emoticon)
  # code goes here
  emoticons = load_library(file_path)
  emoticons.each do |key, value|
    if emoticons[key][:japanese] == emoticon
      return key
    end
  end
  return "Sorry, that emoticon was not found"
end

puts get_english_meaning('lib/emoticons.yml', "☜(⌒▽⌒)☞")

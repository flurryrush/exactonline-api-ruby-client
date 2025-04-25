# frozen_string_literal: true

module Elmas
  module Utils

    # /
    #   (?<before>[A-Za-z]*?)          # lazy grab of letters before a token
    #   (?:
    #       (?<token>VatGl[A-Z])       # "VatGl" + next capital letter
    #     | (?<token>Gl[A-Z])          # "Gl" + next capital letter
    #     | (?<token>Vat)              # literal "Vat"
    #     | (?<token>Id)               # "Id" suffix / token
    #     | (?<token>Fc)               # "Fc" suffix / token
    #   )
    # /x.freeze

    TOKEN_REGEX = /(?<before>[A-Za-z]*?)(?:(?<token>VatGl[A-Z])|(?<token>Gl[A-Z])|(?<token>Vat)|(?<token>Id)|(?<token>Fc))/x.freeze

    def self.demodulize(class_name_in_module)
      class_name_in_module.to_s.sub(/^.*::/, "")
    end

    def self.pluralize(word)
      word.to_s.sub(/([^s])$/, '\1s')
    end

    def self.modulize(class_name)
      "Elmas::#{class_name}"
    end

    def self.collection_path(class_name)
      (Utils.pluralize Utils.demodulize class_name).downcase
    end

    def self.camelize(word, uppercase_first_letter = true)
      if uppercase_first_letter
        # use active support camelize
        # make sure *Vat*, *Gl*, *Id and *Fc are properly camelized
        word = word.to_s.camelize
        res = ""
        pos = 0
        while (m = TOKEN_REGEX.match(word, pos))
          # push the 'before' group unless it's empty
          res += m[:before] unless m[:before].empty?
          # push the token itself
          res += m[:token].upcase
          # advance the cursor
          pos = m.end(0)
        end
        # push any trailing letters after the last token
        res += word[pos..] if pos < word.length
        res
      else
        word[0] + Utils.camelize(word)[1..]
      end
    end

    def self.normalize_hash_key(key)
      if key.is_a? String
        key = key.gsub(/::/, "/")
        key = key.gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
        key = key.gsub(/([a-z\d])([A-Z])/, '\1_\2')
        key = key.gsub(/([a-z])(\d{2,})/, '\1_\2')
        key = key.tr("-", "_")
        key = key.downcase
        return key.to_sym
      end
      key
    end

    def self.normalize_hash(hash)
      hash&.transform_keys { |k| Utils.normalize_hash_key(k) }
    end

    def self.parse_key(key)
      "VATCode" if key.casecmp "vat_code"
      Utils.camelize(key)
    end
  end
end

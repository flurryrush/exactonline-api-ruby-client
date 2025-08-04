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

    TOKEN_REGEX = /(?<before>[A-Za-z]*?)(?:(?<token>VatGl[A-Z])|(?<token>Vatfc)|(?<token>Vatdc)|(?<token>Gl[A-Z])|(?<token>Vat)|(?<token>Id)|(?<token>Fc)|(?<token>Dc)|(?<token>Hr))/x.freeze
    SPECIAL_CASES = {
      bic_code: "BICCode",
      brin: "BRIN",
      bsn: "BSN",
      class_01: "Class_01",
      class_02: "Class_02",
      class_03: "Class_03",
      class_04: "Class_04",
      class_05: "Class_05",
      class_06: "Class_06",
      class_07: "Class_07",
      class_08: "Class_08",
      class_09: "Class_09",
      class_10: "Class_10",
      free_date_field_01: "FreeDateField_01",
      free_date_field_02: "FreeDateField_02",
      free_date_field_03: "FreeDateField_03",
      free_date_field_04: "FreeDateField_04",
      free_date_field_05: "FreeDateField_05",
      free_date_field_06: "FreeDateField_06",
      free_date_field_07: "FreeDateField_07",
      free_date_field_08: "FreeDateField_08",
      free_date_field_09: "FreeDateField_09",
      free_date_field_10: "FreeDateField_10",
      free_number_field_01: "FreeNumberField_01",
      free_number_field_02: "FreeNumberField_02",
      free_number_field_03: "FreeNumberField_03",
      free_number_field_04: "FreeNumberField_04",
      free_number_field_05: "FreeNumberField_05",
      free_number_field_06: "FreeNumberField_06",
      free_number_field_07: "FreeNumberField_07",
      free_number_field_08: "FreeNumberField_08",
      free_number_field_09: "FreeNumberField_09",
      free_number_field_10: "FreeNumberField_10",
      free_text_field_01: "FreeTextField_01",
      free_text_field_02: "FreeTextField_02",
      free_text_field_03: "FreeTextField_03",
      free_text_field_04: "FreeTextField_04",
      free_text_field_05: "FreeTextField_05",
      free_text_field_06: "FreeTextField_06",
      free_text_field_07: "FreeTextField_07",
      free_text_field_08: "FreeTextField_08",
      free_text_field_09: "FreeTextField_09",
      free_text_field_10: "FreeTextField_10",
      eori_number: "EORINumber",
      glap: "GLAP",
      glar: "GLAR",
      ob_number: "OBNumber",
      oin_number: "OINNumber",
      rsin: "RSIN",
      vat_doc_type: "VatDocType",
      vat_margin: "VatMargin"
    }

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
      if SPECIAL_CASES.keys.include?(word.to_sym)
        SPECIAL_CASES[word.to_sym]
      elsif uppercase_first_letter
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

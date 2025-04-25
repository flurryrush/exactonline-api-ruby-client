# frozen_string_literal: true

module Elmas
  # Endpoint
  # OpportunityContact
  #
  # Good to know
  # 
  #
  # Scope
  # Crm opportunities
  class OpportunityContact
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/crm/OpportunityContacts"
    end

    def mandatory_attributes
      %i[
        account first_name last_name
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadCRMOpportunityContacts
    def other_attributes
      %i[
        account_is_customer account_is_supplier account_main_contact account_name address_line2
        address_street address_street_number address_street_number_suffix allow_mailing birth_date
        birth_name birth_name_prefix birth_place business_email business_fax business_mobile
        business_phone business_phone_extension city code contact country created creator
        creator_full_name custom_field division email end_date full_name gender hid
        identification_date identification_document identification_user initials is_anonymised
        is_mailing_excluded is_main_contact job_title_description language lead_purpose lead_source
        marketing_notes middle_name mobile modified modifier modifier_full_name nationality notes
        opportunity partner_name partner_name_prefix person phone phone_extension picture
        picture_name picture_thumbnail_url picture_url postcode social_security_number start_date
        state title title_abbreviation title_description
      ]
    end
  end
end

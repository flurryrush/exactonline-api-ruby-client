# frozen_string_literal: true

module Elmas
  # Endpoint
  # Asset
  #
  # Good to know
  # Use this endpoint to get all information related to your admininstrations asset master data.
  #  This REST API returns the information as seen on the asset card.
  # To retrieve the total depreciated amount and the last depreciation date as calculated in Exact Online, you must use XML API
  #
  # Scope
  # Financial assets
  class Asset
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "assets/Assets"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=AssetsAssets
    def other_attributes
      %i[
        already_depreciated asset_from asset_from_description asset_group asset_group_code
        asset_group_description catalogue_value code commercial_building_values costcenter
        costcenter_description costunit costunit_description created creator creator_full_name
        custom_field deduction_percentage depreciated_amount depreciated_periods
        depreciated_start_date description division end_date engine_emission engine_type
        gl_transaction_line gl_transaction_line_description investment_account
        investment_account_code investment_account_name investment_amount_dc investment_amount_fc
        investment_currency investment_currency_description investment_date investment_deduction
        modified modifier modifier_full_name notes parent parent_code parent_description picture
        picture_file_name primary_method primary_method_code primary_method_description
        residual_value start_date status transaction_entry_id transaction_entry_no type
      ]
    end
  end
end

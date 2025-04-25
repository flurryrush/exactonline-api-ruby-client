# frozen_string_literal: true

module Elmas
  # Endpoint
  # AssetGroup
  #
  # Good to know
  # Use this endpoint to get all information related to the asset groups of the administration.
  #   Asset groups are used to maintain depreciation method and G/L accounts for a group of assets
  #
  # Scope
  # Financial assets
  class AssetGroup
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "assets/AssetGroups"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=AssetsAssetGroups
    def other_attributes
      %i[
        code created creator creator_full_name depreciation_method depreciation_method_code
        depreciation_method_description description division gl_account_assets
        gl_account_assets_code gl_account_assets_description gl_account_depreciation_bs
        gl_account_depreciation_bs_code gl_account_depreciation_bs_description
        gl_account_depreciation_pl gl_account_depreciation_pl_code
        gl_account_depreciation_pl_description gl_account_revaluation_bs
        gl_account_revaluation_bs_code gl_account_revaluation_bs_description modified modifier
        modifier_full_name notes
      ]
    end
  end
end

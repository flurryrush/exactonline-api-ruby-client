# frozen_string_literal: true

module Elmas
  # Endpoint
  # SyncSyncTimestamp
  #
  # Good to know
  # The sync APIs have the goal to keep the data between Exact Online and a 3rd party application the same.
  #  When you use the Sync APIs for the first time, you might not want to sync all data, but you want to start syncing on a particular date.
  #  Via the Modified date filter, you can retrieve a single timestamp and use it in the Sync APIs.
  #  You must provide datetime as 'modified' and name of the endpoint as 'endpoint' to filter on property 'Modified' of each sync endpoint.
  #  The first record found will be return based on the greater than or equal to logical operator.
  #   You can provide the endPoint value based on the following supported endPoints: &nbsp &nbsp • sync/CRM/QuotationHeaders use QuotationHeaders as endPoint value.
  #  &nbsp &nbsp • sync/CRM/QuotationLines use QuotationLines as endPoint value.
  #  &nbsp &nbsp • sync/Financial/TransactionLines use TransactionLines as endPoint value.
  #  &nbsp &nbsp • sync/Inventory/ItemStorageLocations use ItemStorageLocations as endPoint value.
  #  &nbsp &nbsp • sync/Manufacturing/ShopOrders use ShopOrders as endPoint value.
  #  &nbsp &nbsp • sync/Manufacturing/ShopOrderMaterialPlans use ShopOrderMaterialPlans as endPoint value.
  #  &nbsp &nbsp • sync/Manufacturing/ShopOrderRoutingStepPlans use ShopOrderRoutingStepPlans as endPoint value.
  #  &nbsp &nbsp • sync/Manufacturing/ShopOrderPurchasePlanning use ShopOrderPurchasePlanning as endPoint value.
  #  &nbsp &nbsp • sync/Manufacturing/ShopOrderSubOrders use ShopOrderSubOrders as endPoint value.
  #  &nbsp &nbsp • sync/Manufacturing/MaterialIssues use MaterialIssues as endPoint value.
  #  &nbsp &nbsp • sync/Manufacturing/BillOfMaterialVersions use BillOfMaterialVersions as endPoint value.
  #  &nbsp &nbsp • sync/Manufacturing/BillOfMaterialMaterials use BillOfMaterialMaterials as endPoint value.
  #  &nbsp &nbsp • sync/PurchaseOrder/PurchaseOrders use PurchaseOrders as endPoint value.
  #  &nbsp &nbsp • sync/Project/Projects use Projects as endPoint value.
  #  &nbsp &nbsp • sync/Project/ProjectPlanning use ProjectPlanning as endPoint value.
  #  &nbsp &nbsp • sync/Project/ProjectWBS use ProjectWBS as endPoint value.
  #  &nbsp &nbsp • sync/Project/TimeCostTransactions use TimeCostTransactions as endPoint value.
  #  &nbsp &nbsp • sync/SalesInvoice/SalesInvoices use SalesInvoices as as endPoint value.
  #  &nbsp &nbsp • sync/SalesOrder/GoodsDeliveries use GoodsDeliveries as as endPoint value.
  #  &nbsp &nbsp • sync/SalesOrder/GoodsDeliveryLines use GoodsDeliveryLines as endPoint value.
  #  &nbsp &nbsp • sync/SalesOrder/SalesOrderHeaders use SalesOrderHeaders as endPoint value.
  #  &nbsp &nbsp • sync/SalesOrder/SalesOrderLines use SalesOrderLines as endPoint value.
  #  &nbsp &nbsp • sync/Subscription/Subscriptions use Subscriptions as endPoint value.
  #  &nbsp &nbsp • sync/Subscription/SubscriptionLines use SubscriptionLines as endPoint value.
  #   For example : modified=datetime'2022-01-01'&endPoint='QuotationHeaders' For this function to work correctly, you must supply all parameters
  #
  # Scope
  # Organization administration
  class SyncSyncTimestamp
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/sync/Sync/SyncTimestamp"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadSyncSyncSyncTimestamp
    def other_attributes
      %i[
        modified api time_stamp_as_big_int
      ]
    end
  end
end

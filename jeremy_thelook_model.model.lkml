connection: "thelook"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.

explore: order_items {
  join: users {
    relationship: many_to_one
    sql_on: ${order_items.user_id} = ${users.id} ;;
  }

  join: inventory_items {
    relationship: many_to_one
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
  }

  join: distribution_centers {
    relationship: many_to_one
    sql_on: ${inventory_items.product_distribution_center_id} = ${distribution_centers.id} ;;
  }
}

explore: inventory_items {
  join: products {
    view_label: "Limited Products"
    relationship: one_to_one
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
  }
  sql_always_where: ${product_distribution_center_id} = 1 ;;
  persist_for: "4 hours"
  fields: [ALL_FIELDS*, -products.cost]
  always_filter: {
    filters: {
      field: product_brand
      value: "Dickies"
    }
  }label: "Dickies Inventory"
}

explore: users {
  join: events {
    relationship: one_to_many
    sql_on: ${users.id} = ${events.id} ;;
  }
  label: "User's Events"
}

# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

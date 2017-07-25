view: order_items {
  sql_table_name: public.order_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: distance {
    type:  distance
    start_location_field: distribution_centers.location
    end_location_field: users.location
    units:  miles
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: delivered {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.delivered_at ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension_group: shipped {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.shipped_at ;;
  }

  dimension: price_category {
    case: {
      when: {
        sql: ${order_items.sale_price} > 300  ;;
        label: "expensive"
      }
      when: {
        sql: ${order_items.sale_price} < 80 ;;
        label: "affordable"
      }
      else: "mid_ranged"
    }
    alpha_sort:  yes
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: max_distance {
    type: max
    sql:  ${distance};;
    value_format_name: decimal_2
  }

  measure: min_sold {
    type: min
    sql: ${sale_price} ;;
    value_format_name: usd
  }

  measure: avg_sold {
    type: average
    sql: ${sale_price} ;;
    value_format_name: usd
  }

  measure: sum_sold {
    type: sum
    sql: ${sale_price} ;;
    value_format_name: usd
  }

  measure: total_distance_shipped {
    type: sum_distinct
    sql_distinct_key: ${order_items.id} ;;
    sql: ${distance} ;;
    value_format_name: decimal_1
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      inventory_items.id,
      inventory_items.product_name,
      users.id,
      users.last_name,
      users.first_name
    ]
  }
}

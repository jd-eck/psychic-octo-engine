view: obs {
  sql_table_name: observation_2016_08.obs ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: common_name {
    type: string
    sql: ${TABLE}.common_name ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: genus {
    type: string
    sql: ${TABLE}.genus ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: location_description {
    type: string
    sql: ${TABLE}.location_description ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: national_ownership {
    type: string
    sql: ${TABLE}.national_ownership ;;
  }

  dimension: observer {
    type: string
    sql: ${TABLE}.observer ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: species {
    type: string
    sql: ${TABLE}.species ;;
  }

  dimension: taxon {
    type: string
    sql: ${TABLE}.taxon ;;
  }

  dimension: unique_id {
    type: number
    sql: ${TABLE}.unique_id ;;
  }

  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: [id, common_name]
  }
}

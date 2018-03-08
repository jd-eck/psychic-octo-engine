view: timely_effective {
  sql_table_name: observation_2016_08.timely_effective ;;

  dimension: address {
    type: string
    sql: ${TABLE}.Address ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: condition {
    type: string
    sql: ${TABLE}.Condition ;;
  }

  dimension: county_name {
    type: string
    sql: ${TABLE}.County_Name ;;
  }

  dimension: footnote {
    type: string
    sql: ${TABLE}.Footnote ;;
  }

  dimension: hospital_name {
    type: string
    sql: ${TABLE}.Hospital_Name ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.Location ;;
  }

  dimension_group: measure_end {
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
    sql: ${TABLE}.Measure_End_Date ;;
  }

  dimension: measure_id {
    type: string
    sql: ${TABLE}.Measure_ID ;;
  }

  dimension: measure_name {
    type: string
    sql: ${TABLE}.Measure_Name ;;
  }

  dimension_group: measure_start {
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
    sql: ${TABLE}.Measure_Start_Date ;;
  }

  dimension: phone_number {
    type: number
    sql: ${TABLE}.Phone_Number ;;
  }

  dimension: provider_id {
    type: number
    sql: ${TABLE}.Provider_ID ;;
  }

  dimension: sample {
    type: string
    sql: ${TABLE}.Sample ;;
  }

  dimension: score {
    type: string
    sql: ${TABLE}.Score ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: zip_code {
    type: zipcode
    sql: ${TABLE}.ZIP_Code ;;
  }

  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: [county_name, measure_name, hospital_name]
  }
}

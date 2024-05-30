# The name of this view in Looker is "Pdt Build Catalog"
view: pdt_build_catalog {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.pdt_build_catalog ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Build Began At" in Explore.

  dimension: build_began_at {
    type: number
    sql: ${TABLE}.build_began_at ;;
  }

  dimension: build_duration {
    type: number
    sql: ${TABLE}.build_duration ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_build_duration {
    type: sum
    sql: ${build_duration} ;;  }
  measure: average_build_duration {
    type: average
    sql: ${build_duration} ;;  }

  dimension: build_error {
    type: string
    sql: ${TABLE}.build_error ;;
  }

  dimension: build_new_trigger_value {
    type: string
    sql: ${TABLE}.build_new_trigger_value ;;
  }

  dimension: build_old_trigger_value {
    type: string
    sql: ${TABLE}.build_old_trigger_value ;;
  }

  dimension: build_reason {
    type: string
    sql: ${TABLE}.build_reason ;;
  }

  dimension: built_at {
    type: number
    sql: ${TABLE}.built_at ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.`key` ;;
  }

  dimension: last_build_sql {
    type: string
    sql: ${TABLE}.last_build_sql ;;
  }

  dimension: num_builds {
    type: number
    sql: ${TABLE}.num_builds ;;
  }

  dimension: num_failed {
    type: number
    sql: ${TABLE}.num_failed ;;
  }

  dimension: record_updated_at {
    type: number
    sql: ${TABLE}.record_updated_at ;;
  }

  dimension: total_duration {
    type: number
    sql: ${TABLE}.total_duration ;;
  }

  dimension: trigger_at {
    type: number
    sql: ${TABLE}.trigger_at ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}

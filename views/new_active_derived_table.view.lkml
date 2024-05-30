# The name of this view in Looker is "New Active Derived Table"
view: new_active_derived_table {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.new_active_derived_table ;;
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
    # This dimension will be called "Cache Value" in Explore.

  dimension: cache_value {
    type: string
    sql: ${TABLE}.cache_value ;;
  }

  dimension: connection {
    type: string
    sql: ${TABLE}.connection ;;
  }

  dimension: dead_at {
    type: number
    sql: ${TABLE}.dead_at ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.`key` ;;
  }

  dimension: mode {
    type: number
    sql: ${TABLE}.mode ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: rename_to {
    type: string
    sql: ${TABLE}.rename_to ;;
  }

  dimension: trigger_at {
    type: number
    sql: ${TABLE}.trigger_at ;;
  }

  dimension: trigger_duration {
    type: number
    sql: ${TABLE}.trigger_duration ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_trigger_duration {
    type: sum
    sql: ${trigger_duration} ;;  }
  measure: average_trigger_duration {
    type: average
    sql: ${trigger_duration} ;;  }

  dimension: trigger_error {
    type: string
    sql: ${TABLE}.trigger_error ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}

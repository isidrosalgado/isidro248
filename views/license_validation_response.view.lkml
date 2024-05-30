# The name of this view in Looker is "License Validation Response"
view: license_validation_response {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.license_validation_response ;;
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
    # This dimension will be called "Integrity Check" in Explore.

  dimension: integrity_check {
    type: string
    sql: ${TABLE}.integrity_check ;;
  }

  dimension: response_code {
    type: number
    sql: ${TABLE}.response_code ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_response_code {
    type: sum
    sql: ${response_code} ;;  }
  measure: average_response_code {
    type: average
    sql: ${response_code} ;;  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: timestamp_completed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timestamp_completed ;;
  }

  dimension_group: timestamp_initiated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timestamp_initiated ;;
  }

  dimension: validation_type {
    type: string
    sql: ${TABLE}.validation_type ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}

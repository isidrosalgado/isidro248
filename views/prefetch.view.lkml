# The name of this view in Looker is "Prefetch"
view: prefetch {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.prefetch ;;
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
    # This dimension will be called "Computation Time" in Explore.

  dimension: computation_time {
    type: number
    sql: ${TABLE}.computation_time ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_computation_time {
    type: sum
    sql: ${computation_time} ;;  }
  measure: average_computation_time {
    type: average
    sql: ${computation_time} ;;  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: expires {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.expires_at ;;
  }

  dimension: hash {
    type: string
    sql: ${TABLE}.hash ;;
  }

  dimension: hit_count {
    type: number
    sql: ${TABLE}.hit_count ;;
  }

  dimension: result_size_bytes {
    type: number
    sql: ${TABLE}.result_size_bytes ;;
  }

  dimension: results {
    type: string
    sql: ${TABLE}.results ;;
  }

  dimension_group: touched {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.touched_at ;;
  }

  dimension: ttl {
    type: number
    sql: ${TABLE}.ttl ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}

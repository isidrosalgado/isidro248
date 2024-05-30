# The name of this view in Looker is "Cache Index"
view: cache_index {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.cache_index ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: cache {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.cache_time ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cleanup Scheme" in Explore.

  dimension: cleanup_scheme {
    type: string
    sql: ${TABLE}.cleanup_scheme ;;
  }

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

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: encrypted {
    type: yesno
    sql: ${TABLE}.encrypted ;;
  }

  dimension: entry_type {
    type: string
    sql: ${TABLE}.entry_type ;;
  }

  dimension: execution_time {
    type: number
    sql: ${TABLE}.execution_time ;;
  }

  dimension_group: expiration {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.expiration ;;
  }

  dimension: gzipped {
    type: yesno
    sql: ${TABLE}.gzipped ;;
  }

  dimension: hash {
    type: string
    sql: ${TABLE}.hash ;;
  }

  dimension_group: last_touched {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_touched_at ;;
  }

  dimension: marshaled {
    type: yesno
    sql: ${TABLE}.marshaled ;;
  }

  dimension: node_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.node_id ;;
  }

  dimension: query_text {
    type: string
    sql: ${TABLE}.query_text ;;
  }

  dimension: result_columns {
    type: number
    sql: ${TABLE}.result_columns ;;
  }

  dimension: result_rows {
    type: number
    sql: ${TABLE}.result_rows ;;
  }

  dimension: result_size_bytes {
    type: number
    sql: ${TABLE}.result_size_bytes ;;
  }

  dimension: time_to_live_without_touch {
    type: number
    sql: ${TABLE}.time_to_live_without_touch ;;
  }

  dimension: touch_count {
    type: number
    sql: ${TABLE}.touch_count ;;
  }

  dimension_group: touched_at {
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
    drill_fields: [id, node.hostname, node.prev_node_id]
  }
}

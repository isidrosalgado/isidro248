# The name of this view in Looker is "Content Usage"
view: content_usage {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.content_usage ;;
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
    # This dimension will be called "API Count" in Explore.

  dimension: api_count {
    type: number
    sql: ${TABLE}.api_count ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_api_count {
    type: sum
    sql: ${api_count} ;;  }
  measure: average_api_count {
    type: average
    sql: ${api_count} ;;  }

  dimension: content_id {
    type: string
    sql: ${TABLE}.content_id ;;
  }

  dimension: content_type {
    type: string
    sql: ${TABLE}.content_type ;;
  }

  dimension: embed_count {
    type: number
    sql: ${TABLE}.embed_count ;;
  }

  dimension: favorite_count {
    type: number
    sql: ${TABLE}.favorite_count ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: last_accessed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_accessed_at ;;
  }

  dimension: other_count {
    type: number
    sql: ${TABLE}.other_count ;;
  }

  dimension: prefetch_count {
    type: number
    sql: ${TABLE}.prefetch_count ;;
  }

  dimension: public_count {
    type: number
    sql: ${TABLE}.public_count ;;
  }

  dimension: schedule_count {
    type: number
    sql: ${TABLE}.schedule_count ;;
  }

  dimension: total_count {
    type: number
    sql: ${TABLE}.total_count ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}

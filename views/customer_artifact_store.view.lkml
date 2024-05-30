# The name of this view in Looker is "Customer Artifact Store"
view: customer_artifact_store {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.customer_artifact_store ;;
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
    # This dimension will be called "Binary Value" in Explore.

  dimension: binary_value {
    type: string
    sql: ${TABLE}.binary_value ;;
  }

  dimension: content_type {
    type: string
    sql: ${TABLE}.content_type ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: created_by_userid {
    type: string
    sql: ${TABLE}.created_by_userid ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.`key` ;;
  }

  dimension: namespace {
    type: string
    sql: ${TABLE}.namespace ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: updated_by_userid {
    type: string
    sql: ${TABLE}.updated_by_userid ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  dimension: value_size {
    type: number
    sql: ${TABLE}.value_size ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_value_size {
    type: sum
    sql: ${value_size} ;;  }
  measure: average_value_size {
    type: average
    sql: ${value_size} ;;  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}

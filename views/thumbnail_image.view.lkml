# The name of this view in Looker is "Thumbnail Image"
view: thumbnail_image {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.thumbnail_image ;;
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
    # This dimension will be called "Dashboard ID" in Explore.

  dimension: dashboard_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.dashboard_id ;;
  }

  dimension: error_message {
    type: string
    sql: ${TABLE}.error_message ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.`key` ;;
  }

  dimension: last_duration {
    type: number
    sql: ${TABLE}.last_duration ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_last_duration {
    type: sum
    sql: ${last_duration} ;;  }
  measure: average_last_duration {
    type: average
    sql: ${last_duration} ;;  }

  dimension: last_queue_duration {
    type: number
    sql: ${TABLE}.last_queue_duration ;;
  }

  dimension: last_render_duration {
    type: number
    sql: ${TABLE}.last_render_duration ;;
  }

  dimension: last_rendering_user_id {
    type: number
    sql: ${TABLE}.last_rendering_user_id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: last_viewed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_viewed_at ;;
  }

  dimension: look_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.look_id ;;
  }

  dimension: lookml_dashboard_id {
    type: string
    sql: ${TABLE}.lookml_dashboard_id ;;
  }

  dimension_group: processing_finished {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.processing_finished_at ;;
  }

  dimension_group: processing_started {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.processing_started_at ;;
  }

  dimension_group: rendering_started {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.rendering_started_at ;;
  }

  dimension_group: scheduled {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.scheduled_at ;;
  }

  dimension: view_count {
    type: number
    sql: ${TABLE}.view_count ;;
  }
  measure: count {
    type: count
    drill_fields: [id, look.id, dashboard.id]
  }
}

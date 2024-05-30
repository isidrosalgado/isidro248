# The name of this view in Looker is "Mail Job"
view: mail_job {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.mail_job ;;
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
    # This dimension will be called "Attach Logo" in Explore.

  dimension: attach_logo {
    type: yesno
    sql: ${TABLE}.attach_logo ;;
  }

  dimension: attachment_file {
    type: string
    sql: ${TABLE}.attachment_file ;;
  }

  dimension: attachment_file_name {
    type: string
    sql: ${TABLE}.attachment_file_name ;;
  }

  dimension: attempts {
    type: number
    sql: ${TABLE}.attempts ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_attempts {
    type: sum
    sql: ${attempts} ;;  }
  measure: average_attempts {
    type: average
    sql: ${attempts} ;;  }

  dimension: bcc {
    type: string
    sql: ${TABLE}.bcc ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: encrypted_raw {
    type: string
    sql: ${TABLE}.encrypted_raw ;;
  }

  dimension: encrypted_raw_hash {
    type: string
    sql: ${TABLE}.encrypted_raw_hash ;;
  }

  dimension: hash {
    type: string
    sql: ${TABLE}.hash ;;
  }

  dimension: html_body {
    type: string
    sql: ${TABLE}.html_body ;;
  }

  dimension_group: last_attempted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_attempted_at ;;
  }

  dimension: last_error {
    type: string
    sql: ${TABLE}.last_error ;;
  }

  dimension_group: next_attempt {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.next_attempt_at ;;
  }

  dimension: raw {
    type: string
    sql: ${TABLE}.raw ;;
  }

  dimension: raw_cache_key {
    type: string
    sql: ${TABLE}.raw_cache_key ;;
  }

  dimension: reply_to {
    type: string
    sql: ${TABLE}.reply_to ;;
  }

  dimension: scheduled_task_id {
    type: number
    sql: ${TABLE}.scheduled_task_id ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
  }

  dimension: to {
    type: string
    sql: ${TABLE}.`to` ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
  measure: count {
    type: count
    drill_fields: [id, attachment_file_name]
  }
}

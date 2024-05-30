# The name of this view in Looker is "Scheduled Job Destination"
view: scheduled_job_destination {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.scheduled_job_destination ;;
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
    # This dimension will be called "Address" in Explore.

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: apply_formatting {
    type: yesno
    sql: ${TABLE}.apply_formatting ;;
  }

  dimension: apply_vis {
    type: yesno
    sql: ${TABLE}.apply_vis ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: format {
    type: string
    sql: ${TABLE}.format ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }

  dimension: scheduled_job_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.scheduled_job_id ;;
  }

  dimension: scheduled_plan_destination_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.scheduled_plan_destination_id ;;
  }

  dimension: slug {
    type: string
    sql: ${TABLE}.slug ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
  measure: count {
    type: count
    drill_fields: [id, scheduled_job.id, scheduled_job.name, scheduled_plan_destination.id]
  }
}

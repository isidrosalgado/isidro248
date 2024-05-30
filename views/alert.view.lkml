# The name of this view in Looker is "Alert"
view: alert {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.alert ;;
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
    # This dimension will be called "Alert Condition ID" in Explore.

  dimension: alert_condition_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.alert_condition_id ;;
  }

  dimension: allow_following_preference {
    type: yesno
    sql: ${TABLE}.allow_following_preference ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: cron {
    type: string
    sql: ${TABLE}.cron ;;
  }

  dimension: custom_title {
    type: string
    sql: ${TABLE}.custom_title ;;
  }

  dimension: custom_url_base {
    type: string
    sql: ${TABLE}.custom_url_base ;;
  }

  dimension: custom_url_label {
    type: string
    sql: ${TABLE}.custom_url_label ;;
  }

  dimension: custom_url_params {
    type: string
    sql: ${TABLE}.custom_url_params ;;
  }

  dimension: dashboard_element_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.dashboard_element_id ;;
  }

  dimension: dashboard_slug {
    type: string
    sql: ${TABLE}.dashboard_slug ;;
  }

  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.deleted_at ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension_group: detached {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.detached_at ;;
  }

  dimension_group: disabled {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.disabled_date ;;
  }

  dimension: disabled_reason {
    type: string
    sql: ${TABLE}.disabled_reason ;;
  }

  dimension: followable {
    type: yesno
    sql: ${TABLE}.followable ;;
  }

  dimension: investigative_content_id {
    type: string
    sql: ${TABLE}.investigative_content_id ;;
  }

  dimension: investigative_content_type {
    type: string
    sql: ${TABLE}.investigative_content_type ;;
  }

  dimension: lookml_dashboard_id {
    type: string
    sql: ${TABLE}.lookml_dashboard_id ;;
  }

  dimension: lookml_link_id {
    type: string
    sql: ${TABLE}.lookml_link_id ;;
  }

  dimension_group: next_run {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.next_run ;;
  }

  dimension: owner_user_id {
    type: number
    sql: ${TABLE}.owner_user_id ;;
  }

  dimension: processing_job_id {
    type: string
    sql: ${TABLE}.processing_job_id ;;
  }

  dimension_group: processing_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.processing_start_time ;;
  }

  dimension: show_custom_url {
    type: yesno
    sql: ${TABLE}.show_custom_url ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_at ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	alert_condition.id,
	alert_condition.field_name,
	dashboard_element.id,
	alert_condition_result.count,
	alert_destination.count,
	alert_sync_history.count
	]
  }

}

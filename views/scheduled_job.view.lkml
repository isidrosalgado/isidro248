# The name of this view in Looker is "Scheduled Job"
view: scheduled_job {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.scheduled_job ;;
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

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Crontab" in Explore.

  dimension: crontab {
    type: string
    sql: ${TABLE}.crontab ;;
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

  dimension: dashboard_filters {
    type: string
    sql: ${TABLE}.dashboard_filters ;;
  }

  dimension: dashboard_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.dashboard_id ;;
  }

  dimension: dashboard_slug {
    type: string
    sql: ${TABLE}.dashboard_slug ;;
  }

  dimension: data_signature {
    type: string
    sql: ${TABLE}.data_signature ;;
  }

  dimension: data_slug {
    type: string
    sql: ${TABLE}.data_slug ;;
  }

  dimension: datagroup {
    type: string
    sql: ${TABLE}.datagroup ;;
  }

  dimension: filters_string {
    type: string
    sql: ${TABLE}.filters_string ;;
  }

  dimension_group: finalized {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.finalized_at ;;
  }

  dimension: include_links {
    type: yesno
    sql: ${TABLE}.include_links ;;
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

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: pdf_landscape {
    type: yesno
    sql: ${TABLE}.pdf_landscape ;;
  }

  dimension: pdf_paper_size {
    type: string
    sql: ${TABLE}.pdf_paper_size ;;
  }

  dimension: prewarm_only {
    type: yesno
    sql: ${TABLE}.prewarm_only ;;
  }

  dimension: progress_state {
    type: string
    sql: ${TABLE}.progress_state ;;
  }

  dimension: query_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.query_id ;;
  }

  dimension: require_change {
    type: yesno
    sql: ${TABLE}.require_change ;;
  }

  dimension: require_no_results {
    type: yesno
    sql: ${TABLE}.require_no_results ;;
  }

  dimension: require_results {
    type: yesno
    sql: ${TABLE}.require_results ;;
  }

  dimension: row_limit_reached {
    type: yesno
    sql: ${TABLE}.row_limit_reached ;;
  }

  dimension: run_as_recipient {
    type: yesno
    sql: ${TABLE}.run_as_recipient ;;
  }

  dimension: run_once {
    type: yesno
    sql: ${TABLE}.run_once ;;
  }

  dimension: scheduled_plan_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.scheduled_plan_id ;;
  }

  dimension: scheduled_render_properties_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.scheduled_render_properties_id ;;
  }

  dimension: send_all_results {
    type: yesno
    sql: ${TABLE}.send_all_results ;;
  }

  dimension: show_custom_url {
    type: yesno
    sql: ${TABLE}.show_custom_url ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: status_detail {
    type: string
    sql: ${TABLE}.status_detail ;;
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	name,
	scheduled_plan.id,
	scheduled_plan.name,
	user.first_name,
	user.last_name,
	user.dev_mode_user_id,
	user.dev_branch_name,
	look.id,
	dashboard.id,
	query.id,
	scheduled_render_properties.id,
	pending_job_state.count,
	scheduled_job_destination.count,
	scheduled_job_stage.count
	]
  }

}

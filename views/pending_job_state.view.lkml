# The name of this view in Looker is "Pending Job State"
view: pending_job_state {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.pending_job_state ;;
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
    # This dimension will be called "Action Job ID" in Explore.

  dimension: action_job_id {
    type: string
    sql: ${TABLE}.action_job_id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: encrypted_job_token {
    type: string
    sql: ${TABLE}.encrypted_job_token ;;
  }

  dimension_group: expires {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.expires_at ;;
  }

  dimension: lookup_id {
    type: string
    sql: ${TABLE}.lookup_id ;;
  }

  dimension: scheduled_job_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.scheduled_job_id ;;
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
	scheduled_job.id,
	scheduled_job.name,
	user.first_name,
	user.last_name,
	user.dev_mode_user_id,
	user.dev_branch_name
	]
  }

}

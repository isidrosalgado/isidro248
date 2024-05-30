# The name of this view in Looker is "Render Job"
view: render_job {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.render_job ;;
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
    # This dimension will be called "Caching Node ID" in Explore.

  dimension: caching_node_id {
    type: number
    sql: ${TABLE}.caching_node_id ;;
  }

  dimension: caching_runtime {
    type: number
    sql: ${TABLE}.caching_runtime ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_caching_runtime {
    type: sum
    sql: ${caching_runtime} ;;  }
  measure: average_caching_runtime {
    type: average
    sql: ${caching_runtime} ;;  }

  dimension: caching_thread_id {
    type: number
    sql: ${TABLE}.caching_thread_id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: finalized {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.finalized_at ;;
  }

  dimension: maestro_job_id {
    type: string
    sql: ${TABLE}.maestro_job_id ;;
  }

  dimension: node_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.node_id ;;
  }

  dimension: phantom_runtime {
    type: number
    sql: ${TABLE}.phantom_runtime ;;
  }

  dimension: phantomjs_pid {
    type: number
    value_format_name: id
    sql: ${TABLE}.phantomjs_pid ;;
  }

  dimension: render_node_id {
    type: number
    sql: ${TABLE}.render_node_id ;;
  }

  dimension: render_options {
    type: string
    sql: ${TABLE}.render_options ;;
  }

  dimension: render_thread_id {
    type: number
    sql: ${TABLE}.render_thread_id ;;
  }

  dimension: retried_job_id {
    type: number
    sql: ${TABLE}.retried_job_id ;;
  }

  dimension: slug {
    type: string
    sql: ${TABLE}.slug ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: status_detail {
    type: string
    sql: ${TABLE}.status_detail ;;
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
	user.first_name,
	user.last_name,
	user.dev_mode_user_id,
	user.dev_branch_name,
	node.hostname,
	node.prev_node_id
	]
  }

}

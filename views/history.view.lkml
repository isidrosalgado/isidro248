# The name of this view in Looker is "History"
view: history {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.history ;;
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
    # This dimension will be called "Apply Formatting" in Explore.

  dimension: apply_formatting {
    type: yesno
    sql: ${TABLE}.apply_formatting ;;
  }

  dimension: apply_vis {
    type: yesno
    sql: ${TABLE}.apply_vis ;;
  }

  dimension: cache {
    type: yesno
    sql: ${TABLE}.cache ;;
  }

  dimension: cache_key {
    type: string
    sql: ${TABLE}.cache_key ;;
  }

  dimension: cache_only {
    type: yesno
    sql: ${TABLE}.cache_only ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: completed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.completed_at ;;
  }

  dimension: connection_id {
    type: string
    sql: ${TABLE}.connection_id ;;
  }

  dimension: connection_name {
    type: string
    sql: ${TABLE}.connection_name ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: dashboard_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.dashboard_id ;;
  }

  dimension: dashboard_session {
    type: string
    sql: ${TABLE}.dashboard_session ;;
  }

  dimension: dialect {
    type: string
    sql: ${TABLE}.dialect ;;
  }

  dimension: force_production {
    type: yesno
    sql: ${TABLE}.force_production ;;
  }

  dimension: generate_links {
    type: yesno
    sql: ${TABLE}.generate_links ;;
  }

  dimension: look_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.look_id ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }

  dimension: models_dir {
    type: string
    sql: ${TABLE}.models_dir ;;
  }

  dimension: node_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.node_id ;;
  }

  dimension: path_prefix_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.path_prefix_id ;;
  }

  dimension: query_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.query_id ;;
  }

  dimension: rebuild_pdts {
    type: yesno
    sql: ${TABLE}.rebuild_pdts ;;
  }

  dimension: render_key {
    type: string
    sql: ${TABLE}.render_key ;;
  }

  dimension: result_format {
    type: string
    sql: ${TABLE}.result_format ;;
  }

  dimension: result_maker_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.result_maker_id ;;
  }

  dimension: result_source {
    type: string
    sql: ${TABLE}.result_source ;;
  }

  dimension: runtime {
    type: number
    sql: ${TABLE}.runtime ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_runtime {
    type: sum
    sql: ${runtime} ;;  }
  measure: average_runtime {
    type: average
    sql: ${runtime} ;;  }

  dimension: server_table_calcs {
    type: yesno
    sql: ${TABLE}.server_table_calcs ;;
  }

  dimension: slug {
    type: string
    sql: ${TABLE}.slug ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: sql_query_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.sql_query_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: workspace_id {
    type: string
    sql: ${TABLE}.workspace_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	connection_name,
	user.first_name,
	user.last_name,
	user.dev_mode_user_id,
	user.dev_branch_name,
	query.id,
	look.id,
	node.hostname,
	node.prev_node_id,
	path_prefix.id,
	sql_query.id,
	sql_query.model_name,
	dashboard.id,
	result_maker.id,
	query_metrics.count
	]
  }

}

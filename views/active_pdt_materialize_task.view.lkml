# The name of this view in Looker is "Active Pdt Materialize Task"
view: active_pdt_materialize_task {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.active_pdt_materialize_task ;;
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
    # This dimension will be called "Connection" in Explore.

  dimension: connection {
    type: string
    sql: ${TABLE}.connection ;;
  }

  dimension: created_at {
    type: number
    sql: ${TABLE}.created_at ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_created_at {
    type: sum
    sql: ${created_at} ;;  }
  measure: average_created_at {
    type: average
    sql: ${created_at} ;;  }

  dimension: finished_at {
    type: number
    sql: ${TABLE}.finished_at ;;
  }

  dimension: force_full_incremental {
    type: string
    sql: ${TABLE}.force_full_incremental ;;
  }

  dimension: force_rebuild {
    type: string
    sql: ${TABLE}.force_rebuild ;;
  }

  dimension: model_name {
    type: string
    sql: ${TABLE}.model_name ;;
  }

  dimension: node_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.node_id ;;
  }

  dimension: query_slug {
    type: string
    sql: ${TABLE}.query_slug ;;
  }

  dimension: started_at {
    type: number
    sql: ${TABLE}.started_at ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: view_name {
    type: string
    sql: ${TABLE}.view_name ;;
  }

  dimension: workspace {
    type: string
    sql: ${TABLE}.workspace ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	model_name,
	view_name,
	node.hostname,
	node.prev_node_id,
	user.first_name,
	user.last_name,
	user.dev_mode_user_id,
	user.dev_branch_name
	]
  }

}

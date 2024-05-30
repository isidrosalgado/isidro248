# The name of this view in Looker is "Upload Table"
view: upload_table {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.upload_table ;;
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
    # This dimension will be called "Built At" in Explore.

  dimension: built_at {
    type: number
    sql: ${TABLE}.built_at ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_built_at {
    type: sum
    sql: ${built_at} ;;  }
  measure: average_built_at {
    type: average
    sql: ${built_at} ;;  }

  dimension: created_at {
    type: number
    sql: ${TABLE}.created_at ;;
  }

  dimension: db_connection_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.db_connection_id ;;
  }

  dimension: definition {
    type: string
    sql: ${TABLE}.definition ;;
  }

  dimension: file_type {
    type: string
    sql: ${TABLE}.file_type ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.table_name ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: view_name {
    type: string
    sql: ${TABLE}.view_name ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	table_name,
	view_name,
	db_connection.id,
	db_connection.name,
	db_connection.username,
	db_connection.ssh_username,
	db_connection.tmp_db_name,
	user.first_name,
	user.last_name,
	user.dev_mode_user_id,
	user.dev_branch_name
	]
  }

}

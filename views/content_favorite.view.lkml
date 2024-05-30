# The name of this view in Looker is "Content Favorite"
view: content_favorite {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.content_favorite ;;
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
    # This dimension will be called "Content Metadata ID" in Explore.

  dimension: content_metadata_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.content_metadata_id ;;
  }

  dimension: dashboard_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.dashboard_id ;;
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
	look.id,
	dashboard.id,
	content_metadata.id
	]
  }

}

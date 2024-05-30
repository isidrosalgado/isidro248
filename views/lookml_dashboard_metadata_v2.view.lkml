# The name of this view in Looker is "Lookml Dashboard Metadata V2"
view: lookml_dashboard_metadata_v2 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.lookml_dashboard_metadata_v2 ;;
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

  dimension: dashboard_name {
    type: string
    sql: ${TABLE}.dashboard_name ;;
  }

  dimension: model_name {
    type: string
    sql: ${TABLE}.model_name ;;
  }

  dimension: project_name {
    type: string
    sql: ${TABLE}.project_name ;;
  }

  dimension: space_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.space_id ;;
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
	dashboard_name,
	project_name,
	space.id,
	space.name,
	content_metadata.id
	]
  }

}

# The name of this view in Looker is "Content Metadata"
view: content_metadata {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.content_metadata ;;
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
    # This dimension will be called "Content ID" in Explore.

  dimension: content_id {
    type: number
    sql: ${TABLE}.content_id ;;
  }

  dimension: content_type {
    type: string
    sql: ${TABLE}.content_type ;;
  }

  dimension: dashboard_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.dashboard_id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.deleted_at ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: homepage_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.homepage_id ;;
  }

  dimension: inheriting_id {
    type: number
    sql: ${TABLE}.inheriting_id ;;
  }

  dimension: look_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.look_id ;;
  }

  dimension: lookml_dashboard_id {
    type: number
    sql: ${TABLE}.lookml_dashboard_id ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}.parent_id ;;
  }

  dimension: slug {
    type: string
    sql: ${TABLE}.slug ;;
  }

  dimension: space_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.space_id ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	look.id,
	dashboard.id,
	space.id,
	space.name,
	homepage.id,
	content_favorite.count,
	content_metadata_group_user.count,
	content_view.count,
	dashboard.count,
	homepage.count,
	homepage_item.count,
	look.count,
	lookml_dashboard_metadata.count,
	lookml_dashboard_metadata_v2.count,
	space.count
	]
  }

}

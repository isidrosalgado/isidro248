# The name of this view in Looker is "Look"
view: look {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.look ;;
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
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.deleted_at ;;
  }

  dimension: deleter_id {
    type: number
    sql: ${TABLE}.deleter_id ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension_group: indexed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.indexed_at ;;
  }

  dimension: is_run_on_load {
    type: yesno
    sql: ${TABLE}.is_run_on_load ;;
  }

  dimension: last_updater_id {
    type: number
    sql: ${TABLE}.last_updater_id ;;
  }

  dimension: public {
    type: yesno
    sql: ${TABLE}.public ;;
  }

  dimension: public_slug {
    type: string
    sql: ${TABLE}.public_slug ;;
  }

  dimension: query_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.query_id ;;
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

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_at ;;
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
	query.id,
	space.id,
	space.name,
	content_metadata.id,
	content_favorite.count,
	content_metadata.count,
	dashboard_element.count,
	history.count,
	homepage_item.count,
	look_json.count,
	query_task.count,
	scheduled_job.count,
	scheduled_plan.count,
	thumbnail_image.count
	]
  }

}

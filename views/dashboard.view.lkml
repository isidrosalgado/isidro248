# The name of this view in Looker is "Dashboard"
view: dashboard {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.dashboard ;;
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
    # This dimension will be called "Alert Sync with Dashboard Filter Enabled" in Explore.

  dimension: alert_sync_with_dashboard_filter_enabled {
    type: yesno
    sql: ${TABLE}.alert_sync_with_dashboard_filter_enabled ;;
  }

  dimension: appearance {
    type: string
    sql: ${TABLE}.appearance ;;
  }

  dimension: background_color {
    type: string
    sql: ${TABLE}.background_color ;;
  }

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

  dimension: crossfilter_enabled {
    type: yesno
    sql: ${TABLE}.crossfilter_enabled ;;
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

  dimension: enable_viz_full_screen {
    type: yesno
    sql: ${TABLE}.enable_viz_full_screen ;;
  }

  dimension: filter_lookml {
    type: string
    sql: ${TABLE}.filter_lookml ;;
  }

  dimension: filters_bar_collapsed {
    type: yesno
    sql: ${TABLE}.filters_bar_collapsed ;;
  }

  dimension: filters_location_top {
    type: yesno
    sql: ${TABLE}.filters_location_top ;;
  }

  dimension: hidden {
    type: yesno
    sql: ${TABLE}.hidden ;;
  }

  dimension_group: indexed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.indexed_at ;;
  }

  dimension: last_updater_id {
    type: number
    sql: ${TABLE}.last_updater_id ;;
  }

  dimension: load_configuration {
    type: string
    sql: ${TABLE}.load_configuration ;;
  }

  dimension: lookml_link_id {
    type: string
    sql: ${TABLE}.lookml_link_id ;;
  }

  dimension: preferred_viewer {
    type: string
    sql: ${TABLE}.preferred_viewer ;;
  }

  dimension: query_timezone {
    type: string
    sql: ${TABLE}.query_timezone ;;
  }

  dimension: refresh_interval {
    type: string
    sql: ${TABLE}.refresh_interval ;;
  }

  dimension: show_filters_bar {
    type: yesno
    sql: ${TABLE}.show_filters_bar ;;
  }

  dimension: show_tile_shadow {
    type: yesno
    sql: ${TABLE}.show_tile_shadow ;;
  }

  dimension: show_title {
    type: yesno
    sql: ${TABLE}.show_title ;;
  }

  dimension: space_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.space_id ;;
  }

  dimension: text_tile_text_color {
    type: string
    sql: ${TABLE}.text_tile_text_color ;;
  }

  dimension: tile_background_color {
    type: string
    sql: ${TABLE}.tile_background_color ;;
  }

  dimension: tile_border_radius {
    type: number
    sql: ${TABLE}.tile_border_radius ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_tile_border_radius {
    type: sum
    sql: ${tile_border_radius} ;;  }
  measure: average_tile_border_radius {
    type: average
    sql: ${tile_border_radius} ;;  }

  dimension: tile_separator_color {
    type: string
    sql: ${TABLE}.tile_separator_color ;;
  }

  dimension: tile_text_color {
    type: string
    sql: ${TABLE}.tile_text_color ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: title_color {
    type: string
    sql: ${TABLE}.title_color ;;
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
	space.id,
	space.name,
	content_metadata.id,
	content_favorite.count,
	content_metadata.count,
	dashboard_element.count,
	dashboard_filter.count,
	dashboard_json.count,
	dashboard_layout.count,
	history.count,
	homepage_item.count,
	query_task.count,
	scheduled_job.count,
	scheduled_plan.count,
	thumbnail_image.count
	]
  }

}

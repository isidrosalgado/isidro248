# The name of this view in Looker is "Homepage Item"
view: homepage_item {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.homepage_item ;;
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

  dimension: custom_description {
    type: string
    sql: ${TABLE}.custom_description ;;
  }

  dimension: custom_title {
    type: string
    sql: ${TABLE}.custom_title ;;
  }

  dimension: custom_url {
    type: string
    sql: ${TABLE}.custom_url ;;
  }

  dimension: dashboard_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.dashboard_id ;;
  }

  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.deleted_at ;;
  }

  dimension: has_custom_image {
    type: yesno
    sql: ${TABLE}.has_custom_image ;;
  }

  dimension: homepage_section_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.homepage_section_id ;;
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

  dimension: order {
    type: number
    sql: ${TABLE}.`order` ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_order {
    type: sum
    sql: ${order} ;;  }
  measure: average_order {
    type: average
    sql: ${order} ;;  }

  dimension: show_description {
    type: yesno
    sql: ${TABLE}.show_description ;;
  }

  dimension: show_image {
    type: yesno
    sql: ${TABLE}.show_image ;;
  }

  dimension: show_title {
    type: yesno
    sql: ${TABLE}.show_title ;;
  }

  dimension: show_url {
    type: yesno
    sql: ${TABLE}.show_url ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: use_custom_description {
    type: yesno
    sql: ${TABLE}.use_custom_description ;;
  }

  dimension: use_custom_image {
    type: yesno
    sql: ${TABLE}.use_custom_image ;;
  }

  dimension: use_custom_title {
    type: yesno
    sql: ${TABLE}.use_custom_title ;;
  }

  dimension: use_custom_url {
    type: yesno
    sql: ${TABLE}.use_custom_url ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	homepage_section.id,
	look.id,
	dashboard.id,
	content_metadata.id,
	homepage_event.count
	]
  }

}

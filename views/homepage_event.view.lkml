# The name of this view in Looker is "Homepage Event"
view: homepage_event {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.homepage_event ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Event Type" in Explore.

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: homepage_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.homepage_id ;;
  }

  dimension: homepage_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.homepage_item_id ;;
  }

  dimension: homepage_section_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.homepage_section_id ;;
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
	homepage.id,
	homepage_section.id,
	homepage_item.id
	]
  }

}

# The name of this view in Looker is "Session"
view: session {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.session ;;
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
    # This dimension will be called "Access Token ID" in Explore.

  dimension: access_token_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.access_token_id ;;
  }

  dimension: browser {
    type: string
    sql: ${TABLE}.browser ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: credentials_type {
    type: string
    sql: ${TABLE}.credentials_type ;;
  }

  dimension_group: expires_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.expires_at ;;
  }

  dimension_group: extended {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.extended_at ;;
  }

  dimension: extended_count {
    type: number
    sql: ${TABLE}.extended_count ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_extended_count {
    type: sum
    sql: ${extended_count} ;;  }
  measure: average_extended_count {
    type: average
    sql: ${extended_count} ;;  }

  dimension_group: inactivity_expires {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.inactivity_expires_at ;;
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension: operating_system {
    type: string
    sql: ${TABLE}.operating_system ;;
  }

  dimension: outgoing_access_token_id {
    type: number
    sql: ${TABLE}.outgoing_access_token_id ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: sudo_url {
    type: string
    sql: ${TABLE}.sudo_url ;;
  }

  dimension: sudo_user_id {
    type: number
    sql: ${TABLE}.sudo_user_id ;;
  }

  dimension: token {
    type: string
    sql: ${TABLE}.token ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_overrides_workspace {
    type: yesno
    sql: ${TABLE}.user_overrides_workspace ;;
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
	user.first_name,
	user.last_name,
	user.dev_mode_user_id,
	user.dev_branch_name,
	access_token.outgoing_access_token_id,
	access_token.count
	]
  }

}

# The name of this view in Looker is "Oauth Client App"
view: oauth_client_app {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.oauth_client_app ;;
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
    # This dimension will be called "Client Guid" in Explore.

  dimension: client_guid {
    type: string
    sql: ${TABLE}.client_guid ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: display_name {
    type: string
    sql: ${TABLE}.display_name ;;
  }

  dimension: enabled {
    type: yesno
    sql: ${TABLE}.enabled ;;
  }

  dimension: encrypted_client_secret {
    type: string
    sql: ${TABLE}.encrypted_client_secret ;;
  }

  dimension: global {
    type: yesno
    sql: ${TABLE}.global ;;
  }

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }

  dimension: public {
    type: yesno
    sql: ${TABLE}.public ;;
  }

  dimension: redirect_uri {
    type: string
    sql: ${TABLE}.redirect_uri ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: tokens_invalid_before {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.tokens_invalid_before ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	display_name,
	group.name,
	group.external_group_id,
	access_token.count,
	oauth_client_app_user_activation.count
	]
  }

}

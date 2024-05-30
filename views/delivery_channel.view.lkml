# The name of this view in Looker is "Delivery Channel"
view: delivery_channel {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.delivery_channel ;;
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
    # This dimension will be called "Action Hub Form Params JSON" in Explore.

  dimension: action_hub_form_params_json {
    type: string
    sql: ${TABLE}.action_hub_form_params_json ;;
  }

  dimension: action_hub_integration_id {
    type: string
    sql: ${TABLE}.action_hub_integration_id ;;
  }

  dimension: channel_destination_type {
    type: string
    sql: ${TABLE}.channel_destination_type ;;
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

  dimension: owner_user_id {
    type: number
    sql: ${TABLE}.owner_user_id ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_at ;;
  }
  measure: count {
    type: count
    drill_fields: [id, alert_destination.count]
  }
}

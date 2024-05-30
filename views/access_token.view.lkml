# The name of this view in Looker is "Access Token"
view: access_token {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.access_token ;;
  drill_fields: [outgoing_access_token_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: outgoing_access_token_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.outgoing_access_token_id ;;
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
    # This dimension will be called "Credentials Api3 ID" in Explore.

  dimension: credentials_api3_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.credentials_api3_id ;;
  }

  dimension: credentials_type {
    type: string
    sql: ${TABLE}.credentials_type ;;
  }

  dimension: encrypted_code {
    type: string
    sql: ${TABLE}.encrypted_code ;;
  }

  dimension: encrypted_token {
    type: string
    sql: ${TABLE}.encrypted_token ;;
  }

  dimension: encrypted_token2 {
    type: string
    sql: ${TABLE}.encrypted_token2 ;;
  }

  dimension_group: expires {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.expires_at ;;
  }

  dimension: grant_type {
    type: string
    sql: ${TABLE}.grant_type ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: lookup_id {
    type: string
    sql: ${TABLE}.lookup_id ;;
  }

  dimension: oauth_client_app_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.oauth_client_app_id ;;
  }

  dimension: resource_owner_id {
    type: number
    sql: ${TABLE}.resource_owner_id ;;
  }

  dimension: role_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.role_id ;;
  }

  dimension: session_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.session_id ;;
  }

  dimension: sudo_user_id {
    type: number
    sql: ${TABLE}.sudo_user_id ;;
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
	outgoing_access_token_id,
	user.first_name,
	user.last_name,
	user.dev_mode_user_id,
	user.dev_branch_name,
	role.id,
	role.name,
	session.id,
	credentials_api3.id,
	oauth_client_app.id,
	oauth_client_app.display_name,
	session.count
	]
  }

}

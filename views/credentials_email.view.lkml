# The name of this view in Looker is "Credentials Email"
view: credentials_email {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.credentials_email ;;
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
    # This dimension will be called "Email" in Explore.

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: encrypted_password {
    type: string
    sql: ${TABLE}.encrypted_password ;;
  }

  dimension: encrypted_password_reset_token {
    type: string
    sql: ${TABLE}.encrypted_password_reset_token ;;
  }

  dimension: encrypted_password_reset_token2 {
    type: string
    sql: ${TABLE}.encrypted_password_reset_token2 ;;
  }

  dimension: forced_password_reset_at_next_login {
    type: yesno
    sql: ${TABLE}.forced_password_reset_at_next_login ;;
  }

  dimension_group: forced_password_reset_session_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.forced_password_reset_session_start ;;
  }

  dimension: last_login_attempt_id {
    type: number
    sql: ${TABLE}.last_login_attempt_id ;;
  }

  dimension_group: logged_in {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.logged_in_at ;;
  }

  dimension_group: password_reset_sent {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.password_reset_sent_at ;;
  }

  dimension: password_reset_token {
    type: string
    sql: ${TABLE}.password_reset_token ;;
  }

  dimension: reset_token_lookup_id {
    type: string
    sql: ${TABLE}.reset_token_lookup_id ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [id, user.first_name, user.last_name, user.dev_mode_user_id, user.dev_branch_name]
  }
}

# The name of this view in Looker is "Project Configuration"
view: project_configuration {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.project_configuration ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Allow Warnings" in Explore.

  dimension: allow_warnings {
    type: yesno
    sql: ${TABLE}.allow_warnings ;;
  }

  dimension: deploy_secret {
    type: string
    sql: ${TABLE}.deploy_secret ;;
  }

  dimension: folders_enabled {
    type: yesno
    sql: ${TABLE}.folders_enabled ;;
  }

  dimension: git_application_server_http_port {
    type: number
    sql: ${TABLE}.git_application_server_http_port ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_git_application_server_http_port {
    type: sum
    sql: ${git_application_server_http_port} ;;  }
  measure: average_git_application_server_http_port {
    type: average
    sql: ${git_application_server_http_port} ;;  }

  dimension: git_application_server_http_scheme {
    type: string
    sql: ${TABLE}.git_application_server_http_scheme ;;
  }

  dimension: git_auth_cookie {
    type: string
    sql: ${TABLE}.git_auth_cookie ;;
  }

  dimension: git_password {
    type: string
    sql: ${TABLE}.git_password ;;
  }

  dimension: git_password_user_attribute {
    type: string
    sql: ${TABLE}.git_password_user_attribute ;;
  }

  dimension: git_production_branch_name {
    type: string
    sql: ${TABLE}.git_production_branch_name ;;
  }

  dimension: git_release_mgmt_enabled {
    type: yesno
    sql: ${TABLE}.git_release_mgmt_enabled ;;
  }

  dimension: git_service_name {
    type: string
    sql: ${TABLE}.git_service_name ;;
  }

  dimension: git_username {
    type: string
    sql: ${TABLE}.git_username ;;
  }

  dimension: git_username_user_attribute {
    type: string
    sql: ${TABLE}.git_username_user_attribute ;;
  }

  dimension: lookml_type {
    type: string
    sql: ${TABLE}.lookml_type ;;
  }

  dimension: managed_by_marketplace {
    type: yesno
    sql: ${TABLE}.managed_by_marketplace ;;
  }

  dimension: marketplace_auxiliary_of {
    type: string
    sql: ${TABLE}.marketplace_auxiliary_of ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }

  dimension: pull_request_mode {
    type: string
    sql: ${TABLE}.pull_request_mode ;;
  }

  dimension: test_state_required_for_deploy {
    type: string
    sql: ${TABLE}.test_state_required_for_deploy ;;
  }

  dimension: use_git_cookie_auth {
    type: yesno
    sql: ${TABLE}.use_git_cookie_auth ;;
  }

  dimension: validation_required {
    type: yesno
    sql: ${TABLE}.validation_required ;;
  }
  measure: count {
    type: count
    drill_fields: [git_service_name, git_username, git_production_branch_name]
  }
}

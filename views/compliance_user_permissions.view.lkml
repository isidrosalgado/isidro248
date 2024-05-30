# The name of this view in Looker is "Compliance User Permissions"
view: compliance_user_permissions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.compliance_user_permissions ;;
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
    # This dimension will be called "Access Data" in Explore.

  dimension: access_data {
    type: number
    sql: ${TABLE}.access_data ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_access_data {
    type: sum
    sql: ${access_data} ;;  }
  measure: average_access_data {
    type: average
    sql: ${access_data} ;;  }

  dimension: administer {
    type: number
    sql: ${TABLE}.administer ;;
  }

  dimension: can_copy_print {
    type: number
    sql: ${TABLE}.can_copy_print ;;
  }

  dimension: can_create_forecast {
    type: number
    sql: ${TABLE}.can_create_forecast ;;
  }

  dimension: can_override_vis_config {
    type: number
    sql: ${TABLE}.can_override_vis_config ;;
  }

  dimension: clear_cache_refresh {
    type: number
    sql: ${TABLE}.clear_cache_refresh ;;
  }

  dimension: create_alerts {
    type: number
    sql: ${TABLE}.create_alerts ;;
  }

  dimension: create_custom_fields {
    type: number
    sql: ${TABLE}.create_custom_fields ;;
  }

  dimension: create_prefetches {
    type: number
    sql: ${TABLE}.create_prefetches ;;
  }

  dimension: create_public_looks {
    type: number
    sql: ${TABLE}.create_public_looks ;;
  }

  dimension: create_table_calculations {
    type: number
    sql: ${TABLE}.create_table_calculations ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: deploy {
    type: number
    sql: ${TABLE}.deploy ;;
  }

  dimension: develop {
    type: number
    sql: ${TABLE}.develop ;;
  }

  dimension: download_with_limit {
    type: number
    sql: ${TABLE}.download_with_limit ;;
  }

  dimension: download_without_limit {
    type: number
    sql: ${TABLE}.download_without_limit ;;
  }

  dimension: embed {
    type: yesno
    sql: ${TABLE}.embed ;;
  }

  dimension: embed_browse_spaces {
    type: number
    sql: ${TABLE}.embed_browse_spaces ;;
  }

  dimension: embed_save_shared_space {
    type: number
    sql: ${TABLE}.embed_save_shared_space ;;
  }

  dimension: explore {
    type: number
    sql: ${TABLE}.explore ;;
  }

  dimension: follow_alerts {
    type: number
    sql: ${TABLE}.follow_alerts ;;
  }

  dimension: login_special_email {
    type: number
    sql: ${TABLE}.login_special_email ;;
  }

  dimension: manage_embed_settings {
    type: number
    sql: ${TABLE}.manage_embed_settings ;;
  }

  dimension: manage_groups {
    type: number
    sql: ${TABLE}.manage_groups ;;
  }

  dimension: manage_homepage {
    type: number
    sql: ${TABLE}.manage_homepage ;;
  }

  dimension: manage_models {
    type: number
    sql: ${TABLE}.manage_models ;;
  }

  dimension: manage_privatelabel {
    type: number
    sql: ${TABLE}.manage_privatelabel ;;
  }

  dimension: manage_project_connections {
    type: number
    sql: ${TABLE}.manage_project_connections ;;
  }

  dimension: manage_project_connections_restricted {
    type: number
    sql: ${TABLE}.manage_project_connections_restricted ;;
  }

  dimension: manage_project_models {
    type: number
    sql: ${TABLE}.manage_project_models ;;
  }

  dimension: manage_roles {
    type: number
    sql: ${TABLE}.manage_roles ;;
  }

  dimension: manage_schedules {
    type: number
    sql: ${TABLE}.manage_schedules ;;
  }

  dimension: manage_spaces {
    type: number
    sql: ${TABLE}.manage_spaces ;;
  }

  dimension: manage_stereo {
    type: number
    sql: ${TABLE}.manage_stereo ;;
  }

  dimension: manage_themes {
    type: number
    sql: ${TABLE}.manage_themes ;;
  }

  dimension: manage_user_attributes {
    type: number
    sql: ${TABLE}.manage_user_attributes ;;
  }

  dimension: mobile_app_access {
    type: number
    sql: ${TABLE}.mobile_app_access ;;
  }

  dimension: permissions {
    type: string
    sql: ${TABLE}.permissions ;;
  }

  dimension: save_content {
    type: number
    sql: ${TABLE}.save_content ;;
  }

  dimension: save_dashboards {
    type: number
    sql: ${TABLE}.save_dashboards ;;
  }

  dimension: save_looks {
    type: number
    sql: ${TABLE}.save_looks ;;
  }

  dimension: schedule_external_look_emails {
    type: number
    sql: ${TABLE}.schedule_external_look_emails ;;
  }

  dimension: schedule_look_emails {
    type: number
    sql: ${TABLE}.schedule_look_emails ;;
  }

  dimension: see_alerts {
    type: number
    sql: ${TABLE}.see_alerts ;;
  }

  dimension: see_datagroups {
    type: number
    sql: ${TABLE}.see_datagroups ;;
  }

  dimension: see_drill_overlay {
    type: number
    sql: ${TABLE}.see_drill_overlay ;;
  }

  dimension: see_logs {
    type: number
    sql: ${TABLE}.see_logs ;;
  }

  dimension: see_lookml {
    type: number
    sql: ${TABLE}.see_lookml ;;
  }

  dimension: see_lookml_dashboards {
    type: number
    sql: ${TABLE}.see_lookml_dashboards ;;
  }

  dimension: see_looks {
    type: number
    sql: ${TABLE}.see_looks ;;
  }

  dimension: see_pdts {
    type: number
    sql: ${TABLE}.see_pdts ;;
  }

  dimension: see_queries {
    type: number
    sql: ${TABLE}.see_queries ;;
  }

  dimension: see_schedules {
    type: number
    sql: ${TABLE}.see_schedules ;;
  }

  dimension: see_sql {
    type: number
    sql: ${TABLE}.see_sql ;;
  }

  dimension: see_system_activity {
    type: number
    sql: ${TABLE}.see_system_activity ;;
  }

  dimension: see_user_dashboards {
    type: number
    sql: ${TABLE}.see_user_dashboards ;;
  }

  dimension: see_users {
    type: number
    sql: ${TABLE}.see_users ;;
  }

  dimension: send_outgoing_webhook {
    type: number
    sql: ${TABLE}.send_outgoing_webhook ;;
  }

  dimension: send_to_integration {
    type: number
    sql: ${TABLE}.send_to_integration ;;
  }

  dimension: send_to_s3 {
    type: number
    sql: ${TABLE}.send_to_s3 ;;
  }

  dimension: send_to_sftp {
    type: number
    sql: ${TABLE}.send_to_sftp ;;
  }

  dimension: sudo {
    type: number
    sql: ${TABLE}.sudo ;;
  }

  dimension: support_access_toggle {
    type: number
    sql: ${TABLE}.support_access_toggle ;;
  }

  dimension: update_datagroups {
    type: number
    sql: ${TABLE}.update_datagroups ;;
  }

  dimension: use_global_connections {
    type: number
    sql: ${TABLE}.use_global_connections ;;
  }

  dimension: use_sql_runner {
    type: number
    sql: ${TABLE}.use_sql_runner ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}

# The name of this view in Looker is "Space"
view: space {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.space ;;
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

  dimension: creator_id {
    type: number
    sql: ${TABLE}.creator_id ;;
  }

  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.deleted_at ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: is_embed {
    type: yesno
    sql: ${TABLE}.is_embed ;;
  }

  dimension: is_embed_shared_root {
    type: yesno
    sql: ${TABLE}.is_embed_shared_root ;;
  }

  dimension: is_embed_users_root {
    type: yesno
    sql: ${TABLE}.is_embed_users_root ;;
  }

  dimension: is_lookml_root {
    type: yesno
    sql: ${TABLE}.is_lookml_root ;;
  }

  dimension: is_personal {
    type: yesno
    sql: ${TABLE}.is_personal ;;
  }

  dimension: is_personal_descendant {
    type: yesno
    sql: ${TABLE}.is_personal_descendant ;;
  }

  dimension: is_shared_root {
    type: yesno
    sql: ${TABLE}.is_shared_root ;;
  }

  dimension: is_users_root {
    type: yesno
    sql: ${TABLE}.is_users_root ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}.parent_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	name,
	content_metadata.id,
	content_metadata.count,
	dashboard.count,
	look.count,
	lookml_dashboard_metadata.count,
	lookml_dashboard_metadata_v2.count,
	space_user.count
	]
  }

}

prompt --application/pages/page_00010
begin
--   Manifest
--     PAGE: 00010
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.5'
,p_default_workspace_id=>68083285233183961161
,p_default_application_id=>258619
,p_default_id_offset=>0
,p_default_owner=>'WKSP_TEST9876WS'
);
wwv_flow_imp_page.create_page(
 p_id=>10
,p_name=>'Statistics'
,p_alias=>'STATISTICS'
,p_step_title=>'Statistics'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'04'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(72239526701723787307)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(72041526964042963091)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(72041411074659963028)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(72041589852053963136)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(72239527413727787308)
,p_plug_name=>'Simulaciones'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(72041514425375963085)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P10_PID'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(72239527820161787309)
,p_region_id=>wwv_flow_imp.id(72239527413727787308)
,p_chart_type=>'area'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(72239529540430787310)
,p_chart_id=>wwv_flow_imp.id(72239527820161787309)
,p_seq=>10
,p_name=>'Series 1'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH limites AS (',
'    SELECT ',
'        MIN(total) AS min_valor,',
'        MAX(total) AS max_valor',
'    FROM simulations',
'    where project_id = :P10_PID',
'),',
'histograma AS (',
'    SELECT',
'        FLOOR((total - limites.min_valor) / ((limites.max_valor - limites.min_valor) / 20)) AS intervalo,',
'        COUNT(*) AS frecuencia',
'    FROM simulations, limites',
'    where project_id = :P10_PID',
'    GROUP BY FLOOR((total - limites.min_valor) / ((limites.max_valor - limites.min_valor) / 20))',
'    ORDER BY FLOOR((total - limites.min_valor) / ((limites.max_valor - limites.min_valor) / 20))',
')',
'SELECT ',
'    TO_CHAR(ROUND(limites.min_valor + (((limites.max_valor - limites.min_valor)/20)*(intervalo+1)),2),''99999990.99'')||''h'' as label,',
'    frecuencia as value',
'FROM histograma,limites;',
''))
,p_max_row_count=>20
,p_ajax_items_to_submit=>'P10_PID'
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABEL'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(72239528374338787309)
,p_chart_id=>wwv_flow_imp.id(72239527820161787309)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(72239528926968787309)
,p_chart_id=>wwv_flow_imp.id(72239527820161787309)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(72239530137366787312)
,p_plug_name=>'Horas Promedio'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(72041514425375963085)
,p_plug_display_sequence=>60
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(72239530513379787312)
,p_region_id=>wwv_flow_imp.id(72239530137366787312)
,p_chart_type=>'pie'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(72239531071740787313)
,p_chart_id=>wwv_flow_imp.id(72239530513379787312)
,p_seq=>10
,p_name=>'Series 1'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT p.name as label,ROUND(AVG(total),2) as value',
'FROM simulations s,project p',
'where s.project_id = p.id',
'GROUP BY p.name',
''))
,p_max_row_count=>20
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABEL'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'LABEL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(72239531677907787313)
,p_plug_name=>'Num. Tareas'
,p_title=>'Tareas Activas'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(72041514425375963085)
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(72239532022610787313)
,p_region_id=>wwv_flow_imp.id(72239531677907787313)
,p_chart_type=>'bar'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(72239533700109787314)
,p_chart_id=>wwv_flow_imp.id(72239532022610787313)
,p_seq=>10
,p_name=>'Series 1'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT p.name as label,(select count(*) from tasks where project_id = p.id and disabled = 0) as value',
'FROM project p',
''))
,p_max_row_count=>20
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(72239532590276787314)
,p_chart_id=>wwv_flow_imp.id(72239532022610787313)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(72239533117666787314)
,p_chart_id=>wwv_flow_imp.id(72239532022610787313)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(72128695107815819528)
,p_name=>'P10_PID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(72239527413727787308)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,id as r',
'from project where rownum = 1'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Project'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_named_lov=>'PROJECT.NAME'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(72041585711091963134)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CONTAINS'
,p_attribute_02=>'N'
,p_attribute_04=>'N'
,p_attribute_09=>'0'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(72128695388469819530)
,p_name=>'Change'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_PID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(72128695455875819531)
,p_event_id=>wwv_flow_imp.id(72128695388469819530)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(72239527413727787308)
);
wwv_flow_imp.component_end;
end;
/

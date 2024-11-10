prompt --application/pages/page_00002
begin
--   Manifest
--     PAGE: 00002
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
 p_id=>2
,p_name=>'Project'
,p_alias=>'PROJECT1'
,p_step_title=>'Project'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>To find data enter a search term into the search dialog, or click on the column headings to limit the records returned.</p>',
'',
'<p>You can perform numerous functions by clicking the <strong>Actions</strong> button. This includes selecting the columns that are displayed / hidden and their display sequence, plus numerous data and format functions.  You can also define additiona'
||'l views of the data using the chart, group by, and pivot options.</p>',
'',
'<p>If you want to save your customizations select report, or click download to unload the data. Enter you email address and time frame under subscription to be sent the data on a regular basis.<p>',
'',
'<p>For additional information click Help at the bottom of the Actions menu.</p> ',
'',
'<p>Click the <strong>Reset</strong> button to reset the interactive report back to the default settings.</p>'))
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(72042327139498963428)
,p_plug_name=>'Project'
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH pproject AS (select ID,',
'       YEAR,',
'       NAME,',
'       (SELECT COUNT(*) FROM tasks WHERE project_id = PROJECT.ID and disabled = 0) AS TAREAS,',
'       (SELECT ROUND(AVG(total),2) FROM simulations WHERE project_id = PROJECT.ID) AS PROMEDIO,',
'       ROUND((SELECT PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY total) FROM simulations WHERE project_id = PROJECT.ID),2) AS PERCENTILE',
'  from PROJECT PROJECT)',
'select ID,',
'    YEAR,',
'    NAME,',
'    TAREAS,',
'    PROMEDIO as PROMH,',
'    ROUND(PROMEDIO/8,2) as PROMD,',
'    ROUND(PROMEDIO/37.5,2) as PROMW,',
'    PERCENTILE as PERCENTH,',
'    ROUND(PERCENTILE/8,2) as PERCENTD,',
'    ROUND(PERCENTILE/37.5,2) as PERCENTW',
'from pproject',
'',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Project'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(72042327294567963428)
,p_name=>'Project'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:3:&APP_SESSION.::&DEBUG.:RP:P3_ID:\#ID#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_detail_link_auth_scheme=>wwv_flow_imp.id(72042306811525963298)
,p_owner=>'XOFAKGMKGAIEJHWLXL@YTNHY.COM'
,p_internal_uid=>72042327294567963428
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(69475836385630975535)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'L'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(69475836486581975536)
,p_db_column_name=>'YEAR'
,p_display_order=>20
,p_column_identifier=>'M'
,p_column_label=>'Year'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(69475836529904975537)
,p_db_column_name=>'NAME'
,p_display_order=>30
,p_column_identifier=>'N'
,p_column_label=>'Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72371741563367124305)
,p_db_column_name=>'TAREAS'
,p_display_order=>40
,p_column_identifier=>'R'
,p_column_label=>'Tareas Activas'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72371743533107124325)
,p_db_column_name=>'PROMH'
,p_display_order=>50
,p_column_identifier=>'AA'
,p_column_label=>'Media (hrs)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72371743698077124326)
,p_db_column_name=>'PROMD'
,p_display_order=>60
,p_column_identifier=>'AB'
,p_column_label=>'Media (dias)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72371743794320124327)
,p_db_column_name=>'PROMW'
,p_display_order=>70
,p_column_identifier=>'AC'
,p_column_label=>'Media (sem)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72371743823374124328)
,p_db_column_name=>'PERCENTH'
,p_display_order=>80
,p_column_identifier=>'AD'
,p_column_label=>'P90 (hrs)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72371743950546124329)
,p_db_column_name=>'PERCENTD'
,p_display_order=>90
,p_column_identifier=>'AE'
,p_column_label=>'P90 (dias)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72371744062439124330)
,p_db_column_name=>'PERCENTW'
,p_display_order=>100
,p_column_identifier=>'AF'
,p_column_label=>'P90 (sem)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(72042575998173963872)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'720425760'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID:YEAR:NAME:TAREAS:PROMH:PROMD:PROMW:PERCENTH:PERCENTD:PERCENTW:'
,p_sort_column_1=>'YEAR'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'PERCENTH'
,p_sort_direction_2=>'DESC NULLS LAST'
,p_sort_column_3=>'NAME'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(72042330967152963435)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(72041526964042963091)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(72041411074659963028)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(72041589852053963136)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(72042329744865963434)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(72042327139498963428)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(72041588230892963136)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&APP_SESSION.::&DEBUG.:3::'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(72042330088310963434)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(72042327139498963428)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(72042330590363963435)
,p_event_id=>wwv_flow_imp.id(72042330088310963434)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(72042327139498963428)
);
wwv_flow_imp.component_end;
end;
/

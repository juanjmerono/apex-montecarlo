prompt --application/pages/page_00004
begin
--   Manifest
--     PAGE: 00004
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
 p_id=>4
,p_name=>'Tasks'
,p_alias=>'TASKS'
,p_step_title=>'Tasks'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.u-tL[headers="prj"] {',
unistr('    max-width: 100px;      /* Ajusta el ancho m\00E1ximo que deseas */'),
unistr('    white-space: nowrap;   /* Evita que el texto se divida en varias l\00EDneas */'),
'    overflow: hidden;      /* Oculta el texto que excede el ancho */',
'    text-overflow: ellipsis; /* Agrega los puntos suspensivos (...) */',
'}',
'',
'.u-tL:hover[headers="prj"] {',
'    overflow: visible;',
'    white-space: normal;',
'    /*background: #f9f9f9;*/',
'    background-color: black;',
'    color: #fff;',
'    position: absolute;',
'    z-index: 1;',
'    padding: 5px;',
'    /*border: 1px solid #ddd;*/',
'    max-width: 300px; /* o el valor que prefieras para el hover */',
'    height: auto;',
'    border-radius: 6px;',
'    text-align: center;',
'}',
'',
''))
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
 p_id=>wwv_flow_imp.id(72042562608902963863)
,p_plug_name=>'Tasks'
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH ptasks AS (select ID,',
'       ''(''||PROJECT_ID||'') ''||(select name from project where id = project_id) as PROJECT,',
'       ORDEN,',
'       NAME,',
'       OPTIMISTIC,',
'       LIKELY,',
'       PESIMISTIC,',
'       DISABLED,',
'       (SELECT AVG(total) FROM tasks_simulations WHERE task_id = T.ID) AS PROMEDIO,',
'       (SELECT PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY total) FROM tasks_simulations WHERE task_id = T.ID) AS PERCENTILE',
'  from TASKS T)',
'select ID,',
'        PROJECT,',
'        ORDEN,',
'        NAME,',
'        OPTIMISTIC,',
'        LIKELY,',
'        PESIMISTIC,',
'        DISABLED,',
'        ROUND(PROMEDIO,2) as PROMH,',
'        ROUND(PROMEDIO/8,2) as PROMD,',
'        ROUND(PROMEDIO/37.5,2) as PROMW,',
'        ROUND(PERCENTILE,2) as PERCENTH,',
'        ROUND(PERCENTILE/8,2) as PERCENTD,',
'        ROUND(PERCENTILE/37.5,2) as PERCENTW',
'from ptasks',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Tasks'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(72042562780364963863)
,p_name=>'Tasks'
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
,p_detail_link=>'f?p=&APP_ID.:5:&APP_SESSION.::&DEBUG.:RP:P5_ID:\#ID#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_detail_link_auth_scheme=>wwv_flow_imp.id(72042306811525963298)
,p_owner=>'XOFAKGMKGAIEJHWLXL@YTNHY.COM'
,p_internal_uid=>72042562780364963863
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72042564068176963866)
,p_db_column_name=>'ID'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(69475837776831975549)
,p_db_column_name=>'ORDEN'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Orden'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72042564834208963866)
,p_db_column_name=>'NAME'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Task Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_static_id=>'tskname'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72128697091846819547)
,p_db_column_name=>'DISABLED'
,p_display_order=>60
,p_column_identifier=>'K'
,p_column_label=>'Disabled'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72128697169332819548)
,p_db_column_name=>'PROJECT'
,p_display_order=>100
,p_column_identifier=>'L'
,p_column_label=>'Project'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_static_id=>'prj'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72371742627440124316)
,p_db_column_name=>'OPTIMISTIC'
,p_display_order=>110
,p_column_identifier=>'S'
,p_column_label=>'Opt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72371742782639124317)
,p_db_column_name=>'LIKELY'
,p_display_order=>120
,p_column_identifier=>'T'
,p_column_label=>'Likely'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72371742870129124318)
,p_db_column_name=>'PESIMISTIC'
,p_display_order=>130
,p_column_identifier=>'U'
,p_column_label=>'Pes.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72371744169586124331)
,p_db_column_name=>'PROMH'
,p_display_order=>140
,p_column_identifier=>'AB'
,p_column_label=>'Media (hrs)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72371744227235124332)
,p_db_column_name=>'PROMD'
,p_display_order=>150
,p_column_identifier=>'AC'
,p_column_label=>'Media (dias)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72371744340172124333)
,p_db_column_name=>'PROMW'
,p_display_order=>160
,p_column_identifier=>'AD'
,p_column_label=>'Media (sem)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72371744496785124334)
,p_db_column_name=>'PERCENTH'
,p_display_order=>170
,p_column_identifier=>'AE'
,p_column_label=>'P90 (hrs)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72371744545802124335)
,p_db_column_name=>'PERCENTD'
,p_display_order=>180
,p_column_identifier=>'AF'
,p_column_label=>'P90 (dias)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(72371744636142124336)
,p_db_column_name=>'PERCENTW'
,p_display_order=>190
,p_column_identifier=>'AG'
,p_column_label=>'P90 (sem)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(72042589446305963878)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'720425895'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PROJECT:NAME:OPTIMISTIC:LIKELY:PESIMISTIC:PROMH:PROMD:PROMW:PERCENTH:PERCENTD:PERCENTW:'
,p_sort_column_1=>'PROJECT'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'ORDEN'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(72042569588222963868)
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
 p_id=>wwv_flow_imp.id(72042567672535963868)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(72042562608902963863)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(72041588230892963136)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:5:&APP_SESSION.::&DEBUG.:5::'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(72042567945892963868)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(72042562608902963863)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(72042568772404963868)
,p_event_id=>wwv_flow_imp.id(72042567945892963868)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(72042562608902963863)
);
wwv_flow_imp.component_end;
end;
/

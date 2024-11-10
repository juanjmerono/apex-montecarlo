prompt --application/pages/page_00006
begin
--   Manifest
--     PAGE: 00006
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
 p_id=>6
,p_name=>'Simulations'
,p_alias=>'SIMULATIONSPAGE'
,p_step_title=>'Simulations'
,p_allow_duplicate_submissions=>'N'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''td[headers="DISABLED"]'').each(function(){',
'    if ($(this).text() == ''Disabled'') {',
'        $(this).parent().addClass(''highlight-row'');',
'    }',
'});',
'',
'let opt = $("input[type=''radio''][name=''P6_UNIT'']:checked").val();',
'',
'$(''.t-Report-cell[headers="OPTIMISTIC"],.t-Report-cell[headers="PESIMISTIC"],.t-Report-cell[headers="LIKELY"],.t-Report-cell[headers="PROMEDIO"],.t-Report-cell[headers="PERCENTILE"]'')',
'.each(function(){',
'    $(this)[0].dataset.hrs = $(this).text();',
'    let rdo = $(this).text();',
'    if (opt == ''W'') rdo = Math.round(((rdo / 37.5) + Number.EPSILON) * 100) / 100',
'    if (opt == ''D'') rdo = Math.round(((rdo / 8) + Number.EPSILON) * 100) / 100',
'    $(this).text(rdo);',
'});',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Scroll Results Only in Side Column */',
'.t-Body-side {',
'    display: flex;',
'    flex-direction: column;',
'    overflow: hidden;',
'}',
'.search-results {',
'    flex: 1;',
'    overflow: auto;',
'}',
'/* Format Search Region */',
'.search-region {',
'    border-bottom: 1px solid rgba(0,0,0,.1);',
'    flex-shrink: 0;',
'}',
'.highlight-row {',
'    text-decoration:line-through;',
'}',
''))
,p_step_template=>wwv_flow_imp.id(72041414742503963031)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(72045371517556998477)
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
 p_id=>wwv_flow_imp.id(72045373081035998480)
,p_plug_name=>'Search'
,p_region_css_classes=>'search-region padding-md'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_imp.id(72041447761982963051)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_02'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(72045373802116998481)
,p_name=>'Master Records'
,p_template=>wwv_flow_imp.id(72041449148691963052)
,p_display_sequence=>40
,p_region_css_classes=>'search-results'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'t-MediaList--showDesc:t-MediaList--stack'
,p_display_point=>'REGION_POSITION_02'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "ID",',
'    null LINK_CLASS,',
'    apex_page.get_url(p_items => ''P6_ID'', p_values => "ID") LINK,',
'    null ICON_CLASS,',
'    null LINK_ATTR,',
'    null ICON_COLOR_CLASS,',
'    case when coalesce(:P6_ID,''0'') = "ID"',
'      then ''is-active'' ',
'      else '' ''',
'    end LIST_CLASS,',
'    (substr("NAME", 1, 50)||( case when length("NAME") > 50 then ''...'' else '''' end )) LIST_TITLE,',
'    (substr("YEAR", 1, 50)||( case when length("YEAR") > 50 then ''...'' else '''' end )) LIST_TEXT,',
'    null LIST_BADGE',
'from "PROJECT" x',
'where (:P6_SEARCH is null',
'        or upper(x."NAME") like ''%''||upper(:P6_SEARCH)||''%''',
'        or upper(x."YEAR") like ''%''||upper(:P6_SEARCH)||''%''',
'    )',
'order by "NAME"'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P6_SEARCH'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(72041549817733963105)
,p_query_num_rows=>1000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'<div class="u-tC">No data found.</div>'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72045374510834998485)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'ID'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72045374909302998485)
,p_query_column_id=>2
,p_column_alias=>'LINK_CLASS'
,p_column_display_sequence=>2
,p_column_heading=>'LINK_CLASS'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72045375384492998486)
,p_query_column_id=>3
,p_column_alias=>'LINK'
,p_column_display_sequence=>3
,p_column_heading=>'LINK'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72045375709745998486)
,p_query_column_id=>4
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>4
,p_column_heading=>'ICON_CLASS'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72045376110789998486)
,p_query_column_id=>5
,p_column_alias=>'LINK_ATTR'
,p_column_display_sequence=>5
,p_column_heading=>'LINK_ATTR'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72045376597625998486)
,p_query_column_id=>6
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>6
,p_column_heading=>'ICON_COLOR_CLASS'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72045376960224998487)
,p_query_column_id=>7
,p_column_alias=>'LIST_CLASS'
,p_column_display_sequence=>7
,p_column_heading=>'LIST_CLASS'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72045377333955998487)
,p_query_column_id=>8
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>8
,p_column_heading=>'LIST_TITLE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72045377745053998487)
,p_query_column_id=>9
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>9
,p_column_heading=>'LIST_TEXT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72045378196683998488)
,p_query_column_id=>10
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>10
,p_column_heading=>'LIST_BADGE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(72046214779346998691)
,p_name=>'ProjectTasks'
,p_title=>'Project'
,p_template=>wwv_flow_imp.id(72041514425375963085)
,p_display_sequence=>10
,p_region_css_classes=>'js-master-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH fproject as (select ID, YEAR, NAME,',
'       (SELECT COUNT(*) FROM tasks WHERE project_id = :P6_ID AND disabled = 0) AS TAREAS,',
'       (SELECT AVG(total) FROM simulations WHERE project_id = :P6_ID) AS PROMEDIO,',
'       (SELECT PERCENTILE_CONT(NVL(:P6_PCT,0.9)) WITHIN GROUP (ORDER BY total) FROM simulations WHERE project_id = :P6_ID) AS PERCENTILE',
'  from PROJECT',
' where "ID" = :P6_ID)',
' select ',
'    ID, YEAR, NAME,',
'    TAREAS,',
'    ROUND(PROMEDIO,2) as PROMH,',
'    ROUND(PROMEDIO/8,2) as PROMD,',
'    ROUND(PROMEDIO/37.5,2) as PROMW, ',
'    ROUND(PERCENTILE,2) as PERCENTH,',
'    ROUND(PERCENTILE/8,2) as PERCENTD,',
'    ROUND(PERCENTILE/37.5,2) as PERCENTW',
' from fproject;',
''))
,p_display_when_condition=>'P6_ID'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(72041553078284963107)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No Record Selected'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72046215335382998693)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'Id'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "PROJECT"',
'where "ID" is not null',
'and "ID" = :P6_ID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72046215773723998693)
,p_query_column_id=>2
,p_column_alias=>'YEAR'
,p_column_display_sequence=>2
,p_column_heading=>'Year'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "PROJECT"',
'where "YEAR" is not null',
'and "ID" = :P6_ID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72046216145154998693)
,p_query_column_id=>3
,p_column_alias=>'NAME'
,p_column_display_sequence=>3
,p_column_heading=>'Name'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "PROJECT"',
'where "NAME" is not null',
'and "ID" = :P6_ID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72413734444268903009)
,p_query_column_id=>4
,p_column_alias=>'TAREAS'
,p_column_display_sequence=>13
,p_column_heading=>'Tareas Activas'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72413734524678903010)
,p_query_column_id=>5
,p_column_alias=>'PROMH'
,p_column_display_sequence=>23
,p_column_heading=>'Media (hrs)'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72413734624559903011)
,p_query_column_id=>6
,p_column_alias=>'PROMD'
,p_column_display_sequence=>33
,p_column_heading=>'Media (dias)'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72413734793206903012)
,p_query_column_id=>7
,p_column_alias=>'PROMW'
,p_column_display_sequence=>43
,p_column_heading=>'Media (sem)'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72413734859529903013)
,p_query_column_id=>8
,p_column_alias=>'PERCENTH'
,p_column_display_sequence=>53
,p_column_heading=>'Percent. (hrs)'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72413734909817903014)
,p_query_column_id=>9
,p_column_alias=>'PERCENTD'
,p_column_display_sequence=>63
,p_column_heading=>'Percent. (dias)'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72413735033339903015)
,p_query_column_id=>10
,p_column_alias=>'PERCENTW'
,p_column_display_sequence=>73
,p_column_heading=>'Percent. (sem)'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(72046220032770998698)
,p_plug_name=>'Region Display Selector'
,p_region_css_classes=>'js-detail-rds'
,p_region_template_options=>'#DEFAULT#:margin-bottom-md'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(72041447761982963051)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_num_rows=>15
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P6_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'Y',
  'rds_mode', 'STANDARD',
  'remember_selection', 'N')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(72046220408390998698)
,p_name=>'TasksFromProject'
,p_title=>'Project''s tasks'
,p_template=>wwv_flow_imp.id(72041514425375963085)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_css_classes=>'js-detail-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'t-Report--stretch:#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH ttasks AS (select disabled,',
'       ID,',
'       PROJECT_ID,',
'       ORDEN,',
'       NAME,',
'       OPTIMISTIC,',
'       LIKELY,',
'       PESIMISTIC,',
'       (SELECT AVG(total) FROM tasks_simulations WHERE task_id = T.ID) AS PROMEDIO,',
'       (SELECT PERCENTILE_CONT(:P6_PCT) WITHIN GROUP (ORDER BY total) FROM tasks_simulations WHERE task_id = T.ID) AS PERCENTILE',
'  from TASKS T',
' where "PROJECT_ID" = :P6_ID',
' ORDER BY ORDEN)',
' select ID,',
'    DISABLED,',
'    PROJECT_ID,',
'    ORDEN,',
'    NAME,',
'    OPTIMISTIC,',
'    LIKELY,',
'    PESIMISTIC,',
'    ROUND(PROMEDIO,2) as PROMEDIO,',
'    ROUND(PERCENTILE,2) as PERCENTILE',
' from ttasks'))
,p_display_when_condition=>'P6_ID'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(72041553078284963107)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found.'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>5000
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72046221267790998700)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>20
,p_column_heading=>'<span class="u-VisuallyHidden">Edit</span>'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:9:&APP_SESSION.::&DEBUG.:RP:P9_ID:#ID#'
,p_column_linktext=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_heading_alignment=>'LEFT'
,p_report_column_width=>32
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72128696799113819544)
,p_query_column_id=>2
,p_column_alias=>'DISABLED'
,p_column_display_sequence=>50
,p_column_heading=>'Status'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_inline_lov=>'STATIC:Disabled;1,Enabled;0'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72046221673450998700)
,p_query_column_id=>3
,p_column_alias=>'PROJECT_ID'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72128692868923819505)
,p_query_column_id=>4
,p_column_alias=>'ORDEN'
,p_column_display_sequence=>40
,p_column_heading=>'Orden'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72046222005755998700)
,p_query_column_id=>5
,p_column_alias=>'NAME'
,p_column_display_sequence=>60
,p_column_heading=>'Name'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72046222469291998700)
,p_query_column_id=>6
,p_column_alias=>'OPTIMISTIC'
,p_column_display_sequence=>70
,p_column_heading=>'Opt.'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72046222801895998700)
,p_query_column_id=>7
,p_column_alias=>'LIKELY'
,p_column_display_sequence=>80
,p_column_heading=>'Likely'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72046223233511998701)
,p_query_column_id=>8
,p_column_alias=>'PESIMISTIC'
,p_column_display_sequence=>90
,p_column_heading=>'Pes.'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72371741817507124308)
,p_query_column_id=>9
,p_column_alias=>'PROMEDIO'
,p_column_display_sequence=>110
,p_column_heading=>'Media'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(72371741958706124309)
,p_query_column_id=>10
,p_column_alias=>'PERCENTILE'
,p_column_display_sequence=>120
,p_column_heading=>'Percentil'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(72046237328439998813)
,p_plug_name=>'No Record Selected'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(72041447761982963051)
,p_plug_display_sequence=>70
,p_plug_source=>'No Record Selected'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P6_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(72046226130501998703)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(72046220408390998698)
,p_button_name=>'POP_TASKS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(72041587543993963135)
,p_button_image_alt=>'Add ProjectTasks'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:9:&APP_SESSION.::&DEBUG.:RP,9:P9_PROJECT_ID:&P6_ID.'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(69475834743367975519)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(72046214779346998691)
,p_button_name=>'Simulate'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(72041588323429963136)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Simulate'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-network-triangle'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(72046237861220998813)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(72046214779346998691)
,p_button_name=>'EDIT'
,p_button_static_id=>'edit_master_btn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(72041588323429963136)
,p_button_image_alt=>'Edit'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:8:&APP_SESSION.::&DEBUG.:RP,8:P8_ID:&P6_ID.'
,p_icon_css_classes=>'fa-pencil-square-o'
,p_required_patch=>wwv_flow_imp.id(72041410457756963028)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(72045372384997998479)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(72045371517556998477)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft:t-Button--gapRight'
,p_button_template_id=>wwv_flow_imp.id(72041588323429963136)
,p_button_image_alt=>'Reset'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&APP_SESSION.:RESET:&DEBUG.:RP,6::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(72045372713593998480)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(72045371517556998477)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(72041588323429963136)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:8:&APP_SESSION.::&DEBUG.:RP,8::'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(72045373587225998480)
,p_name=>'P6_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(72045373081035998480)
,p_prompt=>'Search'
,p_placeholder=>'Search...'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(72041585427108963134)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large:t-Form-fieldContainer--postTextBlock'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(72046219785673998698)
,p_name=>'P6_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(72046214779346998691)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(72128693042094819507)
,p_name=>'P6_FUNCTION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(72046214779346998691)
,p_item_display_point=>'EDIT'
,p_item_default=>'T'
,p_prompt=>'Distribution'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>'STATIC:Triangular;T,PERT;P,Uniforme;U,Normal;N'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(72041585711091963134)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CONTAINS'
,p_attribute_02=>'N'
,p_attribute_04=>'N'
,p_attribute_09=>'0'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(72128693180625819508)
,p_name=>'P6_PCT'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(72046214779346998691)
,p_item_display_point=>'EDIT'
,p_item_default=>'0.9'
,p_prompt=>'Percentile'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(72041585711091963134)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'0'
,p_attribute_02=>'1'
,p_attribute_03=>'left'
,p_attribute_04=>'decimal'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(72413735285346903017)
,p_name=>'P6_UNIT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(72046220408390998698)
,p_item_display_point=>'EDIT'
,p_item_default=>'H'
,p_prompt=>'Unit'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Hours;H,Days;D,Weeks;W'
,p_field_template=>wwv_flow_imp.id(72041585711091963134)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'3'
,p_attribute_02=>'NONE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(72046238114732998814)
,p_name=>'Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(72046214779346998691)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(72046238765709998814)
,p_event_id=>wwv_flow_imp.id(72046238114732998814)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(72046214779346998691)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(72046239292536998814)
,p_event_id=>wwv_flow_imp.id(72046238114732998814)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''ProjectTasks row(s) updated.'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(72046220595322998698)
,p_name=>'Dialog Closed'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(72046220408390998698)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(72046226852200998703)
,p_event_id=>wwv_flow_imp.id(72046220595322998698)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(72046220408390998698)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(72046227308330998704)
,p_event_id=>wwv_flow_imp.id(72046220595322998698)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''ProjectTasks row(s) updated.'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(72046238235609998814)
,p_name=>'Perform Search'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P6_SEARCH'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.which === apex.jQuery.ui.keyCode.ENTER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(72046240046490998815)
,p_event_id=>wwv_flow_imp.id(72046238235609998814)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(72045373802116998481)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(72046240550326998815)
,p_event_id=>wwv_flow_imp.id(72046238235609998814)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CANCEL_EVENT'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(69475834821672975520)
,p_name=>'Simulate'
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(69475834743367975519)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(69475834998155975521)
,p_event_id=>wwv_flow_imp.id(69475834821672975520)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#P6_PCT'').val() >= 0 && $(''#P6_PCT'').val() <= 1',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(72128696807611819545)
,p_name=>'After Refresh'
,p_event_sequence=>170
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(72046220408390998698)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(72128696954963819546)
,p_event_id=>wwv_flow_imp.id(72128696807611819545)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''td[headers="DISABLED"]'').each(function(){',
'    if ($(this).text() == ''Disabled'') {',
'        $(this).parent().addClass(''highlight-row'');',
'    }',
'});',
'',
'let opt = $("input[type=''radio''][name=''P6_UNIT'']:checked").val();',
'',
'$(''.t-Report-cell[headers="OPTIMISTIC"],.t-Report-cell[headers="PESIMISTIC"],.t-Report-cell[headers="LIKELY"],.t-Report-cell[headers="PROMEDIO"],.t-Report-cell[headers="PERCENTILE"]'')',
'.each(function(){',
'    $(this)[0].dataset.hrs = $(this).text();',
'    let rdo = $(this).text();',
'    if (opt == ''W'') rdo = Math.round(((rdo / 37.5) + Number.EPSILON) * 100) / 100',
'    if (opt == ''D'') rdo = Math.round(((rdo / 8) + Number.EPSILON) * 100) / 100',
'    $(this).text(rdo);',
'});',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(72413735308799903018)
,p_name=>'OnChange'
,p_event_sequence=>180
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P6_UNIT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(72413735444554903019)
,p_event_id=>wwv_flow_imp.id(72413735308799903018)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let opt = $("input[type=''radio''][name=''P6_UNIT'']:checked").val();',
'$(''.t-Report-cell[headers="OPTIMISTIC"],.t-Report-cell[headers="PESIMISTIC"],.t-Report-cell[headers="LIKELY"],.t-Report-cell[headers="PROMEDIO"],.t-Report-cell[headers="PERCENTILE"]'')',
'.each(function(){',
'    let rdo = $(this)[0].dataset.hrs;',
'    if (opt == ''W'') rdo = Math.round(((rdo / 37.5) + Number.EPSILON) * 100) / 100',
'    if (opt == ''D'') rdo = Math.round(((rdo / 8) + Number.EPSILON) * 100) / 100',
'    $(this).text(rdo);',
'});'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(69475835413278975526)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Simulate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
unistr('    -- Variables para controlar el n\00FAmero de simulaciones y los resultados'),
unistr('    n_simulations   NUMBER := 2000;  -- N\00FAmero de simulaciones'),
unistr('    total_duration  NUMBER;          -- Duraci\00F3n total del proyecto en una simulaci\00F3n'),
unistr('    sim_duration    NUMBER;          -- Duraci\00F3n simulada de una tarea en una simulaci\00F3n'),
'',
'    -- Variables para obtener datos de cada tarea',
'    v_optimistic    NUMBER;',
'    v_likely        NUMBER;',
'    v_pessimistic   NUMBER;',
'',
'    -- Cursor para iterar sobre las tareas',
'    CURSOR task_cur IS',
'        SELECT id, optimistic, likely, pesimistic',
'        FROM tasks',
'        WHERE project_id = :P6_ID',
'        AND disabled = 0; -- Ignore disabled tasks',
'',
'BEGIN',
'    -- Delete previous simulation data',
'    DELETE FROM simulations WHERE project_id = :P6_ID;',
'    DELETE FROM tasks_simulations WHERE task_id in (SELECT id FROM tasks where project_id = :P6_ID);',
'    ',
'    -- Bucle principal para realizar n_simulations',
'    FOR sim_id IN 1..n_simulations LOOP',
unistr('        total_duration := 0;  -- Reiniciar la duraci\00F3n total para cada simulaci\00F3n'),
'',
unistr('        -- Iterar sobre cada tarea y calcular su duraci\00F3n simulada'),
'        FOR task_rec IN task_cur LOOP',
'            v_optimistic := task_rec.optimistic;',
'            v_likely := task_rec.likely;',
'            v_pessimistic := task_rec.pesimistic;',
'',
'            IF :P6_FUNCTION = ''P'' THEN',
unistr('                -- Generar duraci\00F3n simulada usando distribuci\00F3n PERT'),
'                DECLARE',
'                    u1 NUMBER := DBMS_RANDOM.VALUE;',
'                    u2 NUMBER := DBMS_RANDOM.VALUE;',
'                    lambda NUMBER := 4; -- Suavizado',
'                    beta_random NUMBER;',
'                    alpha NUMBER := 1 + lambda * (v_likely - v_optimistic) / (v_pessimistic - v_optimistic);',
'                    beta NUMBER := 1 + lambda * (v_pessimistic - v_likely) / (v_pessimistic - v_optimistic);',
'                BEGIN',
'                    -- Eleva los valores aleatorios a las potencias de alpha y beta para aproximar Beta(alpha, beta)',
'                    beta_random := POWER(u1, 1 / alpha) / (POWER(u1, 1 / alpha) + POWER(u2, 1 / beta));',
'                    -- beta_random := POWER(u1, alpha - 1) * POWER(u2, beta - 1);',
'                    -- beta_random := POWER(u1, alpha) / (POWER(u1, alpha) + POWER(u2, beta));',
unistr('                    -- Escala el valor beta_random a [a, c] usando la f\00F3rmula de la distribuci\00F3n PERT'),
'                    sim_duration := v_optimistic + (v_pessimistic - v_optimistic) * beta_random;',
'                END;',
'            ELSIF :P6_FUNCTION = ''U'' THEN',
unistr('                -- Generar duraci\00F3n simulada usando distribuci\00F3n uniforme'),
'                sim_duration := v_optimistic + (v_pessimistic - v_optimistic) * DBMS_RANDOM.VALUE;',
'            ELSIF :P6_FUNCTION = ''N'' THEN',
unistr('                -- Generar duraci\00F3n simulada usando distribuci\00F3n normal'),
'                DECLARE',
'                    z NUMBER;',
'                    u1 NUMBER := DBMS_RANDOM.VALUE;',
'                    u2 NUMBER := DBMS_RANDOM.VALUE;',
'                    mu NUMBER := (v_optimistic + 4 * v_likely + v_pessimistic) / 6;',
'                    sigma NUMBER := (v_pessimistic - v_optimistic) / 6;',
'                BEGIN',
'                    z := SQRT(-2 * LN(u1)) * COS(2 * ACOS(-1) * u2);',
'                    sim_duration := mu + sigma * z;',
'                END;                ',
'            ELSE',
unistr('                -- Generar duraci\00F3n simulada usando distribuci\00F3n triangular'),
'                /*sim_duration := v_optimistic',
'                            + (v_likely - v_optimistic) * DBMS_RANDOM.VALUE',
'                            + (v_pessimistic - v_likely) * DBMS_RANDOM.VALUE;*/',
'                DECLARE',
'                    u NUMBER := DBMS_RANDOM.VALUE;',
'                BEGIN',
'                    IF u < (v_likely - v_optimistic) / (v_pessimistic - v_optimistic) THEN',
'                        sim_duration := v_optimistic + SQRT(u * (v_likely - v_optimistic) * (v_pessimistic - v_optimistic));',
'                    ELSE',
'                        sim_duration := v_pessimistic - SQRT((1 - u) * (v_pessimistic - v_likely) * (v_pessimistic - v_optimistic));',
'                    END IF;',
'                END;',
'            END IF;',
'',
unistr('            -- Acumular la duraci\00F3n simulada en la duraci\00F3n total del proyecto'),
'            total_duration := total_duration + sim_duration;',
'',
'            INSERT INTO tasks_simulations (task_id, total) VALUES (task_rec.id, sim_duration);',
'',
'        END LOOP;',
'',
unistr('        -- Insertar el resultado de la simulaci\00F3n en la tabla temporal'),
'        INSERT INTO simulations (project_id,total) VALUES (:P6_ID,total_duration);',
'    END LOOP;',
'',
'    -- Confirmar los resultados en la base de datos',
unistr('    -- No es necesario LA TRANSACCI\00D3N LA CONTROLA EL PROCESO EXTERNO !!'),
'    -- COMMIT;',
'    ',
'END;',
'',
'    '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>69475835413278975526
);
wwv_flow_imp.component_end;
end;
/

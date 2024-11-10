prompt --application/shared_components/navigation/lists/page_navigation
begin
--   Manifest
--     LIST: Page Navigation
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.5'
,p_default_workspace_id=>68083285233183961161
,p_default_application_id=>258619
,p_default_id_offset=>0
,p_default_owner=>'WKSP_TEST9876WS'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(72042603778214963886)
,p_name=>'Page Navigation'
,p_list_status=>'PUBLIC'
,p_version_scn=>15587919118911
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(72042604732794963887)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Project'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-table'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(72042605445895963887)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Tasks'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-table'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(72073664237724322131)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Simulations'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-table'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(72241851908420552572)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Statistics'
,p_list_item_link_target=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-area-chart'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/

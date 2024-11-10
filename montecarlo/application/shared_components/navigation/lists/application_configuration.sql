prompt --application/shared_components/navigation/lists/application_configuration
begin
--   Manifest
--     LIST: Application Configuration
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
 p_id=>wwv_flow_imp.id(72043844936650964692)
,p_name=>'Application Configuration'
,p_list_status=>'PUBLIC'
,p_required_patch=>wwv_flow_imp.id(72042304741701963296)
,p_version_scn=>15587803345841
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(72043845550480964692)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Configuration Options'
,p_list_item_link_target=>'f?p=&APP_ID.:10010:&APP_SESSION.::&DEBUG.:10010::'
,p_list_item_icon=>'fa-sliders'
,p_list_text_01=>'Enable or disable application features'
,p_required_patch=>wwv_flow_imp.id(72042304741701963296)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/

prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 258619
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.5'
,p_default_workspace_id=>68083285233183961161
,p_default_application_id=>258619
,p_default_id_offset=>0
,p_default_owner=>'WKSP_TEST9876WS'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(72042307915352963299)
,p_group_name=>'Administration'
);
wwv_flow_imp.component_end;
end;
/

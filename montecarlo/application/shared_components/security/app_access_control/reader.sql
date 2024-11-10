prompt --application/shared_components/security/app_access_control/reader
begin
--   Manifest
--     ACL ROLE: Reader
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.5'
,p_default_workspace_id=>68083285233183961161
,p_default_application_id=>258619
,p_default_id_offset=>0
,p_default_owner=>'WKSP_TEST9876WS'
);
wwv_flow_imp_shared.create_acl_role(
 p_id=>wwv_flow_imp.id(72042306581714963298)
,p_static_id=>'READER'
,p_name=>'Reader'
,p_description=>'Role assigned to application readers.'
,p_version_scn=>15587803320680
);
wwv_flow_imp.component_end;
end;
/

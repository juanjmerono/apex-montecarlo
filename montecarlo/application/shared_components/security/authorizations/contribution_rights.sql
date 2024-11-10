prompt --application/shared_components/security/authorizations/contribution_rights
begin
--   Manifest
--     SECURITY SCHEME: Contribution Rights
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.5'
,p_default_workspace_id=>68083285233183961161
,p_default_application_id=>258619
,p_default_id_offset=>0
,p_default_owner=>'WKSP_TEST9876WS'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(72042306811525963298)
,p_name=>'Contribution Rights'
,p_scheme_type=>'NATIVE_IS_IN_GROUP'
,p_attribute_01=>'Administrator,Contributor'
,p_attribute_02=>'A'
,p_error_message=>'Insufficient privileges, user is not a Contributor'
,p_version_scn=>15587803320716
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_imp.component_end;
end;
/

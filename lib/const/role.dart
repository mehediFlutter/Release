const admin = 'ADMIN';
const editor = 'EDITOR';
const manager = 'MANAGER';
const support = 'SUPPORT';

 String? authRoleCatch ;
 String? authRoleUidCatch ;

List role = [
  {"id": "M", "title": "MANAGER"},
  {"id": "E", "title": "EDITOR"},
  {"id": "A", "title": "ADVERTISER"},
  {"id": "S", "title": "CUSTOMER CARE"},
];

List managerCanAddList = [
  {"id": "E", "title": "EDITOR"},
  {"id": "S", "title": "CUSTOMER CARE"},
];
List editorCanAddList = [
  {"id": "S", "title": "CUSTOMER CARE"},
];



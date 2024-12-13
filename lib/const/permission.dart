import 'package:shared_preferences/shared_preferences.dart';

const String rootAccess = "*";
const cannotCreateManager = 'cannot-create-manager';
const cannotDeleteManager = 'cannot-delete-manager';
const cannotCreateAdmin = 'cannot-create-admin';
const cannotDeleteAdmin = 'cannot-delete-admin';
const cannotCreateEditor = 'cannot-create-editor';
const cannotDeleteEditor = 'cannot-delete-editor';
const cannotCreateCustomerCare = 'cannot-create-support';
const cannotDeleteCustomerCare = 'cannot-delete-support';
const cannotShowPurchasePrice = 'cannot-show-purchase-price';
const cannotCreateVehicle = 'cannot-create-vehicle';
const cannotDeleteVehicle = 'cannot-delete-vehicle';
const cannotChangePrice = 'cannot-change-price';
const cannotApproveVehicle = 'cannot-approve-vehicle';
const cannotChangeAdvancedOption = 'cannot-change-advanced-option';

bool? isCreateManager = true;
bool? isDeleteManager = true;

bool? isDeleteAdmin = true;
bool? isCreateAdmin = true;

bool? isCreateEditor = true;
bool? isDeleteEditor = true;

bool? isCreateCustomerCare = true;
bool? isDeleteCustomerCate = true;

bool? isShowPurchasePrice = true;
bool? isCreateVehicle = true;

bool? isChangePrice = true;
bool? isApproveVehicle = true;

bool? isDeleteVehicle = true;

bool? isChangeAdvanceOption = true;
SharedPreferences? preferences;

canDeleteMember(String role, String uuid , authRole , authUuid) async {
//  preferences = await SharedPreferences.getInstance();
 // print("${preferences?.getString('role')}");
  // String authRole = await "${preferences?.getString('role')}";
  // String authUuid = await "${preferences?.getString('id')}";
  bool status = false;

  // if (authRole == SUPPORT) {
  //   status = false;
  // }

  // if (authRole == MANAGER) {
  //   if (role == ADMIN || role == MANAGER || uuid == authUuid) {
  //     status = false;
  //   } else {
  //     status = true;
  //   }
  // }

  // if (authRole == EDITOR) {
  //   if (role == EDITOR ||
  //       role == ADMIN ||
  //       role == MANAGER ||
  //       uuid == authUuid) {
  //     status = false;
  //   } else {
  //     status = true;
  //   }
  // }
  return status;

}
  //Uploader     -> can not delete manager, admin, can not approve uploaded vehicle

//Manager  -> can not delete admin, can not add manager ,can not delete other manager ,

// role == 'ADMIN'    -> all
// role == editor     -> can not delete manager,admin
// role == manager    ->  can not delete admin, can not add manager ,can not delete other manager
// Customer Care      -> Can not delete admin, manager, uploader,




// 'ROOT_ADMIN'    => ['*'],
// 'MANAGER'       => [
//     'cannot-create-manager',
//     'cannot-delete-manager',
//     'cannot-delete-admin',
//     'cannot-show-purchase-price',
// ],
// 'EDITOR'        => [
//     'cannot-delete-manager',
//     'cannot-delete-admin',
//     'cannot-approve-vehicle',
// ],
// 'ADVERTISER'    => ['*'],
// 'SUPPORT'       => [
//     'cannot-change-price',
//     'cannot-delete-vehicle',
//     'cannot-show-purchase-price',
//     'cannot-create-manager',
//     'cannot-delete-manager',
//     'cannot-delete-admin',
//     'cannot-delete-editor',
//     'cannot-delete-support',
//     'cannot-create-vehicle',
//     'cannot-change-advanced-option',
// ],

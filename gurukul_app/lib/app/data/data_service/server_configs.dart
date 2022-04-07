class ServerConfigs{

  static String domain = '192.168.1.125:3000';
  // static String domain = 'gurukulparivar.softcube.co.in';
  static String baseURL = 'http://$domain/api/v1/';
  static String imageBaseURL = 'http://$domain/images/';
  static String userLogin = 'userLogin';
  static String sendOtp = 'sendOtp';
  static String verifyOtp = 'verifyOtp';
  static String userSignUp = 'userSignUp';
  static String userUpdatePasswordByNumber = 'userUpdatePasswordByNumber';
  static String userLogout = 'userLogout';
  static String userBasicDetails = 'userBasicDetails';
  static String updateUserBasicDetails = 'updateUserBasicDetails';
  static String getTypeTerm = 'getTypeTerm';
  static String getSubTerm = 'getSubTerm';
  static String getAddress = 'getAddress';
  static String updateAddress = 'updateAddress';
  static String getProfessionDetail = 'getProfessionDetail';
  static String updateProfessionDetail = 'updateProfessionDetail';
  static String getAllGurukulList = 'getAllGurukulList';
  static String getSaintId = 'getSaintId';
  static String addUserGurukul = 'addUserGurukul';
  static String getGurukulList = 'getGurukulList';
  static String updateGurukulForId = 'updateGurukulForId';
  static String getSkillHobbyByUserId = 'getSkillHobbyByUserId';
  static String updateHobbySkillByUserId = 'updateHobbySkillByUserId';
  static String getFamilyMemberByUserId = 'getFamilyMemberByUserId';
  static String addFamilyMember = 'addFamilyMember';
  static String updateFamilyMember = 'updateFamilyMember';
  static String getCmsPages = 'getCmsPages';
  static String getCurrentVersion = 'getCurrentVersion';
  static String getFaimilyRequestList = 'getFaimilyRequestList';
  static String acceptRejectRequestFaimily = 'acceptRejectRequestFaimily';
  static String getGurukulPost = 'getGurukulPostList';
  static String getGurukulPostDetail = 'gurukulPostDetailsByWallId';
}
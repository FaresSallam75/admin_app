class AppLink {
  //const String linkServerName = "http://10.0.2.2/course_php";
  //const String linkServerName = "localhost/ecommerce";
  static const String server =
      "http://10.0.2.2/ecommerce";
     // "https://faressallam.online/ecommerce";
  static const String test = "$server/test.php";

  // images ========================
  static const String imageStatic     = "$server/upload";
  static const String imageCategories = "$imageStatic/categories";
  static const String imageItems      = "$imageStatic/items";
  static const String imageAdmin      = "$imageStatic/adminimage";

  // =============== Auth ============
  static const String signup = "$server/admin/auth/signup.php";
  static const String login = "$server/admin/auth/login.php";
  static const String verifyCodeSignUp = "$server/admin/auth/verifycode.php";
  static const String resendCode = "$server/admin/auth/resend.php";
  static const String getNotifyVerifyCodeData = "$server/admin/auth/sendnotify.php";

  // Forget Password
  static const String checkEmail =
      "$server/admin/forgetpassword/checkemail.php";
  static const String verifyCodeForgetPassword =
      "$server/admin/forgetpassword/verifycode.php";
  static const String resetPassword =
      "$server/admin/forgetpassword/resetpassword.php";

  //checkout || Orders
  //event
  static const String pendingOrders = "$server/admin/orders/pending.php";
  static const String prepareOrders = "$server/admin/orders/prepare.php";
  //view
  static const String viewArchieveOrders = "$server/admin/orders/archive.php";
  static const String viewDetailsOrders = "$server/admin/orders/details.php";
  static const String viewAcceptedOrders =
      "$server/admin/orders/viewaccepted.php";
  static const String viewPendingOrders =
      "$server/admin/orders/viewpending.php";

  //categories
  static const String categoriesAdd = "$server/admin/categories/add.php";
  static const String categoriesEdit = "$server/admin/categories/edit.php";
  static const String categoriesView = "$server/admin/categories/view.php";
  static const String categoriesDelete = "$server/admin/categories/delete.php";

  //items
  static const String itemsAdd = "$server/admin/items/add.php";
  static const String itemsEdit = "$server/admin/items/edit.php";
  static const String itemsView = "$server/admin/items/view.php";
  static const String itemsDelete = "$server/admin/items/delete.php";

  // Notifications
  static const String notificationsData =
      "$server/admin/notifications/notifications.php";

     // coupon ======================
  static const String viewCoupons = "$server/admin/coupon/viewcoupons.php";
  static const String addCoupons = "$server/admin/coupon/add.php"; 

  //setting 
  static const String viewUserProfile = "$server/admin/auth/viewadmin.php"; 

  // delivery 
  static const String viewDeliveryMen = "$server/admin/delivery/view.php"; 
  static const String approveDeliveryMen = "$server/admin/delivery/approve.php"; 


}

var listApp = angular.module('listpp', []);


 
/* variable listApp is a variable which used to control the array values to show the data to show in view using the module name 'listApp' with arguments as an array */
 
/* Initialize the controller by name 'PhoneListCtrl' holds the information of phone in form of array with keys name, snipper, price , quantity */
 
/* $scope argument passed in function is a key arguments should be passed with exactly the same name */
 
listApp.controller('PhoneListCtrl', function ($scope,$http) {
 
/** function to get detail of product added in mysql referencing php **/
 
$scope.get_user = function() {
$scope.add_use = true;
$http.get("ajax/user.php?action=get_user").success(function(data)
{
//$scope.product_detail = data;
$scope.pagedItems = data;
 
});
}
 
/** function to add details for products in mysql referecing php **/
 
$scope.user_submit = function() {
$scope.add_user = true;
$http.post('ajax/user.php?action=add_user',
{
'user_name' : $scope.user_name,
'id_config' : $scope.id_config,
'password' : $scope.password,
'droit' : $scope.droit
}
)
.success(function (data, status, headers, config) {
$scope.get_user();
$scope.user_name = null;
$scope.id_config = null;
$scope.password = null;
$scope.droit = null;
})
 
.error(function(data, status, headers, config){
 
});
}
 
/** function to delete product from list of product referencing php **/
 
$scope.user_delete = function(index) {
 
$http.post('ajax/user.php?action=delete_user',
{
'user_index' : index
}
)
.success(function (data, status, headers, config) {
$scope.get_user();
})
 
.error(function(data, status, headers, config){
 
});
}
 
/** fucntion to edit product details from list of product referencing php **/
 
$scope.user_edit = function(index) {
$scope.update_user = true;
$scope.add_user = false;
$http.post('ajax/user.php?action=edit_user',
{
'user_index' : index
}
)
.success(function (data, status, headers, config) {
//alert(data[0]["prod_name"]);
$scope.user_id = data[0]["id"];
$scope.user_name = data[0]["user_name"];
$scope.id_config = data[0]["id_config"];
$scope.password = data[0]["password"];
$scope.droit = data[0]["droit"];
 
})
 
.error(function(data, status, headers, config){
 
});
}
 
/** function to update product details after edit from list of products referencing php **/
 
$scope.update_user = function() {
 
$http.post('ajax/user.php?action=update_user',
{
'id' : $scope.user_id,
'user_name' : $scope.user_name,
'id_config' : $scope.id_config,
'password' : $scope.password,
'droit' : $scope.droit
}
)
.success(function (data, status, headers, config) {
$scope.get_user();
})
.error(function(data, status, headers, config){
 
});
}
 
});
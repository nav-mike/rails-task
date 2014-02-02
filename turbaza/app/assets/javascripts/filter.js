'use strict';

// Сворачивание/разворачивание фильтра
$('#filter').hide();
$('#filter_hide').click(function(){
    $('#filter').hide('slow');
    return false;
});

$('#filter_show').click(function(){
    $('#filter').show('slow');
    return false;
});

////// Инициализация приложения
////var hostels_filter_app = angular.module('hostels_filter_app', []);
//
//// Контроллер
//hostels_filter_app.controller('init_filter_app_ctrl', function($scope){
//    $scope.turbaza_list = hostels_list; // Инициализация списка турбаз
//});
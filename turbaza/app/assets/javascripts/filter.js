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

var phonecatApp = angular.module('phonecatApp', []);

// Инициализация списка турбаз
phonecatApp.controller('TurbazaListCtrl', function($scope){
    $scope.turbaza_list = [
        {
            'id': '0',
            'image': './images/t1.jpg',
            'image_title': 'Vestibulum augue velit',
            'name': 'Vestibulum augue velit',
            'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam feugiat placerat dignissim. Integer sit amet enim sollicitudin, vestibulum magna sit amet, molestie tellus. Vivamus non porttitor orci. Sed aliquet massa arcu, molestie fermentum libero sagittis et. Duis quis pharetra enim. Nulla lacus ligula, varius quis erat vitae, venenatis semper justo. Nam metus metus, pellentesque sed odio at, ornare eleifend tortor. Cras sodales est quis elit ultrices pretium. Cras vestibulum diam ac risus tincidunt blandit. Maecenas cursus et tellus sed laoreet. Vivamus ac nisi a sapien condimentum facilisis. Quisque eget leo ac sem aliquet ultricies. Vestibulum aliquet, velit ac ultricies hendrerit, eros ligula placerat erat, et rhoncus lorem dui vel arcu. Ut pellentesque lectus eu massa aliquet, sed porta purus lobortis.',
            'email': 'tbase@email.com',
            'phone': '+7 (8442) 12-23-34',
            'country': 'Страна_1',
            'region': 'Регион_2',
            'city': 'Город_3'
        },
        {
            'id': '1',
            'image': './images/t1.jpg',
            'image_title': 'Vestibulum augue velit',
            'name': 'Vestibulum augue velit',
            'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam feugiat placerat dignissim. Integer sit amet enim sollicitudin, vestibulum magna sit amet, molestie tellus. Vivamus non porttitor orci. Sed aliquet massa arcu, molestie fermentum libero sagittis et. Duis quis pharetra enim. Nulla lacus ligula, varius quis erat vitae, venenatis semper justo. Nam metus metus, pellentesque sed odio at, ornare eleifend tortor. Cras sodales est quis elit ultrices pretium. Cras vestibulum diam ac risus tincidunt blandit. Maecenas cursus et tellus sed laoreet. Vivamus ac nisi a sapien condimentum facilisis. Quisque eget leo ac sem aliquet ultricies. Vestibulum aliquet, velit ac ultricies hendrerit, eros ligula placerat erat, et rhoncus lorem dui vel arcu. Ut pellentesque lectus eu massa aliquet, sed porta purus lobortis.',
            'email': 'tbase@email.com',
            'phone': '+7 (8442) 12-23-34',
            'country': 'Страна_1',
            'region': 'Регион_2',
            'city': 'Город_1'
        },
        {
            'id': '2',
            'image': './images/t1.jpg',
            'image_title': 'Vestibulum augue velit',
            'name': 'Vestibulum augue velit',
            'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam feugiat placerat dignissim. Integer sit amet enim sollicitudin, vestibulum magna sit amet, molestie tellus. Vivamus non porttitor orci. Sed aliquet massa arcu, molestie fermentum libero sagittis et. Duis quis pharetra enim. Nulla lacus ligula, varius quis erat vitae, venenatis semper justo. Nam metus metus, pellentesque sed odio at, ornare eleifend tortor. Cras sodales est quis elit ultrices pretium. Cras vestibulum diam ac risus tincidunt blandit. Maecenas cursus et tellus sed laoreet. Vivamus ac nisi a sapien condimentum facilisis. Quisque eget leo ac sem aliquet ultricies. Vestibulum aliquet, velit ac ultricies hendrerit, eros ligula placerat erat, et rhoncus lorem dui vel arcu. Ut pellentesque lectus eu massa aliquet, sed porta purus lobortis.',
            'email': 'tbase@email.com',
            'phone': '+7 (8442) 12-23-34',
            'country': 'Страна_1',
            'region': 'Регион_1',
            'city': 'Город_3'
        },
        {
            'id': '3',
            'image': './images/t1.jpg',
            'image_title': 'Vestibulum augue velit',
            'name': 'Vestibulum augue velit',
            'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam feugiat placerat dignissim. Integer sit amet enim sollicitudin, vestibulum magna sit amet, molestie tellus. Vivamus non porttitor orci. Sed aliquet massa arcu, molestie fermentum libero sagittis et. Duis quis pharetra enim. Nulla lacus ligula, varius quis erat vitae, venenatis semper justo. Nam metus metus, pellentesque sed odio at, ornare eleifend tortor. Cras sodales est quis elit ultrices pretium. Cras vestibulum diam ac risus tincidunt blandit. Maecenas cursus et tellus sed laoreet. Vivamus ac nisi a sapien condimentum facilisis. Quisque eget leo ac sem aliquet ultricies. Vestibulum aliquet, velit ac ultricies hendrerit, eros ligula placerat erat, et rhoncus lorem dui vel arcu. Ut pellentesque lectus eu massa aliquet, sed porta purus lobortis.',
            'email': 'tbase@email.com',
            'phone': '+7 (8442) 12-23-34',
            'country': 'Страна_2',
            'region': 'Регион_2',
            'city': 'Город_3'
        }
    ];

});

// Инициализация полей выбора страны в фильтре
phonecatApp.controller('CountrySelectCtrl', function($scope){
    var options = ['', 'Страна_1', 'Страна_2'];
    $scope.country_combobox = [
        {'id': '0', 'options': options}
    ];
    $scope.country_id = 0;

    // Добавление поля ввода страны в фильтр
    $scope.add_country = function(){
        $scope.country_id++;
        var newItem = {'id': $scope.country_id, 'options': options};
        $scope.country_combobox.push(newItem);
    }
});

// Инициализация полей выбора региона в фильтре
phonecatApp.controller('RegionSelectCtrl', function($scope){
    var options = ['', 'Регион_1', 'Регион_2'];
    $scope.region_combobox = [
        {'id': '0', 'options': options}
    ];
    $scope.region_id = 0;

    // Добавление поля ввода региона в фильтр
    $scope.add_region = function() {
        $scope.region_id++;
        var newItem = {'id': $scope.region_id, 'options': options};
        $scope.region_combobox.push(newItem);
    }
});

// Инициализация полей выбора города в фильтре
phonecatApp.controller('CitySelectCtrl', function($scope){
    var options = ['', 'Город_1', 'Город_2'];
    $scope.city_combobox = [
        {'id': '0', 'options': options}
    ];
    $scope.city_id = 0;

    // Добавление поля ввода города в фильтр
    $scope.add_city = function() {
        $scope.city_id++;
        var newItem = {'id': $scope.city_id, 'options': options};
        $scope.city_combobox.push(newItem);
    }
});
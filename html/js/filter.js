
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

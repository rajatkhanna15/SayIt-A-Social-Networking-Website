$(function()
{
	$('.search').keyup(function()
	{
		var search = $(this).val();
		$.post('http://localhost/php projects/SayIt/core/ajax/search.php', {search:search}, function(data)
		{
			$('.search-result').html(data);
		});
	});

});
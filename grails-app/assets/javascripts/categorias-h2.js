storageEngine = function() {
	var initialized = false;
	return {
		init : function(successCallback, errorCallback) {
			initialized = true;
			successCallback(null);
		},
		save : function(type, obj, successCallback, errorCallback) {
			console.log(obj);
			$.ajax({
				method: "post", 
				url: "categoria/save", 
				data: obj
			})
			.done(function( msg ){
				successCallback(obj);
			});
		},
		findAll : function(type, successCallback, errorCallback) {
			var aCategorias = [];
			$.ajax({method: 'GET', dataType: "JSON", url: "categoria/list", 
					success: function (data) {
						var categorias = [];
						$.each(data, function(k, v){
							categorias.push(v);
						});
						successCallback(categorias);
					}
				});
		},
		delete : function(type, id, successCallback, errorCallback) {
			$.ajax({method: 'DELETE', dataType: 'JSON', url: 'categoria/delete/'+id});
			successCallback(id);
		},
		countCategorias : function (successCallback, errorCallback){
			$.ajax({method: 'GET', dataType: 'JSON', url: 'categoria/countCategorias', success: function(data){
				successCallback(data);
			}});
		},
		findById : function (type, id, successCallback, errorCallback) {
			$.ajax({method: 'GET', dataType: 'JSON', url: 'categoria/getById/'+id, success: function(categoria){
				successCallback(categoria);
			}});
		}
	}
}();


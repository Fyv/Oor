package com.oor.tl.tools

class ToolsTagLib {

	def editInPlace = {attrs, body ->
		def id = attrs.remove('id')
		def initialVal = attrs.remove('initialValue')
	 
		out << "<span id='${id}' class='editInline'>"
		out << initialVal
		out << "</span>"
	 
		out << "<script type='text/javascript'>"
		out << "new Ajax.InPlaceEditor('${id}', '"
	 
		// id has alread been removed from attrs map
		out << createLink(action: attrs.action, id: id, controller: attrs.controller)
	 
		out << "',{"
	 
		if (attrs.paramName) {
		  out << "callback: function(form,value) { return '${attrs.paramName}=' + encodeURIComponent(value) }  "
		}
		out << "}); "
		out << "</script>"
	  }
}

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="EDC2015_Trabalho1.JSON._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="page-header">
  <div class="row">
    <div class="col-lg-12">
      <h1 id="buttons">Book Authors</h1>
    </div>
  </div>
</div>
<div style="font-size: 13px">
  Sort by:
  <div class="btn-group">
    <a href="#" class="btn btn-primary btn-xs">Name (A-Z)</a>
    <a href="#" class="btn btn-primary btn-xs dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></a>
    <ul class="dropdown-menu">
      <li><a href="#">Action</a></li>
      <li><a href="#">Another action</a></li>
      <li><a href="#">Something else here</a></li>
    </ul>
  </div>
</div>
<div id="demo">
</div>
<style>
.circle {
  width: 70px;
  height: 70px;
  border-radius: 50%;
  font-size: 25px;
  color: #fff;
  line-height: 70px;
  text-align: center;
  background: #000;
}
</style>
<script>

var myUrl = "http://192.168.160.36/JSON/getAuthors.aspx";
$.ajax({
  type: "GET",
  url: myUrl,
  data: { numAuthors: 8 },
  dataType: "jsonp",
  success: processArray,
  error: function (xhr, status, err) {
  }
});
function processArray(arr) {
  var result = JSON.stringify(arr, null, 4).split("\n").join("<br/>");
  result = result.split(" ").join("&nbsp;");

  var out = "<div class=\"row\">";
  var i;
  for (i = 0; i < arr.length; i++) {
    out += "<div class=\"col-lg-4\"><div class=\"panel-body\"><div class=\"panel panel-default\"><div class=\"panel-body\"><div class=\"row\"><div class=\"col-lg-4\"><div class=\"bs-container\">" +
    "<div  class=\"circle\">";
    var name = arr[i].name.match(/[A-Z][a-z]+/g);
    out += name[0][0] + name[1][0] + "</div><div><p></p><p style=\"font-size:13px\">" +
    arr[i].ID + '</p></div></div></div><div class=\"col-lg-8\"><div class=\"bs-container\"><h4>' +
    arr[i].name + '</h4><p><h5>' +
    arr[i].address + '</h5></p><p><h5>' +
    arr[i].city + ', ' +
    arr[i].state + ' ' +
    arr[i].zip + '</h5></p><p style=\"font-size:13px\"><i class=\"fa fa-phone\"></i> ' +
    arr[i].phone + '</p><p><a href=\"/JSON/sales?author_ID=' + arr[i].ID + '\" class=\"btn btn-primary\">Sales</a><a href=\"/JSON/book?author_ID=' + arr[i].ID + '\" class=\"btn btn-primary\">Books</a></p></div></div></div></div></div></div></div>';
    if ((i + 1) % 3 == 0) {
      out += "</div><div class=\"row\">";
    }
  }
  out += "</div>";
  document.getElementById("demo").innerHTML = out;
}

</script>
</asp:Content>

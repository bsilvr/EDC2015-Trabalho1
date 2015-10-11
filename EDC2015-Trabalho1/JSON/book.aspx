<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="book.aspx.cs" Inherits="EDC2015_Trabalho1.JSON.book" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div style="clear: both">
  <p></p>
  <hr />
  <h1>Book Sales <small>(by <i id="auth_name"></i>)</small></h1>
  <h5><a href="default"><i class="fa fa-backward"></i>  Back to Authors</a></h5>
  <hr/>
</div>
<div style="font-size: 13px">
  Sort by:
  <div class="btn-group">
    <a href="#" class="btn btn-primary btn-xs" onclick="sortAZ();">Name (A-Z)</a>
    <a href="#" class="btn btn-primary btn-xs dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></a>
    <ul class="dropdown-menu">
      <li><a href="#" onclick="sortZA();">Name (Z-A)</a></li>

    </ul>
  </div>
</div>
<div id="demo">
</div>

<script>
var array;

var myParam = location.search.split('author_ID=')[1];
console.log(myParam);
if (myParam === undefined) {
  myParam = "213-46-8915";
}
console.log(myParam);

var myUrl = "http://192.168.160.36/JSON/getAuthorTitles.aspx";
$.ajax({
  type: "GET",
  url: myUrl,
  data: { author_ID: myParam },
  dataType: "jsonp",
  success: processArray,
  error: function (xhr, status, err) {
  }
});

var userNameURL = "http://192.168.160.36/JSON/getAuthors.aspx";
$.ajax({
  type: "GET",
  url: userNameURL,
  data: { numAuthors: 8 },
  dataType: "jsonp",
  success: processUser,
  error: function (xhr, status, err) {
  }
});

function processArray(arr) {
  array = arr;
  var result = JSON.stringify(arr, null, 4).split("\n").join("<br/>");
  result = result.split(" ").join("&nbsp;");

  drawTable(arr);
}

function processUser(arr) {
  var result = JSON.stringify(arr, null, 4).split("\n").join("<br/>");
  result = result.split(" ").join("&nbsp;");
  var i;
  for (i = 0; i < arr.length; i++) {
    if (arr[i].ID == myParam) {
      document.getElementById("auth_name").innerHTML = arr[i].name;
      return;
    }
  }
}

function sortAZ() {
  arr = array;
  var result = JSON.stringify(arr, null, 4).split("\n").join("<br/>");
  result = result.split(" ").join("&nbsp;");

  arr.sort(function (a, b) {
    return a.title.localeCompare(b.title);
  });

  drawTable(arr);
}

function sortZA() {
  arr = array;
  var result = JSON.stringify(arr, null, 4).split("\n").join("<br/>");
  result = result.split(" ").join("&nbsp;");

  arr.sort(function (a, b) {
    return b.title.localeCompare(a.title);
  });

  drawTable(arr);
}

function drawTable(arr) {
  var out = "<table class=\"table table-striped table-bordered table-condensed\"><tr><th>Title</th><th>Authors</th><th>Type</th><th>Price</th><th>Sold qty.</th><th>Notes</th><th>Pub. date</th></tr>";
  var i;
  for (i = 0; i < arr.length; i++) {

    out += "<tr><td><i class=\"fa fa-book\"></i> " + arr[i].title + "</td><td>";
    for (var j = 0; j < arr[i].authors.length; j++) {
      out += "<i class=\"fa fa-user\"></i> " + arr[i].authors[j] + "<br>"
    }
    out += "</td><td>" + arr[i].type + "</td>"
    + "<td>" + arr[i].price + "</td>"
    + "<td>" + arr[i].ytd_sales + "</td>"
    + "<td>" + arr[i].notes + "</td>"
    + "<td>" + arr[i].pubdate.split(' ')[0] + "</td>"
    + "</tr>";

    out += "</td></tr>";
  }
  out += "</table>";
  document.getElementById("demo").innerHTML = out;
}

</script>
<style>
table{
  table-layout: fixed;
  width: 100%;
}
</style>


</asp:Content>

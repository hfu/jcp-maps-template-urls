require 'open-uri'
require 'json'

print <<-EOS
<!doctype html>
<html>
<head>
<title>jcp-maps-template-urls</title>
</head>
<body>
<h1>jcp-maps-template-urls</h1>
<table border='1'>
<thead>
<tr>
  <th>name</th><th>attribution</th><th>template URL</th>
  <th>minZoom</th><th>maxZoom</th><th>center</th><th>bounds</th>
</tr>
</thead>
<tbody>
EOS
open('https://github.com/tilemapjp/jcp_maps/raw/master/tilejson.list').each_line {|l|
  begin
    json = JSON.parse(open(l.strip).read)
  rescue
    next
  end
  print <<-EOS
<tr>
  <td>#{json[:name.to_s]}</td>
  <td>#{json[:attribution.to_s]}</td>
  <td>#{json[:tiles.to_s][0]}</td>
  <td>#{json[:minzoom.to_s]}</td>
  <td>#{json[:maxzoom.to_s]}</td>
  <td>#{json[:center.to_s]}</td>
  <td>#{json[:bounds.to_s]}</td>
</tr>
  EOS
}
print <<-EOS
</tbody>
</table>
</body>
</html>
EOS

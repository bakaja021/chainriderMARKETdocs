require 'nokogiri'

def toc_data(page_content)
  html_doc = Nokogiri::HTML::DocumentFragment.parse(page_content)

  # get a flat list of headers
  headers = []
  html_doc.css('h1, h2, h3').each do |header|
    headers.push({
      id: header.attribute('id').to_s,
      content: header.children,
      level: header.name[1].to_i,
      children: []
    })
  end

  [3,2].each do |header_level|
    header_to_nest = nil
    headers = headers.reject do |header|
      if header[:level] == header_level
        header_to_nest[:children].push header if header_to_nest
        true
      else
        header_to_nest = header if header[:level] < header_level
        false
      end
    end
  end
  headers
end

def data_parse(page_content)
  html_doc = Nokogiri::HTML::DocumentFragment.parse(page_content)
  return page_content.gsub(/<\/p>(.*)(\n)*(.*)<blockquote>/,"</p></div><div class='code'><blockquote>").gsub(/<\/table>(.*)(\n)*(.*)<blockquote>/,"</table></div><div class='code'><blockquote>").gsub(/<\/pre><\/div><div class="code"><blockquote>/,"</pre><blockquote>").gsub(/<\/table>(.*)(\n)*(.*)<h1/,"</table></div></div><div class='section'><div class='description'><h1").gsub(/<\/table>(.*)(\n)*(.*)<h2/,"</table></div></div><div class='section'><div class='description'><h2").gsub(/<\/pre>(.*)(\n)*(.*)<h1/,"</pre></div></div><div class='section'><div class='description'><h1").gsub(/<\/pre>(.*)(\n)*(.*)<h2/,"</pre></div></div><div class='section'><div class='description'><h2").concat('</div></div>').prepend('<div class="section"><div class="description shadow">').gsub(/<\/p>(.*)(\n)*<h2/,"</p></div></div><div class='section'><div class='description'><h2")
end


# h2
# h3
# p
# p
# <div class="code">
#   block
#   pre
#   pre
#   pre
# </div>
# h2

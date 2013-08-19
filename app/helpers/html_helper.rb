class HtmlHelper

  def self.nav_bar(title, links, title_pic = nil)
    nav = "<nav class='left-bar'>
            <div class='margins'>
              <div class='site_name'>"
                
    nav += "<img id='title_pic' src='" + title_pic + "' alt="" />" if title_pic

    nav +=      "<h2 id='title_text'><a href='/'>#{title}</a></h2>
              </div>

              <ul>"
    
    links.each { |list| nav << "<li><a href='#{list[:link]}'>#{list[:display]}</a></li>" }
    
    nav += "</ul></div></nav>"
  end

  def self.authenticator(user = nil)
    auth = "<div class='authentication'><ul>"
    
    unless user
    
      auth += "<form action='/sign_in' method='post'>
                 <li><input type='text' name='email' placeholder='Enter email'></li>
                 <li><input type='password' name='password' placeholder='Enter password'></li>
                 <li><input class='button' type='submit' value='Sign In'>
               </form>
               <form action='/sign_up' method='get'>
                 <li><input class='button' type='submit' value='Sign Up'></li>
               </form>"
    else
     
      auth += "<li>Hello, #{ user.name }</li>
               <form action='/sign_out' method='get'>
                 <li><input class='button' type='submit' value='Sign Out'></li>
               </form>"
    end
    
    auth += "</ul></div>"
  end

  def self.paginator(num_elements, base_directory, current_page)
    paginator = "<div class='paginator'>' "
    paginator += "<a class='page_link' href='#{base_directory}/#{current_page}" if current_page ==  1
    paginator += "<a class='page_link' href='#{base_directory}/#{current_page - 1}" unless current_page == 1
    paginator += "'>Previous</a><ol class='page_ol'>"

    num_elements.times do |i|
      paginator += "<li class='page_li'><a class='page_link' href='#{base_directory}/#{current_page + 1}'" 
      paginator += " class='active'" if current_page == i + 1
      paginator += ">" + (i + 1).to_s + "</a></li>"
    end

    paginator += "</ol><a href='#{base_directory}/#{current_page}" if current_page ==  num_elements
    paginator += "</ol><a href='#{base_directory}/#{current_page + 1}" unless current_page == num_elements
    paginator += "'>Next</a></div>"
  end

  def self.listinator(array, attribute, link, link_id)

    listinator = "<ul>"
    array.each do |element|
      listinator += '<li><a href=/' 
      listinator += link + '/' + eval("element." + link_id).to_s
      listinator += '>' + eval("element." + attribute) + '</a></li>'
    end
    listinator += '</ul>'
  end
end
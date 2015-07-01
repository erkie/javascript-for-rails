class @Controller extends View
  events: {}

  setCookie: (name, value, days) =>
    if days
      date = new Date()
      date.setTime date.getTime() + (days * 24 * 60 * 60 * 1000)
      expires = "; expires=" + date.toGMTString()
    else
      expires = ""
    document.cookie = "#{name}=#{value}#{expires}; path=/"

  getCookie: (name) =>
    nameEQ = name + "="
    ca = document.cookie.split(";")
    for c in ca
      while c.charAt(0) == " "
        c = c.substring(1, c.length)
      return c.substring(nameEQ.length, c.length) if c.indexOf(nameEQ) == 0


require 'dotenv/load'
require 'rest-client'
require 'pp'
require 'json'

response = RestClient.post 'https://learn.saylor.org/webservice/rest/server.php', {
  wstoken: ENV['SAYLOR_TOKEN'],
  wsfunction: 'local_wsfunc_get_visible_courses',
  moodlewsrestformat: 'json',
}

data = JSON.parse(response.body)
courseId = data["courses"][0]["id"]

response = RestClient.post 'https://learn.saylor.org/webservice/rest/server.php', {
  wstoken: ENV['SAYLOR_TOKEN'],
  wsfunction: 'core_course_get_contents',
  moodlewsrestformat: 'json',
  courseid: courseId,
}

pp JSON.parse(response.body)

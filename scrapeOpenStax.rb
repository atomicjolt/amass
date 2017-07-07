require 'httparty'
require 'fileutils'

subjects = [
    "Prealgebra",
    "ElementaryAlgebra",
    "IntermediateAlgebra",
    "CollegeAlgebra",
    "AlgebraAndTrigonometry",
    "Precalculus",
    "CalculusVolume1",
    "CalculusVolume2",
    "CalculusVolume3",
    "IntroductoryStatistics",
    "AnatomyAndPhysiology",
    "Astronomy",
    "Biology",
    "Concepts_Biology",
    "Microbiology",
    "Chemistry",
    "ChemistryAtomsFirst",
    "CollegePhysics",
    "UniversityPhysicsVolume1",
    "UniversityPhysicsVolume2",
    "UniversityPhysicsVolume3",
    "AmericanGovernment",
    "PrinciplesofEconomics",
    "PrinciplesofMacroeconomics",
    "PrinciplesofMicroeconomics",
    "Psychology",
    "IntroductiontoSociology2e",
    "U.S_History",
    "CollegePhysicsForAPCourses",
    "PrinciplesofMacroeconomicsforAPCourses",
    "PrinciplesofMicroeconomicsforAPCourses",
]
filepath = "./openstax/"
FileUtils.mkdir_p(filepath)

subjects.each do | topic |
    puts "Fetching " + topic + "-OP.pdf"
    link = "https://d3bxy9euw4e147.cloudfront.net/oscms-prodcms/media/documents/" + topic + "-OP.pdf"
    filename = File.join(filepath, topic + ".pdf")
    File.open(filename, "w") do |file|
        HTTParty.get(link, stream_body: true) do |fragment|
          file.write(fragment)
        end
    end
end

# TODO: Upload scraped files to a location in canvas.
# Since the upload will be largely universal, we should
# decide how to do that later.

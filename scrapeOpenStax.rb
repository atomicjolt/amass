require 'HTTParty'
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

subjects.for_each do | topic |
    link = "https://d3bxy9euw4e147.cloudfront.net/oscms-prodcms/media/documents/" + topic + "-OP.pdf"
    filename = File.join(filepath, topic + ".pdf")
    File.open(filename, "w") do |file|
        HTTParty.get(cdn.original_cdn_url, stream_body: true) do |fragment|
          file.write(fragment)
        end
    end
    File.close(filename)
end

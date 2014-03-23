# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
#

skills = [
  {id:1  , name: "Athletics"    }  ,
  {id:2  , name: "Burglary"    }  ,
  {id:3  , name: "Contacts"    }  ,
  {id:4  , name: "Crafts"      }  ,
  {id:5  , name: "Deceive"     }  ,
  {id:6  , name: "Drive"       }  ,
  {id:7  , name: "Empathy"     }  ,
  {id:8  , name: "Fight"       }  ,
  {id:9  , name: "Investigate" }  ,
  {id:10 , name: "Lore"        }  ,
  {id:11 , name: "Notice"      }  ,
  {id:12 , name: "Physique"    }  ,
  {id:13 , name: "Provoke"     }  ,
  {id:14 , name: "Rapport"     }  ,
  {id:15 , name: "Resources"   }  ,
  {id:16 , name: "Shoot"       }  ,
  {id:17 , name: "Stealth"     }  ,
  {id:18 , name: "Will"        }
]

skills.each do |skill|
  Skill.create skill
end

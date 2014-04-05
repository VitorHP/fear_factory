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
  { name: "Athletics"   }  ,
  { name: "Burglary"    }  ,
  { name: "Contacts"    }  ,
  { name: "Crafts"      }  ,
  { name: "Deceive"     }  ,
  { name: "Drive"       }  ,
  { name: "Empathy"     }  ,
  { name: "Fight"       }  ,
  { name: "Investigate" }  ,
  { name: "Lore"        }  ,
  { name: "Notice"      }  ,
  { name: "Physique"    }  ,
  { name: "Provoke"     }  ,
  { name: "Rapport"     }  ,
  { name: "Resources"   }  ,
  { name: "Shoot"       }  ,
  { name: "Stealth"     }  ,
  { name: "Will"        }
]

skills.each do |skill|
  Skill.create skill
end

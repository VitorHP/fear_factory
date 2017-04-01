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

skill_groups = [
  { name: "Physical Attributes", id: 1 },
  { name: "Mental Attributes", id: 2 },
  { name: "Social Attributes", id: 3 },

  { name: "Physical Skills", id: 4 },
  { name: "Mental Skills", id: 5 },
  { name: "Social Skills", id: 6 },

  { name: "Physical Merits", id: 7 },
  { name: "Mental Merits", id: 8 },
  { name: "Social Merits", id: 9 },

  { name: "Vitalidade", id: 10 },
  { name: "Força de Vontade", id: 11 },
  { name: "Moralidade", id: 12 },
]

skill_groups.each do |s|
  SkillGroup.create(s)
end

skills = [
  { name: "Inteligência", skill_group_id: 1      }  ,
  { name: "Raciocínio", skill_group_id: 1     }  ,
  { name: "Perseverança", skill_group_id: 1       }  ,

  { name: "Força", skill_group_id: 2   }  ,
  { name: "Destreza", skill_group_id: 2    }  ,
  { name: "Vigor", skill_group_id: 2    }  ,

  { name: "Presença", skill_group_id: 3     }  ,
  { name: "Manipulação", skill_group_id: 3       }  ,
  { name: "Autocontrole", skill_group_id: 3       }  ,

  { name: "Ciências", skill_group_id: 4   }  ,
  { name: "Erudição", skill_group_id: 4    }  ,
  { name: "Informática", skill_group_id: 4    }  ,
  { name: "Investigação", skill_group_id: 4      }  ,
  { name: "Medicina", skill_group_id: 4     }  ,
  { name: "Ocultismo", skill_group_id: 4       }  ,
  { name: "Ofícios", skill_group_id: 4     }  ,
  { name: "Política", skill_group_id: 4       }  ,

  { name: "Armamento", skill_group_id: 5 }  ,
  { name: "Armas de Fogo", skill_group_id: 5        }  ,
  { name: "Briga", skill_group_id: 5      }  ,
  { name: "Condução", skill_group_id: 5    }  ,
  { name: "Dissimulação", skill_group_id: 5     }  ,
  { name: "Esportes", skill_group_id: 5     }  ,
  { name: "Furto", skill_group_id: 5   }  ,
  { name: "Sobrevivência", skill_group_id: 5       }  ,

  { name: "Astúcia", skill_group_id: 6     }  ,
  { name: "Empatia", skill_group_id: 6        },
  { name: "Expressão", skill_group_id: 6     }  ,
  { name: "Intimidação", skill_group_id: 6     }  ,
  { name: "Manha", skill_group_id: 6   }  ,
  { name: "Persuasão", skill_group_id: 6       }  ,
  { name: "Socialização", skill_group_id: 6   }  ,
  { name: "Trato com Animais", skill_group_id: 6       }  ,

  { name: "Ambidestria", skill_group_id: 7 },
  { name: "Conhecimento Enciclopédico", skill_group_id: 7 },
  { name: "Consciência Holística", skill_group_id: 7 },
  { name: "Idiomas", skill_group_id: 7 },
  { name: "Memória Eidética", skill_group_id: 7 },
  { name: "Mente Meditativa", skill_group_id: 7 },
  { name: "Senso do Perigo", skill_group_id: 7 },
  { name: "Sexto Sentido", skill_group_id: 7 },

  { name: "Ás do Volante", skill_group_id: 8 },
  { name: "Costas Fortes", skill_group_id: 8 },
  { name: "Desarme", skill_group_id: 8 },
  { name: "Esquiva [Armamento]", skill_group_id: 8 },
  { name: "Esquiva [Briga]", skill_group_id: 8 },
  { name: "Estilo de Luta", skill_group_id: 8 },
  { name: "Estômago de Avestruz", skill_group_id: 8 },
  { name: "Gigante", skill_group_id: 8 },
  { name: "Imunidade Natural", skill_group_id: 8 },
  { name: "Ligeiro", skill_group_id: 8 },
  { name: "Pistoleiro", skill_group_id: 8 },
  { name: "Pulmões Fortes", skill_group_id: 8 },
  { name: "Recuperação Rápida", skill_group_id: 8 },
  { name: "Refinamento em Combate", skill_group_id: 8 },
  { name: "Refléxos Rápidos", skill_group_id: 8 },
  { name: "Resistência a Toxinas", skill_group_id: 8 },
  { name: "Resistência Férrea", skill_group_id: 8 },
  { name: "Saque Rápido", skill_group_id: 8 },
  { name: "Segunda Chance", skill_group_id: 8 },
  { name: "Senso de Direção", skill_group_id: 8 },

  { name: "Aliados", skill_group_id: 9 },
  { name: "Aparência Surpreendente", skill_group_id: 9 },
  { name: "Contatos", skill_group_id: 9 },
  { name: "Fama", skill_group_id: 9 },
  { name: "Fonte de Inspiração", skill_group_id: 9 },
  { name: "Habitué", skill_group_id: 9 },
  { name: "Mentor", skill_group_id: 9 },
  { name: "Recursos", skill_group_id: 9 },
  { name: "Servidor", skill_group_id: 9 },
  { name: "Status", skill_group_id: 9 },

  { name: "Vitalidade", skill_group_id: 10 },
  { name: "Força de Vontade", skill_group_id: 11 },
  { name: "Moralidade", skill_group_id: 12 },
]

skills.each do |skill|
  Skill.create skill
end

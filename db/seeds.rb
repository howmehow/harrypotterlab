require("pry")
require_relative("../models/student")
require_relative("../models/house")
Student.delete_all()
House.delete_all()

house1= House.new({
      "name" => "Gryffindor",
      "logo" => "https://qph.fs.quoracdn.net/main-qimg-ddbc05ae2751f87c0dc7bce395f54cfb.webp"
      })
house2= House.new({
      "name" => "Ravenclaw",
      "logo" => "https://qph.fs.quoracdn.net/main-qimg-6052ac0c436d7443e020b724a8c5d68d"
    })
house3= House.new({
        "name" => "Hufflepuff",
        "logo" => "https://qph.fs.quoracdn.net/main-qimg-7bedce91102be52d31263ce3e05bc960"
        })
house4= House.new({
        "name" => "Slytherin",
        "logo" => "https://qph.fs.quoracdn.net/main-qimg-311ab1c87b937a9059d3d8b87dbfe14a"
        })
house5= House.new({
        "name" => "CodeClan",
        "logo" => "https://www.talentscotland.com/~/media/talentscotland/companyfiles/codeclan/codeclan.jpg?h=179&la=en&mw=240&w=200"
        })

house1.save()
house2.save()
house3.save()
house4.save()
house5.save()

student1 = Student.new({
  "first_name" => "Harry",
  "second_name" => "Potter",
  "house_id" => house1.id,
  "age" => 13
  })
student1.save()
student2 = Student.new({
  "first_name" => "Hermione",
  "second_name" => "Granger",
  "house_id" => house1.id,
  "age" => 12
  })
student2.save()
student3 = Student.new({
  "first_name" => "Ron",
  "second_name" => "Weasley",
  "house_id" => house2.id,
  "age" => 14
  })
student3.save()



binding.pry
nil

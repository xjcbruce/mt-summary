# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Person.delete_all
MagicParam.delete_all
Record.delete_all
RecordDetail.delete_all
RateAssignment.delete_all

MagicParam.create!(
    subject_normal_weight: 1.0,
    subject_special_weight: 1.2,
    subject_growup_weight: 0.5,

    rater_boss_weight: 1.5,
    rater_manager_weight: 1.2,
    rater_mate_weight: 1.0,

    point_five_weight: 1.0,
    point_four_weight: 0.8,
    point_three_weight: 0.5,
    point_two_weight: 0.2,
    point_one_weight: 0,

    given_five_point: 20,
    given_four_point: 15,
    given_three_point: 10,
    given_two_point: 5,
    given_one_point: 0,

    level_one_weight: 0.80,
    level_two_weight: 0.85,
    level_three_weight: 0.90,
    level_four_weight: 0.95,
    level_five_weight: 1.00,
    level_six_weight: 1.05
)

#####################

Person.create!(name: "杨宇波", department: :prdanddev, title: :manager, salary: 20000)

Person.create!(name: "余燕华", department: :uidesign, title: :manager, salary: 10000)
Person.create!(name: "孙毅", department: :appdev, title: :manager, salary: 15600)
Person.create!(name: "蒋成波", department: :serverdev, title: :manager, salary: 14000)
Person.create!(name: "樊勇建", department: :pm, title: :manager, salary: 9000)

Person.create!(name: "王雨乔", department: :uidesign, title: :staff, salary: 6000)
Person.create!(name: "吴亚蓉", department: :uidesign, title: :staff, salary: 7500)

Person.create!(name: "宋伟", department: :appdev, title: :staff, salary: 12000)
Person.create!(name: "庞柏君", department: :appdev, title: :staff, salary: 14400)
Person.create!(name: "谢昌平", department: :appdev, title: :staff, salary: 10200)

Person.create!(name: "杨建中", department: :serverdev, title: :staff, salary: 11000)
Person.create!(name: "钟昆", department: :serverdev, title: :staff, salary: 13000)
Person.create!(name: "陈飞", department: :serverdev, title: :staff, salary: 9500)
Person.create!(name: "宋生洪", department: :serverdev, title: :staff, salary: 6000)
Person.create!(name: "张建", department: :serverdev, title: :staff, salary: 4000)
Person.create!(name: "马果", department: :serverdev, title: :staff, salary: 10000)

Person.create!(name: "王强", department: :pm, title: :staff, salary: 8000)
Person.create!(name: "曹煜", department: :pm, title: :staff, salary: 14000)
Person.create!(name: "张耀", department: :pm, title: :staff, salary: 8000)

#####################

## 主管
RateAssignment.create!(target_person_name: "余燕华", rater_name: "杨宇波", rater_type: :boss)
RateAssignment.create!(target_person_name: "余燕华", rater_name: "孙毅", rater_type: :mate)
RateAssignment.create!(target_person_name: "余燕华", rater_name: "蒋成波", rater_type: :mate)
RateAssignment.create!(target_person_name: "余燕华", rater_name: "樊勇建", rater_type: :mate)

RateAssignment.create!(target_person_name: "孙毅", rater_name: "杨宇波", rater_type: :boss)
RateAssignment.create!(target_person_name: "孙毅", rater_name: "余燕华", rater_type: :mate)
RateAssignment.create!(target_person_name: "孙毅", rater_name: "蒋成波", rater_type: :mate)
RateAssignment.create!(target_person_name: "孙毅", rater_name: "樊勇建", rater_type: :mate)

RateAssignment.create!(target_person_name: "蒋成波", rater_name: "杨宇波", rater_type: :boss)
RateAssignment.create!(target_person_name: "蒋成波", rater_name: "余燕华", rater_type: :mate)
RateAssignment.create!(target_person_name: "蒋成波", rater_name: "孙毅", rater_type: :mate)
RateAssignment.create!(target_person_name: "蒋成波", rater_name: "樊勇建", rater_type: :mate)

RateAssignment.create!(target_person_name: "樊勇建", rater_name: "杨宇波", rater_type: :boss)
RateAssignment.create!(target_person_name: "樊勇建", rater_name: "余燕华", rater_type: :mate)
RateAssignment.create!(target_person_name: "樊勇建", rater_name: "孙毅", rater_type: :mate)
RateAssignment.create!(target_person_name: "樊勇建", rater_name: "蒋成波", rater_type: :mate)

## 设计部
RateAssignment.create!(target_person_name: "王雨乔", rater_name: "余燕华", rater_type: :boss)
RateAssignment.create!(target_person_name: "王雨乔", rater_name: "杨宇波", rater_type: :manager)
RateAssignment.create!(target_person_name: "王雨乔", rater_name: "王强", rater_type: :mate)
RateAssignment.create!(target_person_name: "王雨乔", rater_name: "陈飞", rater_type: :mate)
RateAssignment.create!(target_person_name: "王雨乔", rater_name: "宋伟", rater_type: :mate)

RateAssignment.create!(target_person_name: "吴亚蓉", rater_name: "余燕华", rater_type: :boss)
RateAssignment.create!(target_person_name: "吴亚蓉", rater_name: "孙毅", rater_type: :manager)
RateAssignment.create!(target_person_name: "吴亚蓉", rater_name: "张耀", rater_type: :mate)
RateAssignment.create!(target_person_name: "吴亚蓉", rater_name: "马果", rater_type: :mate)
RateAssignment.create!(target_person_name: "吴亚蓉", rater_name: "谢昌平", rater_type: :mate)

# 客户端开发部
RateAssignment.create!(target_person_name: "宋伟", rater_name: "孙毅", rater_type: :boss)
RateAssignment.create!(target_person_name: "宋伟", rater_name: "杨宇波", rater_type: :manager)
RateAssignment.create!(target_person_name: "宋伟", rater_name: "杨建中", rater_type: :mate)
RateAssignment.create!(target_person_name: "宋伟", rater_name: "张耀", rater_type: :mate)
RateAssignment.create!(target_person_name: "宋伟", rater_name: "吴亚荣", rater_type: :mate)

RateAssignment.create!(target_person_name: "庞柏君", rater_name: "孙毅", rater_type: :boss)
RateAssignment.create!(target_person_name: "庞柏君", rater_name: "余燕华", rater_type: :manager)
RateAssignment.create!(target_person_name: "庞柏君", rater_name: "钟昆", rater_type: :mate)
RateAssignment.create!(target_person_name: "庞柏君", rater_name: "王强", rater_type: :mate)
RateAssignment.create!(target_person_name: "庞柏君", rater_name: "王雨乔", rater_type: :mate)

RateAssignment.create!(target_person_name: "谢昌平", rater_name: "孙毅", rater_type: :boss)
RateAssignment.create!(target_person_name: "谢昌平", rater_name: "樊勇建", rater_type: :manager)
RateAssignment.create!(target_person_name: "谢昌平", rater_name: "杨建中", rater_type: :mate)
RateAssignment.create!(target_person_name: "谢昌平", rater_name: "张耀", rater_type: :mate)
RateAssignment.create!(target_person_name: "谢昌平", rater_name: "吴亚蓉", rater_type: :mate)

# 服务器开发部
RateAssignment.create!(target_person_name: "杨建中", rater_name: "蒋成波", rater_type: :boss)
RateAssignment.create!(target_person_name: "杨建中", rater_name: "孙毅", rater_type: :manager)
RateAssignment.create!(target_person_name: "杨建中", rater_name: "庞柏君", rater_type: :mate)
RateAssignment.create!(target_person_name: "杨建中", rater_name: "陈飞", rater_type: :mate)
RateAssignment.create!(target_person_name: "杨建中", rater_name: "张建", rater_type: :mate)

RateAssignment.create!(target_person_name: "钟昆", rater_name: "蒋成波", rater_type: :boss)
RateAssignment.create!(target_person_name: "钟昆", rater_name: "杨宇波", rater_type: :manager)
RateAssignment.create!(target_person_name: "钟昆", rater_name: "曹煜", rater_type: :mate)
RateAssignment.create!(target_person_name: "钟昆", rater_name: "杨建中", rater_type: :mate)
RateAssignment.create!(target_person_name: "钟昆", rater_name: "宋生洪", rater_type: :mate)

RateAssignment.create!(target_person_name: "陈飞", rater_name: "蒋成波", rater_type: :boss)
RateAssignment.create!(target_person_name: "陈飞", rater_name: "樊勇建", rater_type: :manager)
RateAssignment.create!(target_person_name: "陈飞", rater_name: "王强", rater_type: :mate)
RateAssignment.create!(target_person_name: "陈飞", rater_name: "庞柏君", rater_type: :mate)
RateAssignment.create!(target_person_name: "陈飞", rater_name: "马果", rater_type: :mate)

RateAssignment.create!(target_person_name: "宋生洪", rater_name: "蒋成波", rater_type: :boss)
RateAssignment.create!(target_person_name: "宋生洪", rater_name: "杨宇波", rater_type: :manager)
RateAssignment.create!(target_person_name: "宋生洪", rater_name: "谢昌平", rater_type: :mate)
RateAssignment.create!(target_person_name: "宋生洪", rater_name: "杨建中", rater_type: :mate)
RateAssignment.create!(target_person_name: "宋生洪", rater_name: "张建", rater_type: :mate)

RateAssignment.create!(target_person_name: "张建", rater_name: "蒋成波", rater_type: :boss)
RateAssignment.create!(target_person_name: "张建", rater_name: "樊勇建", rater_type: :manager)
RateAssignment.create!(target_person_name: "张建", rater_name: "庞柏君", rater_type: :mate)
RateAssignment.create!(target_person_name: "张建", rater_name: "钟昆", rater_type: :mate)
RateAssignment.create!(target_person_name: "张建", rater_name: "宋生洪", rater_type: :mate)

RateAssignment.create!(target_person_name: "马果", rater_name: "蒋成波", rater_type: :boss)
RateAssignment.create!(target_person_name: "马果", rater_name: "余燕华", rater_type: :manager)
RateAssignment.create!(target_person_name: "马果", rater_name: "曹煜", rater_type: :mate)
RateAssignment.create!(target_person_name: "马果", rater_name: "宋伟", rater_type: :mate)
RateAssignment.create!(target_person_name: "马果", rater_name: "钟昆", rater_type: :mate)

# 产品质量和运营部

RateAssignment.create!(target_person_name: "王强", rater_name: "樊勇建", rater_type: :boss)
RateAssignment.create!(target_person_name: "王强", rater_name: "杨宇波", rater_type: :manager)
RateAssignment.create!(target_person_name: "王强", rater_name: "孙毅", rater_type: :mate)
RateAssignment.create!(target_person_name: "王强", rater_name: "陈飞", rater_type: :mate)
RateAssignment.create!(target_person_name: "王强", rater_name: "吴亚蓉", rater_type: :mate)

RateAssignment.create!(target_person_name: "曹煜", rater_name: "樊勇建", rater_type: :boss)
RateAssignment.create!(target_person_name: "曹煜", rater_name: "杨宇波", rater_type: :manager)
RateAssignment.create!(target_person_name: "曹煜", rater_name: "蒋成波", rater_type: :mate)
RateAssignment.create!(target_person_name: "曹煜", rater_name: "马果", rater_type: :mate)
RateAssignment.create!(target_person_name: "曹煜", rater_name: "杨建中", rater_type: :mate)

RateAssignment.create!(target_person_name: "张耀", rater_name: "樊勇建", rater_type: :boss)
RateAssignment.create!(target_person_name: "张耀", rater_name: "杨宇波", rater_type: :manager)
RateAssignment.create!(target_person_name: "张耀", rater_name: "余燕华", rater_type: :mate)
RateAssignment.create!(target_person_name: "张耀", rater_name: "庞柏君", rater_type: :mate)
RateAssignment.create!(target_person_name: "张耀", rater_name: "王雨乔", rater_type: :mate)

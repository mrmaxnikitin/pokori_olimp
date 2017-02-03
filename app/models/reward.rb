class Reward < ActiveRecord::Base
  belongs_to :contest
  belongs_to :user

  def diploma_number1(position, prize, diploma_number)
    dnum = rand(100)
    image = MiniMagick::Image.open("./public/original_diplomas/#{diploma_number}.jpg")

    subject = ""
    if self.contest_id == 1
      subject = "по русскому языку"
    elsif self.contest_id == 2
      subject = "по математике"
    elsif self.contest_id == 3
      subject = "по окружающему миру"
    elsif self.contest_id == 4
      subject = "по литературе"
    end

    institution = self.institution
    if institution.size > 44
      institution_44 = institution[0, 44]
      index_inst = institution_44.rindex(" ")
      fp_institution = institution[0, index_inst]
      sp_institution = institution[index_inst+1, institution.size]
    end

    image.resize "1654x2339"
    image.format "jpg"
    image.combine_options do |c|
      c.gravity 'NorthWest'
      c.fill '#383838'
      c.pointsize '102'
      c.draw "text 505,700 '#{prize}'"

      c.fill '#383838'
      c.pointsize '52'
      c.draw "text 505,#{position} 'Награждается'"
      c.pointsize '82'
      c.draw "text 505,#{position+90} '#{self.name}'"
      c.pointsize '43'
      c.draw "text 505,#{position+240} '#{self.age}'"
      c.pointsize '43'
      if institution.size > 44
        c.draw "text 0,#{position+320} '#{fp_institution}'"
        c.draw "text 0,#{position+400} '#{sp_institution}'"
      else
        c.draw "text 0,#{position+320} '#{institution}'"
      end
      c.pointsize '43'
      if self.prize != 0
        c.draw "text 0,#{position+480} 'за победу во Всероссийской олимпиаде'"
      else
        c.draw "text 0,#{position+480} 'за участие во Всероссийской олимпиаде'"
      end
      c.pointsize '43'
      c.draw "text 0,#{position+560} '#{subject}'"
      c.pointsize '30'
      c.draw "text 767,1650 '#{Russian::strftime(self.created_at, "%d.%m.%Y г.")}'"
      c.pointsize '26'
      if diploma_number == 10
        c.fill '#ffffff'
      end
      c.draw "text 840,2260 '№ П-#{self.id}'"
    end
    output_diploma = "./public/diplomas/diploma#{dnum}.jpg"
    image.write output_diploma
    return "/diplomas/diploma#{dnum}.jpg"
  end
end

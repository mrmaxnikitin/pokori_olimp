class Reward < ActiveRecord::Base
  belongs_to :contest
  belongs_to :user

  def diploma_number1(position, prize)
    
  	image = MiniMagick::Image.open("./public/original_diplomas/1.jpg")
    image.resize "1654x2339"
    image.format "jpg"
    image.combine_options do |c|
      c.gravity 'North'
      c.fill '#f37a1f'
      c.pointsize '102'
      c.draw "text 0,600 '#{prize}'"

      c.fill '#383838'
      c.pointsize '62'
      c.draw "text 0,#{position} 'Награждается'"
      c.pointsize '92'
      c.draw "text 0,#{position+90} '#{self.name}'"
      c.pointsize '50'
      c.draw "text 0,#{position+240} '#{self.age}'"
      c.pointsize '50'
      c.draw "text 0,#{position+320} '#{self.institution}'"
      c.pointsize '50'
      c.draw "text 0,#{position+400} 'за победу во Всероссийской олимпиаде'"
      c.pointsize '50'
      c.draw "text 0,#{position+480} 'по русскому языку'"
      c.pointsize '40'
      c.draw "text -153,1650 '#{Russian::strftime(self.created_at, "%d.%m.%Y г.")}'"
      c.pointsize '36'
      c.draw "text 0,2190 '№ #{self.id}'"
    end
    image.write "./public/diplomas/diploma.jpg"
  end

  def diploma_number2(position, prize)
  	image = MiniMagick::Image.open("./public/original_diplomas/2.jpg")
    image.resize "1654x2339"
    image.format "jpg"
    image.combine_options do |c|
      c.gravity 'North'
      c.fill '#ff1e4a'
      c.pointsize '102'
      c.draw "text 0,500 '#{prize}'"

      c.fill '#383838'
      c.pointsize '62'
      c.draw "text 0,#{position} 'Награждается'"
      c.pointsize '92'
      c.draw "text 0,#{position+90} '#{self.name}'"
      c.pointsize '50'
      c.draw "text 0,#{position+240} '#{self.age}'"
      c.pointsize '50'
      c.draw "text 0,#{position+320} '#{self.institution}'"
      c.pointsize '50'
      c.draw "text 0,#{position+400} 'за победу во Всероссийской олимпиаде'"
      c.pointsize '50'
      c.draw "text 0,#{position+480} 'по русскому языку'"
      c.pointsize '40'
      c.draw "text 60,1740 '#{Russian::strftime(self.created_at, "%d.%m.%Y г.")}'"
      c.pointsize '36'
      c.draw "text 0,2190 '№ #{self.id}'"
    end
    image.write "./public/diplomas/diploma.jpg"
  end

  def diploma_number3(position, prize)
  	image = MiniMagick::Image.open("./public/original_diplomas/3.jpg")
    image.resize "1654x2339"
    image.format "jpg"
    image.combine_options do |c|
      c.gravity 'North'
      c.fill '#0096cc'
      c.pointsize '102'
      c.draw "text 0,580 '#{prize}'"

      c.fill '#383838'
      c.pointsize '62'
      c.draw "text 0,#{position} 'Награждается'"
      c.pointsize '92'
      c.draw "text 0,#{position+90} '#{self.name}'"
      c.pointsize '50'
      c.draw "text 0,#{position+240} '#{self.age}'"
      c.pointsize '50'
      c.draw "text 0,#{position+320} '#{self.institution}'"
      c.pointsize '50'
      c.draw "text 0,#{position+400} 'за победу во Всероссийской олимпиаде'"
      c.pointsize '50'
      c.draw "text 0,#{position+480} 'по русскому языку'"
      c.pointsize '40'
      c.draw "text 36,1740 '#{Russian::strftime(self.created_at, "%d.%m.%Y г.")}'"
      c.pointsize '36'
      c.draw "text 30,2250 '№ #{self.id}'"
    end
    image.write "./public/diplomas/diploma.jpg"
  end

  def diploma_number4(position, prize)
  	image = MiniMagick::Image.open("./public/original_diplomas/4.jpg")
    image.resize "1654x2339"
    image.format "jpg"
    image.combine_options do |c|
      c.gravity 'North'
      c.fill '#00bdc3'
      c.pointsize '102'
      c.draw "text 0,810 '#{prize}'"

      c.fill '#383838'
      c.pointsize '62'
      c.draw "text 0,#{position} 'Награждается'"
      c.pointsize '92'
      c.draw "text 0,#{position+90} '#{self.name}'"
      c.pointsize '50'
      c.draw "text 0,#{position+240} '#{self.age}'"
      c.pointsize '50'
      c.draw "text 0,#{position+320} '#{self.institution}'"
      c.pointsize '50'
      c.draw "text 0,#{position+400} 'за победу во Всероссийской олимпиаде'"
      c.pointsize '50'
      c.draw "text 0,#{position+480} 'по русскому языку'"
      c.pointsize '40'
      c.draw "text 39,1800 '#{Russian::strftime(self.created_at, "%d.%m.%Y г.")}'"
      c.pointsize '36'
      c.draw "text 0,2190 '№ #{self.id}'"
    end
    image.write "./public/diplomas/diploma.jpg"
  end

  def diploma_number5(position, prize)
  	image = MiniMagick::Image.open("./public/original_diplomas/5.jpg")
    image.resize "1654x2339"
    image.format "jpg"
    image.combine_options do |c|
      c.gravity 'North'
      c.fill '#fc3400'
      c.pointsize '102'
      c.draw "text 0,510 '#{prize}'"

      c.fill '#383838'
      c.pointsize '62'
      c.draw "text 0,#{position} 'Награждается'"
      c.pointsize '92'
      c.draw "text 0,#{position+90} '#{self.name}'"
      c.pointsize '50'
      c.draw "text 0,#{position+240} '#{self.age}'"
      c.pointsize '50'
      c.draw "text 0,#{position+320} '#{self.institution}'"
      c.pointsize '50'
      c.draw "text 0,#{position+400} 'за победу во Всероссийской олимпиаде'"
      c.pointsize '50'
      c.draw "text 0,#{position+480} 'по русскому языку'"
      c.pointsize '40'
      c.draw "text -107,1650 '#{Russian::strftime(self.created_at, "%d.%m.%Y г.")}'"
      c.pointsize '36'
      c.draw "text 0,2190 '№ #{self.id}'"
    end
    image.write "./public/diplomas/diploma.jpg"
  end

  def diploma_number6(position, prize)
  	image = MiniMagick::Image.open("./public/original_diplomas/6.jpg")
    image.resize "1654x2339"
    image.format "jpg"
    image.combine_options do |c|
      c.gravity 'North'
      c.fill '#fc3400'
      c.pointsize '102'
      c.draw "text 0,510 '#{prize}'"

      c.fill '#383838'
      c.pointsize '62'
      c.draw "text 0,#{position} 'Награждается'"
      c.pointsize '92'
      c.draw "text 0,#{position+90} '#{self.name}'"
      c.pointsize '50'
      c.draw "text 0,#{position+240} '#{self.age}'"
      c.pointsize '50'
      c.draw "text 0,#{position+320} '#{self.institution}'"
      c.pointsize '50'
      c.draw "text 0,#{position+400} 'за победу во Всероссийской олимпиаде'"
      c.pointsize '50'
      c.draw "text 0,#{position+480} 'по русскому языку'"
      c.pointsize '40'
      c.draw "text 48,1550 '#{Russian::strftime(self.created_at, "%d.%m.%Y г.")}'"
      c.pointsize '36'
      c.draw "text 0,2250 '№ #{self.id}'"
    end
    image.write "./public/diplomas/diploma.jpg"
  end

  def diploma_number7(position, prize)
  	image = MiniMagick::Image.open("./public/original_diplomas/7.jpg")
    image.resize "1654x2339"
    image.format "jpg"
    image.combine_options do |c|
      c.gravity 'North'
      c.fill '#fc3400'
      c.pointsize '102'
      c.draw "text 0,510 '#{prize}'"

      c.fill '#383838'
      c.pointsize '62'
      c.draw "text 0,#{position} 'Награждается'"
      c.pointsize '92'
      c.draw "text 0,#{position+90} '#{self.name}'"
      c.pointsize '50'
      c.draw "text 0,#{position+240} '#{self.age}'"
      c.pointsize '50'
      c.draw "text 0,#{position+320} '#{self.institution}'"
      c.pointsize '50'
      c.draw "text 0,#{position+400} 'за победу во Всероссийской олимпиаде'"
      c.pointsize '50'
      c.draw "text 0,#{position+480} 'по русскому языку'"
      c.pointsize '40'
      c.draw "text -53,1630 '#{Russian::strftime(self.created_at, "%d.%m.%Y г.")}'"
      c.pointsize '36'
      c.draw "text -20,2110 '№ #{self.id}'"
    end
    image.write "./public/diplomas/diploma.jpg"
  end

  def diploma_number8(position, prize)
  	image = MiniMagick::Image.open("./public/original_diplomas/8.jpg")
    image.resize "1654x2339"
    image.format "jpg"
    image.combine_options do |c|
      c.gravity 'North'
      c.fill '#cf4554'
      c.pointsize '142'
      c.draw "text 0,310 '#{prize}'"

      c.fill '#383838'
      c.pointsize '62'
      c.draw "text 0,#{position} 'Награждается'"
      c.pointsize '92'
      c.draw "text 0,#{position+90} '#{self.name}'"
      c.pointsize '50'
      c.draw "text 0,#{position+240} '#{self.age}'"
      c.pointsize '50'
      c.draw "text 0,#{position+320} '#{self.institution}'"
      c.pointsize '50'
      c.draw "text 0,#{position+400} 'за победу во Всероссийской олимпиаде'"
      c.pointsize '50'
      c.draw "text 0,#{position+480} 'по русскому языку'"
      c.pointsize '40'
      c.draw "text 58,1640 '#{Russian::strftime(self.created_at, "%d.%m.%Y г.")}'"
      c.pointsize '36'
      c.draw "text -20,2265 '№ #{self.id}'"
    end
    image.write "./public/diplomas/diploma.jpg"
  end

  def diploma_number9(position, prize)
  	image = MiniMagick::Image.open("./public/original_diplomas/9.jpg")
    image.resize "1654x2339"
    image.format "jpg"
    image.combine_options do |c|
      c.gravity 'North'
      c.fill '#d42465'
      c.pointsize '142'
      c.draw "text 0,780 '#{prize}'"

      c.fill '#383838'
      c.pointsize '62'
      c.draw "text 0,#{position} 'Награждается'"
      c.pointsize '92'
      c.draw "text 0,#{position+90} '#{self.name}'"
      c.pointsize '50'
      c.draw "text 0,#{position+240} '#{self.age}'"
      c.pointsize '50'
      c.draw "text 0,#{position+320} '#{self.institution}'"
      c.pointsize '50'
      c.draw "text 0,#{position+400} 'за победу во Всероссийской олимпиаде'"
      c.pointsize '50'
      c.draw "text 0,#{position+480} 'по русскому языку'"
      c.pointsize '40'
      c.draw "text -20,1840 '#{Russian::strftime(self.created_at, "%d.%m.%Y г.")}'"
      c.pointsize '36'
      c.draw "text 0,2215 '№ #{self.id}'"
    end
    image.write "./public/diplomas/diploma.jpg"
  end

  def diploma_number10(position, prize)
  	image = MiniMagick::Image.open("./public/original_diplomas/10.jpg")
    image.resize "1654x2339"
    image.format "jpg"
    image.combine_options do |c|
      c.gravity 'North'
      c.fill '#cf4368'
      c.pointsize '122'
      c.draw "text 0,470 '#{prize}'"

      c.fill '#383838'
      c.pointsize '62'
      c.draw "text 0,#{position} 'Награждается'"
      c.pointsize '92'
      c.draw "text 0,#{position+90} '#{self.name}'"
      c.pointsize '50'
      c.draw "text 0,#{position+240} '#{self.age}'"
      c.pointsize '50'
      c.draw "text 0,#{position+320} '#{self.institution}'"
      c.pointsize '50'
      c.draw "text 0,#{position+400} 'за победу во Всероссийской олимпиаде'"
      c.pointsize '50'
      c.draw "text 0,#{position+480} 'по русскому языку'"
      c.pointsize '40'
      c.draw "text -278,1810 '#{Russian::strftime(self.created_at, "%d.%m.%Y г.")}'"
      c.fill '#ffffff'
      c.pointsize '36'
      c.draw "text 0,2291 '№ #{self.id}'"
    end
    image.write "./public/diplomas/diploma.jpg"
  end
end

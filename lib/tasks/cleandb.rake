desc 'Sanitize the DB'
task :clean_db, [:option] => :environment do |t, args|
  option = args['option'] || 'all'

  case option
    when 'keys'
      keys
    when 'ebooks'
      ebooks
    when 'android'
      android
    when 'music'
      music
    when 'drmfree'
      drmfree
    when 'all'
      keys
      android
      music
      drmfree
      ebooks
    else
      puts 'Please enter a proper parameter'
  end
  puts 'DONE!'
end

def keys
  gamekeys = Gamekey.all
  puts 'Keys #' + gamekeys.count.to_s
  gamekeys.each do |a|
    a.key = 'XXXX-XXXX-XXXX-XXXX'
    a.gift_url = 'http://www.gifturl.com'
    a.save(:validate => false)
  end
end

def ebooks
  ebooks = Ebook.all
  puts 'Ebooks# ' + ebooks.count.to_s
  ebooks.each do |a|
    a.http = 'http://www.gamedllink.here'
    a.bt =  'http://www.gamedllink.here'
    a.md5_hash = 'abcdefghijklmnopqrstuvwxyz1234567890'
    a.save(:validate => false)
  end
end

def android
  androidgames = Androidgame.all
  puts 'Android Games# ' + androidgames.count.to_s
  androidgames.each do |a|
    a.http = 'http://www.gamedllink.here'
    a.bt =  'http://www.gamedllink.here'
    a.md5_hash = 'abcdefghijklmnopqrstuvwxyz1234567890'
    a.save(:validate => false)
  end
end

def drmfree
  drmfreegames = DrmFreeGame.all
  puts 'DRM Free games# ' + drmfreegames.count.to_s
  drmfreegames.each do |a|
    a.http = 'http://www.gamedllink.here'
    a.md5_hash = 'abcdefghijklmnopqrstuvwxyz1234567890'
    a.save(:validate => false)
  end
end

def music
  musictracks = Musictrack.all
  puts 'Music Tracks# ' + musictracks.count.to_s
  musictracks.each do |a|
    a.mp3dllink = 'http://www.gamedllink.here'
    a.flacdllink = 'http://www.gamedllink.here'
    a.http = 'http://www.gamedllink.here'
    a.bt = 'http://www.gamedllink.here'
    a.md5_hash = 'abcdefghijklmnopqrstuvwxyz1234567890'
    a.save(:validate => false)
  end
end
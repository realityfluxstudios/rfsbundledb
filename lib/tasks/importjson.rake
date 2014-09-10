desc 'Import JSON object to database'
task :import_ig, [:file_path] => :environment do |t, args|

  require 'pp'
  json = File.read(args['file_path'])

  hash = ActiveSupport::JSON.decode(json)

  b = Bundle.new
  b.title =  hash['name']
  b.title_slug =  hash['name_slug']
  b.site =  hash['site']
  b.save

  puts b.title.to_s

  hash['games'].each do |game|
    bundle = Bundle.last
    g = Game.new
    g.save

    g.title = game['title']
    g.title_slug = g.id.to_s + '-' + game['title_slug']
    g.drm = game['drm']
    g.store_url = game['store_url']
    g.bundle_id = bundle.id
    g.save
    puts '-' + g.title
    game['keys'].each do |key|
      k = Gamekey.new
      k.key = key['key']
      k.gift_url = key['gift_url']
      k.game_id = g.id
      k.save
    end
    puts '--Key Count: ' + g.gamekeys.count.to_s
  end

  if hash['musictracks'] != nil
    puts '------ MUSIC TRACKS -----'
    hash['musictracks'].each do |musictrack|
      bundle = Bundle.last
      m = Musictrack.new
      m.save

      m.title = musictrack['title']
      m.title_slug = m.id.to_s + '-' + musictrack['title_slug']
      m.dev = musictrack['dev']
      m.dev_slug = musictrack['dev_slug']
      m.mp3dllink = musictrack['mp3dllink']
      m.mp3type = musictrack['mp3type']
      m.flacdllink = musictrack['flacdllink']
      m.flactype = musictrack['flactype']
      m.bundle_id = bundle.id
      m.save
      puts '-' + m.title.to_s
    end
  end

  if hash['drmFreeGames'] != nil
    puts '------ DRM FREE GAMES -----'
    hash['drmFreeGames'].each do |drmfreegame|
      bundle = Bundle.last
      d = DrmFreeGame.new
      d.save

      d.title = drmfreegame['title']
      d.title_slug = d.id.to_s + '-' + drmfreegame['title_slug'] + '-' + drmfreegame['platform'].to_s.downcase
      d.title_slug = d.title_slug.parameterize
      d.platform = drmfreegame['platform']
      d.http = drmfreegame['dllink']
      d.bundle_id = bundle.id
      d.save

      puts '-' + d.title.to_s
    end
  end

  if hash['androidgames'] != nil
    puts '------ ANDROID GAMES -----'
    androidgames = hash['androidgames']
    androidgames.each do |androidgame|
      bundle = Bundle.last
      a = Androidgame.new
      a.save

      a.title = androidgame['title']
      a.title_slug = a.id.to_s + '-' + androidgame['title_slug']
      a.http = androidgame['dllink']
      a.bundle_id = bundle.id
      a.save
      puts '-' + a.title.to_s
    end
  end
end

task :import_hb, [:file_path] => :environment do |t, args|

  require 'pp'
  json = File.read(args['file_path'])

  hash = ActiveSupport::JSON.decode(json)

  b = Bundle.new
  b.title =  hash['title']
  b.title_slug =  hash['title_slug']
  b.site =  hash['site']
  b.save

  puts b.title.to_s
  #puts

  hash['items'].each do |item|
    bundle = Bundle.last
    if !item['keys'].nil?
      g = Game.new
      g.save

      g.title = item['title']
      g.title_slug = g.id.to_s + '-' + item['title_slug']
      g.bundle_id = bundle.id
      g.save
      #puts '-' + g.title.to_s

      item['keys'].each do |key|
        k = Gamekey.new
        k.key = key['key']
        k.gift_url = key['bundle_url']
        k.game_id = g.id
        k.save
        bundle.save
      end
      #puts '--Key Count'
      #puts g.gamekeys.count
      if g.gamekeys.count == 0
        #puts '------------------------------------------------- !!!!! PROBLEM !!!!! -------------------------------------------------'
      end
    elsif !item['platforms'].nil?
      item['platforms'].each do |platform|
        bundle = Bundle.last
        if platform['platform'].to_s == 'Android'
          puts '---------- ANDROID ----------'
          a = Androidgame.new
          a.save

          a.title = item['title']
          a.title_slug = a.id.to_s + '-' + item['title_slug'].to_s.downcase + '-' + platform['type'].to_s.downcase
          a.title_slug = a.title_slug.parameterize
          a.dev = item['developer']
          a.dev_slug = a.dev.parameterize
          a.dev_url = item['url']
          a.icon = item['icon']
          a.format = platform['type'].to_s
          a.size = platform['size']
          a.http = platform['http']
          a.bt = platform['bt']
          a.md5_hash = platform['hash']

          a.bundle_id = bundle.id

          a.save
        elsif platform['platform'] == 'Mac' or platform['platform'] == 'Linux' or platform['platform'] == 'Windows'
          puts '---------- COMPUTER ----------'
          d = DrmFreeGame.new
          d.save

          d.title  = item['title']
          d.title_slug = d.id.to_s + '-' + item['title_slug'].to_s.downcase + '-' + platform['platform'].to_s.downcase + '-' + platform['type'].to_s.downcase
          d.title_slug = d.title_slug.parameterize
          d.dev = item['developer']
          d.dev_slug = d.dev.parameterize
          d.icon = item['icon']
          d.dev_url = item['url']
          d.format = platform['type']
          d.size = platform['size']
          d.platform = platform['platform']
          d.md5_hash = platform['hash']

          d.bundle_id = bundle.id

          puts d.title_slug

          d.save
        elsif platform['platform'].to_s == 'eBook'
          puts '---------- EBOOK ----------'
          e = Ebook.new
          e.save

          e.title = item['title']
          e.title_slug = e.id.to_s + '-' + item['title_slug'].to_s.downcase + '-' + platform['type'].to_s.downcase
          e.title_slug = e.title_slug.parameterize
          e.dev = item['developer']
          e.dev_slug = e.dev.parameterize
          e.format = platform['type']
          e.size = platform['size']
          e.http = platform['http']
          e.bt = platform['bt']
          e.md5_hash = platform['hash']

          e.bundle_id = bundle.id

          e.save
        elsif platform['platform'].to_s == 'Audio'
          puts '---------- AUDIO ----------'
          m = Musictrack.new
          m.save

          m.title = item['title']
          m.title_slug = m.id.to_s + '-' + item['title_slug'].to_s.downcase + '-' + platform['type'].to_s.downcase
          m.dev = item['developer']
          m.dev_slug = m.dev.parameterize
          m.format = platform['type']
          m.size = platform['size']
          m.http = platform['http']
          m.bt = platform['bt']
          m.md5_hash = platform['hash']

          m.bundle_id = bundle.id

          m.save
        end
      end
    end
  end
end

task :import_bs, [:file_path] => :environment do |t, args|

  require 'pp'
  json = File.read(args['file_path'])

  hash = ActiveSupport::JSON.decode(json)

  hash.each do |bundle|
    puts bundle['bundle_name']
    b = Bundle.new
    b.title =  bundle['bundle_name']
    b.title_slug =  bundle['bundle_slug']
    b.site =  bundle['site']
    b.save

    bundle['games'].each do |game|
      bundle = Bundle.last

      g = Game.new
      g.save

      g.title = game['game_name']
      g.title_slug = g.id.to_s + '-' + game['game_slug']
      g.drm = game['drm']
      g.bundle_id = bundle.id
      g.save
      #puts '-' + g.title.to_s

      game['keys'].each do |key|
        k = Gamekey.new
        k.key = key['key']
        k.gift_url = key['orderID']
        k.game_id = g.id
        k.save
        bundle.save
      end
      #puts '--Key Count'
      #puts g.gamekeys.count
      if g.gamekeys.count == 0
        #puts '------------------------------------------------- check this!!!!! -------------------------------------------------'
      end
    end
  end
end
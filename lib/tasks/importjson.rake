desc 'Import IndieGala JSON object to database'
task :import_ig, [:file_path] => :environment do |t, args|

  show = true

  json = File.read(args['file_path'])

  hash = ActiveSupport::JSON.decode(json)

  b = Bundle.new
  b.title_raw = b.title = hash['name']
  b.title_slug_raw = b.title_slug = hash['name_slug']
  b.site =  hash['site']
  b.save

  if show
    puts b.title.to_s
  end

  hash['games'].each do |game|
    bundle = Bundle.last
    g = find_game(game['title_slug']) || Game.new
    if g.title != nil and show
      puts g.title + ' already exists in the database'
    elsif
      g.save
      g.title_raw = g.title = game['title']
      g.title_slug_raw = g.title_slug = g.id.to_s + '-' + game['title_slug']
      g.drm = game['drm']
      g.store_url = game['store_url']
      g.bundle_id = bundle.id
      g.save
      if show
        puts '-' + g.title
      end
      game['keys'].each do |key|
        k = Gamekey.new
        k.key = key['key']
        k.gift_url = key['gift_url']
        k.game_id = g.id
        k.save
      end
      if show
        puts '--Key Count: ' + g.gamekeys.count.to_s
      end
    end
  end

  if hash['musictracks'] != nil
    if show
      puts '------ MUSIC TRACKS -----'
    end

    hash['musictracks'].each do |musictrack|
      bundle = Bundle.last
      m = find_music(musictrack['mp3dllink'], 'ig') || Musictrack.new
      if m.title != nil and show
        puts m.title + ' already exists in the database'
      elsif
        m.save
        m.title_raw = m.title = musictrack['title']
        m.title_slug_raw = m.title_slug = m.id.to_s + '-' + musictrack['title_slug']
        m.dev = musictrack['dev']
        m.dev_slug = musictrack['dev_slug']
        m.mp3dllink = musictrack['mp3dllink']
        m.mp3type = musictrack['mp3type']
        m.flacdllink = musictrack['flacdllink']
        m.flactype = musictrack['flactype']
        m.bundle_id = bundle.id
        m.save
      end
      if show
        puts '-' + m.title.to_s
      end
    end
  end

  if hash['drmFreeGames'] != nil
    if show
      puts '------ DRM FREE GAMES -----'
    end

    hash['drmFreeGames'].each do |drmfreegame|
      bundle = Bundle.last
      d = find_drmfree(drmfreegame['dllink']) || DrmFreeGame.new
      if d.title != nil and show
        puts d.title + ' already exists in the database'
      else
        d.save
        d.title_raw = d.title = drmfreegame['title']
        d.title_slug = d.id.to_s + '-' + drmfreegame['title_slug'] + '-' + drmfreegame['platform'].to_s.downcase
        d.title_slug_raw = d.title_slug = d.title_slug.parameterize
        d.platform = drmfreegame['platform']
        d.http = drmfreegame['dllink']
        d.bundle_id = bundle.id
        d.save
        if show
          puts '-' + d.title.to_s
        end
      end
    end
  end

  if hash['androidgames'] != nil
    if show
      puts '------ ANDROID GAMES -----'
    end
    androidgames = hash['androidgames']
    androidgames.each do |androidgame|
      bundle = Bundle.last
      a = find_androidgame(androidgame['dllink']) || Androidgame.new
      if a.title != nil and show
        puts a.title + ' already exists in the database'
      else
        a.save
        a.title_raw = a.title = androidgame['title']
        a.title_slug_raw = a.title_slug = a.id.to_s + '-' + androidgame['title_slug']
        a.http = androidgame['dllink']
        a.bundle_id = bundle.id
        a.save
        if show
          puts '-' + a.title.to_s
        end
      end
    end
  end
end

desc 'Import Humble Bundle JSON object to database'
task :import_hb, [:file_path] => :environment do |t, args|

  require 'uri'

  show = true

  json = File.read(args['file_path'])

  hash = ActiveSupport::JSON.decode(json)

  b = Bundle.new
  b.title_raw = b.title =  hash['title']
  b.title_slug_raw = b.title_slug =  hash['title_slug']
  b.site =  hash['site']
  b.save

  if show
    puts b.title.to_s
  end

  hash['items'].each do |item|
    bundle = Bundle.last
    if !item['keys'].nil?
      g = Game.new
      g.save

      g.title_raw = g.title = item['title']
      g.title_slug_raw = g.title_slug = g.id.to_s + '-' + item['title_slug']
      g.bundle_id = bundle.id
      g.save

      item['keys'].each do |key|
        k = Gamekey.new
        k.key = key['key']
        k.gift_url = key['bundle_url']
        k.game_id = g.id
        k.save
        bundle.save
      end
      if show
        puts '--Key Count'
        puts g.gamekeys.count
      end
      if g.gamekeys.count == 0 and show
        puts '------------------------------------------------- !!!!! PROBLEM !!!!! -------------------------------------------------'
      end
    elsif !item['platforms'].nil?
      item['platforms'].each do |platform|
        bundle = Bundle.last
        if platform['platform'].to_s == 'Android'
          if show
            puts '---------- ANDROID ----------'
          end
          a = find_androidgame(platform['http']) || Androidgame.new
          if a.title != nil
            if show
              puts 'AndroidGame found. Updating HTTP and BT URLs'
            end
            a.http = platform['http']
            a.bt = platform['bt']
            a.save
          else
            a.save # to get the ID that we prepend to the title slug to ensure uniqueness
            if show
              puts 'New AndroidGame.'
            end
            a.title_raw = a.title = item['title']
            a.title_slug = a.id.to_s + '-' + item['title_slug'].to_s.downcase + '-' + platform['type'].to_s.downcase
            a.title_slug_raw = a.title_slug = a.title_slug.parameterize
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
          end
        elsif platform['platform'] == 'Mac' or platform['platform'] == 'Linux' or platform['platform'] == 'Windows'
          if show
            puts '---------- DRM FREE ----------'
          end
          d = find_drmfree(platform['http']) || DrmFreeGame.new
          if d.title != nil
            if show
              puts 'DrmFreeGame found. Updating HTTP and BT URLs'
            end
            d.http = platform['http']
            d.bt = platform['bt']
            d.save
          else
            d.save # to get the ID that we prepend to the title slug to ensure uniqueness
            if show
              puts 'New DrmFreeGame'
            end
            d.title_raw = d.title  = item['title']
            d.title_slug = d.id.to_s + '-' + item['title_slug'].to_s.downcase + '-' + platform['platform'].to_s.downcase + '-' + platform['type'].to_s.downcase
            d.title_slug_raw = d.title_slug = d.title_slug.parameterize
            d.dev = item['developer']
            d.dev_slug = d.dev.parameterize
            d.icon = item['icon']
            d.dev_url = item['url']
            d.format = platform['type']
            d.size = platform['size']
            d.http = platform['http']
            d.bt = platform['bt']
            d.platform = platform['platform']
            d.md5_hash = platform['hash']
            d.bundle_id = bundle.id
            d.save
          end
          if show
            puts d.title_slug
          end
        elsif platform['platform'].to_s == 'eBook'
          if show
            puts '---------- EBOOK ----------'
          end
          e = find_ebook(platform['http']) || Ebook.new
          if e.title != nil
            if show
              puts 'Ebook found. Updating HTTP and BT URLs'
            end
            e.http = platform['http']
            e.bt = platform['bt']
            e.save
          else
            e.save # to get the ID that we prepend to the title slug to ensure uniqueness
            if show
              puts 'New eBook'
            end
            e.title_raw = e.title = item['title']
            e.title_slug = e.id.to_s + '-' + item['title_slug'].to_s.downcase + '-' + platform['type'].to_s.downcase
            e.title_slug_raw = e.title_slug = e.title_slug.parameterize
            e.dev = item['developer']
            e.dev_slug = e.dev.parameterize
            e.format = platform['format']
            e.size = platform['size']
            e.http = platform['http']
            e.bt = platform['bt']
            e.md5_hash = platform['hash']
            e.bundle_id = bundle.id
            e.save
          end
        elsif platform['platform'].to_s == 'Audio'
          if show
            puts '---------- AUDIO ----------'
          end
          m = find_music(platform['http'], 'hb') || Musictrack.new
          if m.title != nil
            if show
              puts 'Musictrack found. Updating HTTP and BT URLs'
            end
            m.http = platform['http']
            m.bt = platform['bt']
            m.save
          else
            m.save # to get the ID that we prepend to the title slug to ensure uniqueness
            if show
              puts 'New Music Track'
            end
            m.title_raw = m.title = item['title']
            m.title_slug_raw = m.title_slug = m.id.to_s + '-' + item['title_slug'].to_s.downcase + '-' + platform['type'].to_s.downcase.parameterize
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
end

desc 'Import Bundle Stars JSON object to database'
task :import_bs, [:file_path] => :environment do |t, args|

  show = true

  json = File.read(args['file_path'])

  hash = ActiveSupport::JSON.decode(json)

  hash.each do |bundle|
    if show
      puts bundle['bundle_name']
    end
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
      if show
        puts '-' + g.title.to_s
      end
      game['keys'].each do |key|
        k = Gamekey.new
        k.key = key['key']
        k.gift_url = key['orderID']
        k.game_id = g.id
        k.save
        bundle.save
      end
      if show
        puts '--Key Count'
        puts g.gamekeys.count
      end
      if g.gamekeys.count == 0 and show
        puts '------------------------------------------------- check this!!!!! -------------------------------------------------'
      end
    end
  end
end

def find_game(title_slug)
  Game.all.each do |a|
    if get_slug(a.title_slug) == title_slug
      return a
    end
  end
  false
end

def find_androidgame(url)
  Androidgame.all.each do |a|
    first = URI(a.http).path
    second = URI(url).path
    if first == second
      return a
    end
  end
  false
end

def find_ebook(url)
  Ebook.all.each do |e|
    first = URI(e.http).path
    second = URI(url).path
    if first == second
      return e
    end
  end
  false
end

def find_drmfree(url)
  DrmFreeGame.all.each do |e|
    first = URI(e.http).path
    second = URI(url).path
    if first == second
      return e
    end
  end
  false
end

def find_music(url, site = 'hb')
    Musictrack.all.each do |e|
      if site == 'hb' and !e.http.nil?
        first = URI(e.http).path
        second = URI(url).path
        if first == second
          return e
        end
      else
        if e.mp3dllink == url
          return e
        end
      end

    end
  false
end

def get_id(slug)
  arr = slug.split('-',2)
  arr[0]
end

def get_slug(slug)
  arr = slug.split('-',2)
  arr[1]
end
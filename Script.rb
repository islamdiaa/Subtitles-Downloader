require 'digest/md5'
require 'net/http'

def gethash(name)
	readsize = 64 * 1024
	file = File.open(name,"rb")
	data = file.read(readsize)
	file.seek(-readsize,IO::SEEK_END)
	data += file.read(readsize)
	return Digest::MD5.hexdigest(data)
end

def getsubtitle(path)
	hash =  gethash(path)
	for con in Array[".avi",".mp4",".mkv",".mpg",".mpeg"]
		path.gsub! con,""
	end
	
	url = URI.parse("http://api.thesubdb.com/")
	req = Net::HTTP::Get.new(url.path + "?action=download&hash="+hash+"&language=en")
      	req["User-Agent"] = "SubDB/1.0 (subtitle-downloader/1.0; http://github.com/islamdiaa/subtitles_downloader)"
     
        Net::HTTP.start(url.host, url.port) do |http|
        file = File.open(path+".srt","wb")
	file.write(http.request(req).body)
      end

end

getsubtitle ARGV[0].dup

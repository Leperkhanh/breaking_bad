class Api
    BASE_URL = "https://breakingbadapi.com/api/" #this is API's base URL, it's constant because... well it doesn't change. 

    def self.get_data # this will get character's data
        url = "#{BASE_URL}characters" # endpoint for characters.
        response = RestClient.get(url)
        data = JSON.parse(response.body)
        data.each do |element|
            id = element["char_id"]
            name = element["name"]
            birthday = element["birthday"]
            img = element["img"]
            actor = element["portrayed"]
            occupation = element["occupation"]
            status = element["status"]
            nickname = element["nickname"]
            Character.create(name: name, birthday: birthday, img: img, actor: actor, occupation: occupation, nickname: nickname)    
        end
    end

    def self.get_quote_data # getting quote data
        url = "#{BASE_URL}quotes"
        response = RestClient.get(url)
        data = JSON.parse(response.body)
        data.each do |element|
            quote = element["quote"]
            author = element["author"]
            Quote.create(author: author, quote: quote)
        end
    end
end

Api.get_data
Api.get_quote_data
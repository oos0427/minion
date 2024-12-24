import sys
import OpenAi

key = input("input your openai key:")

file_name = input("input audio file name:")

client = OpenAi(api_key=key)

def make_description_from_image(link):
    response = client.chat.completions.create(
    model = 'gpt-4-turbo',
    messages = [
        {
            "role":"user",
            "content":[
                {"type":"text", "text":"이미지에 대해 설명해 주세요."},
                {"type":"image_url",
                "image_url":{
                    "url":link
                    }
                }
            ]
        }
    ],
    max_tokens = 1000
    )
    return response.choices[0].message.content

link = input("input image link: ")

image_to_text = make_description_from_image(link)


def make_description_from_text(text = image_to_text, file_name = file_name):
    with client.audio.speech.with_streaming_response.create(
        model =  "tts-1",
        voice = "onyx",
        input=f"{text}"
    ) as response:
        response.stream_to_file(f"Data/{file_name}")


make_description_from_text()

# if __name__  == "__main__":
#     if not sys.argv == 3:
#         print("invalid execution command", end=" ")
#         print("--> python program.py image_file_name audio_file_name")
#     else:
#         images_file_name = sys.argv[2]
#         audio_file_name = sys.argv[3]
#     print( sys.argv ) # 파이선 xxx.py a b c -> ['xxx.py', 'a', 'b', 'c']
#     pass
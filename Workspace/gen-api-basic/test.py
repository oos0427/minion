import sys
from openai import OpenAI

import time
from tqdm import tqdm



key = input("input your openai key:")

client = OpenAI(api_key=key)

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

file_name = input("input audio file name:")

def make_description_from_text(text = image_to_text, file_name = file_name):
    with client.audio.speech.with_streaming_response.create(
        model =  "tts-1",
        voice = "onyx",
        input=f"{text}"
    ) as response:
        response.stream_to_file(f"Data/{file_name}")


make_description_from_text()
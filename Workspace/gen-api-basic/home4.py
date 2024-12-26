import openai

import sys
import io
import base64
from PIL import Image

from threading import Thread
import time
from tqdm import tqdm  # 진행률 표시를 위한 라이브러리

key = input("input your api key :")
client = openai.OpenAI(api_key=key) # openai api service에 연결된 객체


created_description = None
is_running = False

def make_description():
    global created_description
    global is_running
    is_running = True
    try:
        # API 호출 코드 (예제 응답으로 대체)
        response = client.chat.completions.create(
            model='gpt-4-turbo',
            messages=[
                {
                    "role": "user",
                    "content": [
                        {"type": "text", "text": "이미지에 대해 설명해 주세요."},
                        {
                            "type": "image_url",
                            "image_url": {
                                "url": image_data
                            }
                        }
                    ]
                }
            ],
            max_tokens=300
        )  # API 호출 대신 예제 응답으로 대체

        created_description = response.choices[0].message.content
        is_running = False

    except Exception as e:
        print(f"API 호출 중 오류 발생: {e}")
        
        return None


def print_dot():
    print("..", end="")


def make_description_from_image(image_data):
    print("이미지에 대한 설명을 생성 중입니다...")
    
    global created_description, is_running

    # 항상 새로운 Thread 객체 생성
    thread = Thread(target=make_description)
    thread.start()  # 새 Thread 실행

    with tqdm(total=100, desc="진행률", ncols=80) as progress_bar:
        while is_running:
            time.sleep(1)  # 진행률 업데이트
            if progress_bar.n + 3 < 100:  # 100% 초과 방지
                progress_bar.update(3)
            else:
                progress_bar.n = 100  # 100%로 설정
                progress_bar.last_print_n = 100
                progress_bar.update(0)
                break  # 루프 종료

        # 루프가 끝나고 100%를 보장
        progress_bar.n = 100
        progress_bar.last_print_n = 100
        progress_bar.update(0)

    thread.join()  # 작업 완료 대기
    print("설명 생성 완료!")
    return created_description

# thread = Thread(target=make_description_from_image)
thread = Thread(target=make_description)


def make_speech_from_description(description, audio_file_name):
    with client.audio.speech.with_streaming_response.create(
        model="tts-1",
        voice="onyx",
        input=description
    ) as response:
        response.stream_to_file(f'Data/{audio_file_name}')


image_data = input("url for image : ")

description = make_description_from_image(image_data)

audio_file_name = input("file_name_for_audio_file :" )

make_speech_from_description(description, audio_file_name)
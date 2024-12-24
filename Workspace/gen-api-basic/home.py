import openai

import sys
import io
import base64
from PIL import Image

from threading import Thread
import time
from tqdm import tqdm  # 진행률 표시를 위한 라이브러리


OPENAI_API_KEY = "sk-fHu2XOAEabWNOaTq35n2QmBKKAFU2mosRnsCMQz5OcT3BlbkFJNAr4-bIwJlm8MdKiwurinXpZ7oloiaTpxUUFKa0DUA"

client = openai.OpenAI(api_key=OPENAI_API_KEY) # openai api service에 연결된 객체



def make_description_from_image(image_data):
    print("이미지에 대한 설명을 생성 중입니다...")

    total_steps = 3  # 작업 단계 수 정의 (예: 요청 준비, API 호출, 결과 처리)
    
    # tqdm을 업데이트하는 스레드 정의
    def progress_task(progress_bar):
        for _ in range(total_steps):
            time.sleep(0.5)  # 단계 간 대기 시간 (여기서는 예제용으로 0.5초 대기)
            progress_bar.update(1)

    with tqdm(total=total_steps, desc="진행률", ncols=80) as progress_bar:
        # tqdm 업데이트를 위한 스레드 시작
        thread = Thread(target=progress_task, args=(progress_bar,))
        thread.start()

        # 단계 1: 요청 준비
        time.sleep(0.5)  # 준비 시간 시뮬레이션

        # 단계 2: API 호출
        start_time = time.time()
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
            max_tokens=1000
        )  # API 호출 대신 예제 응답으로 대체
        elapsed_time = time.time() - start_time
        time.sleep(elapsed_time)  # API 대기 시간을 실제 시간으로 반영

        # 단계 3: 결과 처리
        time.sleep(0.5)  # 결과 처리 시간 시뮬레이션

        # tqdm 스레드가 작업 완료를 기다림
        thread.join()

    print("설명 생성 완료!")
    return response.choices[0].message.content






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
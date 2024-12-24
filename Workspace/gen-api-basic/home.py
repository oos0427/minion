import openai

import sys
import io
import base64
from PIL import Image


import time
from tqdm import tqdm  # 진행률 표시를 위한 라이브러리

client = openai.OpenAI(api_key=OPENAI_API_KEY) # openai api service에 연결된 객체



# def make_decription_from_image(image_data):
#     """이미지에 대한 설명을 만드는 함수"""
#     response = client.chat.completions.create(
#         model='gpt-4-turbo',
#         messages=[
#             {
#                 "role": "user", 
#                 "content" : [
#                     { "type": "text", "text": "이미지에 대해 설명해 주세요" },
#                     { 
#                         'type': "image_url",
#                         'image_url': {
#                             'url': image_data
#                         }
#                     }
#                 ]
#             }
#         ],
#         max_tokens=1000
#     )

#     return response.choices[0].message.content




"""
def make_decription_from_image(image_data):

    # 진행 상황 표시
    for _ in tqdm(range(100), desc="진행률", ncols=80):
        time.sleep(0.05)  # 진행률 업데이트 속도 시뮬레이션 (API 대기 시간)

    response = client.chat.completions.create(
        model='gpt-4-turbo',
        messages=[
            {
                "role": "user", 
                "content" : [
                    { "type": "text", "text": "이미지에 대해 설명해 주세요" },
                    { 
                        'type': "image_url",
                        'image_url': {
                            'url': image_data
                        }
                    }
                ]
            }
        ],
        max_tokens=1000
    )

    print("설명 생성 완료!")
    return response.choices[0].message.content
"""


def make_decription_from_image(image_data):
    """이미지에 대한 설명을 만드는 함수"""
    print("이미지에 대한 설명을 생성 중입니다...")

    total_steps = 3  # 작업 단계 수 정의 (예: 요청 준비, API 호출, 결과 처리)
    
    with tqdm(total=total_steps, desc="진행률", ncols=80) as progress_bar:
        # 단계 1: 요청 준비
        time.sleep(0.5)  # 준비 시간 시뮬레이션
        progress_bar.update(1)  # 진행률 업데이트

        # 단계 2: API 호출
        start_time = time.time()
        response = client.chat.completions.create(
            model='gpt-4-turbo',
            messages=[
                {
                    "role": "user",
                    "content": [
                        {"type": "text", "text": "이미지에 대해 설명해 주세요"},
                        {
                            "type": "image_url",
                            "image_url": {"url": image_data}
                        }
                    ]
                }
            ],
            max_tokens=1000
        )
        elapsed_time = time.time() - start_time
        time.sleep(elapsed_time)  # API 대기 시간을 실제 시간으로 반영
        progress_bar.update(1)

        # 단계 3: 결과 처리
        time.sleep(0.5)  # 결과 처리 시간 시뮬레이션
        progress_bar.update(1)

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

description = make_decription_from_image(image_data)

audio_file_name = input("file_name_for_audio_file :" )

make_speech_from_description(description, audio_file_name)
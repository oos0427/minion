import cv2
import numpy as np

# YOLO 모델 로드 함수
def load_yolo():
    try:
        model = cv2.dnn.readNet("YOLO_Data/yolov3-tiny.weights", "YOLO_Data/yolov3-tiny.cfg")
        with open('YOLO_Data/coco.names', 'r') as f:
            classes = [line.strip() for line in f.readlines()]
        layer_names = model.getUnconnectedOutLayersNames()
        colors = np.random.uniform(0, 255, size=(len(classes), 3))
        return model, classes, layer_names, colors
    except Exception as e:
        print(f"Error loading YOLO model: {e}")
        return None, None, None, None

# 이미지 로드 및 리사이즈 함수
def load_image(image_path):
    image = cv2.imread(image_path)
    image = cv2.resize(image, None, fx=0.5, fy=0.5)
    height, width, channels = image.shape
    return image, height, width, channels

# 객체 탐지 함수
def detect_objects(image, model, layers):
    blob = cv2.dnn.blobFromImage(image, scalefactor=1/255, size=(320, 320), mean=(0, 0, 0), swapRB=True)
    model.setInput(blob)
    outputs = model.forward(layers)
    return blob, outputs

# 탐지 결과로부터 바운딩 박스 정보 추출
def get_box_dimensions(outputs, height, width):
    boxes, confs, class_ids = [], [], []
    for output in outputs:
        for detect in output:
            scores = detect[5:]
            class_id = np.argmax(scores)
            conf = scores[class_id]
            if conf > 0.3:  # 신뢰도 임계값
                center_x = int(detect[0] * width)
                center_y = int(detect[1] * height)
                w = int(detect[2] * width)
                h = int(detect[3] * height)
                x = int(center_x - w / 2)
                y = int(center_y - h / 2)
                boxes.append([x, y, w, h])
                confs.append(float(conf))
                class_ids.append(class_id)
    return boxes, confs, class_ids

# 바운딩 박스와 레이블 그리기 함수
def draw_labels(boxes, confs, colors, class_ids, classes, image):
    indexes = cv2.dnn.NMSBoxes(boxes, confs, 0.5, 0.4)  # 비최대 억제
    font = cv2.FONT_HERSHEY_PLAIN
    for i in range(len(boxes)):
        if i in indexes:
            x, y, w, h = boxes[i]
            label = str(classes[class_ids[i]])
            color = colors[class_ids[i]]
            cv2.rectangle(image, (x, y), (x + w, y + h), color, 2)
            cv2.putText(image, label, (x, y - 5), font, 1, color, 1)
    cv2.imshow("Image", image)

# 객체 탐지 및 시각화 함수
def process_image(image_path):
    model, classes, layer_names, colors = load_yolo()
    if model is None:
        print("Failed to load YOLO model.")
        return

    image, height, width, channels = load_image(image_path)
    blob, outputs = detect_objects(image, model, layer_names)
    boxes, confs, class_ids = get_box_dimensions(outputs, height, width)
    draw_labels(boxes, confs, colors, class_ids, classes, image)

    while True:
        key = cv2.waitKey(1)  # wait for keyboard input
        if key == 27:  # ESC key
            break
    cv2.destroyAllWindows()

# 메인 실행부
if __name__ == "__main__":
    process_image("YOLO_data/busy_street.jpg")

def image_detect(image_path):
	model, classes, layer_names, colors = load_yolo()
	image, height, width, channels = load_image(image_path)
	blob, outputs = detect_objects(image, model, layer_names)
	boxes, confs, class_ids = get_box_dimensions(outputs, height, width)
	draw_labels(boxes, confs, colors, class_ids, classes, image)

	while True:
		key = cv2.waitKey(1) # wait keyboard input
		if key == 27: # esc key
			break



cv2.destroyAllWindows()
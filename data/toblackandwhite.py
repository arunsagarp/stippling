import cv2
img = cv2.imread('hari5.jpeg',1)
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
cv2.imshow("im",gray)
cv2.waitKey(0)
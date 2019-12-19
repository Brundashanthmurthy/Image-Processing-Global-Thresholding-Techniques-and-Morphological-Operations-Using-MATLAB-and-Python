# -*- coding: utf-8 -*-
"""
Created on Thu Dec 19 17:29:15 2019

@author: cmkir
"""

import cv2
import numpy as np
img = cv2.imread('camel.jpeg')
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
#sobel
img_sobelx = cv2.Sobel(img,cv2.CV_8U,1,0,ksize=3)
img_sobely = cv2.Sobel(img,cv2.CV_8U,0,1,ksize=3)
img_sobel = img_sobelx + img_sobely
#prewitt
kernelx = np.array([[1,1,1],[0,0,0],[-1,-1,-1]])
kernely = np.array([[-1,0,1],[-1,0,1],[-1,0,1]])
img_prewittx = cv2.filter2D(img, -1, kernelx)
img_prewitty = cv2.filter2D(img, -1, kernely)
cv2.imshow("Original Image", img)
cv2.imshow("camel_Sobel X", img_sobelx)
cv2.imshow("camel_Sobel Y", img_sobely)
cv2.imshow("camel_Sobel", img_sobel)
cv2.imshow("camel_Prewitt X", img_prewittx)
cv2.imshow("camel_Prewitt Y", img_prewitty)
cv2.imshow("camel_Prewitt", img_prewittx + img_prewitty)
cv2.imwrite("camel_Sobel X.jpeg", img_sobelx)
cv2.imwrite("camel_Sobel Y.jpeg", img_sobely)
cv2.imwrite("camel_Sobel.jpeg", img_sobel)
cv2.imwrite("camel_Prewitt_X.jpeg", img_prewittx)
cv2.imwrite("camel_Prewitt_Y.jpeg", img_prewitty)
cv2.imwrite("camel_Prewitt.jpeg", img_prewittx + img_prewitty)
cv2.waitKey(0)
cv2.destroyAllWindows()

#Global thresholding
import cv2
import numpy as np
from matplotlib import pyplot as plt
#reading image in gray scale
img = cv2.imread("grayflower.jpg",0)
cv2.imshow('original image', img)
h,w = np.shape(img)
t0=127
t=127 #initial condition
g1 = []
g2 = []
camel_Prewitt camel_Prewitt_X camel_Prewitt_Y
#calculating t by algorithm
while(1):
for px in range(0,h):
for py in range(0,w):
if (img[px][py] < t):
g1.append(img[px][py])
else:
g2.append(img[px][py])
mu1 = sum(g1) / len(g1)
mu2 = sum(g2) / len(g2)
t0=t
t = ((mu1+ mu2)/2)
delta_t = abs(t-t0)
print(mu1,mu2,t,delta_t)
if(delta_t < 1):
break
print(t)
#calculating the histogram
hist_full = cv2.calcHist([img],[0],None,[256],[0,256])
#apply thresholding
for px in range(0,h):
for py in range(0,w):
if (img[px][py] < t):
img[px][py] = 0
else:
img[px][py] = 225
#plotting histogram
plt.plot(hist_full)
plt.xlim([0,256])
plt.ylim(bottom=0)
cv2.imshow('threshold', img)
plt.show()
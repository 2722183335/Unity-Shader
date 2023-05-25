渐变 Gradient

1.效果图

![](https://unity-shader.oss-cn-beijing.aliyuncs.com/Gradient.gif)

2.关键点 平滑阶梯函数

     //如果x在min与max之间返回x,如果x的平滑值,如果小于min返回min,大于max返回max
     float SmoothStep(float min,float max,float x)
     {
      float t=saturate(x-min)/(max-min);
      return t*t*(3-2*t);
     }
     
     

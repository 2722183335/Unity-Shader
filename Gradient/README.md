渐变 Gradient
1.关键点

` float SmoothStep(float min,float max,float x)
  {
      float t=saturate(x-min)/(max-min);
      return t*t*(3-2*t);
  }
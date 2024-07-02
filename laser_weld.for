      SUBROUTINE DFLUX(FLUX, SOL, KSTEP, KINC, TIME, NOEL, NPT, COORDS,
     &            JLTYP, TEMP, PRESS, SNAME)
C
      INCLUDE 'ABA_PARAM.INC'
      DIMENSION FLUX(2), TIME(2), COORDS(3)
      CHARACTER*80 SNAME
C
      X = COORDS(1)
      Y = COORDS(2)
      Z = COORDS(3)

      Xstart = 0.0
      Ystart = 0.006/2
      Zstart = 0.0


      vx = 0.0
      vy = 0.0
      vz = 0.05
	  
	  Xcentre = Xstart
      Ycentre = Ystart
      Zcentre = Zstart + vz*TIME(2)

      XT = Xcentre - X
      ZT = Zcentre - Z
	  
      Dist = SQRT((ZT*ZT) + (XT*XT))
	  
	  Q=1400
	  etta=0.85
	  pi=3.1415
	  r0=0.009
	  s=0.0054
	  y=0.003
	  
	  FLUX(1)=((Q*etta)/(pi*(r0**2)*s))*(1-(y/s))*exp(1-(Dist**2/r0**2))
	  
	  RETURN
	  END
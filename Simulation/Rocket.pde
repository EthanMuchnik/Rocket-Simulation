import java.lang.Math.*;

class Rocket{

    double perThrust; //Percent Thrust form 0 to 1

    double massE; //Empty Mass
    double massF; //mass full rocket
    double massC; //current mass of rocket

    double mFR; //mass flow rate
    double eVel; //exit velocity of fuel
    double ePres; //exit Pressure in Engine

    double hPos;
    double wPos;
    double hImg;
    double wImg;
    PImage rImage;


    double angleGround;

    double hVelI;
    double hVelF;
    double wVelI;
    double wVelF;

    double combVel = Math.sqrt(hVelF*hVelF+wVelF*wVelF);

    double coefDrag; //Coefficient of drag is typically around 0.75
    double viscosity;
    double a;//area of engine

    double thrustFX= thrustForceX();
    double thrustFY= thrustForceY();
    double gravF= gravityForce();
    double airDragFX = airDragForceX();
    double airDragFY= airDragForceY();

    double netForceX;
    double netForceY;

    double aEng;//area of engine
    double aRocket;//area of Rocket
    double pres; //pressure at altitude

    //Equation Var
        //F = m dot * Ve + (pe - p0) * Ae

            //Pressure //dP/P = -(Mg/RT)(dh)--> P = P0e^((-Mg/RT)(h)) https://www.math24.net/barometric-formula/#:~:text=P(h)%3D101.325%E2%8B%85,0.00012h)%5BmmHg%5D.
            // Mass

    public Rocket(double hPos,double wPos, double eVel,double mFR, double coefDrag){
        this.hPos = hPos;
        this.wPos = wPos;
        this.hVelI = 0;
        this.wVelI = 0;
        this.massE = 60.0;
        this.massF = 80.0;
        this.massC = massF;
        this.angleGround = 90;
        this.viscosity = viscosityUpdate();
        this.aEng = 5;
        this.aRocket = 5;
        this.rImage = loadImage("images/rocket/smallRocket.png");
        this.wImg = 50.0;
        this.hImg = 300.0;
        this.mFR = mFR;
        this.eVel = eVel;
        this.coefDrag = coefDrag;
        this.ePres = 20;
    }

    public void imagePrint(){
        image(rImage,(int)wPos,(int)hPos,(int)wImg,(int)hImg);
    }

    // F = thrustForce-drag-mg = ma 
    // t is constant is it increases in increments of 0.2
    // Ft = I --> p = mv-vi --> Rocket:  M (u + du) - M u = M du


    public double updatePressure(){
        return Constants.pZero*Math.pow( Constants.e, -1*(((Constants.molarMass)*(Constants.gravAcc))/((Constants.rGasConst)*(Constants.rGasConst)))*(hPos) );
    }

    public double thrustForceX(){
        System.out.println("cos" + Math.cos(Math.toRadians(angleGround)));
        return  (mFR*eVel+(ePres-pres)*aEng*perThrust)* Math.cos(Math.toRadians(angleGround)); 

    }

    public double thrustForceY(){
        System.out.println("sin" + Math.sin(Math.toRadians(angleGround)));
        return  1*(mFR*eVel+(ePres-pres)*aEng*perThrust)*Math.sin(Math.toRadians(angleGround))*(-1);  
    }

    public double gravityForce(){
        return massC*Constants.gravAcc;
    }
    public double airDragForceX(){
        return 0.5*coefDrag*wVelF*wVelF*aRocket*viscosityUpdate()*Math.signum(wVelF)*(-1);
    }
    public double airDragForceY(){
        return 0.5*coefDrag*hVelF*hVelF*aRocket*viscosityUpdate()*Math.signum(hVelF)*(-1);
    }


    public double forceUpdateX(){
        thrustFX = thrustForceX();//thrust of Engine X
        System.out.println("thrustFX:" + thrustFX);
        airDragFX = airDragForceX();//force of air resistance
        System.out.println("airDragX:" + airDragFX);
        return thrustFX + airDragFX;
    }

    public double forceUpdateY(){
        thrustFY = thrustForceY();//thrust of Engine Y
        System.out.println("thrustFY:" + thrustFY);
        gravF= gravityForce();//force of gravity
        System.out.println("gravF:" + gravF);
        airDragFY = airDragForceY();//force of air resistance
        System.out.println("airDragY:" + airDragFY);
        return thrustFY + airDragFY+gravF;
    }

    public double massUpdate(){
        if(massC-mFR*perThrust>=massE){
            return massC-=(mFR*perThrust);
        }
        return massC;
    }

    public void generalUpdate(){
        System.out.println("hPos:" + hPos);
        massC = massUpdate();
        pres  = updatePressure();
        System.out.println("pres" + pres);
        netForceX = forceUpdateX();
        System.out.println("net x: " +netForceX);
        netForceY = forceUpdateY();
        System.out.println("net y"+ netForceY);
        viscosity = viscosityUpdate();
        hVelF = speedUpdateY();
        wVelF = speedUpdateX();
        hPos = setHPos();
        wPos = setWPos();
        itoFSpeedY();
        itoFSpeedX();
        System.out.println();
    }
    public double speedUpdateX(){
        return (netForceX*Constants.dt)/massC+wVelI;
        // System.out.println("Width I")
    }
    public double speedUpdateY(){
        return (netForceY*Constants.dt)/massC+ hVelI;
    }

    public void itoFSpeedY(){
        hVelI = hVelF;
        System.out.println("hightFinalSpeed" + hVelF);
    }
    public void itoFSpeedX(){
        wVelI = wVelF;
        System.out.println("widthFinalSpeed" + wVelF);
    }


    public double viscosityUpdate(){
        return Math.pow((Constants.e),-0.0005*hPos+0.25);
    }

    //get variables functions
    public double getHPos(){
        return hPos;
    }    
    public double getWPos(){
        return wPos;
    }    
    public double setHPos(){
        return hPos+=hVelF;
    }    
    public double setWPos(){
        return wPos+=wVelF;
    }        
}
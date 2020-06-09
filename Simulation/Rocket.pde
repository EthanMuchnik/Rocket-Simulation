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

    //Equation Var
        //F = m dot * Ve + (pe - p0) * Ae

            //Pressure //dP/P = -(Mg/RT)(dh)--> P = P0e^((-Mg/RT)(h)) https://www.math24.net/barometric-formula/#:~:text=P(h)%3D101.325%E2%8B%85,0.00012h)%5BmmHg%5D.
            private double pres = calcPressure();
            // Mass

    public Rocket(double hPos,double wPos, double massE, double massF, double angleGround, double aEng, double aRocket){
        this.hPos = hPos;
        this.wPos = wPos;
        this.hVelI = 0;
        this.wVelI = 0;
        // this.hVelF = 0;
        // this.wVelF = 0;
        this.massE = massE;
        this.massF = massF;
        this.massC = massF;
        this.angleGround = angleGround;
        this.viscosity = viscosityUpdate();
        this.aEng = aEng;
        this.aRocket = aRocket;
        this.rImage = loadImage("images/rocket/smallRocket.png");
        this.wImg = 50.0;
        this.hImg = 300.0;
    }

    public void imagePrint(){
        image(rImage,(int)wPos,(int)hPos,(int)wImg,(int)hImg);
    }

    // F = thrustForce-drag-mg = ma 
    // t is constant is it increases in increments of 0.2
    // Ft = I --> p = mv-vi --> Rocket:  M (u + du) - M u = M du


    public double calcPressure(){
        return Constants.pZero*Math.pow( Constants.e, (((Constants.molarMass)*(Constants.gravAcc))/((Constants.rGasConst)*(Constants.rGasConst)))*(hPos) );
    }

    public double thrustForceX(){
        return  mFR*eVel+(ePres-pres)*aEng*perThrust* Math.cos(angleGround); 
    }

    public double thrustForceY(){
        return  mFR*eVel+(ePres-pres)*aEng*perThrust*Math.sin(angleGround);  
    }

    public double gravityForce(){
        return massC*Constants.gravAcc*(-1);
    }
    public double airDragForceX(){
        return 0.5*coefDrag*wVelF*wVelF*aRocket*viscosityUpdate()*Math.signum(wVelF)*(-1);
    }
    public double airDragForceY(){
        return 0.5*coefDrag*hVelF*hVelF*aRocket*viscosityUpdate()*Math.signum(hVelF)*(-1);
    }


    public double forceUpdateX(){
        thrustFX = thrustForceX();//thrust of Engine X
        airDragFX = airDragForceX();//force of air resistance
        return thrustFX + airDragFX;
    }

    public double forceUpdateY(){
        thrustFY = thrustForceY();//thrust of Engine Y
        gravF= gravityForce();//force of gravity
        airDragFY = airDragForceY();//force of air resistance
        return thrustFY + airDragFY+gravF;
    }

    public double massUpdate(){
        if(massC-mFR*perThrust>=massE){
            return massC-=(mFR*perThrust);
        }
        return massC;
    }

    public void generalUpdate(){
        massC = massUpdate();
        netForceX = forceUpdateX();
        netForceX = forceUpdateY();
        viscosity = viscosityUpdate();
        hVelF = speedUpdateY();
        wVelF = speedUpdateX();
        hPos = setHPos();
        wPos = setWPos();
    }
    public double speedUpdateX(){
        return (netForceY*Constants.dt)/massC+wVelI;
    }
    public double speedUpdateY(){
        return (netForceX*Constants.dt)/massC+ hVelI;
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
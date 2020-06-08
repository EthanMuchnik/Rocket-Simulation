import java.lang.Math.*;

abstract class Rocket{

    double perThrust; //Percent Thrust form 0 to 1

    double heightImage;
    double widthImage;

    double massE; //Empty Mass
    double massF; //mass full rocket
    double massC; //current mass of rocket

    double mFR; //mass flow rate
    double eVel; //exit velocity of fuel
    double ePres; //exit Pressure in Engine

    double hPos;
    double wPos;
    double angleGround;

    double hVel;
    double vVel;
    double combVel = Math.sqrt(hVel*hVel+vVel*vVel);

    double coefDrag; //Coefficient of drag is typically around 0.75
    double viscosity;

    private double thrustFX;
    private double thrustFY;
    private double gravF;
    private double airDragF;
    private double netForceX;
    private double netForceY;

    
    

    private double a = 5.0;//area of engine

    public Rocket(double hPos, double massE, double massF, double angleGround){
        this.hPos = hPos;
        this.massE = massE;
        this.massF = massF;
        this.angleGround = angleGround;
    }


    //Equation Var
        //F = m dot * Ve + (pe - p0) * Ae

            thrustFX = thrustForceX();//thrust of Engine X
            thrustFY = thrustForceY();//thrust of Engine Y
            gravF= gravityForce();//force of gravity
            airDragF = airDragForce();//force of air resistance


            //Pressure //dP/P = -(Mg/RT)(dh)--> P = P0e^((-Mg/RT)(h)) https://www.math24.net/barometric-formula/#:~:text=P(h)%3D101.325%E2%8B%85,0.00012h)%5BmmHg%5D.
            private double pres = calcPressure();
            // Mass


    //

    // F = thrustForce-drag-mg = ma 
    // t is constant is it increases in increments of 0.2
    // Ft = I --> p = mv-vi --> Rocket:  M (u + du) - M u = M du


    public double calcPressure(){
        return Constants.pZero*Math.pow( Constants.e, (((Constants.molarMass)*(Constants.gravAcc))/((Constants.rGasConst)*(Constants.rGasConst)))*(getHPos) );
    }

    public double thrustForceX(){
        return  mFR*eVel+(ePres-pres)*a*perThrust* Math.cos(angleGround); 
    }

    public double thrustForceY(){
        return  mFR*eVel+(ePres-pres)*a*perThrust*Math.sin(angleGround);  
    }

    public double gravityForce(){
        return massC*Constants.gravAcc*(-1);
    }
    public double airDragForceX(){
        return 0.5*coefDrag*wVel*wVel*viscosityUpdate()*signum(wVel)*(-1);
    }
    public double airDragForceY(){
        return 0.5*coefDrag*hVel*hVel*viscosityUpdate()*signum(wVel)*(-1);
    }


    public double forceUpdateX();
    {
        thrustFX = thrustForceX();//thrust of Engine X
        airDragFX = airDragForceX();//force of air resistance
        netForceX = thrustFX + airdDragFX;
        return thrustFX + airdDragFX;
    }
    public double forceUpdateY();
    {
        thrustFY = thrustForceY();//thrust of Engine Y
        gravF= gravityForce();//force of gravity
        airDragFY = airDragForceY();//force of air resistance
        netForceY = thrustFY + airdDragFY+gravF;
        return thrustFY + airdDragFY+gravF;
    }

    public double massUpdate(){
        if(massC-mFR*perThrust>=massE){
            massC-=(mFR*perThrust);
        }
        return massC;
    }

    public double generalUpdate(){
        massUpdate();
        forceUpdateX();
        forceUpdateY();
    }

    public double speedUpdate(){
        netForceX = 
    }

    public double viscosityUpdate(){
        viscosity = Math.pow((Constants.e),-0.0005*getHPos+0.25);
        return Math.pow((Constants.e),-0.0005*getHPos+0.25);
    }

    //get variables functions
    public double getHPos(){
        return hPos;
    }        

    
}
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
    PImage rTImage;


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

    double normalFY = normalForceY();

    double netForceX;
    double netForceY;

    double aEng;//area of engine
    double aRocket;//area of Rocket
    double pres; //pressure at altitude
    int counter = 0;
    boolean thrustOn = false;

    double scrH;
    double scrW;
    Sky theSky;

    //Equation Var

    public Rocket(double hPos,double wPos, double eVel,double mFR, double coefDrag){
        this.hPos = hPos;
        this.wPos = wPos;
        this.hVelI = 0;
        this.wVelI = 0;
        this.massE = 60.0;
        this.massF = 800.0;
        this.massC = massF;
        this.angleGround = PI/2;
        this.viscosity = viscosityUpdate();
        this.aEng = 10;
        this.aRocket = 20;
        this.rImage = loadImage("images/rocket/Rocket.png");
        this.rTImage = loadImage("images/rocket/RocketThrust.png");
        this.wImg = 50.0;
        this.hImg = 300.0;
        this.mFR = mFR;
        this.eVel = eVel;
        this.coefDrag = coefDrag;
        this.ePres = 5;
        this.perThrust = 0.2;
        this.scrH = height-350;
        this.scrW = width/2-wImg/2;
        this.theSky = new Sky(hPos, wPos);
    }

    public void imagePrint(){
        pushMatrix();
        translate((float)(scrW + wImg/2), (float)(scrH+hImg/2));
        rotate(counter*(PI/60.0));
        translate((float)-(scrW + wImg/2), (float)-(scrH+hImg/2));
        if(!thrustOn){
            image(rImage,(int)scrW,(int)scrH,(int)wImg,(int)hImg);
        }
        else{
            image(rTImage,(int)scrW,(int)scrH,(int)wImg,(int)hImg+50);
        }
        popMatrix();     
    }

    public double massUpdate(){
        if(thrustOn){
            if(massC-mFR*perThrust>=massE){
                return massC-=(mFR*perThrust)*0.7;
            }
            else{
                massC = massE;
            }
        }
        return massC;
    }

    public double updatePressure(){
        //Pressure //dP/P = -(Mg/RT)(dh)--> P = P0e^((-Mg/RT)(h)) https://www.math24.net/barometric-formula/#:~:text=P(h)%3D101.325%E2%8B%85,0.00012h)%5BmmHg%5D.
        return Constants.pZero*Math.pow( Constants.e, ((((Constants.molarMass)*(Constants.gravAcc))/((Constants.tempConst)*(Constants.rGasConst)))*(hPos)) );
    }
    public double viscosityUpdate(){
        return Math.pow((Constants.e),0.00005*(hPos)+0.25); // viscosity/density of the air
    }

    public double airDragForceX(){
        return 0.5*coefDrag*wVelF*wVelF*viscosityUpdate()*aRocket*Math.signum(wVelF)*(-1);
        
    }

    public double airDragForceY(){
        return 0.5*coefDrag*hVelF*hVelF*viscosityUpdate()*aRocket*Math.signum(hVelF)*(-1);
    }

    public double thrustForceX(){
        if(thrustOn == true){
            return  (mFR*eVel+(ePres-pres)*aEng)*perThrust*Math.cos(angleGround+counter*Constants.turnConst)*(-1); 
        }   
        return  0.0; 
    }

    public double thrustForceY(){
        if(thrustOn == true){
            return  (mFR*eVel+(ePres-pres)*aEng)*perThrust*Math.sin(angleGround+counter*Constants.turnConst)*(-1);
        }
        return  0.0;  
    }

    public double normalForceY(){
        if(hPos>0 ){
            normalFY = netForceY*(-1);
            return normalFY;
        }
        else{
            normalFY = 0.0;
            return normalFY;
        }
    }

    public double gravityForce(){
        return massC*Constants.gravAcc;
    }

    public double forceUpdateX(){
        thrustFX = thrustForceX();//thrust of Engine X
        airDragFX = airDragForceX();//force of air resistance
        return thrustFX + airDragFX; //total Force on X axis
    }

    public double forceUpdateY(){
        thrustFY = thrustForceY();//thrust of Engine Y
        gravF= gravityForce();//force of gravity
        airDragFY = airDragForceY();//force of air resistance
        return thrustFY + airDragFY+gravF; //total Force on Y axis
    }

    public void generalUpdate(){
        massC = massUpdate();
        pres  = updatePressure();
        netForceX = forceUpdateX();
        netForceY = forceUpdateY();
        netForceY = netForceY - normalForceY();
        viscosity = viscosityUpdate();
        itoFSpeedY();
        itoFSpeedX();
        hUpdate();
        wUpdate();
        theSky.update(hVelF,wVelF);
        theSky.imagePrint();
    }
    public double speedUpdateX(){
        return (netForceX*Constants.dt)/massC+wVelI;
    }
    public void itoFSpeedY(){
        hVelI = hVelF;
    }
    public void itoFSpeedX(){
        wVelI = wVelF;
    }

    //Position and Speed Equation
    public double getHPos(){
        return hPos;
    }    
    public double getWPos(){
        return wPos;
    }    

    public void wUpdate(){
        if(hPos<0){
            wVelF =(netForceX*Constants.dt)/massC+ wVelI; //Derived from I = Integral(Fdt)
            wPos+=wVelF;

        }
        else if(hPos==0 && thrustOn ){
            wVelF =(netForceX*Constants.dt)/massC+ wVelI;
            wPos+=wVelF;
        }
        else if(hPos==0 && !thrustOn ){
            wVelF = 0;
        }
        else if(hPos>0){
            wVelF = 0;
        }
    }
    public void hUpdate(){
        // System.out.println("thrustOn: "+  thrustOn);
        if(hPos<0){
            hVelF =(netForceY*Constants.dt)/massC+ hVelI;
            hPos+=hVelF;

        }
        else if(hPos==0 && thrustOn ){
            hVelF =(netForceY*Constants.dt)/massC+ hVelI;
            hPos+=hVelF;
        }
        else if(hPos==0 && !thrustOn ){
            hVelF = 0;
            hPos =  0;
        }
        else if(hPos>0){
            hVelF = 0;
            double mod = hPos;
            hPos =  0;
            theSky.modY(mod);
        }
    }    
    public double setWPos(){
        return wPos+=wVelF;
    }     

    public void thrust(){
            thrustOn = true;
    }
    public void noThrust(){
        thrustOn = false;
    }   
    public void rightTurn(){
        counter++;
    }
    public void leftTurn(){
        counter--;
    }
    public void tUp(){
        if(perThrust+0.005 <=1){
            perThrust+=0.005;
        }
        else{
            perThrust = 1.0;
        }
    }
    public void tDown(){
        if(perThrust-0.005 >=0){
            perThrust-=0.005;
        }
        else{
            perThrust = 0;
        }
    }
}
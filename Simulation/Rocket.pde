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
        this.angleGround = PI/2;
        this.viscosity = viscosityUpdate();
        this.aEng = 50;
        this.aRocket = 5;
        this.rImage = loadImage("images/rocket/Rocket.png");
        this.rTImage = loadImage("images/rocket/RocketThrust.png");
        // this.skyImage = loadImage("images/clouds.png");
        this.wImg = 50.0;
        this.hImg = 300.0;
        this.mFR = mFR;
        this.eVel = eVel;
        this.coefDrag = coefDrag;
        this.ePres = 5;
        this.perThrust = 0.2;
        this.scrH = height/2;
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
            System.out.println("Ni");
        }
        else{
            image(rTImage,(int)scrW,(int)scrH,(int)wImg,(int)hImg+50);
            System.out.println("NAni");
        }
        popMatrix();
        
        // System.out.println("hPos initial"+hPos);
    }

    // F = thrustForce-drag-mg = ma 
    // t is constant is it increases in increments of 0.2
    // Ft = I --> p = mv-vi --> Rocket:  M (u + du) - M u = M du


    public double updatePressure(){
        // System.out.println("before Pressure"+ -1*((((Constants.molarMass)*(Constants.gravAcc))/((Constants.tempConst)*(Constants.rGasConst)))*(hPos-900)));
        // System.out.println("before Pressure 2.0"+ (hPos-900));
        return Constants.pZero*Math.pow( Constants.e, ((((Constants.molarMass)*(Constants.gravAcc))/((Constants.tempConst)*(Constants.rGasConst)))*(hPos)) );
    }

    public double thrustForceX(){
        // System.out.println("cos" + Math.cos(Math.toRadians(angleGround)));
        if(thrustOn == true){
            return  (mFR*eVel+(ePres-pres)*aEng*perThrust)* Math.cos(angleGround+counter*Constants.turnConst)*(-1); 
        }   
        return  0.0; 
    }

    public double thrustForceY(){
        // System.out.println("sin" + Math.sin(angleGround+counter*PI/60));
        if(thrustOn == true){
            return  (mFR*eVel+(ePres-pres)*aEng*perThrust)*Math.sin(angleGround+counter*Constants.turnConst)*(-1);
        }
        return  0.0;  
    }

    public double gravityForce(){
        return massC*Constants.gravAcc;
    }
    public double airDragForceX(){
        return 0.5*coefDrag*wVelF*wVelF*viscosityUpdate()*aRocket*Math.signum(wVelF)*(-1);
        
    }
    public double airDragForceY(){
        // System.out.println("coefDrag"+ coefDrag);
        // System.out.println("speed"+ hVelF);
        // System.out.println("arocket"+ aRocket);
        // System.out.println("viscosity"+ viscosityUpdate());
        // System.out.println("mathsign" + Math.signum(hVelF)*(-1));

        return 0.5*coefDrag*hVelF*hVelF*viscosityUpdate()*aRocket*Math.signum(hVelF)*(-1);
        // *viscosityUpdate()
    }


    public double forceUpdateX(){
        thrustFX = thrustForceX();//thrust of Engine X
        // System.out.println("thrustFX:" + thrustFX);
        airDragFX = airDragForceX();//force of air resistance
        // System.out.println("airDragX:" + airDragFX);
        return thrustFX + airDragFX;
    }

    public double forceUpdateY(){
        thrustFY = thrustForceY();//thrust of Engine Y
        // System.out.println("thrustFY:" + thrustFY);
        gravF= gravityForce();//force of gravity
        // System.out.println("gravF:" + gravF);
        airDragFY = airDragForceY();//force of air resistance
        // System.out.println("airDragY:" + airDragFY);
        return thrustFY + airDragFY+gravF;
    }

    public double massUpdate(){
        if(massC-mFR*perThrust>=massE){
            return massC-=(mFR*perThrust);
        }
        return massC;
    }

    public void generalUpdate(){
        // theKey = "";
        // hVelF = speedUpdateY();
        // hPos = setHPos();
        
        massC = massUpdate();
        pres  = updatePressure();
        // System.out.println("pres" + pres);
        netForceX = forceUpdateX();
        // System.out.println("net x: " +netForceX);
        netForceY = forceUpdateY();
        netForceY = netForceY - normalForceY();
        // System.out.println("net y"+ netForceY);
        viscosity = viscosityUpdate();
        // wPos = setWPos();
        // wVelF = speedUpdateX();
        // System.out.println("hPos:" + hPos);
        System.out.println();
        itoFSpeedY();
        itoFSpeedX();
        hUpdate();
        wUpdate();
        theSky.update(hVelF,wVelF);
        theSky.imagePrint();

        // thrustOn = false ;
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
    public double speedUpdateX(){
        return (netForceX*Constants.dt)/massC+wVelI;
        // System.out.println("Width I")
    }
    // public double speedUpdateY(){
    //     return (netForceY*Constants.dt)/massC+ hVelI;
    // }

    public void itoFSpeedY(){
        hVelI = hVelF;
        // System.out.println("hightFinalSpeed" + hVelF);
    }
    public void itoFSpeedX(){
        wVelI = wVelF;
        // System.out.println("widthFinalSpeed" + wVelF);
    }


    public double viscosityUpdate(){
        return Math.pow((Constants.e),0.0005*(hPos)+0.25);
    }

    //get variables functions
    public double getHPos(){
        return hPos;
    }    
    public double getWPos(){
        return wPos;
    }    

    public void wUpdate(){
        if(hPos<0){
            wVelF =(netForceX*Constants.dt)/massC+ wVelI;
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
        System.out.println("hPos " + hPos);
        System.out.println(hVelF + "hVelF");
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
        // angleGround+=Math.to
    }
    public void leftTurn(){
        counter--;
    }
    // public void double(){
    //     cloud.returnRand();
    // }
}
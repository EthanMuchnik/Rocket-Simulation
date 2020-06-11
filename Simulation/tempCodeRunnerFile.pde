
        skyX+=wVel;
        if(skyY >= 0){
            System.out.println(skyImage.height);
            skyY -=skyImage.height;
            System.out.println("down");
        }
        if(skyY <= (-1)*skyImage.height && (int)hPos<=-10){
            skyY +=skyImage.height;
            System.out.println("up");
        }
        if(skyX >= 0){
            skyX -=skyImage.width;
            System.out.println("right");
        }
        if(skyX <= (-1)*skyImage.width){
            skyX +=skyImage.width;
            System.out.println("left");
        }
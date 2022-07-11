#!/bin/bash


      ### Function is selecting 1 random char from list 
      choose() { echo ${1:RANDOM%${#1}:1} $RANDOM; }

      pass_sc (){
        
            ### Additionaly put 4 (One char per line) of required symbols in a password
            choose '!@#$%^\&'
            choose '0123456789'
            choose 'abcdefghijklmnopqrstuvwxyz'
            choose 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
            
            
            ### Loop for the choose with adding some seed to it 
          for i in $( seq 1 $(( RANDOM )) )
          do
            choose '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
            choose '!@#$%^\&'
          done
            }
         
         
            ### Simplefide version for random 
      pass(){
        for i in $( seq 1 $((4 + RANDOM % 48 )) )
          do
              choose '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
          done   
              }
      #pass_lg(){ if [[ -z $LENGTH ]] then $RANDOM}

   
   
    while getopts "c:sh" opt; do
      case $opt in
        
        c)
          LENGTH=${OPTARG}
          ;;
        s)
          pass_sc | sort -R | head -${LENGTH} | awk '{printf "%s",$1}'
          
          ;;
        h)
          echo "Usage:"
          echo "-c 'nuber of symbols' - Password Length" 
          echo "-s - Add a Special Cheracters in generated password"
          echo "Usage example:"
          echo "./passgen.sh -c 12 -s"
      
          ;;
        \?)
          echo "Invalid option: -$OPTARG" >&2
          ;;
      esac
    done
    
### Sort for randomly mixing all the stuff
### head is cut it out number of reqested chars
### (random in case flag is empty flag and awk is removing our seed)
pass | sort -R | head -${LENGTH} | awk '{printf "%s",$1}'
 echo " "
                                                                     
//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;


contract votes{
    uint private Candidate_1;
    uint private Candidate_2;
    uint private Candidate_3;
    uint private Candidate_4;
    address[] voters;

 

   
    modifier check(uint  _s){
        int correct=0;
        if(_s==1||_s==2||_s==3||_s==4){
        correct+=1;
        }
        require(correct!=0,"Invalid Option");
        _;
    }
    modifier voter(address _add)
    { 
        uint flag=0;
        for(uint i=0;i<voters.length;i++)
        {
            if(_add==voters[i])
            {
                flag+=1;
                break;
            }
        }
         
        require(flag==0,"Voter has already voted");
        _;
    } 
    
    function vote(uint Candidate_Number) external check(Candidate_Number) voter(msg.sender){
        voters.push(msg.sender);
        uint _s=Candidate_Number;
        if(_s==1)
        Candidate_1+=1;
        else if(_s==2)
        Candidate_2+=1;
        else if(_s==3)
        Candidate_3+=1;
        else 
        Candidate_4+=1;

    }

    function vote_count(uint Candidate_Number) external view check(Candidate_Number) returns(uint){
       // return(Candidate_1,Candidate_2,Candidate_3,Candidate_4);
       if(Candidate_Number==1)
       return Candidate_1;
       else if(Candidate_Number==2)
       return Candidate_2;
       else if(Candidate_Number==3)
       return Candidate_3;
       else
       return Candidate_4;
    }

}
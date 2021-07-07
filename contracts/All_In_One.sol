pragma solidity ^0.5.1;
// pragma experimental ABIEncoderV2;

contract All_In_One {
    
    // Paitent Structure here 
    
    struct paitent {           
        string name;
        string addres;
        uint256 phoneNo;
        string bloodGroup;
        uint256 insuranceCompanyId;
        uint256 emergencyContact;  
        string Precautions;
        uint256 [] treatmentId;
    }
    
    mapping (uint256 => uint256 ) entitie;
    mapping (uint256 => paitent ) p_info;
    mapping (address => uint256) addresstoId;
    mapping (uint256 => address) IdtoAdress;
    mapping(address => uint256)balancesOfMoney;
 
    
    function addPatientInfo (uint256 _adharCardNumber, string memory _name,string memory _addres,uint256 _phoneNo ,string memory _bloodGroup , uint256 _insuranceCompany, uint256 _emergencyContact) public  {
        require(entitie[_adharCardNumber]==0 && addresstoId[msg.sender]==0); 
        p_info[_adharCardNumber].name = _name;
        p_info[_adharCardNumber].addres = _addres;
        p_info[_adharCardNumber].phoneNo = _phoneNo;
        p_info[_adharCardNumber].bloodGroup = _bloodGroup;
        p_info[_adharCardNumber].insuranceCompanyId = _insuranceCompany;
        p_info[_adharCardNumber].emergencyContact = _emergencyContact;
        entitie[_adharCardNumber] = 1; 
        addresstoId[msg.sender] = _adharCardNumber;
        IdtoAdress[_adharCardNumber] = msg.sender;
    }
    
    function getPatientInfo(uint256  _adharCardNumber) public view returns(string memory name , string memory addres,uint256 phoneNo ,string memory bloodGroup , uint256 insuranceCompany, uint256 emergencyContacts,string memory Precautions){
        require(entitie[_adharCardNumber]==1 || entitie[_adharCardNumber]==2 );
        return(p_info[_adharCardNumber].name, p_info[_adharCardNumber].addres, p_info[_adharCardNumber].phoneNo, p_info[_adharCardNumber].bloodGroup, p_info[_adharCardNumber].insuranceCompanyId, p_info[_adharCardNumber].emergencyContact,p_info[_adharCardNumber].Precautions);
    }
    
    function UpdatePrecautions( uint256 _adharCardNumber,string memory _Precautions ) public {
        require(entitie[_adharCardNumber]==1);
        p_info[_adharCardNumber].Precautions = _Precautions;
    }
    
    //---------------------------------------------------------------------------------------------------------------------------------
    // Insurance is here 
    struct insuranceCompany {
        string name ;
        uint256 phoneNo;
        string [] notCovered;
    }
    
    mapping (uint256 => insuranceCompany)insu_info;
 
    function addInsurancecompany (uint256 _companyId,string memory _name, uint256 phone_no) public{
        require(entitie[_companyId]==0 && addresstoId[msg.sender]==0); 
        insu_info[_companyId].name = _name;
        insu_info[_companyId].phoneNo = phone_no;
        addresstoId[msg.sender] = _companyId;
        entitie[_companyId]=3;
        addresstoId[msg.sender] = _companyId;
        IdtoAdress[_companyId] = msg.sender;
    }
    
    function getInsuranceCompany (uint256 Insu_id) public view returns (string memory name, uint256 phoneNo){
        uint256 val = addresstoId[msg.sender];
        require(entitie[val]==1 || entitie[Insu_id]==3); 
        uint256 length = insu_info[Insu_id].notCovered.length;
        return(insu_info[Insu_id].name, insu_info[Insu_id].phoneNo);
    }
    
    function addNotCoverdMedicationInInsurance(string memory _Medication) public{
        uint256 val = addresstoId[msg.sender];
        require(entitie[val]==3); 
        insu_info[val].notCovered.push(_Medication);  
    }
    
    function applyForInsurance(uint256 _adharCardNumber) public view returns(string memory InsuranceStatus){
        uint256 val = addresstoId[msg.sender];
        require((entitie[_adharCardNumber]==1 || entitie[_adharCardNumber]==2) && (entitie[val]==1 || entitie[2]==2));
        uint256 insu_id = p_info[_adharCardNumber].insuranceCompanyId;
        uint256 latestTreatmentid = p_info[_adharCardNumber].treatmentId[p_info[_adharCardNumber].treatmentId.length-1];
        bool flag = true;
        for(uint256 j=0;j<insu_info[insu_id].notCovered.length;j++){
            if(flag!=true)
            break;
            else{
                for(uint256 i=0;i<tid[latestTreatmentid].InsuranceKeep.length;){
                        flag = false;
                        break;
                }    
            }
        }
        if(flag)
        return("success");
        //return (0x496e737572616e6365205375636365737366756c6c7920436c61696d6564);
        else
        return("fail");
        //return (0x496e737572616e636520436c61696d696e67204661696c6564);
    }
    
    //---------------------------------------------------------------------------------------------------------------------------------
    // Treatment Structure here 
    struct treatment {
        uint256 patient_id;
        uint256 doctor_id;
        string diagnosis;
        string test_conducted;
        uint256 bill;
        string medicine;
        string [] InsuranceKeep;
    }
    
    mapping(uint256=>treatment) tid;
            
    function createTreatmentID(uint256 patient_id) public returns (uint256){
        uint256 treatment_id = (142317*patient_id)%1000003;
        return treatment_id;
    }
    
    function TreatPatient(uint256 patient_id,uint256 doctor_id,string memory diagnosis,string memory test_conducted,uint256 bill,string memory medicine) public  returns (uint256){
        uint256 val = addresstoId[msg.sender];
        require(entitie[patient_id]==1 || entitie[val]==2 );
        uint256 _tid = createTreatmentID(patient_id);
        tid[_tid].patient_id = patient_id;
        tid[_tid].doctor_id = doctor_id;
        tid[_tid].diagnosis = diagnosis;
        tid[_tid].test_conducted = test_conducted;
        tid[_tid].bill = bill;
        tid[_tid].medicine = medicine;
        p_info[patient_id].treatmentId.push(_tid); // pushing treatmentId to array in treatmentId.
        return _tid;
    }
    
    function getTreatmentDetails(uint256 _tid) public view returns (uint256 p_id,uint256 d_id,string memory diagnosis,string memory test_conducted,uint256 bill,string memory medicine) {
        return (tid[_tid].patient_id,tid[_tid].doctor_id,tid[_tid].diagnosis,tid[_tid].test_conducted,tid[_tid].bill,tid[_tid].medicine);
    }
        
    function addInsuranceKeep(uint256 p_id,string memory  _medication) public {
        uint256 val = addresstoId[msg.sender];
        require(entitie[val]==2); 
        uint256 _t_id = p_info[p_id].treatmentId[p_info[p_id].treatmentId.length-1];
        tid[_t_id].InsuranceKeep.push(_medication);   
    }
    
    //---------------------------------------------------------------------------------------------------------------------------------
    //Doctor starts here
    
     struct doctor{
        uint256 doc_id;
        string name;
        string practice_type;
        string area_of_expertize;
        uint256 phone_no;
        string Address;
    }
    
    mapping(uint256=>doctor) did;
    mapping(uint256 => uint256) Otp;
    
    function addDoctor(uint256 doc_id,string memory name,string memory practice_type,string memory area_of_expertize,uint256 phone_no,string memory Address) public {
        require(entitie[doc_id]==0 || addresstoId[msg.sender]==0); 
        did[doc_id] = doctor(doc_id,name,practice_type,area_of_expertize,phone_no,Address);
        entitie[doc_id]=2;
        addresstoId[msg.sender] = doc_id;
        IdtoAdress[doc_id] = msg.sender;
    }
 
    function getDoctorDetails(uint256 _d_id) public view returns (uint256 doc_id,string memory name,string memory practice_type,string memory area_of_expertize,uint256 phone_no,string memory Address){
        uint256 val = addresstoId[msg.sender];
        require(entitie[val]==2 || entitie[val]==1 ); 
        return( did[_d_id].doc_id,did[_d_id].name,did[_d_id].practice_type,did[_d_id].area_of_expertize,did[_d_id].phone_no,did[_d_id].Address);
    }

    function requestAccessToPatient(uint256 _adharCardNumber) public returns(uint256){
           uint256 val = addresstoId[msg.sender];
           require(entitie[val]==2);
       }
       
       function getDetailsOfAllTID(uint256 _adharCardNumber, uint256 OTP) public returns(uint256){
           uint256 val = addresstoId[msg.sender];
           require(entitie[val]==2 && Otp[_adharCardNumber]==OTP);           
       }
    //---------------------------------------------------------------------------------------------------------------------------------
    //Medical store
    
    struct chemist {
        uint256 chemist_id;
        string Address;
        string name;
        uint256 phoneNo;
        string [] medicines;
    }
    
    mapping(uint256=>chemist) cid;
 
    function addChemist(uint256 chem_id,string memory Address,string memory name,uint256 phone_no) public {
        require(entitie[chem_id]==0 || addresstoId[msg.sender]==0); 
        cid[chem_id].chemist_id = chem_id;
        cid[chem_id].Address = Address;
        cid[chem_id].name = name;
        cid[chem_id].phoneNo = phone_no;
        entitie[chem_id]=4;
        addresstoId[msg.sender] = chem_id;
        IdtoAdress[chem_id] = msg.sender;
    }
    
    function getchemistinfo(uint256 chem_id) public returns(string memory Address,string memory name,uint256 phone_no){
        require(entitie[chem_id]==4 || entitie[chem_id]==1); 
        return( cid[chem_id].Address,cid[chem_id].name,cid[chem_id].phoneNo);
    }
    
    function giveMedicines(uint256 p_id) public  returns(string memory){
        uint256 val = addresstoId[msg.sender];
        string memory medicatines = tid[p_info[p_id].treatmentId[p_info[p_id].treatmentId.length-1]].medicine;
        return(medicatines);
    }
    
//--------------------------------------------------------------------------------------------------------------------------
//Identify
 
    function Identify() public returns (uint256 val) {
        uint256 No = addresstoId[msg.sender];
        if(entitie[No]==0){
            return(0);
        }
        else 
            return(entitie[No]);
    }
 
}
 
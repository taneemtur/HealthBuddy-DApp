import web3 from './web3';
const address = '0xB9Cbb55d3f170781F022B2b383F93f86900353dF';
const abi = [
	{
		"constant": false,
		"inputs": [
			{
				"name": "chem_id",
				"type": "uint256"
			},
			{
				"name": "Address",
				"type": "string"
			},
			{
				"name": "name",
				"type": "string"
			},
			{
				"name": "phone_no",
				"type": "uint256"
			}
		],
		"name": "addChemist",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "doc_id",
				"type": "uint256"
			},
			{
				"name": "name",
				"type": "string"
			},
			{
				"name": "practice_type",
				"type": "string"
			},
			{
				"name": "area_of_expertize",
				"type": "string"
			},
			{
				"name": "phone_no",
				"type": "uint256"
			},
			{
				"name": "Address",
				"type": "string"
			}
		],
		"name": "addDoctor",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_companyId",
				"type": "uint256"
			},
			{
				"name": "_name",
				"type": "string"
			},
			{
				"name": "phone_no",
				"type": "uint256"
			}
		],
		"name": "addInsurancecompany",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "p_id",
				"type": "uint256"
			},
			{
				"name": "_medication",
				"type": "string"
			}
		],
		"name": "addInsuranceKeep",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_Medication",
				"type": "string"
			}
		],
		"name": "addNotCoverdMedicationInInsurance",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_adharCardNumber",
				"type": "uint256"
			},
			{
				"name": "_name",
				"type": "string"
			},
			{
				"name": "_addres",
				"type": "string"
			},
			{
				"name": "_phoneNo",
				"type": "uint256"
			},
			{
				"name": "_bloodGroup",
				"type": "string"
			},
			{
				"name": "_insuranceCompany",
				"type": "uint256"
			},
			{
				"name": "_emergencyContact",
				"type": "uint256"
			}
		],
		"name": "addPatientInfo",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "patient_id",
				"type": "uint256"
			}
		],
		"name": "createTreatmentID",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "chem_id",
				"type": "uint256"
			}
		],
		"name": "getchemistinfo",
		"outputs": [
			{
				"name": "Address",
				"type": "string"
			},
			{
				"name": "name",
				"type": "string"
			},
			{
				"name": "phone_no",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_adharCardNumber",
				"type": "uint256"
			},
			{
				"name": "OTP",
				"type": "uint256"
			}
		],
		"name": "getDetailsOfAllTID",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "p_id",
				"type": "uint256"
			}
		],
		"name": "giveMedicines",
		"outputs": [
			{
				"name": "",
				"type": "string"
			}
		],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [],
		"name": "Identify",
		"outputs": [
			{
				"name": "val",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_adharCardNumber",
				"type": "uint256"
			}
		],
		"name": "requestAccessToPatient",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "patient_id",
				"type": "uint256"
			},
			{
				"name": "doctor_id",
				"type": "uint256"
			},
			{
				"name": "diagnosis",
				"type": "string"
			},
			{
				"name": "test_conducted",
				"type": "string"
			},
			{
				"name": "bill",
				"type": "uint256"
			},
			{
				"name": "medicine",
				"type": "string"
			}
		],
		"name": "TreatPatient",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_adharCardNumber",
				"type": "uint256"
			},
			{
				"name": "_Precautions",
				"type": "string"
			}
		],
		"name": "UpdatePrecautions",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "_adharCardNumber",
				"type": "uint256"
			}
		],
		"name": "applyForInsurance",
		"outputs": [
			{
				"name": "InsuranceStatus",
				"type": "string"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "_d_id",
				"type": "uint256"
			}
		],
		"name": "getDoctorDetails",
		"outputs": [
			{
				"name": "doc_id",
				"type": "uint256"
			},
			{
				"name": "name",
				"type": "string"
			},
			{
				"name": "practice_type",
				"type": "string"
			},
			{
				"name": "area_of_expertize",
				"type": "string"
			},
			{
				"name": "phone_no",
				"type": "uint256"
			},
			{
				"name": "Address",
				"type": "string"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "Insu_id",
				"type": "uint256"
			}
		],
		"name": "getInsuranceCompany",
		"outputs": [
			{
				"name": "name",
				"type": "string"
			},
			{
				"name": "phoneNo",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "_adharCardNumber",
				"type": "uint256"
			}
		],
		"name": "getPatientInfo",
		"outputs": [
			{
				"name": "name",
				"type": "string"
			},
			{
				"name": "addres",
				"type": "string"
			},
			{
				"name": "phoneNo",
				"type": "uint256"
			},
			{
				"name": "bloodGroup",
				"type": "string"
			},
			{
				"name": "insuranceCompany",
				"type": "uint256"
			},
			{
				"name": "emergencyContacts",
				"type": "uint256"
			},
			{
				"name": "Precautions",
				"type": "string"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "_tid",
				"type": "uint256"
			}
		],
		"name": "getTreatmentDetails",
		"outputs": [
			{
				"name": "p_id",
				"type": "uint256"
			},
			{
				"name": "d_id",
				"type": "uint256"
			},
			{
				"name": "diagnosis",
				"type": "string"
			},
			{
				"name": "test_conducted",
				"type": "string"
			},
			{
				"name": "bill",
				"type": "uint256"
			},
			{
				"name": "medicine",
				"type": "string"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	}
];
export default new web3.eth.Contract(abi, address);
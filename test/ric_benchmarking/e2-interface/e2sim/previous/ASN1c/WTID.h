/*****************************************************************************
#                                                                            *
# Copyright 2019 AT&T Intellectual Property                                  *
#                                                                            *
# Licensed under the Apache License, Version 2.0 (the "License");            *
# you may not use this file except in compliance with the License.           *
# You may obtain a copy of the License at                                    *
#                                                                            *
#      http://www.apache.org/licenses/LICENSE-2.0                            *
#                                                                            *
# Unless required by applicable law or agreed to in writing, software        *
# distributed under the License is distributed on an "AS IS" BASIS,          *
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.   *
# See the License for the specific language governing permissions and        *
# limitations under the License.                                             *
#                                                                            *
******************************************************************************/

/*
 * Generated by asn1c-0.9.29 (http://lionet.info/asn1c)
 * From ASN.1 module "X2AP-IEs"
 * 	found in "../../asnFiles/X2AP-IEs.asn"
 * 	`asn1c -fcompound-names -fincludes-quoted -fno-include-deps -findirect-choice -gen-PER -no-gen-OER -D.`
 */

#ifndef	_WTID_H_
#define	_WTID_H_


#include "asn_application.h"

/* Including external dependencies */
#include "WTID-Long-Type2.h"
#include "constr_CHOICE.h"

#ifdef __cplusplus
extern "C" {
#endif

/* Dependencies */
typedef enum WTID_PR {
	WTID_PR_NOTHING,	/* No components present */
	WTID_PR_wTID_Type1,
	WTID_PR_wTID_Type2
	/* Extensions may appear below */
	
} WTID_PR;

/* Forward declarations */
struct WTID_Type1;

/* WTID */
typedef struct WTID {
	WTID_PR present;
	union WTID_u {
		struct WTID_Type1	*wTID_Type1;
		WTID_Long_Type2_t	 wTID_Type2;
		/*
		 * This type is extensible,
		 * possible extensions are below.
		 */
	} choice;
	
	/* Context for parsing across buffer boundaries */
	asn_struct_ctx_t _asn_ctx;
} WTID_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_WTID;
extern asn_CHOICE_specifics_t asn_SPC_WTID_specs_1;
extern asn_TYPE_member_t asn_MBR_WTID_1[2];
extern asn_per_constraints_t asn_PER_type_WTID_constr_1;

#ifdef __cplusplus
}
#endif

#endif	/* _WTID_H_ */
#include "asn_internal.h"

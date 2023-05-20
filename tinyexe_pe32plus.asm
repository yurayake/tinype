BITS 64

;MS-DOSヘッダ

	dw 0x5a4d ;e_magic
	dw 0      ;e_cblp
	dw 0      ;e_cp
	dw 0      ;e_crlc
	dw 0      ;e_cparhdr
	dw 0      ;e_minalloc
	dw 0      ;e_maxalloc
	dw 0      ;e_ss
	dw 0      ;e_sp
	dw 0      ;e_csum
	dw 0      ;e_ip	
	dw 0      ;e_cs
	dw 0      ;e_lfarlc
	dw 0      ;e_ovno
	dw 0      ;e_res
	dw 0
	dw 0
	dw 0
	dw 0      ;e_oemid
	dw 0      ;e_oeminfo
	dw 0      ;e_res2
	dw 0
	dw 0
	dw 0
	dw 0
	dw 0
	dw 0
	dw 0
	dw 0
	dw 0
	dd 64     ;e_lfanew

;PEシグネチャ

	dd 0x00004550

;PEファイルヘッダ

	dw 0x8664 ;Machine
	dw 0      ;NumberOfSections
	dd 0      ;TimeDateStamp
	dd 0      ;PointerToSymbolTable
	dd 0      ;NumberOfSymbols
	dw 240    ;SizeOfOptionalHeader
	dw 0x0002 ;Characteristics

;PEオプションヘッダ

	dw 0x20b  ;Magic
	db 0      ;MajorLinkerVersion
	db 0      ;MinorLinkerVersion
	dd 0      ;SizeOfCode
	dd 0      ;SizeOfInitializedData
	dd 0      ;SizeOfUninitializedData
	dd entry  ;AddressOfEntryPoint
	dd 0      ;BaseOfCode
	dq 0x0000000040000000 ;ImageBase
	dd 1      ;SectionAlignment
	dd 1      ;FileAlignment
	dw 0      ;MajorOperatingSystemVersion
	dw 0      ;MinorOperatingSystemVersion
	dw 0      ;MajorImageVersion
	dw 0      ;MinorImageVersion
	dw 6      ;MajorSubsystemVersion
	dw 0      ;MinorSubsystemVersion
	dd 0      ;Win32VersionValue
	dd image_size    ;SizeOfImage
	dd 264    ;SizeOfHeaders
	dd 0      ;CheckSum
	dw 3      ;Subsystem
	dw 0      ;DllCharacteristics
	dq 0      ;SizeOfStackReserve
	dq 0      ;SizeOfStackCommit
	dq 0      ;SizeOfHeapReserve
	dq 0      ;SizeOfHeapCommit
	dd 0      ;LoaderFlags
	dd 16     ;NumberOfRvaAndSizes
	dq 0      ;DataDirectory
	dd import_table	  ;インポートテーブルのアドレス
	dd 20	  ;インポートテーブルのサイズ
	dq 0
	dq 0
	dq 0
	dq 0
	dq 0
	dq 0
	dq 0
	dq 0
	dq 0
	dq 0
	dd import_address_table	  ;インポートアドレステーブルのアドレス
	dd 16	  ;インポートアドレステーブルのサイズ
	dq 0
	dq 0
	dq 0

import_table:
	dd 0
	dd 0
	dd 0
	dd dll_name
	dd import_address_table

dll_name:
	db"USER32.dll", 0

import_address_table:
	dq hint_name_table
	dq 0

hint_name_table:
	dw 0
	db "MessageBoxW", 0	

entry:
	mov rcx, 0	;hwnd
	lea rdx, [rel message]	;lptext
	lea R8, [rel title]	;lpCaption
	lea R9, [0]	;uType
	jmp [rel import_address_table]

message:
	db 0x77,0x00,0x6f,0x00,0x72,0x00,0x6c,0x00,0x64,0x00,0,0

title:
	db 0x68,0x00,0x65,0x00,0x6c,0x00,0x6c,0x00,0x6f,0x00,0,0

image_size equ $-$$	

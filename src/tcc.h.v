@[translated]
module main

pub struct Section {
	data_offset    u32
	data           &u8
	data_allocated u32
	sh_name        int
	sh_num         int
	sh_type        int
	sh_flags       int
	sh_info        int
	sh_addralign   int
	sh_entsize     int
	sh_size        u32
	sh_addr        Elf64_Addr
	sh_offset      u32
	nb_hashed_syms int
	link           &Section
	reloc          &Section
	hash           &Section
	prev           &Section
	name           [1]i8
}

struct DLLReference {
	level  int
	handle voidptr
	name   [1]i8
}

struct BufferedFile {
	buf_ptr            &u8
	buf_end            &u8
	fd                 int
	prev               &BufferedFile
	line_num           int
	line_ref           int
	ifndef_macro       int
	ifndef_macro_saved int
	ifdef_stack_ptr    &int
	include_next_index int
	filename           [1024]i8
	truefilename       &i8
	unget              [4]u8
	buffer             [1]u8
}

struct TokenString {
	str           &int
	len           int
	lastlen       int
	allocated_len int
	last_line_num int
	save_line_num int
	prev          &TokenString
	prev_ptr      &int
	alloc         i8
}

struct AttributeDef {
	a            SymAttr
	f            FuncAttr
	section      &Section
	cleanup_func &Sym
	alias_target int
	asm_label    int
	attr_mode    i8
}

struct InlineFunc {
	func_str &TokenString
	sym      &Sym
	filename [1]i8
}

struct CachedInclude {
	ifndef_macro int
	once         int
	hash_next    int
	filename     [1]i8
}

struct ExprValue {
	v     u64
	sym   &Sym
	pcrel int
}

struct ASMOperand {
	id          int
	constraint  &i8
	asm_str     [16]i8
	vt          &SValue
	ref_index   int
	input_index int
	priority    int
	reg         int
	is_llong    int
	is_memory   int
	is_rw       int
}

struct Sym_attr {
	got_offset u32
	plt_offset u32
	plt_sym    int
	dyn_index  int
}

struct Filespec {
	type_ i8
	name  [1]i8
}

enum Tcc_token as u16 {
	tok_last                       = 256 - 1
	tok_int
	tok_void
	tok_char
	tok_if
	tok_else
	tok_while
	tok_break
	tok_return
	tok_for
	tok_extern
	tok_static
	tok_unsigned
	tok_goto
	tok_do
	tok_continue
	tok_switch
	tok_case
	tok_const1
	tok_const2
	tok_const3
	tok_volatile1
	tok_volatile2
	tok_volatile3
	tok_long
	tok_register
	tok_signed1
	tok_signed2
	tok_signed3
	tok_auto
	tok_inline1
	tok_inline2
	tok_inline3
	tok_restrict1
	tok_restrict2
	tok_restrict3
	tok_extension
	tok_generic
	tok_static_assert
	tok_float
	tok_double
	tok_bool
	tok_short
	tok_struct
	tok_union
	tok_typedef
	tok_default
	tok_enum
	tok_sizeof
	tok_attribute1
	tok_attribute2
	tok_alignof1
	tok_alignof2
	tok_alignof3
	tok_alignas
	tok_typeof1
	tok_typeof2
	tok_typeof3
	tok_label
	tok_asm1
	tok_asm2
	tok_asm3
	tok_define
	tok_include
	tok_include_next
	tok_ifdef
	tok_ifndef
	tok_elif
	tok_endif
	tok_defined
	tok_undef
	tok_error
	tok_warning
	tok_line
	tok_pragma
	tok___line__
	tok___file__
	tok___date__
	tok___time__
	tok___function__
	tok___va_args__
	tok___counter__
	tok___func__
	tok___nan__
	tok___snan__
	tok___inf__
	tok_section1
	tok_section2
	tok_aligned1
	tok_aligned2
	tok_packed1
	tok_packed2
	tok_weak1
	tok_weak2
	tok_alias1
	tok_alias2
	tok_unused1
	tok_unused2
	tok_cdecl1
	tok_cdecl2
	tok_cdecl3
	tok_stdcall1
	tok_stdcall2
	tok_stdcall3
	tok_fastcall1
	tok_fastcall2
	tok_fastcall3
	tok_regparm1
	tok_regparm2
	tok_cleanup1
	tok_cleanup2
	tok_mode
	tok_mode_qi
	tok_mode_di
	tok_mode_hi
	tok_mode_si
	tok_mode_word
	tok_dllexport
	tok_dllimport
	tok_nodecorate
	tok_noreturn1
	tok_noreturn2
	tok_noreturn3
	tok_visibility1
	tok_visibility2
	tok_builtin_types_compatible_p
	tok_builtin_choose_expr
	tok_builtin_constant_p
	tok_builtin_frame_address
	tok_builtin_return_address
	tok_builtin_expect
	tok_builtin_va_arg_types
	tok_pack
	tok_comment
	tok_lib
	tok_push_macro
	tok_pop_macro
	tok_once
	tok_option
	tok_memcpy
	tok_memmove
	tok_memset
	tok___divdi3
	tok___moddi3
	tok___udivdi3
	tok___umoddi3
	tok___ashrdi3
	tok___lshrdi3
	tok___ashldi3
	tok___floatundisf
	tok___floatundidf
	tok___floatundixf
	tok___fixunsxfdi
	tok___fixunssfdi
	tok___fixunsdfdi
	tok_alloca
	tok___bound_ptr_add
	tok___bound_ptr_indir1
	tok___bound_ptr_indir2
	tok___bound_ptr_indir4
	tok___bound_ptr_indir8
	tok___bound_ptr_indir12
	tok___bound_ptr_indir16
	tok___bound_main_arg
	tok___bound_local_new
	tok___bound_local_delete
	tok_strlen
	tok_strcpy
	tok_asmdir_byte
	tok_asmdir_word
	tok_asmdir_align
	tok_asmdir_balign
	tok_asmdir_p2align
	tok_asmdir_set
	tok_asmdir_skip
	tok_asmdir_space
	tok_asmdir_string
	tok_asmdir_asciz
	tok_asmdir_ascii
	tok_asmdir_file
	tok_asmdir_globl
	tok_asmdir_global
	tok_asmdir_weak
	tok_asmdir_hidden
	tok_asmdir_ident
	tok_asmdir_size
	tok_asmdir_type
	tok_asmdir_text
	tok_asmdir_data
	tok_asmdir_bss
	tok_asmdir_previous
	tok_asmdir_pushsection
	tok_asmdir_popsection
	tok_asmdir_fill
	tok_asmdir_rept
	tok_asmdir_endr
	tok_asmdir_org
	tok_asmdir_quad
	tok_asmdir_code64
	tok_asmdir_short
	tok_asmdir_long
	tok_asmdir_int
	tok_asmdir_section
	tok_asm_al
	tok_asm_cl
	tok_asm_dl
	tok_asm_bl
	tok_asm_ah
	tok_asm_ch
	tok_asm_dh
	tok_asm_bh
	tok_asm_ax
	tok_asm_cx
	tok_asm_dx
	tok_asm_bx
	tok_asm_sp
	tok_asm_bp
	tok_asm_si
	tok_asm_di
	tok_asm_eax
	tok_asm_ecx
	tok_asm_edx
	tok_asm_ebx
	tok_asm_esp
	tok_asm_ebp
	tok_asm_esi
	tok_asm_edi
	tok_asm_rax
	tok_asm_rcx
	tok_asm_rdx
	tok_asm_rbx
	tok_asm_rsp
	tok_asm_rbp
	tok_asm_rsi
	tok_asm_rdi
	tok_asm_mm0
	tok_asm_mm1
	tok_asm_mm2
	tok_asm_mm3
	tok_asm_mm4
	tok_asm_mm5
	tok_asm_mm6
	tok_asm_mm7
	tok_asm_xmm0
	tok_asm_xmm1
	tok_asm_xmm2
	tok_asm_xmm3
	tok_asm_xmm4
	tok_asm_xmm5
	tok_asm_xmm6
	tok_asm_xmm7
	tok_asm_cr0
	tok_asm_cr1
	tok_asm_cr2
	tok_asm_cr3
	tok_asm_cr4
	tok_asm_cr5
	tok_asm_cr6
	tok_asm_cr7
	tok_asm_tr0
	tok_asm_tr1
	tok_asm_tr2
	tok_asm_tr3
	tok_asm_tr4
	tok_asm_tr5
	tok_asm_tr6
	tok_asm_tr7
	tok_asm_db0
	tok_asm_db1
	tok_asm_db2
	tok_asm_db3
	tok_asm_db4
	tok_asm_db5
	tok_asm_db6
	tok_asm_db7
	tok_asm_dr0
	tok_asm_dr1
	tok_asm_dr2
	tok_asm_dr3
	tok_asm_dr4
	tok_asm_dr5
	tok_asm_dr6
	tok_asm_dr7
	tok_asm_es
	tok_asm_cs
	tok_asm_ss
	tok_asm_ds
	tok_asm_fs
	tok_asm_gs
	tok_asm_st
	tok_asm_rip
	tok_asm_spl
	tok_asm_bpl
	tok_asm_sil
	tok_asm_dil
	tok_asm_movb
	tok_asm_movw
	tok_asm_movl
	tok_asm_movq
	tok_asm_mov
	tok_asm_addb
	tok_asm_addw
	tok_asm_addl
	tok_asm_addq
	tok_asm_add
	tok_asm_orb
	tok_asm_orw
	tok_asm_orl
	tok_asm_orq
	tok_asm_or
	tok_asm_adcb
	tok_asm_adcw
	tok_asm_adcl
	tok_asm_adcq
	tok_asm_adc
	tok_asm_sbbb
	tok_asm_sbbw
	tok_asm_sbbl
	tok_asm_sbbq
	tok_asm_sbb
	tok_asm_andb
	tok_asm_andw
	tok_asm_andl
	tok_asm_andq
	tok_asm_and
	tok_asm_subb
	tok_asm_subw
	tok_asm_subl
	tok_asm_subq
	tok_asm_sub
	tok_asm_xorb
	tok_asm_xorw
	tok_asm_xorl
	tok_asm_xorq
	tok_asm_xor
	tok_asm_cmpb
	tok_asm_cmpw
	tok_asm_cmpl
	tok_asm_cmpq
	tok_asm_cmp
	tok_asm_incb
	tok_asm_incw
	tok_asm_incl
	tok_asm_incq
	tok_asm_inc
	tok_asm_decb
	tok_asm_decw
	tok_asm_decl
	tok_asm_decq
	tok_asm_dec
	tok_asm_notb
	tok_asm_notw
	tok_asm_notl
	tok_asm_notq
	tok_asm_not
	tok_asm_negb
	tok_asm_negw
	tok_asm_negl
	tok_asm_negq
	tok_asm_neg
	tok_asm_mulb
	tok_asm_mulw
	tok_asm_mull
	tok_asm_mulq
	tok_asm_mul
	tok_asm_imulb
	tok_asm_imulw
	tok_asm_imull
	tok_asm_imulq
	tok_asm_imul
	tok_asm_divb
	tok_asm_divw
	tok_asm_divl
	tok_asm_divq
	tok_asm_div
	tok_asm_idivb
	tok_asm_idivw
	tok_asm_idivl
	tok_asm_idivq
	tok_asm_idiv
	tok_asm_xchgb
	tok_asm_xchgw
	tok_asm_xchgl
	tok_asm_xchgq
	tok_asm_xchg
	tok_asm_testb
	tok_asm_testw
	tok_asm_testl
	tok_asm_testq
	tok_asm_test
	tok_asm_rolb
	tok_asm_rolw
	tok_asm_roll
	tok_asm_rolq
	tok_asm_rol
	tok_asm_rorb
	tok_asm_rorw
	tok_asm_rorl
	tok_asm_rorq
	tok_asm_ror
	tok_asm_rclb
	tok_asm_rclw
	tok_asm_rcll
	tok_asm_rclq
	tok_asm_rcl
	tok_asm_rcrb
	tok_asm_rcrw
	tok_asm_rcrl
	tok_asm_rcrq
	tok_asm_rcr
	tok_asm_shlb
	tok_asm_shlw
	tok_asm_shll
	tok_asm_shlq
	tok_asm_shl
	tok_asm_shrb
	tok_asm_shrw
	tok_asm_shrl
	tok_asm_shrq
	tok_asm_shr
	tok_asm_sarb
	tok_asm_sarw
	tok_asm_sarl
	tok_asm_sarq
	tok_asm_sar
	tok_asm_shldw
	tok_asm_shldl
	tok_asm_shldq
	tok_asm_shld
	tok_asm_shrdw
	tok_asm_shrdl
	tok_asm_shrdq
	tok_asm_shrd
	tok_asm_pushw
	tok_asm_pushl
	tok_asm_pushq
	tok_asm_push
	tok_asm_popw
	tok_asm_popl
	tok_asm_popq
	tok_asm_pop
	tok_asm_inb
	tok_asm_inw
	tok_asm_inl
	tok_asm_in
	tok_asm_outb
	tok_asm_outw
	tok_asm_outl
	tok_asm_out
	tok_asm_movzbw
	tok_asm_movzbl
	tok_asm_movzbq
	tok_asm_movzb
	tok_asm_movzwl
	tok_asm_movsbw
	tok_asm_movsbl
	tok_asm_movswl
	tok_asm_movsbq
	tok_asm_movswq
	tok_asm_movzwq
	tok_asm_movslq
	tok_asm_leaw
	tok_asm_leal
	tok_asm_leaq
	tok_asm_lea
	tok_asm_les
	tok_asm_lds
	tok_asm_lss
	tok_asm_lfs
	tok_asm_lgs
	tok_asm_call
	tok_asm_jmp
	tok_asm_lcall
	tok_asm_ljmp
	tok_asm_jo
	tok_asm_jno
	tok_asm_jb
	tok_asm_jc
	tok_asm_jnae
	tok_asm_jnb
	tok_asm_jnc
	tok_asm_jae
	tok_asm_je
	tok_asm_jz
	tok_asm_jne
	tok_asm_jnz
	tok_asm_jbe
	tok_asm_jna
	tok_asm_jnbe
	tok_asm_ja
	tok_asm_js
	tok_asm_jns
	tok_asm_jp
	tok_asm_jpe
	tok_asm_jnp
	tok_asm_jpo
	tok_asm_jl
	tok_asm_jnge
	tok_asm_jnl
	tok_asm_jge
	tok_asm_jle
	tok_asm_jng
	tok_asm_jnle
	tok_asm_jg
	tok_asm_seto
	tok_asm_setno
	tok_asm_setb
	tok_asm_setc
	tok_asm_setnae
	tok_asm_setnb
	tok_asm_setnc
	tok_asm_setae
	tok_asm_sete
	tok_asm_setz
	tok_asm_setne
	tok_asm_setnz
	tok_asm_setbe
	tok_asm_setna
	tok_asm_setnbe
	tok_asm_seta
	tok_asm_sets
	tok_asm_setns
	tok_asm_setp
	tok_asm_setpe
	tok_asm_setnp
	tok_asm_setpo
	tok_asm_setl
	tok_asm_setnge
	tok_asm_setnl
	tok_asm_setge
	tok_asm_setle
	tok_asm_setng
	tok_asm_setnle
	tok_asm_setg
	tok_asm_setob
	tok_asm_setnob
	tok_asm_setbb
	tok_asm_setcb
	tok_asm_setnaeb
	tok_asm_setnbb
	tok_asm_setncb
	tok_asm_setaeb
	tok_asm_seteb
	tok_asm_setzb
	tok_asm_setneb
	tok_asm_setnzb
	tok_asm_setbeb
	tok_asm_setnab
	tok_asm_setnbeb
	tok_asm_setab
	tok_asm_setsb
	tok_asm_setnsb
	tok_asm_setpb
	tok_asm_setpeb
	tok_asm_setnpb
	tok_asm_setpob
	tok_asm_setlb
	tok_asm_setngeb
	tok_asm_setnlb
	tok_asm_setgeb
	tok_asm_setleb
	tok_asm_setngb
	tok_asm_setnleb
	tok_asm_setgb
	tok_asm_cmovo
	tok_asm_cmovno
	tok_asm_cmovb
	tok_asm_cmovc
	tok_asm_cmovnae
	tok_asm_cmovnb
	tok_asm_cmovnc
	tok_asm_cmovae
	tok_asm_cmove
	tok_asm_cmovz
	tok_asm_cmovne
	tok_asm_cmovnz
	tok_asm_cmovbe
	tok_asm_cmovna
	tok_asm_cmovnbe
	tok_asm_cmova
	tok_asm_cmovs
	tok_asm_cmovns
	tok_asm_cmovp
	tok_asm_cmovpe
	tok_asm_cmovnp
	tok_asm_cmovpo
	tok_asm_cmovl
	tok_asm_cmovnge
	tok_asm_cmovnl
	tok_asm_cmovge
	tok_asm_cmovle
	tok_asm_cmovng
	tok_asm_cmovnle
	tok_asm_cmovg
	tok_asm_bsfw
	tok_asm_bsfl
	tok_asm_bsfq
	tok_asm_bsf
	tok_asm_bsrw
	tok_asm_bsrl
	tok_asm_bsrq
	tok_asm_bsr
	tok_asm_btw
	tok_asm_btl
	tok_asm_btq
	tok_asm_bt
	tok_asm_btsw
	tok_asm_btsl
	tok_asm_btsq
	tok_asm_bts
	tok_asm_btrw
	tok_asm_btrl
	tok_asm_btrq
	tok_asm_btr
	tok_asm_btcw
	tok_asm_btcl
	tok_asm_btcq
	tok_asm_btc
	tok_asm_larw
	tok_asm_larl
	tok_asm_larq
	tok_asm_lar
	tok_asm_lslw
	tok_asm_lsll
	tok_asm_lslq
	tok_asm_lsl
	tok_asm_fadd
	tok_asm_faddp
	tok_asm_fadds
	tok_asm_fiaddl
	tok_asm_faddl
	tok_asm_fiadds
	tok_asm_fmul
	tok_asm_fmulp
	tok_asm_fmuls
	tok_asm_fimull
	tok_asm_fmull
	tok_asm_fimuls
	tok_asm_fcom
	tok_asm_fcom_1
	tok_asm_fcoms
	tok_asm_ficoml
	tok_asm_fcoml
	tok_asm_ficoms
	tok_asm_fcomp
	tok_asm_fcompp
	tok_asm_fcomps
	tok_asm_ficompl
	tok_asm_fcompl
	tok_asm_ficomps
	tok_asm_fsub
	tok_asm_fsubp
	tok_asm_fsubs
	tok_asm_fisubl
	tok_asm_fsubl
	tok_asm_fisubs
	tok_asm_fsubr
	tok_asm_fsubrp
	tok_asm_fsubrs
	tok_asm_fisubrl
	tok_asm_fsubrl
	tok_asm_fisubrs
	tok_asm_fdiv
	tok_asm_fdivp
	tok_asm_fdivs
	tok_asm_fidivl
	tok_asm_fdivl
	tok_asm_fidivs
	tok_asm_fdivr
	tok_asm_fdivrp
	tok_asm_fdivrs
	tok_asm_fidivrl
	tok_asm_fdivrl
	tok_asm_fidivrs
	tok_asm_xaddb
	tok_asm_xaddw
	tok_asm_xaddl
	tok_asm_xaddq
	tok_asm_xadd
	tok_asm_cmpxchgb
	tok_asm_cmpxchgw
	tok_asm_cmpxchgl
	tok_asm_cmpxchgq
	tok_asm_cmpxchg
	tok_asm_cmpsb
	tok_asm_cmpsw
	tok_asm_cmpsl
	tok_asm_cmpsq
	tok_asm_cmps
	tok_asm_scmpb
	tok_asm_scmpw
	tok_asm_scmpl
	tok_asm_scmpq
	tok_asm_scmp
	tok_asm_insb
	tok_asm_insw
	tok_asm_insl
	tok_asm_ins
	tok_asm_outsb
	tok_asm_outsw
	tok_asm_outsl
	tok_asm_outs
	tok_asm_lodsb
	tok_asm_lodsw
	tok_asm_lodsl
	tok_asm_lodsq
	tok_asm_lods
	tok_asm_slodb
	tok_asm_slodw
	tok_asm_slodl
	tok_asm_slodq
	tok_asm_slod
	tok_asm_movsb
	tok_asm_movsw
	tok_asm_movsl
	tok_asm_movsq
	tok_asm_movs
	tok_asm_smovb
	tok_asm_smovw
	tok_asm_smovl
	tok_asm_smovq
	tok_asm_smov
	tok_asm_scasb
	tok_asm_scasw
	tok_asm_scasl
	tok_asm_scasq
	tok_asm_scas
	tok_asm_sscab
	tok_asm_sscaw
	tok_asm_sscal
	tok_asm_sscaq
	tok_asm_ssca
	tok_asm_stosb
	tok_asm_stosw
	tok_asm_stosl
	tok_asm_stosq
	tok_asm_stos
	tok_asm_sstob
	tok_asm_sstow
	tok_asm_sstol
	tok_asm_sstoq
	tok_asm_ssto
	tok_asm_clc
	tok_asm_cld
	tok_asm_cli
	tok_asm_clts
	tok_asm_cmc
	tok_asm_lahf
	tok_asm_sahf
	tok_asm_pushfq
	tok_asm_popfq
	tok_asm_pushf
	tok_asm_popf
	tok_asm_stc
	tok_asm_std
	tok_asm_sti
	tok_asm_aaa
	tok_asm_aas
	tok_asm_daa
	tok_asm_das
	tok_asm_aad
	tok_asm_aam
	tok_asm_cbw
	tok_asm_cwd
	tok_asm_cwde
	tok_asm_cdq
	tok_asm_cbtw
	tok_asm_cwtl
	tok_asm_cwtd
	tok_asm_cltd
	tok_asm_cqto
	tok_asm_int3
	tok_asm_into
	tok_asm_iret
	tok_asm_rsm
	tok_asm_hlt
	tok_asm_wait
	tok_asm_nop
	tok_asm_pause
	tok_asm_xlat
	tok_asm_lock
	tok_asm_rep
	tok_asm_repe
	tok_asm_repz
	tok_asm_repne
	tok_asm_repnz
	tok_asm_invd
	tok_asm_wbinvd
	tok_asm_cpuid
	tok_asm_wrmsr
	tok_asm_rdtsc
	tok_asm_rdmsr
	tok_asm_rdpmc
	tok_asm_syscall
	tok_asm_sysret
	tok_asm_ud2
	tok_asm_leave
	tok_asm_ret
	tok_asm_retq
	tok_asm_lret
	tok_asm_fucompp
	tok_asm_ftst
	tok_asm_fxam
	tok_asm_fld1
	tok_asm_fldl2t
	tok_asm_fldl2e
	tok_asm_fldpi
	tok_asm_fldlg2
	tok_asm_fldln2
	tok_asm_fldz
	tok_asm_f2xm1
	tok_asm_fyl2x
	tok_asm_fptan
	tok_asm_fpatan
	tok_asm_fxtract
	tok_asm_fprem1
	tok_asm_fdecstp
	tok_asm_fincstp
	tok_asm_fprem
	tok_asm_fyl2xp1
	tok_asm_fsqrt
	tok_asm_fsincos
	tok_asm_frndint
	tok_asm_fscale
	tok_asm_fsin
	tok_asm_fcos
	tok_asm_fchs
	tok_asm_fabs
	tok_asm_fninit
	tok_asm_fnclex
	tok_asm_fnop
	tok_asm_fwait
	tok_asm_fxch
	tok_asm_fnstsw
	tok_asm_emms
	tok_asm_sysretq
	tok_asm_ljmpw
	tok_asm_ljmpl
	tok_asm_enter
	tok_asm_loopne
	tok_asm_loopnz
	tok_asm_loope
	tok_asm_loopz
	tok_asm_loop
	tok_asm_jecxz
	tok_asm_fld
	tok_asm_fldl
	tok_asm_flds
	tok_asm_fildl
	tok_asm_fildq
	tok_asm_fildll
	tok_asm_fldt
	tok_asm_fbld
	tok_asm_fst
	tok_asm_fstl
	tok_asm_fsts
	tok_asm_fstps
	tok_asm_fstpl
	tok_asm_fist
	tok_asm_fistp
	tok_asm_fistl
	tok_asm_fistpl
	tok_asm_fstp
	tok_asm_fistpq
	tok_asm_fistpll
	tok_asm_fstpt
	tok_asm_fbstp
	tok_asm_fucom
	tok_asm_fucomp
	tok_asm_finit
	tok_asm_fldcw
	tok_asm_fnstcw
	tok_asm_fstcw
	tok_asm_fstsw
	tok_asm_fclex
	tok_asm_fnstenv
	tok_asm_fstenv
	tok_asm_fldenv
	tok_asm_fnsave
	tok_asm_fsave
	tok_asm_frstor
	tok_asm_ffree
	tok_asm_ffreep
	tok_asm_fxsave
	tok_asm_fxrstor
	tok_asm_fxsaveq
	tok_asm_fxrstorq
	tok_asm_arpl
	tok_asm_lgdt
	tok_asm_lgdtq
	tok_asm_lidt
	tok_asm_lidtq
	tok_asm_lldt
	tok_asm_lmsw
	tok_asm_ltr
	tok_asm_sgdt
	tok_asm_sgdtq
	tok_asm_sidt
	tok_asm_sidtq
	tok_asm_sldt
	tok_asm_smsw
	tok_asm_str
	tok_asm_verr
	tok_asm_verw
	tok_asm_swapgs
	tok_asm_bswap
	tok_asm_bswapl
	tok_asm_bswapq
	tok_asm_invlpg
	tok_asm_cmpxchg8b
	tok_asm_cmpxchg16b
	tok_asm_fcmovb
	tok_asm_fcmove
	tok_asm_fcmovbe
	tok_asm_fcmovu
	tok_asm_fcmovnb
	tok_asm_fcmovne
	tok_asm_fcmovnbe
	tok_asm_fcmovnu
	tok_asm_fucomi
	tok_asm_fcomi
	tok_asm_fucomip
	tok_asm_fcomip
	tok_asm_movd
	tok_asm_packssdw
	tok_asm_packsswb
	tok_asm_packuswb
	tok_asm_paddb
	tok_asm_paddw
	tok_asm_paddd
	tok_asm_paddsb
	tok_asm_paddsw
	tok_asm_paddusb
	tok_asm_paddusw
	tok_asm_pand
	tok_asm_pandn
	tok_asm_pcmpeqb
	tok_asm_pcmpeqw
	tok_asm_pcmpeqd
	tok_asm_pcmpgtb
	tok_asm_pcmpgtw
	tok_asm_pcmpgtd
	tok_asm_pmaddwd
	tok_asm_pmulhw
	tok_asm_pmullw
	tok_asm_por
	tok_asm_psllw
	tok_asm_pslld
	tok_asm_psllq
	tok_asm_psraw
	tok_asm_psrad
	tok_asm_psrlw
	tok_asm_psrld
	tok_asm_psrlq
	tok_asm_psubb
	tok_asm_psubw
	tok_asm_psubd
	tok_asm_psubsb
	tok_asm_psubsw
	tok_asm_psubusb
	tok_asm_psubusw
	tok_asm_punpckhbw
	tok_asm_punpckhwd
	tok_asm_punpckhdq
	tok_asm_punpcklbw
	tok_asm_punpcklwd
	tok_asm_punpckldq
	tok_asm_pxor
	tok_asm_movups
	tok_asm_movaps
	tok_asm_movhps
	tok_asm_addps
	tok_asm_cvtpi2ps
	tok_asm_cvtps2pi
	tok_asm_cvttps2pi
	tok_asm_divps
	tok_asm_maxps
	tok_asm_minps
	tok_asm_mulps
	tok_asm_pavgb
	tok_asm_pavgw
	tok_asm_pmaxsw
	tok_asm_pmaxub
	tok_asm_pminsw
	tok_asm_pminub
	tok_asm_rcpss
	tok_asm_rsqrtps
	tok_asm_sqrtps
	tok_asm_subps
	tok_asm_prefetchnta
	tok_asm_prefetcht0
	tok_asm_prefetcht1
	tok_asm_prefetcht2
	tok_asm_prefetchw
	tok_asm_lfence
	tok_asm_mfence
	tok_asm_sfence
	tok_asm_clflush
}

@[weak]
__global (
	gnu_ext int
)

@[weak]
__global (
	tcc_ext int
)

@[weak]
__global (
	tcc_state &TCCState
)

@[weak]
__global (
	file &BufferedFile
)

@[weak]
__global (
	ch int
)

@[weak]
__global (
	tok int
)

@[weak]
__global (
	tokc CValue
)

@[weak]
__global (
	macro_ptr &int
)

@[weak]
__global (
	parse_flags int
)

@[weak]
__global (
	tok_flags int
)

@[weak]
__global (
	tokcstr CString
)

@[weak]
__global (
	total_lines int
)

@[weak]
__global (
	total_bytes int
)

@[weak]
__global (
	tok_ident int
)

@[weak]
__global (
	table_ident &&TokenSym
)

fn is_space(ch int) int {
	return ch == ` ` || ch == `\x09` || ch == `\x0b` || ch == `\x0c` || ch == `\x0a`
}

fn isid(c int) int {
	return (c >= `a` && c <= `z`) || (c >= `A` && c <= `Z`) || c == `_`
}

fn isnum(c int) int {
	return c >= `0` && c <= `9`
}

fn isoct(c int) int {
	return c >= `0` && c <= `7`
}

fn toup(c int) int {
	return if (c >= `a` && c <= `z`) { c - `a` + `A` } else { c }
}

@[weak]
__global (
	sym_free_first &Sym
)

@[weak]
__global (
	sym_pools &voidptr
)

@[weak]
__global (
	nb_sym_pools int
)

@[weak]
__global (
	global_stack &Sym
)

@[weak]
__global (
	local_stack &Sym
)

@[weak]
__global (
	local_label_stack &Sym
)

@[weak]
__global (
	global_label_stack &Sym
)

@[weak]
__global (
	define_stack &Sym
)

@[weak]
__global (
	char_pointer_type CType
)

@[weak]
__global (
	func_old_type CType
)

@[weak]
__global (
	int_type CType
)

@[weak]
__global (
	size_type CType
)

@[weak]
__global (
	__vstack [257]SValue
)

@[weak]
__global (
	vtop &SValue
)

@[weak]
__global (
	pvtop &SValue
)

@[weak]
__global (
	rsym int
)

@[weak]
__global (
	anon_sym int
)

@[weak]
__global (
	ind int
)

@[weak]
__global (
	loc int
)

@[weak]
__global (
	const_wanted int
)

@[weak]
__global (
	nocode_wanted int
)

@[weak]
__global (
	global_expr int
)

@[weak]
__global (
	func_vt CType
)

@[weak]
__global (
	func_var int
)

@[weak]
__global (
	func_vc int
)

@[weak]
__global (
	last_line_num int
)

@[weak]
__global (
	last_ind int
)

@[weak]
__global (
	func_ind int
)

@[weak]
__global (
	funcname &i8
)

@[weak]
__global (
	g_debug int
)

struct Stab_Sym {
	n_strx  u32
	n_type  u8
	n_other u8
	n_desc  u16
	n_value u32
}

@[weak]
__global (
	text_section &Section
)

@[weak]
__global (
	data_section &Section
)

@[weak]
__global (
	bss_section &Section
)

@[weak]
__global (
	common_section &Section
)

@[weak]
__global (
	cur_text_section &Section
)

@[weak]
__global (
	last_text_section &Section
)

@[weak]
__global (
	bounds_section &Section
)

@[weak]
__global (
	lbounds_section &Section
)

fn tccelf_bounds_new(s &TCCState)

@[weak]
__global (
	symtab_section &Section
)

@[weak]
__global (
	stab_section &Section
)

@[weak]
__global (
	stabstr_section &Section
)

enum Gotplt_entry {
	no_gotplt_entry
	build_got_only
	auto_gotplt_entry
	always_gotplt_entry
}

@[weak]
__global (
	reg_classes [25]int
)

fn read16le(p &u8) u16 {
	return p[0] | u16(p[1]) << 8
}

fn write16le(p &u8, x u16) {
	p[0] = x & 255
	p[1] = x >> 8 & 255
}

fn read32le(p &u8) u32 {
	return read16le(p) | u32(read16le(p + 2)) << 16
}

fn write32le(p &u8, x u32) {
	write16le(p, x)
	write16le(p + 2, x >> 16)
}

fn add32le(p &u8, x int) {
	write32le(p, read32le(p) + x)
}

fn read64le(p &u8) u64 {
	return read32le(p) | u64(read32le(p + 4)) << 32
}

fn write64le(p &u8, x u64) {
	write32le(p, x)
	write32le(p + 4, x >> 32)
}

fn add64le(p &u8, x i64) {
	write64le(p, read64le(p) + x)
}

@[weak]
__global (
	rt_num_callers int
)

@[weak]
__global (
	rt_bound_error_msg &&u8
)

@[weak]
__global (
	rt_prog_main voidptr
)
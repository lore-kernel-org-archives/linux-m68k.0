Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2096C6FD1D
	for <linux-m68k@archiver.kernel.org>; Wed, 22 Mar 2023 01:39:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbjCVBi7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 21 Mar 2023 21:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjCVBi6 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 21 Mar 2023 21:38:58 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D4E51ACFD
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Mar 2023 18:38:45 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id CB0535C010F;
        Tue, 21 Mar 2023 21:38:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 21 Mar 2023 21:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1679449113; x=1679535513; bh=28iTrOxGZLknK
        21rfhrGQLQr9y5rOLCQcw5qVzDwZxg=; b=gLP+9x/OUgG0Dr6nYBB6QAccgTPiX
        dn/awhavym6rxTMLUpFkNHgjpnr2/zqWt7/qYIYZ0T3XGnuGWWBMd+3DEZT5ibb2
        tx3C3e7lCBXwSq5nshk2GLyVrNT7wleCFw3M2M0p1beM1AhCTT0xPfQnp/E3GWoJ
        B77VG74UBBTNXfap6IGS5tcmVX90LADlDoaMM0VJvZMklqF5YbNxc4af3F8AXFww
        i6InD3HlwfcJKL2fIEniPbya3bvzyjiUi9nScXuT8/zurco2K+SecsfjUrax9tDz
        8faIXYcgIdxWIlIqPMIvVMZ62po1npaX2qHIEZ/95pBr+/vrQ7MIlVkoA==
X-ME-Sender: <xms:GVwaZKGpqmGogc55IdbAl0ZzfiGKVnOGQm7Jcs3yBv03AVqRGlI0LA>
    <xme:GVwaZLX7cjCAAK8Zx_df8cu-71QOZCl7lzNYfbgXwSthA-f3VDLfg94jiF659huCF
    xgpyEpttViYDwQZGMc>
X-ME-Received: <xmr:GVwaZEIiVucOSGOfIAKWRX2vR1YfoN2OLX-sxwxQtm2etH1qwNyhnV0SDUG95l4bAac9lszGQSTXt1fi9M9rO0fZh7Katk50T6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeguddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvufgjkfhfgggtsehttdertd
    dttddvnecuhfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidq
    mheikehkrdhorhhgqeenucggtffrrghtthgvrhhnpeeiveejgfekueelveeulefggeefhf
    fhffefkeetvdeiueefjeeuieehjeetvdelfeenucffohhmrghinhepghhnuhdrohhrghdp
    uggvsghirghnrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:GVwaZEFOL_jMRx_0OjZfch7ieTl-9j-Q59TUzkrbugeBgW9t1I4LGQ>
    <xmx:GVwaZAV8ouoh3I1o5iJ5XBOaekaLpqh44xvHposODdspJBkwysze3Q>
    <xmx:GVwaZHPoHQ50dtZtWAtTpLg7fmsETfhnlsPZxA2idxklTGIv3W5bQA>
    <xmx:GVwaZDAQFeWUTja0mlkkcX4hnUlzoAu2FSTFXRMO4036heEU-R54dg>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 21:38:30 -0400 (EDT)
Date:   Wed, 22 Mar 2023 12:41:24 +1100 (AEDT)
From:   Finn Thain <fthain@linux-m68k.org>
To:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: gdb failure: "core file format not supported"
In-Reply-To: <fa0774b8-3ed2-8b87-defd-17fbb492922f@linux-m68k.org>
Message-ID: <ca000c1c-899a-fa5a-90f5-d44682e54740@linux-m68k.org>
References: <fa0774b8-3ed2-8b87-defd-17fbb492922f@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

[Cc: linux-m68k]

On Fri, 10 Mar 2023, I wrote:

> root@panmac:~# gdb --core core.0
> GNU gdb (Debian 13.1-2) 13.1
> Copyright (C) 2023 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later 
> <http://gnu.org/licenses/gpl.html>
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.
> Type "show copying" and "show warranty" for details.
> This GDB was configured as "m68k-linux-gnu".
> Type "show configuration" for configuration details.
> For bug reporting instructions, please see:
> <https://www.gnu.org/software/gdb/bugs/>.
> Find the GDB manual and other documentation resources online at:
>     <http://www.gnu.org/software/gdb/documentation/>.
> 
> For help, type "help".
> Type "apropos word" to search for commands related to "word".
> "/root/core.0": Core file format not supported
> (gdb) quit


I was able to run gdb under gdb to get a few hints. Here's the error 
message:


  if (!m_core_gdbarch
      || !gdbarch_iterate_over_regset_sections_p (m_core_gdbarch))
    error (_("\"%s\": Core file format not supported"),
	   bfd_get_filename (core_bfd));


And the reason for the message:


bool
gdbarch_iterate_over_regset_sections_p (struct gdbarch *gdbarch)
{
  gdb_assert (gdbarch != NULL);
  return gdbarch->iterate_over_regset_sections != NULL;
}


So gdbarch->iterate_over_regset_sections == NULL somehow:


(gdb) print *m_core_gdbarch
$3 = {initialized_p = true, obstack = {<obstack> = {chunk_size = 4064, 
      chunk = 0x8092bf80, object_base = 0x8092bfb8 "", 
      next_free = 0x8092bfb8 "", chunk_limit = 0x8092cf60 "", temp = {
        i = 853591194, p = 0x32e0c49a}, alignment_mask = 1, chunkfun = {
        plain = 0x800791d8 <xmalloc(size_t)>, 
        extra = 0x800791d8 <xmalloc(size_t)>}, freefun = {
        plain = 0x8007b5d2 <xfree<void>(void*)>, 
        extra = 0x8007b5d2 <xfree<void>(void*)>}, extra_arg = 0x3300c49a, 
      use_extra_arg = 0, maybe_empty_object = 0, 
      alloc_failed = 0}, <No data fields>}, registry_fields = {
    m_fields = std::vector of length 23, capacity 23 = {0x0, 0x0, 0x0, 0x0, 
      0x8090b608, 0x8090b5f8, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 
      0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}}, 
  bfd_arch_info = 0x80795aae <bfd_m68k_arch>, byte_order = BFD_ENDIAN_BIG, 
  byte_order_for_code = BFD_ENDIAN_BIG, osabi = GDB_OSABI_SVR4, 
  target_desc = 0x0, tdep = 0x808e7fb0, 
  dump_tdep = 0x8028c242 <m68k_dump_tdep(gdbarch*, ui_file*)>, nr_data = 0, 
  data = 0x0, short_bit = 16, int_bit = 32, long_bit = 32, long_long_bit = 64, 
  bfloat16_bit = 16, bfloat16_format = 0x807b545a <floatformats_bfloat16>, 
  half_bit = 16, half_format = 0x807b54ba <floatformats_ieee_half>, 
  float_bit = 32, float_format = 0x807b54b2 <floatformats_ieee_single>, 
  double_bit = 64, double_format = 0x807b54aa <floatformats_ieee_double>, 
  long_double_bit = 96, 
  long_double_format = 0x807b548a <floatformats_m68881_ext>, wchar_bit = 32, 
  wchar_signed = 1, 
  floatformat_for_type = 0x8007d812 <default_floatformat_for_type(gdbarch*, char const*, int)>, ptr_bit = 32, addr_bit = 32, dwarf2_addr_size = 4, 
  char_signed = 1, read_pc = 0x0, write_pc = 0x0, 
  virtual_frame_pointer = 0x8007f5c2 <legacy_virtual_frame_pointer(gdbarch*, unsigned long long, int*, long long*)>, pseudo_register_read = 0x0, 
  pseudo_register_read_value = 0x0, pseudo_register_write = 0x0, 
  num_regs = 29, num_pseudo_regs = 0, ax_pseudo_register_collect = 0x0, 
  ax_pseudo_register_push_stack = 0x0, report_signal_info = 0x0, 
  sp_regnum = 15, pc_regnum = 17, ps_regnum = 16, fp0_regnum = 18, 
  stab_reg_to_regnum = 0x8007b4ba <no_op_reg_to_regnum(gdbarch*, int)>, 
  ecoff_reg_to_regnum = 0x8007b4ba <no_op_reg_to_regnum(gdbarch*, int)>, 
  sdb_reg_to_regnum = 0x8007b4ba <no_op_reg_to_regnum(gdbarch*, int)>, 
  dwarf2_reg_to_regnum = 0x8028c298 <m68k_dwarf_reg_to_regnum(gdbarch*, int)>, 
  register_name = 0x8028c248 <m68k_register_name(gdbarch*, int)>, 
  register_type = 0x8028ca62 <m68k_register_type(gdbarch*, int)>, 
  dummy_id = 0x8028e526 <m68k_dummy_id(gdbarch*, frame_info_ptr)>, 
  deprecated_fp_regnum = -1, 
  push_dummy_call = 0x8028c838 <m68k_push_dummy_call(gdbarch*, value*, regcache*, CORE_ADDR, int, value**, CORE_ADDR, function_call_return_method, CORE_ADDR)>, call_dummy_location = AT_ENTRY_POINT, push_dummy_code = 0x0, 
  code_of_frame_writable = 0x8007b4a2 <default_code_of_frame_writable(gdbarch*, frame_info_ptr)>, 
  print_registers_info = 0x8022edfc <default_print_registers_info(gdbarch*, ui_file*, frame_info_ptr, int, int)>, 
  print_float_info = 0x8022f840 <default_print_float_info(gdbarch*, ui_file*, frame_info_ptr, char const*)>, print_vector_info = 0x0, 
  register_sim_regno = 0x8007f228 <legacy_register_sim_regno(gdbarch*, int)>, 
  cannot_fetch_register = 0x8007b4dc <cannot_register_not(gdbarch*, int)>, 
  cannot_store_register = 0x8007b4dc <cannot_register_not(gdbarch*, int)>, 
  get_longjmp_target = 0x0, believe_pcc_promotion = 1, 
  convert_register_p = 0x8028cd58 <m68k_convert_register_p(gdbarch*, int, type*)>, 
  register_to_value = 0x8028e926 <m68k_register_to_value(frame_info_ptr, int, type*, gdb_byte*, int*, int*)>, 
  value_to_register = 0x8028e700 <m68k_value_to_register(frame_info_ptr, int, type*, gdb_byte const*)>, 
  value_from_register = 0x801f5370 <default_value_from_register(gdbarch*, type*, int, frame_id)>, 
  pointer_to_address = 0x801f5092 <unsigned_pointer_to_address(gdbarch*, type*, unsigned char const*)>, 
  address_to_pointer = 0x801f50ee <unsigned_address_to_pointer(gdbarch*, type*, unsigned char*, unsigned long long)>, integer_to_address = 0x0, 
  return_value = 0x8028c04a <m68k_svr4_return_value(gdbarch*, value*, type*, regcache*, gdb_byte*, gdb_byte const*)>, 
  get_return_buf_addr = 0x8007b50e <default_get_return_buf_addr(type*, frame_info_ptr)>, 
  return_in_first_hidden_param_p = 0x8028bc3c <m68k_return_in_first_hidden_param_p(gdbarch*, type*)>, 
  skip_prologue = 0x8028c7e2 <m68k_skip_prologue(gdbarch*, CORE_ADDR)>, 
  skip_main_prologue = 0x0, skip_entrypoint = 0x0, 
  inner_than = 0x8007b984 <core_addr_lessthan(unsigned long long, unsigned long long)>, 
  breakpoint_from_pc = 0x80081c1c <default_breakpoint_from_pc(gdbarch*, unsigned long long*, int*)>, 
  breakpoint_kind_from_pc = 0x8028bc56 <bp_manipulation<2, &m68k_break_insn>::kind_from_pc(gdbarch*, CORE_ADDR*)>, 
  sw_breakpoint_from_kind = 0x8028bc5a <bp_manipulation<2, &m68k_break_insn>::bp_from_kind(gdbarch*, int, int*)>, 
  breakpoint_kind_from_current_state = 0x80081b28 <default_breakpoint_kind_from_current_state(gdbarch*, regcache*, unsigned long long*)>, 
  adjust_breakpoint_address = 0x0, 
  memory_insert_breakpoint = 0x802a5ba4 <default_memory_insert_breakpoint(gdbarch*, bp_target_info*)>, 
  memory_remove_breakpoint = 0x802a5c34 <default_memory_remove_breakpoint(gdbarch*, bp_target_info*)>, decr_pc_after_break = 0, 
  deprecated_function_start_offset = 0, 
  remote_register_number = 0x8007b770 <default_remote_register_number(gdbarch*, int)>, fetch_tls_load_module_address = 0x0, get_thread_local_address = 0x0, 
  frame_args_skip = 8, 
  unwind_pc = 0x8028e442 <m68k_unwind_pc(gdbarch*, frame_info_ptr)>, 
  unwind_sp = 0x801fa23c <default_unwind_sp(gdbarch*, frame_info_ptr)>, 
  frame_num_args = 0x0, 
  frame_align = 0x8028bc30 <m68k_frame_align(gdbarch*, CORE_ADDR)>, 
  stabs_argument_has_addr = 0x8007b4e4 <default_stabs_argument_has_addr(gdbarch*, type*)>, frame_red_zone_size = 0, 
  convert_from_func_ptr_addr = 0x8007b4b0 <convert_from_func_ptr_addr_identity(gdbarch*, unsigned long long, target_ops*)>, 
  addr_bits_remove = 0x8007b4a6 <core_addr_identity(gdbarch*, unsigned long long)>, 
  remove_non_address_bits = 0x8007b756 <default_remove_non_address_bits(gdbarch*, unsigned long long)>, 
  memtag_to_string = 0x8007b514 <default_memtag_to_string[abi:cxx11](gdbarch*, value*)>, 
  tagged_address_p = 0x8007b47c <default_tagged_address_p(gdbarch*, value*)>, 
  memtag_matches_p = 0x8007b480 <default_memtag_matches_p(gdbarch*, value*)>, 
  set_memtags = 0x8007b484 <default_set_memtags(gdbarch*, value*, unsigned int, std::vector<unsigned char, gdb::default_init_allocator<unsigned char, std::allocator<unsigned char> > > const&, memtag_type)>, 
  get_memtag = 0x8007b488 <default_get_memtag(gdbarch*, value*, memtag_type)>, 
  memtag_granule_size = 0, software_single_step = 0x0, 
  single_step_through_delay = 0x0, 
  print_insn = 0x8007b696 <default_print_insn(unsigned long, disassemble_info*)>, 
  skip_trampoline_code = 0x8007b48e <generic_skip_trampoline_code(frame_info_ptr, unsigned long long)>, so_ops = 0x80791610 <solib_target_so_ops>, 
  skip_solib_resolver = 0x8007b494 <generic_skip_solib_resolver(gdbarch*, unsigned long long)>, 
  in_solib_return_trampoline = 0x8007b49a <generic_in_solib_return_trampoline(gdbarch*, unsigned long long, char const*)>, 
  in_indirect_branch_thunk = 0x8007b502 <default_in_indirect_branch_thunk(gdbarch*, unsigned long long)>, 
  stack_frame_destroyed_p = 0x8007b49e <generic_stack_frame_destroyed_p(gdbarch*, unsigned long long)>, elf_make_msymbol_special = 0x0, 
  coff_make_msymbol_special = 0x8007b4c0 <default_coff_make_msymbol_special(int, minimal_symbol*)>, 
  make_symbol_special = 0x8007b4c2 <default_make_symbol_special(symbol*, objfile*)>, 
  adjust_dwarf2_addr = 0x8007b4c4 <default_adjust_dwarf2_addr(unsigned long long)>, 
  adjust_dwarf2_line = 0x8007b4ce <default_adjust_dwarf2_line(unsigned long long, int)>, cannot_step_breakpoint = 0, have_nonsteppable_watchpoint = 0, 
  address_class_type_flags = 0x0, address_class_type_flags_to_name = 0x0, 
  execute_dwarf_cfa_vendor_op = 0x8007b4d8 <default_execute_dwarf_cfa_vendor_op(gdbarch*, unsigned char, dwarf2_frame_state*)>, 
  address_class_name_to_type_flags = 0x0, 
  register_reggroup_p = 0x80351864 <default_register_reggroup_p(gdbarch*, int, reggroup const*)>, fetch_pointer_argument = 0x0, 
  iterate_over_regset_sections = 0x0, make_corefile_notes = 0x0, 
  find_memory_regions = 0x0, create_memtag_section = 0x0, 
  fill_memtag_section = 0x0, decode_memtag_section = 0x0, 
  core_xfer_shared_libraries = 0x0, core_xfer_shared_libraries_aix = 0x0, 
  core_pid_to_str = 0x0, core_thread_name = 0x0, core_xfer_siginfo = 0x0, 
  gcore_bfd_target = 0x0, vtable_function_descriptors = 0, vbit_in_delta = 0, 
  skip_permanent_breakpoint = 0x80081932 <default_skip_permanent_breakpoint(regcache*)>, max_insn_length = 0, displaced_step_copy_insn = 0x0, 
  displaced_step_hw_singlestep = 0x80083572 <default_displaced_step_hw_singlestep(gdbarch*)>, displaced_step_fixup = 0x0, displaced_step_prepare = 0x0, 
  displaced_step_finish = 0x0, displaced_step_copy_insn_closure_by_addr = 0x0, 
  displaced_step_restore_all_in_ptid = 0x0, relocate_instruction = 0x0, 
  overlay_update = 0x0, core_read_description = 0x0, 
  sofun_address_maybe_missing = 0, process_record = 0x0, 
  process_record_signal = 0x0, gdb_signal_from_target = 0x0, 
  gdb_signal_to_target = 0x0, get_siginfo_type = 0x0, 
  record_special_symbol = 0x0, get_syscall_number = 0x0, 
  xml_syscall_file = 0x0, syscalls_info = 0x0, stap_integer_prefixes = 0x0, 
  stap_integer_suffixes = 0x0, stap_register_prefixes = 0x0, 
  stap_register_suffixes = 0x0, stap_register_indirection_prefixes = 0x0, 
  stap_register_indirection_suffixes = 0x0, stap_gdb_register_prefix = 0x0, 
  stap_gdb_register_suffix = 0x0, stap_is_single_operand = 0x0, 
  stap_parse_special_token = 0x0, stap_adjust_register = 0x0, 
  dtrace_parse_probe_argument = 0x0, dtrace_probe_is_enabled = 0x0, 
  dtrace_enable_probe = 0x0, dtrace_disable_probe = 0x0, 
  has_global_solist = 0, has_global_breakpoints = 0, 
  has_shared_address_space = 0x8007b4e8 <default_has_shared_address_space(gdbarch*)>, 
  fast_tracepoint_valid_at = 0x8007b4ec <default_fast_tracepoint_valid_at(gdbarch*, unsigned long long, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*)>, 
  guess_tracepoint_registers = 0x8007eb92 <default_guess_tracepoint_registers(gdbarch*, regcache*, unsigned long long)>, 
  auto_charset = 0x800f3e5a <default_auto_charset()>, 
  auto_wide_charset = 0x800f3e74 <default_auto_wide_charset()>, 
  solib_symbols_extension = 0x0, has_dos_based_file_system = 0, 
  gen_return_address = 0x8007b534 <default_gen_return_address(gdbarch*, agent_expr*, axs_value*, unsigned long long)>, info_proc = 0x0, core_info_proc = 0x0, 
  iterate_over_objfiles_in_search_order = 0x802d77dc <default_iterate_over_objfiles_in_search_order(gdbarch*, gdb::function_view<bool (objfile*)>, objfile*)>, 
  ravenscar_ops = 0x0, 
  insn_is_call = 0x8007b760 <default_insn_is_call(gdbarch*, unsigned long long)>, 
  insn_is_ret = 0x8007b764 <default_insn_is_ret(gdbarch*, unsigned long long)>, 
  insn_is_jump = 0x8007b768 <default_insn_is_jump(gdbarch*, unsigned long long)>, 
  program_breakpoint_here_p = 0x800819a2 <default_program_breakpoint_here_p(gdbarch*, unsigned long long)>, auxv_parse = 0x0, 
  print_auxv_entry = 0x80096fda <default_print_auxv_entry(gdbarch*, ui_file*, unsigned long long, unsigned long long)>, 
  vsyscall_range = 0x8007b76c <default_vsyscall_range(gdbarch*, mem_range*)>, 
  infcall_mmap = 0x8007b554 <default_infcall_mmap(unsigned long long, unsigned int)>, 
  infcall_munmap = 0x8007b500 <default_infcall_munmap(unsigned long long, unsigned long long)>, 
  gcc_target_options = 0x8007dbbe <default_gcc_target_options[abi:cxx11](gdbarch*)>, gnu_triplet_regexp = 0x8007ce2e <default_gnu_triplet_regexp(gdbarch*)>, 
  addressable_memory_unit_size = 0x8007ce42 <default_addressable_memory_unit_size(gdbarch*)>, disassembler_options_implicit = 0x0, disassembler_options = 0x0, 
  valid_disassembler_options = 0x0, 
  type_align = 0x8007b506 <default_type_align(gdbarch*, type*)>, 
  get_pc_address_flags = 0x8007b776 <default_get_pc_address_flags[abi:cxx11](frame_info_ptr, unsigned long long)>, 
  read_core_file_mappings = 0x8007b50c <default_read_core_file_mappings(gdbarch*, bfd*, gdb::function_view<void (unsigned long long)>, gdb::function_view<void (int, unsigned long long, unsigned long long, unsigned long long, char const*, bfd_build_id const*)>)>}
(gdb) 
(gdb) 


But it should get initialized in m68k_linux_init_abi()...

https://sources.debian.org/src/gdb/13.1-2/gdb/m68k-linux-tdep.c/?hl=385#L385


  set_gdbarch_skip_trampoline_code (gdbarch, find_solib_trampoline_target);

  /* Core file support. */
  set_gdbarch_iterate_over_regset_sections
    (gdbarch, m68k_linux_iterate_over_regset_sections);


Yet somehow iterate_over_regset_sections ends up NULL.

I could not see why that happened so I built the current upstream snapshot 
(at the time), gdb-14.0.50.20230316. That took a few attempts and a couple 
of days of building, but it has the same problem:

# /opt/gdb-14.0.50.20230316/bin/gdb
GNU gdb (GDB) 14.0.50.20230316-git
Copyright (C) 2023 Free Software Foundation, Inc.
...
(gdb) core ~/core.0
"/root/core.0": Core file format not supported
(gdb)

I guess the next step will be a formal bug report.

From: fthain@telegraphics.com.au
Subject: Re: toolchain, was Re: bogl: don't know screen type 1
Date: Mon, 14 Sep 2009 20:37:58 +1000 (EST)
Message-ID: <alpine.LNX.2.00.0909141827440.25347@nippy.intranet>
References: <8259f0250908302028n9b0cb56td402539007736fce@mail.gmail.com> <20090831120617.GA1114@marenka.net> <8259f0250908310558l3ddd5fam7d15946a7c1e8572@mail.gmail.com> <8259f0250908311511h77270544vb2dc3dd383f1add8@mail.gmail.com>
 <8259f0250908311516r49e54c7fi44ead0f040cade30@mail.gmail.com> <20090901151747.GB27514@marenka.net> <alpine.OSX.2.00.0909050045330.383@silk.local> <4AA2684E.1080009@codesourcery.com> <alpine.LNX.2.00.0909122039160.6219@nippy.intranet>
 <4AAC7CB6.2060400@codesourcery.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:37518 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751050AbZINKiH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 14 Sep 2009 06:38:07 -0400
In-Reply-To: <4AAC7CB6.2060400@codesourcery.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Maxim Kuvyrkov <maxim@codesourcery.com>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org


On Sun, 13 Sep 2009, Maxim Kuvyrkov wrote:

> fthain@telegraphics.com.au wrote:
>
> > On Sat, 5 Sep 2009, Maxim Kuvyrkov wrote:
> > 
> > > Finn Thain wrote: ...
> > > 
> > > > I understand that the current GCC (4.4) lacks the necessary 
> > > > patches, and 4.5 is still uncooked (and that's a scary prospect). 
> > > > Can someone confirm that this is the necessary patch for 4.4: 
> > > > http://gcc.gnu.org/ml/gcc-patches/2009-05/msg01024.html
> > > I think GCC 4.4 should be good enough.
> > 
> > I tried patching 4.4.1 and the patch was rejected. It expects 
> > m68k_legitimize_address() to have been declared and defined, but that 
> > routine isn't in gcc-4.4.
> 
> m68k.c:m68k_legitimize_address() was macro m68k.h:LEGITIMIZE_ADDRESS(), 
> you need to move the hunk to m68k.h.
> 

Thanks for the tip.

Here's a second cut. This one removes the m68k_tls_symbol_p() routine and 
inlines that logic in the LEGITIMIZE_ADDRESS macro (avoids a reference to 
m68k_tls_symbol_p() from explow.o). The TARGET_HAVE_TLS macro wasn't 
defined in explow.c so I changed it to HAVE_AS_TLS.

It appears to work, but I won't be able to test any binary produced by 
this compiler for a week or so.

Finn


--- gcc-m68k-support-for-tls.patch	2009-09-14 15:11:39.893286532 +1000
+++ gcc-m68k-support-for-tls-backport.patch	2009-09-14 15:11:34.563287784 +1000
@@ -574,13 +574,7 @@
  
  enum reg_class regno_reg_class[] =
  {
-@@ -143,11 +144,13 @@ static tree m68k_handle_fndecl_attribute
- static void m68k_compute_frame_layout (void);
- static bool m68k_save_reg (unsigned int regno, bool interrupt_handler);
- static bool m68k_ok_for_sibcall_p (tree, tree);
-+static bool m68k_tls_symbol_p (rtx);
- static rtx m68k_legitimize_address (rtx, rtx, enum machine_mode);
- static bool m68k_rtx_costs (rtx, int, int, int *, bool);
+@@ -146,6 +147,7 @@ static tree m68k_handle_fndecl_attribute
  #if M68K_HONOR_TARGET_STRICT_ALIGNMENT
  static bool m68k_return_in_memory (const_tree, const_tree);
  #endif
@@ -613,16 +607,6 @@
        && crtl->uses_pic_offset_table)
      insn = emit_insn (gen_load_got (pic_offset_table_rtx));
  }
-@@ -1431,6 +1441,9 @@ m68k_legitimize_sibcall_address (rtx x)
- rtx
- m68k_legitimize_address (rtx x, rtx oldx, enum machine_mode mode)
- {
-+  if (m68k_tls_symbol_p (x))
-+    return m68k_legitimize_tls_address (x);
-+
-   if (GET_CODE (x) == PLUS)
-     {
-       int ch = (x) != (oldx);
 @@ -1849,7 +1862,7 @@ m68k_illegitimate_symbolic_constant_p (r
  	  && !offset_within_block_p (base, INTVAL (offset)))
  	return true;
@@ -957,7 +941,7 @@
  	return orig;
  
        gcc_assert (reg);
-@@ -2196,13 +2421,257 @@ legitimize_pic_address (rtx orig, enum m
+@@ -2196,13 +2421,244 @@ legitimize_pic_address (rtx orig, enum m
  				     base == reg ? 0 : reg);
  
        if (GET_CODE (orig) == CONST_INT)
@@ -1164,19 +1148,6 @@
 +  return orig;
 +}
 +
-+/* Return true if X is a TLS symbol.  */
-+
-+static bool
-+m68k_tls_symbol_p (rtx x)
-+{
-+  if (!TARGET_HAVE_TLS)
-+    return false;
-+
-+  if (GET_CODE (x) != SYMBOL_REF)
-+    return false;
-+
-+  return SYMBOL_REF_TLS_MODEL (x) != 0;
-+}
 +
 +/* Helper for m68k_tls_referenced_p.  */
 +
@@ -1414,6 +1385,18 @@
  
  #define REG_OK_FOR_BASE_P(X) \
    m68k_legitimate_base_reg_p (X, REG_STRICT_P)
+@@ -777,7 +778,10 @@ __transfer_from_trampoline ()					\
+ #define COPY_ONCE(Y) if (!copied) { Y = copy_rtx (Y); copied = ch = 1; }
+ #define LEGITIMIZE_ADDRESS(X,OLDX,MODE,WIN)   \
+ { register int ch = (X) != (OLDX);					\
+-  if (GET_CODE (X) == PLUS)						\
++  if (HAVE_AS_TLS && (GET_CODE (X) == SYMBOL_REF) &&			\
++      (SYMBOL_REF_TLS_MODEL (X) != 0))					\
++    m68k_legitimize_tls_address (X);					\
++  else if (GET_CODE (X) == PLUS)					\
+     { int copied = 0;							\
+       if (GET_CODE (XEXP (X, 0)) == MULT)				\
+ 	{ COPY_ONCE (X); XEXP (X, 0) = force_operand (XEXP (X, 0), 0);} \
 @@ -974,6 +975,9 @@ do { if (cc_prev_status.flags & CC_IN_68
    assemble_name ((FILE), (NAME)),		\
    fprintf ((FILE), ",%u\n", (int)(ROUNDED)))

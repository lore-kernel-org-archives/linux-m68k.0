From: fthain@telegraphics.com.au
Subject: Re: toolchain, was Re: bogl: don't know screen type 1
Date: Sun, 13 Sep 2009 13:38:11 +1000 (EST)
Message-ID: <alpine.LNX.2.00.0909122039160.6219@nippy.intranet>
References: <8259f0250908302028n9b0cb56td402539007736fce@mail.gmail.com> <20090831120617.GA1114@marenka.net> <8259f0250908310558l3ddd5fam7d15946a7c1e8572@mail.gmail.com> <8259f0250908311511h77270544vb2dc3dd383f1add8@mail.gmail.com>
 <8259f0250908311516r49e54c7fi44ead0f040cade30@mail.gmail.com> <20090901151747.GB27514@marenka.net> <alpine.OSX.2.00.0909050045330.383@silk.local> <4AA2684E.1080009@codesourcery.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
In-Reply-To: <4AA2684E.1080009@codesourcery.com>
Resent-Message-ID: <Q7XzCbSssPI.A.9BG.AlGrKB@liszt>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
To: Maxim Kuvyrkov <maxim@codesourcery.com>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org
List-Id: linux-m68k@vger.kernel.org


On Sat, 5 Sep 2009, Maxim Kuvyrkov wrote:

> Finn Thain wrote:
> ...
> 
> > I understand that the current GCC (4.4) lacks the necessary patches, 
> > and 4.5 is still uncooked (and that's a scary prospect). Can someone 
> > confirm that this is the necessary patch for 4.4: 
> > http://gcc.gnu.org/ml/gcc-patches/2009-05/msg01024.html
> 
> I think GCC 4.4 should be good enough.

I tried patching 4.4.1 and the patch was rejected. It expects 
m68k_legitimize_address() to have been declared and defined, but that 
routine isn't in gcc-4.4.

So, I edited the patch (see diff below). What bothers me is that this 
removes the call to the new m68k_tls_symbol_p() routine:

../../gcc-4.4.1/gcc/config/m68k/m68k.c: At top level:
../../gcc-4.4.1/gcc/config/m68k/m68k.c:2553: warning: 'm68k_tls_symbol_p' defined but not used

The compiler appears to work, but I haven't run any executable it produced 
as yet. When we get eglibc-2.10 I plan to run the testsuites on '040 
hardware, which is going to take a long time to complete. It would be nice 
to know in advance whether this naive attempt at a backport is likely to 
work or not (?)

Finn



--- gcc-m68k-support-for-tls.patch	2009-09-13 13:16:03.475546800 +1000
+++ gcc-m68k-support-for-tls-backport.patch	2009-09-13 13:16:03.475546800 +1000
@@ -574,12 +574,11 @@
  
  enum reg_class regno_reg_class[] =
  {
-@@ -143,11 +144,13 @@ static tree m68k_handle_fndecl_attribute
+@@ -143,10 +144,12 @@ static tree m68k_handle_fndecl_attribute
  static void m68k_compute_frame_layout (void);
  static bool m68k_save_reg (unsigned int regno, bool interrupt_handler);
  static bool m68k_ok_for_sibcall_p (tree, tree);
 +static bool m68k_tls_symbol_p (rtx);
- static rtx m68k_legitimize_address (rtx, rtx, enum machine_mode);
  static bool m68k_rtx_costs (rtx, int, int, int *, bool);
  #if M68K_HONOR_TARGET_STRICT_ALIGNMENT
  static bool m68k_return_in_memory (const_tree, const_tree);
@@ -613,16 +612,6 @@
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

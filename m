From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Add private syscalls to support NPTL
Date: Fri, 6 Nov 2009 19:38:36 +1100 (EST)
Message-ID: <alpine.OSX.2.00.0911052033380.497@silk.local>
References: <4A89D037.7090807@codesourcery.com> <m27hx2um3t.fsf@igel.home>  <4A8A54F9.3080100@codesourcery.com> <m3d46tpmue.fsf@hase.home>  <4A8A6CA2.4040806@codesourcery.com> <10f740e80908180222p4d95b19bp3069e037a6bc590e@mail.gmail.com> <4A91A4C8.5040803@codesourcery.com>
 <4A943ECC.80607@codesourcery.com> <4A97B69F.4000306@codesourcery.com> <4AC5CF12.8000200@codesourcery.com> <4AE5B9B7.7000106@codesourcery.com> <alpine.OSX.2.00.0910281209160.394@silk.local> <4AE7EAC2.8050409@codesourcery.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="0-709259303-1257471501=:398"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:58506 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754933AbZKFIib (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 6 Nov 2009 03:38:31 -0500
In-Reply-To: <4AE7EAC2.8050409@codesourcery.com>
Content-ID: <alpine.OSX.2.00.0911061239520.398@silk.local>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Maxim Kuvyrkov <maxim@codesourcery.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-709259303-1257471501=:398
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
Content-ID: <alpine.OSX.2.00.0911061239521.398@silk.local>


On Wed, 28 Oct 2009, Maxim Kuvyrkov wrote:

>...
> 
> We [CodeSourcery] have just updated all of our toolchains, and the 
> GNU/Linux toolchain is based on EGLIBC 2.10 and has well tested TLS/NPTL 
> support.  If you are targeting ColdFire you can simply download the 
> toolchain at <http://www.codesourcery.com/sgpp/lite/coldfire>.
> 
> > I suppose you can't really backport to eglibc 2.10 until the siginfo 
> > question is resolved. It appears from the list traffic that the 
> > consensus is to adopt the generic struct layout here. Is that the 
> > solution that you've used in testing?
> 
> I'm not sure if any parts of the m68k kernel port depend on the custom 
> layout of siginfo, so I've only fixed the pieces which I'm sure are 
> wrong.  I.e, I've been testing with this 
> <http://marc.info/?l=linux-m68k&m=125447365311948&w=2> patch.
> 
> > If so, can you send the patches you been testing?
> 
> All the patches are in the mailing lists.
> 
> The kernel patches are at
> 
> http://marc.info/?l=linux-m68k&m=125447760017098&w=2 

For the benefit of anyone playing along at home, I found that the first 
attachment ("patch.diff") is already merged in the second attachment
 of the same message ("0001-Add-NPTL-support-for-m68k.patch").

> http://marc.info/?l=linux-m68k&m=125447365311948&w=2
> 
> The [E]GLIBC patches are at
> 
> [M68K/ColdFire patch 1/n] Update sysdep.h 
> http://sourceware.org/ml/libc-ports/2009-08/msg00006.html
>
> [M68K/ColdFire patch 2/n] Add CFI information to dl-trampoline.S 
> http://sourceware.org/ml/libc-ports/2009-08/msg00007.html
> 
> [M68K/ColdFire patch 3/n] Update jmpbuf-unwind.h 
> http://sourceware.org/ml/libc-ports/2009-08/msg00008.html
> 
> [M68K/ColdFire patch 4/n] Remove kernel headers
> Update by hand to match your kernel

I suppose I don't need to remove or update anything, since I build eglibc 
against fresh new kernel headers, from linux-2.6.31 patched with your TLS 
patches.

> [M68K/ColdFire patch 5/n] Main NPTL patch 
> http://sourceware.org/ml/libc-ports/2009-10/msg00006.html

For the benefit of anyone else attempting this, the first patch in that 
email ("Don't bind rtld's vdso pointers to libc symbols") is merged into 
the second patch in the same email ("Nptl support for m68k/ColdFire").

I did run into a problem with this second patch. It doesn't apply to the 
eglibc_2.10 branch in svn as of yesterday. The following hunk is the 
problem:

--- a/sysdeps/unix/sysv/linux/m68k/Versions
+++ b/sysdeps/unix/sysv/linux/m68k/Versions
@@ -31,5 +31,17 @@ libc {
   }
   GLIBC_2.11 {
     fallocate64;
+    __m68k_read_tp;
+  }
+  GLIBC_PRIVATE {
+    __vdso_atomic_cmpxchg_32; __vdso_atomic_barrier;
+  }
+}
+
+ld {
+  GLIBC_PRIVATE {
+    __rtld___vdso_read_tp;
+    __rtld___vdso_atomic_cmpxchg_32;
+    __rtld___vdso_atomic_barrier;
   }
 }

It appears that another patch is needed, to allow your patch to apply:
  http://sourceware.org/ml/libc-ports/2009-05/msg00028.html
And probably this patch too (I used both):
  http://sourceware.org/ml/libc-hacker/2009-05/msg00003.html

Should I be using any other patches?

> http://sourceware.org/ml/libc-ports/2009-10/msg00030.html
>
> [M68K/ColdFire patch 6/n] Add TLS relocations to elf/elf.h
> http://sourceware.org/ml/libc-ports/2009-08/msg00012.html

(Trap for the uwary: this patch is for eglibc/libc, the others are for 
eglibc/ports.)

> Should I post this one to glibc-alpha@ for the review?
>
> [M68K/ColdFire patch 7/n] Handle libgcc_s.so.2
> http://sourceware.org/bugzilla/show_bug.cgi?id=4457

The two patches attached to that bug are already in the eglibc_2.10 
branch, BTW.

> 
> Let me know if you find any particular problems with these patches.
> 

Using the above patches, I am almost able to compile eglibc_2.10. But 
there is an old build failure (since glibc-2.4 I think) when linking 
libc.so:

/tmp/build/glibc-m68k-linux-gnu-3/libc_pic.os: In function `fchownat': (.text+0x911c2): undefined reference to `__atfct_seterrno'
/tmp/gcc-4.4.1/lib/gcc/m68k-linux-gnu/4.4.1/../../../../m68k-linux-gnu/bin/ld: /tmp/build/glibc-m68k-linux-gnu-3/libc.so: hidden symbol `__atfct_seterrno' isn't defined
/tmp/gcc-4.4.1/lib/gcc/m68k-linux-gnu/4.4.1/../../../../m68k-linux-gnu/bin/ld: final link failed: Nonrepresentable section on output
collect2: ld returned 1 exit status
make[1]: *** [/tmp/build/glibc-m68k-linux-gnu-3/libc.so] Error 1
make[1]: Leaving directory `/tmp/build/glibc-2.10.1'
make: *** [all] Error 2

To try to fix this issue, I've basically copied this patch:
  http://sources.redhat.com/ml/libc-hacker/2006-08/msg00004.html
An m68k version is attached. Can someone have a look at it and tell 
whether this is the correct fix or not?

The end result is that I now have a NPTL/TLS m68k toolchain 
(binutils-2.19.51 and patched gcc-4.4.1). Thank you for making that 
possible. I've not run the test suites yet, but so far it seems to work.

Only, I did find that a statically linked binary (pccardctl) built with 
this toolchain segfaults ("unknown errorSegmentation fault") when run 
under a linux-2.6.31 kernel that lacks your patches. Is this expected?

Etch-m68k seems to run fine with or without the kernel patches. I've CC'd 
the debian-m68k list but I suppose they can't use any of this until both 
the siginfo ABI is resolved and eglibc passes its tests on m68k 
hardware.

Finn
--0-709259303-1257471501=:398
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII; NAME=glibc-2.5-m68k-fchownat.patch
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.OSX.2.00.0911061242500.398@silk.local>
Content-Description: 
Content-Disposition: ATTACHMENT; FILENAME=glibc-2.5-m68k-fchownat.patch

DQotLS0gZ2xpYmMtMi41L3BvcnRzL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4
L202OGsvZmNob3duYXQuYy5vcmlnCTIwMDctMDktMTggMDA6MjU6MzkuMDAw
MDAwMDAwICsxMDAwDQorKysgZ2xpYmMtMi41L3BvcnRzL3N5c2RlcHMvdW5p
eC9zeXN2L2xpbnV4L202OGsvZmNob3duYXQuYwkyMDA3LTA5LTE4IDAwOjM4
OjIxLjAwMDAwMDAwMCArMTAwMA0KQEAgLTQwLDYgKzQwLDI0IEBADQogaW50
DQogZmNob3duYXQgKGludCBmZCwgY29uc3QgY2hhciAqZmlsZSwgdWlkX3Qg
b3duZXIsIGdpZF90IGdyb3VwLCBpbnQgZmxhZykNCiB7DQorICBpbnQgcmVz
dWx0Ow0KKw0KKyNpZmRlZiBfX05SX2ZjaG93bmF0DQorIyBpZm5kZWYgX19B
U1NVTUVfQVRGQ1RTDQorICBpZiAoX19oYXZlX2F0ZmN0cyA+PSAwKQ0KKyMg
ZW5kaWYNCisgICAgew0KKyAgICAgIHJlc3VsdCA9IElOTElORV9TWVNDQUxM
IChmY2hvd25hdCwgNSwgZmQsIGZpbGUsIG93bmVyLCBncm91cCwgZmxhZyk7
DQorIyBpZm5kZWYgX19BU1NVTUVfQVRGQ1RTDQorICAgICAgaWYgKHJlc3Vs
dCA9PSAtMSAmJiBlcnJubyA9PSBFTk9TWVMpDQorCV9faGF2ZV9hdGZjdHMg
PSAtMTsNCisgICAgICBlbHNlDQorIyBlbmRpZg0KKwlyZXR1cm4gcmVzdWx0
Ow0KKyAgICB9DQorI2VuZGlmDQorDQorI2lmbmRlZiBfX0FTU1VNRV9BVEZD
VFMNCiAgIGlmIChmbGFnICYgfkFUX1NZTUxJTktfTk9GT0xMT1cpDQogICAg
IHsNCiAgICAgICBfX3NldF9lcnJubyAoRUlOVkFMKTsNCkBAIC02NiwxOCAr
ODQsMTcgQEANCiAgICAgICBmaWxlID0gYnVmOw0KICAgICB9DQogDQotICBp
bnQgcmVzdWx0Ow0KICAgSU5URVJOQUxfU1lTQ0FMTF9ERUNMIChlcnIpOw0K
IA0KLSNpZiBfX0FTU1VNRV8zMkJJVFVJRFMgPiAwDQorIyBpZiBfX0FTU1VN
RV8zMkJJVFVJRFMgPiAwDQogICBpZiAoZmxhZyAmIEFUX1NZTUxJTktfTk9G
T0xMT1cpDQogICAgIHJlc3VsdCA9IElOVEVSTkFMX1NZU0NBTEwgKGxjaG93
bjMyLCBlcnIsIDMsIENIRUNLX1NUUklORyAoZmlsZSksIG93bmVyLA0KIAkJ
CSAgICAgICBncm91cCk7DQogICBlbHNlDQogICAgIHJlc3VsdCA9IElOVEVS
TkFMX1NZU0NBTEwgKGNob3duMzIsIGVyciwgMywgQ0hFQ0tfU1RSSU5HIChm
aWxlKSwgb3duZXIsDQogCQkJICAgICAgIGdyb3VwKTsNCi0jZWxzZQ0KLSMg
aWZkZWYgX19OUl9jaG93bjMyDQorIyBlbHNlDQorIyAgaWZkZWYgX19OUl9j
aG93bjMyDQogICBpZiAoX19saWJjX21pc3NpbmdfMzJiaXRfdWlkcyA8PSAw
KQ0KICAgICB7DQogICAgICAgaWYgKGZsYWcgJiBBVF9TWU1MSU5LX05PRk9M
TE9XKQ0KQEAgLTk0LDcgKzExMSw3IEBADQogDQogICAgICAgX19saWJjX21p
c3NpbmdfMzJiaXRfdWlkcyA9IDE7DQogICAgIH0NCi0jIGVuZGlmIC8qIF9f
TlJfY2hvd24zMiAqLw0KKyMgIGVuZGlmIC8qIF9fTlJfY2hvd24zMiAqLw0K
IA0KICAgaWYgKCgob3duZXIgKyAxKSA+IChnaWRfdCkgKChfX2tlcm5lbF91
aWRfdCkgLTFVKSkNCiAgICAgICB8fCAoKGdyb3VwICsgMSkgPiAoZ2lkX3Qp
ICgoX19rZXJuZWxfZ2lkX3QpIC0xVSkpKQ0KQEAgLTEwOSw3ICsxMjYsNyBA
QA0KICAgZWxzZQ0KICAgICByZXN1bHQgPSBJTlRFUk5BTF9TWVNDQUxMIChj
aG93biwgZXJyLCAzLCBDSEVDS19TVFJJTkcgKGZpbGUpLCBvd25lciwNCiAJ
CQkgICAgICAgZ3JvdXApOw0KLSNlbmRpZg0KKyMgZW5kaWYNCiANCiAgIGlm
IChfX2J1aWx0aW5fZXhwZWN0IChJTlRFUk5BTF9TWVNDQUxMX0VSUk9SX1Ag
KHJlc3VsdCwgZXJyKSwgMCkpDQogICAgIHsNCkBAIC0xMTcsNiArMTM0LDcg
QEANCiAgICAgICBfX2F0ZmN0X3NldGVycm5vIChJTlRFUk5BTF9TWVNDQUxM
X0VSUk5PIChyZXN1bHQsIGVyciksIGZkLCBidWYpOw0KICAgICAgIHJlc3Vs
dCA9IC0xOw0KICAgICB9DQorI2VuZGlmDQogDQogICByZXR1cm4gcmVzdWx0
Ow0KIH0NCg==

--0-709259303-1257471501=:398--

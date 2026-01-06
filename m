Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBB6342539
	for <linux-m68k@vger.kernel.org>; Tue,  6 Jan 2026 15:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767713916; cv=none; b=X4mfNkpvozYlilYyjkp+0BssLahCIDjYALUAyZiM6kRuIW58qAiFMmFbzqYbX/XkIV+Qg1g3nqxjDoHhMHQCxYOuamZsliGi39gtUArXq5s8zmnodWTef2T35cyPsIUBpYy37gUTwpv6M8B5ebIC1Q3U6ZYliqqSi+YPriwyqME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767713916; c=relaxed/simple;
	bh=Ci5nnmKvk0ZddaOm1+B46F3EbPaIzL9yFAiuWkKdM3o=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=cON+aXahSJOsM45k+zbAIXmWZXKV5wCjjev0H8dMiBl4hCzY2PumPMYZi8v8PHEqXRsygKvOmYf2gmz+87fsJUWZ5063cnlwnfX9Uo5ZzdFOBFFwVtphm4WKhcT+VWeHscZ1D57s4opcsa3MScotqUJLUBw9Xgxpy+H7HgU2OiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=sIVWDLzx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vePj8q9Z; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="sIVWDLzx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vePj8q9Z"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 24BFF1D0012D;
	Tue,  6 Jan 2026 10:38:21 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 06 Jan 2026 10:38:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767713900;
	 x=1767800300; bh=FvxQDmm8B28/Owm/kwRuOlWRCe5+7VU1xOHDsHgJs+U=; b=
	sIVWDLzxst7nQTC83Xf4TTZzEDoGZwV6X1+RmW/NZgodLyhEMPQlPJwcOEhSHXqk
	JPJAky2ctcC+tNxDRn4fMTQbRCLWaxc7dkl8HwZ3TfSwCbTvJcSokZrSjGBOc7LU
	k14WzxPlRvJHcxMEagF8P4Ds7lyo7XTQpkTI7Kt1jAlt5gdbbnLYEMZWrDfpEqtL
	0cc+Wpq9OPnyT/9VoS8mI2fDO0esrampY32lb4kBi1tSW7m/sa7OGUZwbjPETdeU
	NQTN4t9kJd8smSK9Y1HOVEOoSTJjj+aeZ7TAgakCRrVplk8iyt1Qmdc9Bah62IRF
	1f0CHIPMMfSOcrh7rPcCDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767713900; x=
	1767800300; bh=FvxQDmm8B28/Owm/kwRuOlWRCe5+7VU1xOHDsHgJs+U=; b=v
	ePj8q9ZRo2Dn3FuPQoHBmTSKhe3ZrZfxxoBP0fCL8ieqgaJHllrjT3noVT7RJlQl
	CkAkxuLe87BRMdY6v7E2B3LHlCGzX7KGf++OKtuit1dQW+aMr1ubMaa/E2iKEac6
	guJ2un2w02xYoktIhhn30aT/EQ6Zo9oqETacqb6QmOyqDKNAP5YaxUO4gpj2v09/
	IQNglcUIGJhsEpLAbtBRheLypSHJSoGGe/UVhLtART60bH5VP4Elk0ZI1sWYw4rz
	nmZqV/1UUosLPPib4XBh6Z9A1PxObR6rVwrth82vdnXqedJbV7bXp69rLr+i5NoS
	joM+uBOPwwEVbgKBn2Q5Q==
X-ME-Sender: <xms:bCxdabOiNIn3gDhrHArg6b3l4-8Lz6SRAgdQI6EbmRbsg8F7V-g8qw>
    <xme:bCxdaQzsKMg8r_EIntBeP7nbfmrO4SijF8WfPRIUYN79aIkgSPTgJmREAnC6QSJjR
    Zn-s8vmGk5VkbB_QI9B3enqnLIqCoBJAg6wSsMcPBFyFO5WEoVlR7E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutddtheejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepkeekkedtvedtuddvtdfhgfejudevheefleetfeeklefffeffveduheelkeektdet
    necuffhomhgrihhnpehgvghnthhoohdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhmie
    ekkheskhholhhlrgdrnhhopdhrtghpthhtohepthhhohhmrghsrdifvghishhsshgthhhu
    hheslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqd
    hmieekkhdrohhrghdprhgtphhtthhopeguvggsihgrnhdqieekkheslhhishhtshdruggv
    sghirghnrdhorhhgpdhrtghpthhtohepphhorhhtqdhmieekkhesnhgvthgsshgurdhorh
    hgpdhrtghpthhtohepghhlrghusghithiisehphhihshhikhdrfhhuqdgsvghrlhhinhdr
    uggvpdhrtghpthhtoheplhhinhhugidqmheikehksehvghgvrhdrkhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:bCxdacxQhzIqNxYmn17ExOlL4SAIl3DP4U4bVQHw3amPe9Az0Xw_VQ>
    <xmx:bCxdafWprQi6nzEIn3vAsrPuSUN8flee2J6ZOHBHGkdOviY752hdeA>
    <xmx:bCxdaUg5DHDdcG_ORy5eLCeXuvSuUHxfq_ohFbFRqwjEaxha0Rebgw>
    <xmx:bCxdaXAx9GM0ZHG1iqvpYaJoKaCi0D-FI0UjCib7OmTAx7nk5rUZBQ>
    <xmx:bCxdadAwiFoiwXRwXDTykv5vntD1EOmC5OluQzwdFBiocPfMhNjgtLV7>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4C0BD700069; Tue,  6 Jan 2026 10:38:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ADdmIppGoxVg
Date: Tue, 06 Jan 2026 16:37:40 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "port-m68k@netbsd.org" <port-m68k@netbsd.org>,
 "debian-68k@lists.debian.org" <debian-68k@lists.debian.org>,
 "linux-m68k@vger.kernel.org" <linux-m68k@vger.kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Message-Id: <e01dfc6d-a45f-4d17-a27c-67f913dc614c@app.fastmail.com>
In-Reply-To: 
 <9277b6ef0478bc6651c03b4220004a4c8a2e1cdb.camel@physik.fu-berlin.de>
References: 
 <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
 <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org>
 <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de>
 <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com>
 <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de>
 <7d9d8c95-1b06-c6c5-0932-7ba3af55829a@linux-m68k.org>
 <CABq5eXH8S9MVoRi5znU+u7EJPmaRA+8yOyd-QKBJMQa10UoAmw@mail.gmail.com>
 <6c1d08bf4cd4d7c92338357bd61dca8a23559ad0.camel@physik.fu-berlin.de>
 <WtNQmVJr3uIeOkUfpStavGscYvoTLpprxvowAOsqJKw8V7XCOZqKDi3Qw7Z1m8JVMsv71f0VZCVqZ3MiKnjLYp-VwSvtvTLkoVtJpAkA0gA=@r-v-e.co>
 <c4f086207e68843ea154b5d41950957fa11c6837.camel@physik.fu-berlin.de>
 <CAMuHMdU7Px7bT4XCZC=vF6aUFGj8=cd=refOf2u17mRjp2FUSA@mail.gmail.com>
 <2c10a9539a82b534e4a815361bb24c04d30b7e67.camel@physik.fu-berlin.de>
 <CAMuHMdXnebgBVWp-uxrmxTFKZkQVU2h-OW7H+7hJ+4beN9DFLg@mail.gmail.com>
 <9f1613138de30db0248649e6a36c2b063693057f.camel@physik.fu-berlin.de>
 <f1f4afab-51a4-10b5-106c-e9e6e5528e6f@kolla.no>
 <9277b6ef0478bc6651c03b4220004a4c8a2e1cdb.camel@physik.fu-berlin.de>
Subject: Re: Preliminary results - was: Re: Question on BIGGEST_ALIGNMENT in GCC on
 NetBSD/m68k
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 6, 2026, at 14:40, John Paul Adrian Glaubitz wrote:
> On Tue, 2026-01-06 at 14:34 +0100, Kolbj=C3=B8rn Barmen wrote:
>> On Mon, 16 Jun 2025, John Paul Adrian Glaubitz wrote:
>>=20
>> Does this patch exist somewhere? I ask because I am migrating to
>> 32bit-aligned userland (https://www.gentoo.org/downloads/#m68k) and t=
he
>> gcc provided fails building kernel, stopping at arch/m68k/kernel/sign=
al.c
>
> I haven't created that patch yet as my work on this effort is currentl=
y=20
> paused. However, it should
> be straight-forward to update the asserts in the kernel code.
>
> According to Geert, Arnd Bergmann made some changes to the kernel uapi=20
> that would allow the kernel
> to be built with either alignment. Not sure what the current state of=20
> things is.
>
> Let's CC Arnd to find out.

Hi Adrian,

I have these patches in my work-in-progress tree, and I still
plan to submit them upstream, but haven't made any progress on
it since I talked to Geert about it last month.

See below for my current working version against roughly v6.18,
which replaces all the implicit padding in uapi header files
with explicit padding.

What I do here is a combination of changes:

 - add -Werror=3Dpadded to the header checks to catch any
   implicit padding on any architecture
 - add __uapi_arch_pad8 for any 8-bit pad that is the
   same on any architecture
 - add __uapi_arch_pad16 for any 16-bit pad that is the
   same on any architecture other than m68k
 - add __uapi_arch_pad32 for any 32-bit pad for
   padding between __u32 and __u64 on all architectures
   that naturally align __u64
 - add __uapi_arch_pad_long between __u32 and long
   (or pointer) on 64-bit architectures
 - a few more specialized macros for less common corner
   cases
 - annotate structures as __uapi_arch_align to force 16-bit
   alignment on m68k and larger alignment elsewhere,
   regardless of -malign-int

I've tested this by running the header check on all
architectures, and running the abigail tests to ensure
the ABI is unmodified (abigail is currently broken on a
few architectures).

With all the patches applied, we get two benefits:
 - m68k kernels have a consistent ABI with and without
   -malign-int, so kernel and userspace can use
   different setting here, and we can eventually change
   the kernel to always use -malign-int
 - Any new patches that introduce implicit padding in the
   uapi headers break the build and get fixed before they
   cause problems. Almost all the instances I've seen
   are unintentional.

I have started splitting up the change into individual
commits that explain the padding, but it will take more
work to get through the entire patch, plus any additional
changes for review comments.


The diffstat is

 407 files changed, 2433 insertions(+), 754 deletions(-)

and I think this touches around 1500 structures, though
most files only have a single one.

     Arnd

----
diff --git a/usr/include/Makefile b/usr/include/Makefile
index eafcdbb68ea3..def1a020db53 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -6,7 +6,10 @@
 #
 # -std=3Dc90 (equivalent to -ansi) catches the violation of those.
 # We cannot go as far as adding -Wpedantic since it emits too many warn=
ings.
-UAPI_CFLAGS :=3D -std=3Dc90 -Werror=3Dimplicit-function-declaration
+UAPI_CFLAGS :=3D -std=3Dc90 -Werror=3Dimplicit-function-declaration -We=
rror=3Dpadded
+
+# when cross-compiling with a minimal toolchain, use nolibc headers
+UAPI_CFLAGS +=3D -I$(srctree)/tools/include/nolibc/
=20
 override c_flags =3D $(KBUILD_USERCFLAGS) $(UAPI_CFLAGS) -Wp,-MMD,$(dep=
file) -I $(obj) -I $(srctree)/usr/dummy-include
=20
diff --git a/arch/alpha/include/uapi/asm/signal.h b/arch/alpha/include/u=
api/asm/signal.h
index 1413075f7616..77a30b429805 100644
--- a/arch/alpha/include/uapi/asm/signal.h
+++ b/arch/alpha/include/uapi/asm/signal.h
@@ -90,6 +90,7 @@ struct sigaction {
 	} _u;
 	sigset_t	sa_mask;
 	int		sa_flags;
+	__uapi_arch_pad_long;
 };
=20
 #define sa_handler	_u._sa_handler
@@ -100,6 +101,7 @@ struct sigaction {
 typedef struct sigaltstack {
 	void __user *ss_sp;
 	int ss_flags;
+	__uapi_arch_pad_long;
 	__kernel_size_t ss_size;
 } stack_t;
=20
@@ -110,6 +112,7 @@ typedef struct sigaltstack {
 struct sigstack {
 	void __user *ss_sp;
 	int ss_onstack;
+	__uapi_arch_pad_long;
 };
=20
=20
diff --git a/arch/alpha/include/uapi/asm/stat.h b/arch/alpha/include/uap=
i/asm/stat.h
index 3f454fbd307a..eacf996ede78 100644
--- a/arch/alpha/include/uapi/asm/stat.h
+++ b/arch/alpha/include/uapi/asm/stat.h
@@ -2,6 +2,8 @@
 #ifndef _ALPHA_STAT_H
 #define _ALPHA_STAT_H
=20
+#include <linux/types.h>
+
 struct stat {
 	unsigned int	st_dev;
 	unsigned int	st_ino;
@@ -10,6 +12,7 @@ struct stat {
 	unsigned int	st_uid;
 	unsigned int	st_gid;
 	unsigned int	st_rdev;
+	__uapi_arch_pad32;
 	long		st_size;
 	unsigned long	st_atime;
 	unsigned long	st_mtime;
diff --git a/arch/alpha/include/uapi/asm/statfs.h b/arch/alpha/include/u=
api/asm/statfs.h
index 95852a4f576d..9ad1cd940622 100644
--- a/arch/alpha/include/uapi/asm/statfs.h
+++ b/arch/alpha/include/uapi/asm/statfs.h
@@ -7,6 +7,7 @@
 /* Alpha is the only 64-bit platform with 32-bit statfs. And doesn't
    even seem to implement statfs64 */
 #define __statfs_word __u32
+#define __uapi_arch_pad_statfs64 __uapi_arch_pad32
=20
 #include <asm-generic/statfs.h>
=20
diff --git a/arch/alpha/include/uapi/asm/termios.h b/arch/alpha/include/=
uapi/asm/termios.h
index e1b981222a24..fc26322eaa3c 100644
--- a/arch/alpha/include/uapi/asm/termios.h
+++ b/arch/alpha/include/uapi/asm/termios.h
@@ -2,6 +2,7 @@
 #ifndef _UAPI_ALPHA_TERMIOS_H
 #define _UAPI_ALPHA_TERMIOS_H
=20
+#include <linux/types.h>
 #include <asm/ioctls.h>
 #include <asm/termbits.h>
=20
@@ -46,6 +47,7 @@ struct termio {
 	unsigned short c_lflag;		/* local mode flags */
 	unsigned char c_line;		/* line discipline */
 	unsigned char c_cc[NCC];	/* control characters */
+	__uapi_arch_pad8;
 };
=20
 /*
diff --git a/arch/arc/include/uapi/asm/types.h b/arch/arc/include/uapi/a=
sm/types.h
new file mode 100644
index 000000000000..a3f70faa8ddd
--- /dev/null
+++ b/arch/arc/include/uapi/asm/types.h
@@ -0,0 +1,3 @@
+#define __uapi_arch_pad32
+#include <asm-generic/types.h>
+
diff --git a/arch/arm/include/uapi/asm/msgbuf.h b/arch/arm/include/uapi/=
asm/msgbuf.h
new file mode 100644
index 000000000000..c98d6c93090f
--- /dev/null
+++ b/arch/arm/include/uapi/asm/msgbuf.h
@@ -0,0 +1,6 @@
+#include <linux/types.h>
+#include <asm-generic/msgbuf.h>
+
+#define __uapi_arch_pad_msqid_pid
+#define __uapi_arch_pad_msqid __uapi_arch_pad16
+
diff --git a/arch/arm/include/uapi/asm/posix_types.h b/arch/arm/include/=
uapi/asm/posix_types.h
index 6bf11ad5d6ba..c7a0fc630522 100644
--- a/arch/arm/include/uapi/asm/posix_types.h
+++ b/arch/arm/include/uapi/asm/posix_types.h
@@ -22,6 +22,7 @@
=20
 typedef unsigned short		__kernel_mode_t;
 #define __kernel_mode_t __kernel_mode_t
+#define __uapi_arch_pad_mode_t
=20
 typedef unsigned short		__kernel_ipc_pid_t;
 #define __kernel_ipc_pid_t __kernel_ipc_pid_t
@@ -32,6 +33,7 @@ typedef unsigned short		__kernel_gid_t;
=20
 typedef unsigned short		__kernel_old_dev_t;
 #define __kernel_old_dev_t __kernel_old_dev_t
+#define __uapi_arch_pad_old_dev_t __uapi_arch_pad16
=20
 #include <asm-generic/posix_types.h>
=20
diff --git a/arch/arm/include/uapi/asm/setup.h b/arch/arm/include/uapi/a=
sm/setup.h
index 8e50e034fec7..38136b0b0bfe 100644
--- a/arch/arm/include/uapi/asm/setup.h
+++ b/arch/arm/include/uapi/asm/setup.h
@@ -135,7 +135,8 @@ struct tag_acorn {
 	__u32 vram_pages;
 	__u8 sounddefault;
 	__u8 adfsdrives;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /* footbridge memory clock, see arch/arm/mach-footbridge/arch.c */
 #define ATAG_MEMCLK	0x41000402
diff --git a/arch/arm/include/uapi/asm/stat.h b/arch/arm/include/uapi/as=
m/stat.h
index 9c6580bfc04d..2cabfd843560 100644
--- a/arch/arm/include/uapi/asm/stat.h
+++ b/arch/arm/include/uapi/asm/stat.h
@@ -2,6 +2,8 @@
 #ifndef _ASMARM_STAT_H
 #define _ASMARM_STAT_H
=20
+#include <linux/types.h>
+
 struct __old_kernel_stat {
 	unsigned short st_dev;
 	unsigned short st_ino;
@@ -10,11 +12,12 @@ struct __old_kernel_stat {
 	unsigned short st_uid;
 	unsigned short st_gid;
 	unsigned short st_rdev;
+	__uapi_arch_pad16;
 	unsigned long  st_size;
 	unsigned long  st_atime;
 	unsigned long  st_mtime;
 	unsigned long  st_ctime;
-};
+} __uapi_arch_align;
=20
 #define STAT_HAVE_NSEC=20
=20
@@ -68,9 +71,11 @@ struct stat64 {
=20
 	unsigned long long	st_rdev;
 	unsigned char   __pad3[4];
+	__uapi_arch_pad32;
=20
 	long long	st_size;
 	unsigned long	st_blksize;
+	__uapi_arch_pad32;
 	unsigned long long st_blocks;	/* Number 512-byte blocks allocated. */
=20
 	unsigned long	st_atime;
@@ -83,6 +88,6 @@ struct stat64 {
 	unsigned long	st_ctime_nsec;
=20
 	unsigned long long	st_ino;
-};
+} __uapi_arch_align;
=20
 #endif
diff --git a/arch/arm/include/uapi/asm/statfs.h b/arch/arm/include/uapi/=
asm/statfs.h
index 177f08540079..cd7243f16b03 100644
--- a/arch/arm/include/uapi/asm/statfs.h
+++ b/arch/arm/include/uapi/asm/statfs.h
@@ -2,12 +2,15 @@
 #ifndef _ASMARM_STATFS_H
 #define _ASMARM_STATFS_H
=20
+#include <linux/types.h>
+
 /*
  * With EABI there is 4 bytes of padding added to this structure.
  * Let's pack it so the padding goes away to simplify dual ABI support.
  * Note that user space does NOT have to pack this structure.
  */
 #define ARCH_PACK_STATFS64 __attribute__((packed,aligned(4)))
+#define __uapi_arch_pad_statfs64
=20
 #include <asm-generic/statfs.h>
 #endif
diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi=
/asm/kvm.h
index a792a599b9d6..aca86a963f54 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -51,6 +51,8 @@ struct kvm_regs {
=20
 	__u64	spsr[KVM_NR_SPSR];
=20
+	__u64 :64; /* align fp_regs */
+
 	struct user_fpsimd_state fp_regs;
 };
=20
diff --git a/arch/arm64/include/uapi/asm/sigcontext.h b/arch/arm64/inclu=
de/uapi/asm/sigcontext.h
index e29bf3e2d0cc..eab491add421 100644
--- a/arch/arm64/include/uapi/asm/sigcontext.h
+++ b/arch/arm64/include/uapi/asm/sigcontext.h
@@ -32,6 +32,8 @@ struct sigcontext {
 	__u64 sp;
 	__u64 pc;
 	__u64 pstate;
+
+	__u64 :64; /* pad to alignment */
 	/* 4K reserved for FP/SIMD state and future expansion */
 	__u8 __reserved[4096] __attribute__((__aligned__(16)));
 };
diff --git a/arch/arm64/include/uapi/asm/ucontext.h b/arch/arm64/include=
/uapi/asm/ucontext.h
index ee02721a704d..32b6b2ea648a 100644
--- a/arch/arm64/include/uapi/asm/ucontext.h
+++ b/arch/arm64/include/uapi/asm/ucontext.h
@@ -18,6 +18,8 @@
 #define _UAPI__ASM_UCONTEXT_H
=20
 #include <linux/types.h>
+#include <linux/signal.h>
+#include <asm/sigcontext.h>
=20
 struct ucontext {
 	unsigned long	  uc_flags;
@@ -27,6 +29,7 @@ struct ucontext {
 	/* glibc uses a 1024-bit sigset_t */
 	__u8		  __unused[1024 / 8 - sizeof(sigset_t)];
 	/* last for future expansion */
+	__u64 :64;	/* pad to sigcontext alignment */
 	struct sigcontext uc_mcontext;
 };
=20
diff --git a/arch/csky/include/uapi/asm/types.h b/arch/csky/include/uapi=
/asm/types.h
new file mode 100644
index 000000000000..b337788c00b8
--- /dev/null
+++ b/arch/csky/include/uapi/asm/types.h
@@ -0,0 +1,2 @@
+#define __uapi_arch_pad32
+#include <asm-generic/types.h>
diff --git a/arch/hexagon/include/uapi/asm/sigcontext.h b/arch/hexagon/i=
nclude/uapi/asm/sigcontext.h
index 7171edb1b8b7..179a97041b59 100644
--- a/arch/hexagon/include/uapi/asm/sigcontext.h
+++ b/arch/hexagon/include/uapi/asm/sigcontext.h
@@ -29,6 +29,6 @@
  */
 struct sigcontext {
 	struct user_regs_struct sc_regs;
-} __aligned(8);
+} __attribute__((aligned(8)));
=20
 #endif
diff --git a/arch/hexagon/include/uapi/asm/signal.h b/arch/hexagon/inclu=
de/uapi/asm/signal.h
index a08fc425387d..0a981592b87e 100644
--- a/arch/hexagon/include/uapi/asm/signal.h
+++ b/arch/hexagon/include/uapi/asm/signal.h
@@ -20,9 +20,11 @@
 #ifndef _ASM_SIGNAL_H
 #define _ASM_SIGNAL_H
=20
+#ifdef __KERNEL__
 extern unsigned long __rt_sigtramp_template[2];
=20
 void do_signal(struct pt_regs *regs);
+#endif
=20
 #include <asm-generic/signal.h>
=20
diff --git a/arch/loongarch/include/uapi/asm/kvm.h b/arch/loongarch/incl=
ude/uapi/asm/kvm.h
index de6c3f18e40a..553c400d0d8f 100644
--- a/arch/loongarch/include/uapi/asm/kvm.h
+++ b/arch/loongarch/include/uapi/asm/kvm.h
@@ -35,6 +35,7 @@ struct kvm_regs {
  */
 struct kvm_fpu {
 	__u32 fcsr;
+	__uapi_arch_pad32;
 	__u64 fcc;    /* 8x8 */
 	struct kvm_fpureg {
 		__u64 val64[4];
diff --git a/arch/loongarch/include/uapi/asm/ptrace.h b/arch/loongarch/i=
nclude/uapi/asm/ptrace.h
index b35c794323bc..c2c4f22e4f23 100644
--- a/arch/loongarch/include/uapi/asm/ptrace.h
+++ b/arch/loongarch/include/uapi/asm/ptrace.h
@@ -40,7 +40,8 @@ struct user_fp_state {
 	__u64 fpr[32];
 	__u64 fcc;
 	__u32 fcsr;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 struct user_lsx_state {
 	/* 32 registers, 128 bits width per register. */
diff --git a/arch/loongarch/include/uapi/asm/sigcontext.h b/arch/loongar=
ch/include/uapi/asm/sigcontext.h
index 5cd121275bac..813e5447adb0 100644
--- a/arch/loongarch/include/uapi/asm/sigcontext.h
+++ b/arch/loongarch/include/uapi/asm/sigcontext.h
@@ -21,6 +21,7 @@ struct sigcontext {
 	__u64	sc_pc;
 	__u64	sc_regs[32];
 	__u32	sc_flags;
+	__u32	:32;
 	__u64	sc_extcontext[0] __attribute__((__aligned__(16)));
 };
=20
@@ -38,6 +39,7 @@ struct fpu_context {
 	__u64	regs[32];
 	__u64	fcc;
 	__u32	fcsr;
+	__uapi_arch_pad32;
 };
=20
 /* LSX context */
@@ -47,6 +49,7 @@ struct lsx_context {
 	__u64	regs[2*32];
 	__u64	fcc;
 	__u32	fcsr;
+	__uapi_arch_pad32;
 };
=20
 /* LASX context */
@@ -56,6 +59,7 @@ struct lasx_context {
 	__u64	regs[4*32];
 	__u64	fcc;
 	__u32	fcsr;
+	__uapi_arch_pad32;
 };
=20
 /* LBT context */
diff --git a/arch/loongarch/include/uapi/asm/ucontext.h b/arch/loongarch=
/include/uapi/asm/ucontext.h
index 12577e22b1c7..c37d572cc676 100644
--- a/arch/loongarch/include/uapi/asm/ucontext.h
+++ b/arch/loongarch/include/uapi/asm/ucontext.h
@@ -2,6 +2,9 @@
 #ifndef __LOONGARCH_UAPI_ASM_UCONTEXT_H
 #define __LOONGARCH_UAPI_ASM_UCONTEXT_H
=20
+#include <asm/signal.h>
+#include <asm/sigcontext.h>
+
 /**
  * struct ucontext - user context structure
  * @uc_flags:
@@ -21,6 +24,7 @@ struct ucontext {
 	 * at the end of this structure and explicitly state it can be
 	 * expanded, so we didn't want to box ourselves in here. */
 	__u8		  __unused[1024 / 8 - sizeof(sigset_t)];
+	__u64	:64; /* align to alignof(struct sigcontext) */
 	/* We can't put uc_sigmask at the end of this structure because we need
 	 * to be able to expand sigcontext in the future.  For example, the
 	 * vector ISA extension will almost certainly add ISA state.  We want
diff --git a/arch/m68k/include/uapi/asm/posix_types.h b/arch/m68k/includ=
e/uapi/asm/posix_types.h
index 10a65149b5f2..88db8f21ff84 100644
--- a/arch/m68k/include/uapi/asm/posix_types.h
+++ b/arch/m68k/include/uapi/asm/posix_types.h
@@ -10,6 +10,7 @@
=20
 typedef unsigned short	__kernel_mode_t;
 #define __kernel_mode_t __kernel_mode_t
+#define __uapi_arch_pad_mode_t
=20
 typedef unsigned short	__kernel_ipc_pid_t;
 #define __kernel_ipc_pid_t __kernel_ipc_pid_t
@@ -20,6 +21,7 @@ typedef unsigned short	__kernel_gid_t;
=20
 typedef unsigned short	__kernel_old_dev_t;
 #define __kernel_old_dev_t __kernel_old_dev_t
+#define __uapi_arch_pad_old_dev_t __uapi_arch_pad16
=20
 #include <asm-generic/posix_types.h>
=20
diff --git a/arch/m68k/include/uapi/asm/ptrace.h b/arch/m68k/include/uap=
i/asm/ptrace.h
index d70f771399b4..0aa34857da4f 100644
--- a/arch/m68k/include/uapi/asm/ptrace.h
+++ b/arch/m68k/include/uapi/asm/ptrace.h
@@ -2,6 +2,8 @@
 #ifndef _UAPI_M68K_PTRACE_H
 #define _UAPI_M68K_PTRACE_H
=20
+#include <linux/types.h>
+
 #define PT_D1	   0
 #define PT_D2	   1
 #define PT_D3	   2
@@ -46,7 +48,7 @@ struct pt_regs {
   unsigned long  pc;
 #else
   unsigned short sr;
-  unsigned long  pc;
+  unsigned long  pc __uapi_arch_align;
   unsigned format :  4; /* frame format specifier */
   unsigned vector : 12; /* vector offset */
 #endif
diff --git a/arch/m68k/include/uapi/asm/sigcontext.h b/arch/m68k/include=
/uapi/asm/sigcontext.h
index 6cc8421c8a73..5993d0edc416 100644
--- a/arch/m68k/include/uapi/asm/sigcontext.h
+++ b/arch/m68k/include/uapi/asm/sigcontext.h
@@ -2,6 +2,8 @@
 #ifndef _ASM_M68k_SIGCONTEXT_H
 #define _ASM_M68k_SIGCONTEXT_H
=20
+#include <linux/types.h>
+
 struct sigcontext {
 	unsigned long  sc_mask;		/* old sigmask */
 	unsigned long  sc_usp;		/* old user stack pointer */
@@ -13,7 +15,7 @@ struct sigcontext {
 	unsigned long  sc_a5;
 #endif
 	unsigned short sc_sr;
-	unsigned long  sc_pc;
+	unsigned long  sc_pc __uapi_arch_align;
 	unsigned short sc_formatvec;
 #ifndef __uClinux__
 	unsigned long  sc_fpregs[2*3];  /* room for two fp registers */
diff --git a/arch/m68k/include/uapi/asm/stat.h b/arch/m68k/include/uapi/=
asm/stat.h
index 1e15e6517b9c..28eacd7aea6d 100644
--- a/arch/m68k/include/uapi/asm/stat.h
+++ b/arch/m68k/include/uapi/asm/stat.h
@@ -2,6 +2,8 @@
 #ifndef _M68K_STAT_H
 #define _M68K_STAT_H
=20
+#include <linux/types.h>
+
 struct __old_kernel_stat {
 	unsigned short st_dev;
 	unsigned short st_ino;
@@ -14,7 +16,7 @@ struct __old_kernel_stat {
 	unsigned long  st_atime;
 	unsigned long  st_mtime;
 	unsigned long  st_ctime;
-};
+} __uapi_arch_align;
=20
 struct stat {
 	unsigned short st_dev;
@@ -73,6 +75,6 @@ struct stat64 {
 	unsigned long	st_ctime_nsec;
=20
 	unsigned long long	st_ino;
-};
+} __uapi_arch_align;
=20
 #endif /* _M68K_STAT_H */
diff --git a/arch/m68k/include/uapi/asm/types.h b/arch/m68k/include/uapi=
/asm/types.h
new file mode 100644
index 000000000000..4b5c055157ec
--- /dev/null
+++ b/arch/m68k/include/uapi/asm/types.h
@@ -0,0 +1,5 @@
+
+#define __uapi_arch_pad16
+#define __uapi_arch_pad32
+
+#include <asm-generic/types.h>
diff --git a/arch/microblaze/include/uapi/asm/posix_types.h b/arch/micro=
blaze/include/uapi/asm/posix_types.h
index f3249da69121..bad0cdc3947e 100644
--- a/arch/microblaze/include/uapi/asm/posix_types.h
+++ b/arch/microblaze/include/uapi/asm/posix_types.h
@@ -4,6 +4,7 @@
=20
 typedef unsigned short	__kernel_mode_t;
 #define __kernel_mode_t __kernel_mode_t
+#define __uapi_arch_pad_mode_t
=20
 #include <asm-generic/posix_types.h>
=20
diff --git a/arch/microblaze/include/uapi/asm/types.h b/arch/microblaze/=
include/uapi/asm/types.h
new file mode 100644
index 000000000000..b337788c00b8
--- /dev/null
+++ b/arch/microblaze/include/uapi/asm/types.h
@@ -0,0 +1,2 @@
+#define __uapi_arch_pad32
+#include <asm-generic/types.h>
diff --git a/arch/mips/include/uapi/asm/inst.h b/arch/mips/include/uapi/=
asm/inst.h
index c29dbc8c1d49..54cd976ee428 100644
--- a/arch/mips/include/uapi/asm/inst.h
+++ b/arch/mips/include/uapi/asm/inst.h
@@ -1058,57 +1058,57 @@ struct loongson3_lscsr_format {	/* Loongson-3 CP=
UCFG&CSR read/write format */
  * MIPS16e instruction formats (16-bit length)
  */
 struct m16e_rr {
-	__BITFIELD_FIELD(unsigned int opcode : 5,
-	__BITFIELD_FIELD(unsigned int rx : 3,
-	__BITFIELD_FIELD(unsigned int nd : 1,
-	__BITFIELD_FIELD(unsigned int l : 1,
-	__BITFIELD_FIELD(unsigned int ra : 1,
-	__BITFIELD_FIELD(unsigned int func : 5,
+	__BITFIELD_FIELD(unsigned short opcode : 5,
+	__BITFIELD_FIELD(unsigned short rx : 3,
+	__BITFIELD_FIELD(unsigned short nd : 1,
+	__BITFIELD_FIELD(unsigned short l : 1,
+	__BITFIELD_FIELD(unsigned short ra : 1,
+	__BITFIELD_FIELD(unsigned short func : 5,
 	;))))))
 };
=20
 struct m16e_jal {
-	__BITFIELD_FIELD(unsigned int opcode : 5,
-	__BITFIELD_FIELD(unsigned int x : 1,
-	__BITFIELD_FIELD(unsigned int imm20_16 : 5,
-	__BITFIELD_FIELD(signed int imm25_21 : 5,
+	__BITFIELD_FIELD(unsigned short opcode : 5,
+	__BITFIELD_FIELD(unsigned short x : 1,
+	__BITFIELD_FIELD(unsigned short imm20_16 : 5,
+	__BITFIELD_FIELD(signed short imm25_21 : 5,
 	;))))
 };
=20
 struct m16e_i64 {
-	__BITFIELD_FIELD(unsigned int opcode : 5,
-	__BITFIELD_FIELD(unsigned int func : 3,
-	__BITFIELD_FIELD(unsigned int imm : 8,
+	__BITFIELD_FIELD(unsigned short opcode : 5,
+	__BITFIELD_FIELD(unsigned short func : 3,
+	__BITFIELD_FIELD(unsigned short imm : 8,
 	;)))
 };
=20
 struct m16e_ri64 {
-	__BITFIELD_FIELD(unsigned int opcode : 5,
-	__BITFIELD_FIELD(unsigned int func : 3,
-	__BITFIELD_FIELD(unsigned int ry : 3,
-	__BITFIELD_FIELD(unsigned int imm : 5,
+	__BITFIELD_FIELD(unsigned short opcode : 5,
+	__BITFIELD_FIELD(unsigned short func : 3,
+	__BITFIELD_FIELD(unsigned short ry : 3,
+	__BITFIELD_FIELD(unsigned short imm : 5,
 	;))))
 };
=20
 struct m16e_ri {
-	__BITFIELD_FIELD(unsigned int opcode : 5,
-	__BITFIELD_FIELD(unsigned int rx : 3,
-	__BITFIELD_FIELD(unsigned int imm : 8,
+	__BITFIELD_FIELD(unsigned short opcode : 5,
+	__BITFIELD_FIELD(unsigned short rx : 3,
+	__BITFIELD_FIELD(unsigned short imm : 8,
 	;)))
 };
=20
 struct m16e_rri {
-	__BITFIELD_FIELD(unsigned int opcode : 5,
-	__BITFIELD_FIELD(unsigned int rx : 3,
-	__BITFIELD_FIELD(unsigned int ry : 3,
-	__BITFIELD_FIELD(unsigned int imm : 5,
+	__BITFIELD_FIELD(unsigned short opcode : 5,
+	__BITFIELD_FIELD(unsigned short rx : 3,
+	__BITFIELD_FIELD(unsigned short ry : 3,
+	__BITFIELD_FIELD(unsigned short imm : 5,
 	;))))
 };
=20
 struct m16e_i8 {
-	__BITFIELD_FIELD(unsigned int opcode : 5,
-	__BITFIELD_FIELD(unsigned int func : 3,
-	__BITFIELD_FIELD(unsigned int imm : 8,
+	__BITFIELD_FIELD(unsigned short opcode : 5,
+	__BITFIELD_FIELD(unsigned short func : 3,
+	__BITFIELD_FIELD(unsigned short imm : 8,
 	;)))
 };
=20
@@ -1161,7 +1161,7 @@ union mips_instruction {
 };
=20
 union mips16e_instruction {
-	unsigned int full : 16;
+	unsigned short full : 16;
 	struct m16e_rr rr;
 	struct m16e_jal jal;
 	struct m16e_i64 i64;
diff --git a/arch/mips/include/uapi/asm/ptrace.h b/arch/mips/include/uap=
i/asm/ptrace.h
index f3c025445e45..357134998d54 100644
--- a/arch/mips/include/uapi/asm/ptrace.h
+++ b/arch/mips/include/uapi/asm/ptrace.h
@@ -85,6 +85,7 @@ struct mips32_watch_regs {
 	unsigned short watch_masks[8];
 	/* The number of valid watch register pairs.  */
 	unsigned int num_valid;
+	__uapi_arch_pad32;
 } __attribute__((aligned(8)));
=20
 struct mips64_watch_regs {
@@ -92,15 +93,17 @@ struct mips64_watch_regs {
 	unsigned short watchhi[8];
 	unsigned short watch_masks[8];
 	unsigned int num_valid;
+	__uapi_arch_pad32;
 } __attribute__((aligned(8)));
=20
 struct pt_watch_regs {
 	enum pt_watch_style style;
+	__uapi_arch_pad32;
 	union {
 		struct mips32_watch_regs mips32;
 		struct mips64_watch_regs mips64;
 	};
-};
+} __uapi_arch_align;
=20
 #define PTRACE_GET_WATCH_REGS	0xd0
 #define PTRACE_SET_WATCH_REGS	0xd1
diff --git a/arch/mips/include/uapi/asm/sigcontext.h b/arch/mips/include=
/uapi/asm/sigcontext.h
index d10afd13ee5b..5fc9d77b7841 100644
--- a/arch/mips/include/uapi/asm/sigcontext.h
+++ b/arch/mips/include/uapi/asm/sigcontext.h
@@ -42,6 +42,7 @@ struct sigcontext {
 	unsigned int		sc_fpc_eir;	/* Unused */
 	unsigned int		sc_used_math;
 	unsigned int		sc_dsp;		/* dsp status, was sc_ssflags */
+	__uapi_arch_pad32;
 	unsigned long long	sc_mdhi;
 	unsigned long long	sc_mdlo;
 	unsigned long		sc_hi1;		/* Was sc_cause */
@@ -50,7 +51,7 @@ struct sigcontext {
 	unsigned long		sc_lo2;
 	unsigned long		sc_hi3;
 	unsigned long		sc_lo3;
-};
+} __uapi_arch_align;
=20
 #endif /* _MIPS_SIM =3D=3D _MIPS_SIM_ABI32 */
=20
diff --git a/arch/mips/include/uapi/asm/signal.h b/arch/mips/include/uap=
i/asm/signal.h
index fc3b6e7f57e2..87e0763b21b6 100644
--- a/arch/mips/include/uapi/asm/signal.h
+++ b/arch/mips/include/uapi/asm/signal.h
@@ -102,7 +102,8 @@ typedef struct sigaltstack {
 	void __user *ss_sp;
 	__kernel_size_t ss_size;
 	int ss_flags;
-} stack_t;
+	__uapi_arch_pad_long;
+} __uapi_arch_align stack_t;
=20
=20
 #endif /* _UAPI_ASM_SIGNAL_H */
diff --git a/arch/mips/include/uapi/asm/statfs.h b/arch/mips/include/uap=
i/asm/statfs.h
index f4174dcaef5e..d37a00e782ad 100644
--- a/arch/mips/include/uapi/asm/statfs.h
+++ b/arch/mips/include/uapi/asm/statfs.h
@@ -57,7 +57,8 @@ struct statfs64 {
 	__u32	f_namelen;
 	__u32	f_flags;
 	__u32	f_spare[5];
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 #endif /* _MIPS_SIM =3D=3D _MIPS_SIM_ABI32 */
=20
diff --git a/arch/mips/include/uapi/asm/types.h b/arch/mips/include/uapi=
/asm/types.h
index 6b21504842a4..3d09fefadd46 100644
--- a/arch/mips/include/uapi/asm/types.h
+++ b/arch/mips/include/uapi/asm/types.h
@@ -27,5 +27,4 @@
 # endif
 #endif
=20
-
 #endif /* _UAPI_ASM_TYPES_H */
diff --git a/arch/mips/include/uapi/asm/ucontext.h b/arch/mips/include/u=
api/asm/ucontext.h
index 6122ef97c6ff..2b831dba5902 100644
--- a/arch/mips/include/uapi/asm/ucontext.h
+++ b/arch/mips/include/uapi/asm/ucontext.h
@@ -2,6 +2,10 @@
 #ifndef __MIPS_UAPI_ASM_UCONTEXT_H
 #define __MIPS_UAPI_ASM_UCONTEXT_H
=20
+#include <linux/types.h>
+#include <asm/signal.h>
+#include <asm/sigcontext.h>
+
 /**
  * struct extcontext - extended context header structure
  * @magic:	magic value identifying the type of extended context
@@ -38,7 +42,8 @@ struct msa_extcontext {
=20
 	unsigned long long	wr[32];
 	unsigned int		csr;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 #define END_EXTCONTEXT_MAGIC	0x78454e44	/* xEND */
=20
@@ -56,11 +61,12 @@ struct ucontext {
 	unsigned long		uc_flags;
 	struct ucontext		*uc_link;
 	stack_t			uc_stack;
+	__uapi_arch_pad32;
 	struct sigcontext	uc_mcontext;
 	sigset_t		uc_sigmask;
=20
 	/* Extended context structures may follow ucontext */
 	unsigned long long	uc_extcontext[];
-};
+} __uapi_arch_align;
=20
 #endif /* __MIPS_UAPI_ASM_UCONTEXT_H */
diff --git a/arch/nios2/include/uapi/asm/types.h b/arch/nios2/include/ua=
pi/asm/types.h
new file mode 100644
index 000000000000..a3f70faa8ddd
--- /dev/null
+++ b/arch/nios2/include/uapi/asm/types.h
@@ -0,0 +1,3 @@
+#define __uapi_arch_pad32
+#include <asm-generic/types.h>
+
diff --git a/arch/openrisc/include/uapi/asm/types.h b/arch/openrisc/incl=
ude/uapi/asm/types.h
new file mode 100644
index 000000000000..a3f70faa8ddd
--- /dev/null
+++ b/arch/openrisc/include/uapi/asm/types.h
@@ -0,0 +1,3 @@
+#define __uapi_arch_pad32
+#include <asm-generic/types.h>
+
diff --git a/arch/parisc/include/uapi/asm/msgbuf.h b/arch/parisc/include=
/uapi/asm/msgbuf.h
index 3b4de5b668c3..b9128aff11d2 100644
--- a/arch/parisc/include/uapi/asm/msgbuf.h
+++ b/arch/parisc/include/uapi/asm/msgbuf.h
@@ -2,6 +2,7 @@
 #ifndef _PARISC_MSGBUF_H
 #define _PARISC_MSGBUF_H
=20
+#include <linux/types.h>
 #include <asm/bitsperlong.h>
 #include <asm/ipcbuf.h>
=20
@@ -35,6 +36,14 @@ struct msqid64_ds {
 	__kernel_pid_t	msg_lrpid;	/* last receive pid */
 	unsigned long	__unused1;
 	unsigned long	__unused2;
+	__uapi_arch_pad_long_to_u64;
 };
=20
+#define __uapi_arch_pad_msqid_pid
+#if __BITS_PER_LONG =3D=3D 64
+#define __uapi_arch_pad_msqid __uapi_arch_pad16; __uapi_arch_pad32
+#else
+#define __uapi_arch_pad_msqid __uapi_arch_pad16
+#endif
+
 #endif /* _PARISC_MSGBUF_H */
diff --git a/arch/parisc/include/uapi/asm/pdc.h b/arch/parisc/include/ua=
pi/asm/pdc.h
index 65031ddf8372..6c3056eb2f87 100644
--- a/arch/parisc/include/uapi/asm/pdc.h
+++ b/arch/parisc/include/uapi/asm/pdc.h
@@ -550,6 +550,7 @@ struct pdc_iodc {     /* PDC_IODC */
 	unsigned int	sversion_rev:4;
 	unsigned int	sversion_model:19;
 	unsigned int	sversion_opt:8;
+	unsigned int	:1;
 	unsigned char	rev;
 	unsigned char	dep;
 	unsigned char	features;
@@ -557,6 +558,7 @@ struct pdc_iodc {     /* PDC_IODC */
 	unsigned int	checksum:16;
 	unsigned int	length:16;
 	unsigned int    pad[15];
+	unsigned int	:32;
 } __attribute__((aligned(8))) ;
=20
 /* no BLTBs in pa2.0 processors */
diff --git a/arch/parisc/include/uapi/asm/posix_types.h b/arch/parisc/in=
clude/uapi/asm/posix_types.h
index 8dce56f5dcee..b931b620deb7 100644
--- a/arch/parisc/include/uapi/asm/posix_types.h
+++ b/arch/parisc/include/uapi/asm/posix_types.h
@@ -11,6 +11,7 @@
 #ifndef __LP64__
 typedef unsigned short		__kernel_mode_t;
 #define __kernel_mode_t __kernel_mode_t
+#define __uapi_arch_pad_mode_t
 #endif
=20
 typedef unsigned short		__kernel_ipc_pid_t;
diff --git a/arch/parisc/include/uapi/asm/sembuf.h b/arch/parisc/include=
/uapi/asm/sembuf.h
index e2ca4301c7fb..99dfdaf38d15 100644
--- a/arch/parisc/include/uapi/asm/sembuf.h
+++ b/arch/parisc/include/uapi/asm/sembuf.h
@@ -2,6 +2,7 @@
 #ifndef _PARISC_SEMBUF_H
 #define _PARISC_SEMBUF_H
=20
+#include <linux/types.h>
 #include <asm/bitsperlong.h>
 #include <asm/ipcbuf.h>
=20
@@ -28,6 +29,7 @@ struct semid64_ds {
 	unsigned long	sem_nsems;		/* no. of semaphores in array */
 	unsigned long	__unused1;
 	unsigned long	__unused2;
+	__uapi_arch_pad_long_to_u64;
 };
=20
 #endif /* _PARISC_SEMBUF_H */
diff --git a/arch/parisc/include/uapi/asm/shmbuf.h b/arch/parisc/include=
/uapi/asm/shmbuf.h
index 532da742fb56..5eb28aa9020d 100644
--- a/arch/parisc/include/uapi/asm/shmbuf.h
+++ b/arch/parisc/include/uapi/asm/shmbuf.h
@@ -2,6 +2,7 @@
 #ifndef _PARISC_SHMBUF_H
 #define _PARISC_SHMBUF_H
=20
+#include <linux/types.h>
 #include <asm/bitsperlong.h>
 #include <asm/ipcbuf.h>
 #include <asm/posix_types.h>
@@ -36,6 +37,7 @@ struct shmid64_ds {
 	unsigned long		shm_nattch;	/* no. of current attaches */
 	unsigned long		__unused1;
 	unsigned long		__unused2;
+	__uapi_arch_pad_long_to_u64;
 };
=20
 struct shminfo64 {
@@ -50,4 +52,7 @@ struct shminfo64 {
 	unsigned long	__unused4;
 };
=20
+/* shmid_ds has no padding before shm_unused2 */
+#define __uapi_arch_pad_shm_long
+
 #endif /* _PARISC_SHMBUF_H */
diff --git a/arch/parisc/include/uapi/asm/sigcontext.h b/arch/parisc/inc=
lude/uapi/asm/sigcontext.h
index be404bb0f8e3..ef53dd092a86 100644
--- a/arch/parisc/include/uapi/asm/sigcontext.h
+++ b/arch/parisc/include/uapi/asm/sigcontext.h
@@ -2,6 +2,8 @@
 #ifndef _ASMPARISC_SIGCONTEXT_H
 #define _ASMPARISC_SIGCONTEXT_H
=20
+#include <linux/types.h>
+
 #define PARISC_SC_FLAG_ONSTACK 1<<0
 #define PARISC_SC_FLAG_IN_SYSCALL 1<<1
=20
@@ -11,10 +13,12 @@ struct sigcontext {
 	unsigned long sc_flags;
=20
 	unsigned long sc_gr[32]; /* PSW in sc_gr[0] */
+	__uapi_arch_pad_long_to_u64;
 	unsigned long long sc_fr[32]; /* FIXME, do we need other state info? */
 	unsigned long sc_iasq[2];
 	unsigned long sc_iaoq[2];
 	unsigned long sc_sar; /* cr11 */
+	__uapi_arch_pad_long_to_u64;
 };
=20
=20
diff --git a/arch/parisc/include/uapi/asm/signal.h b/arch/parisc/include=
/uapi/asm/signal.h
index 87bda1e5cc8c..cf19e4c3f1c1 100644
--- a/arch/parisc/include/uapi/asm/signal.h
+++ b/arch/parisc/include/uapi/asm/signal.h
@@ -77,6 +77,7 @@ struct siginfo;
 typedef struct sigaltstack {
 	void __user *ss_sp;
 	int ss_flags;
+	__uapi_arch_pad_long;
 	__kernel_size_t ss_size;
 } stack_t;
=20
diff --git a/arch/parisc/include/uapi/asm/stat.h b/arch/parisc/include/u=
api/asm/stat.h
index b5bbf6704cae..42c4ab914565 100644
--- a/arch/parisc/include/uapi/asm/stat.h
+++ b/arch/parisc/include/uapi/asm/stat.h
@@ -52,9 +52,11 @@ struct stat64 {
 	unsigned int		st_gid;
 	unsigned long long	st_rdev;
 	unsigned int		__pad2;
+	__uapi_arch_pad32;
 	signed long long	st_size;
 	signed int		st_blksize;
=20
+	__uapi_arch_pad32;
 	signed long long	st_blocks;
 	signed int		st_atime;
 	unsigned int		st_atime_nsec;
diff --git a/arch/powerpc/include/uapi/asm/bootx.h b/arch/powerpc/includ=
e/uapi/asm/bootx.h
index 1b8c121071d9..373f0260381a 100644
--- a/arch/powerpc/include/uapi/asm/bootx.h
+++ b/arch/powerpc/include/uapi/asm/bootx.h
@@ -91,6 +91,7 @@ typedef struct boot_infos
     /* Some infos about the current MacOS display */
     __u32       dispDeviceRect[4];       /* left,top,right,bottom */
     __u32       dispDeviceDepth;         /* (8, 16 or 32) */
+    __uapi_arch_pad_long;
     __u8*       dispDeviceBase;          /* base address (physical) */
     __u32       dispDeviceRowBytes;      /* rowbytes (in bytes) */
     __u32       dispDeviceColorsOffset;  /* Colormap (8 bits only) or 0=
 (*) */
@@ -123,6 +124,7 @@ typedef struct boot_infos
     /* Total params size (args + colormap + device tree + ramdisk) */
     __u32       totalParamsSize;
=20
+    __uapi_arch_pad_long;
 } boot_infos_t;
=20
=20
diff --git a/arch/powerpc/include/uapi/asm/kvm.h b/arch/powerpc/include/=
uapi/asm/kvm.h
index 077c5437f521..7c593c52bbf5 100644
--- a/arch/powerpc/include/uapi/asm/kvm.h
+++ b/arch/powerpc/include/uapi/asm/kvm.h
@@ -161,6 +161,7 @@ struct kvm_regs {
  */
 struct kvm_sregs {
 	__u32 pvr;
+	__uapi_arch_pad32;
 	union {
 		struct {
 			__u64 sdr1;
@@ -186,6 +187,7 @@ struct kvm_sregs {
=20
 					/* KVM_SREGS_E_FSL_PIDn */
 					__u32 pid1, pid2;
+					__uapi_arch_pad32;
 				} fsl;
 				__u8 pad[256];
 			} impl;
@@ -327,7 +329,8 @@ struct kvm_sync_regs {
 struct kvm_create_spapr_tce {
 	__u64 liobn;
 	__u32 window_size;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /* for KVM_CAP_SPAPR_TCE_64 */
 struct kvm_create_spapr_tce_64 {
diff --git a/arch/powerpc/include/uapi/asm/msgbuf.h b/arch/powerpc/inclu=
de/uapi/asm/msgbuf.h
index 7919b2ba41b5..c76821095d08 100644
--- a/arch/powerpc/include/uapi/asm/msgbuf.h
+++ b/arch/powerpc/include/uapi/asm/msgbuf.h
@@ -31,6 +31,15 @@ struct msqid64_ds {
 	__kernel_pid_t msg_lrpid;	/* last receive pid */
 	unsigned long  __unused4;
 	unsigned long  __unused5;
+	__uapi_arch_pad_long_to_u64;
 };
=20
+#ifndef __powerpc64__
+#define __uapi_arch_pad_msqid_pid
+#define __uapi_arch_pad_msqid __uapi_arch_pad16
+#else
+#define __uapi_arch_pad_msqid_pid __uapi_arch_pad16
+#define __uapi_arch_pad_msqid
+#endif
+
 #endif	/* _ASM_POWERPC_MSGBUF_H */
diff --git a/arch/powerpc/include/uapi/asm/papr-indices.h b/arch/powerpc=
/include/uapi/asm/papr-indices.h
index c2999d89d52a..5da1b7cda6a2 100644
--- a/arch/powerpc/include/uapi/asm/papr-indices.h
+++ b/arch/powerpc/include/uapi/asm/papr-indices.h
@@ -13,8 +13,10 @@ struct papr_indices_io_block {
 	union {
 		struct {
 			__u8 is_sensor; /* 0 for indicator and 1 for sensor */
+			__uapi_arch_pad8;
+			__uapi_arch_pad16;
 			__u32 indice_type;
-		} indices;
+		} __uapi_arch_align indices;
 		struct {
 			__u32 token; /* Sensor or indicator token */
 			__u32 state; /* get / set state */
diff --git a/arch/powerpc/include/uapi/asm/papr-sysparm.h b/arch/powerpc=
/include/uapi/asm/papr-sysparm.h
index f733467b1534..844bf5ee5e1e 100644
--- a/arch/powerpc/include/uapi/asm/papr-sysparm.h
+++ b/arch/powerpc/include/uapi/asm/papr-sysparm.h
@@ -15,7 +15,8 @@ struct papr_sysparm_io_block {
 	__u32 parameter;
 	__u16 length;
 	__u8 data[PAPR_SYSPARM_MAX_OUTPUT];
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /**
  * PAPR_SYSPARM_IOC_GET - Retrieve the value of a PAPR system parameter.
diff --git a/arch/powerpc/include/uapi/asm/posix_types.h b/arch/powerpc/=
include/uapi/asm/posix_types.h
index 9c0342312544..c7024ac53414 100644
--- a/arch/powerpc/include/uapi/asm/posix_types.h
+++ b/arch/powerpc/include/uapi/asm/posix_types.h
@@ -11,6 +11,7 @@
 #ifdef __powerpc64__
 typedef unsigned long	__kernel_old_dev_t;
 #define __kernel_old_dev_t __kernel_old_dev_t
+#define __uapi_arch_pad_old_dev_t
 #else
 typedef short		__kernel_ipc_pid_t;
 #define __kernel_ipc_pid_t __kernel_ipc_pid_t
diff --git a/arch/powerpc/include/uapi/asm/sembuf.h b/arch/powerpc/inclu=
de/uapi/asm/sembuf.h
index 85e96ccb5f0f..811bfe16a97a 100644
--- a/arch/powerpc/include/uapi/asm/sembuf.h
+++ b/arch/powerpc/include/uapi/asm/sembuf.h
@@ -2,6 +2,7 @@
 #ifndef _ASM_POWERPC_SEMBUF_H
 #define _ASM_POWERPC_SEMBUF_H
=20
+#include <linux/types.h>
 #include <asm/ipcbuf.h>
=20
 /*
@@ -34,6 +35,7 @@ struct semid64_ds {
 	unsigned long	sem_nsems;	/* no. of semaphores in array */
 	unsigned long	__unused3;
 	unsigned long	__unused4;
+	__uapi_arch_pad_long_to_u64;
 };
=20
 #endif	/* _ASM_POWERPC_SEMBUF_H */
diff --git a/arch/powerpc/include/uapi/asm/shmbuf.h b/arch/powerpc/inclu=
de/uapi/asm/shmbuf.h
index 439a3a02ba64..368a0c917811 100644
--- a/arch/powerpc/include/uapi/asm/shmbuf.h
+++ b/arch/powerpc/include/uapi/asm/shmbuf.h
@@ -43,6 +43,7 @@ struct shmid64_ds {
 	unsigned long		shm_nattch;	/* no. of current attaches */
 	unsigned long		__unused5;
 	unsigned long		__unused6;
+	__uapi_arch_pad_long_to_u64;
 };
=20
 struct shminfo64 {
diff --git a/arch/powerpc/include/uapi/asm/signal.h b/arch/powerpc/inclu=
de/uapi/asm/signal.h
index a5dfe84f50ab..a28f6947f8e2 100644
--- a/arch/powerpc/include/uapi/asm/signal.h
+++ b/arch/powerpc/include/uapi/asm/signal.h
@@ -91,6 +91,7 @@ struct sigaction {
 typedef struct sigaltstack {
 	void __user *ss_sp;
 	int ss_flags;
+	__uapi_arch_pad_long;
 	__kernel_size_t ss_size;
 } stack_t;
=20
diff --git a/arch/powerpc/include/uapi/asm/stat.h b/arch/powerpc/include=
/uapi/asm/stat.h
index d50901664239..4fc5fcf95e87 100644
--- a/arch/powerpc/include/uapi/asm/stat.h
+++ b/arch/powerpc/include/uapi/asm/stat.h
@@ -20,6 +20,7 @@ struct __old_kernel_stat {
 	unsigned short st_uid;
 	unsigned short st_gid;
 	unsigned short st_rdev;
+	__uapi_arch_pad16;
 	unsigned long  st_size;
 	unsigned long  st_atime;
 	unsigned long  st_mtime;
@@ -36,9 +37,11 @@ struct stat {
 #else
 	__kernel_mode_t	st_mode;
 	unsigned short	st_nlink;
+	__uapi_arch_pad16;
 #endif
 	__kernel_uid32_t st_uid;
 	__kernel_gid32_t st_gid;
+	__uapi_arch_pad_long;
 	unsigned long	st_rdev;
 	long		st_size;
 	unsigned long	st_blksize;
@@ -66,8 +69,11 @@ struct stat64 {
 	unsigned int	st_gid;		/* Group ID of the file's group. */
 	unsigned long long st_rdev;	/* Device number, if device.  */
 	unsigned short	__pad2;
+	__uapi_arch_pad16;
+	__uapi_arch_pad32;
 	long long	st_size;	/* Size of file, in bytes.  */
 	int		st_blksize;	/* Optimal block size for I/O.  */
+	__uapi_arch_pad32;
 	long long	st_blocks;	/* Number 512-byte blocks allocated. */
 	int		st_atime;	/* Time of last access.  */
 	unsigned int	st_atime_nsec;
diff --git a/arch/powerpc/include/uapi/asm/termios.h b/arch/powerpc/incl=
ude/uapi/asm/termios.h
index 5d07fc89bcb6..65c6c2de7399 100644
--- a/arch/powerpc/include/uapi/asm/termios.h
+++ b/arch/powerpc/include/uapi/asm/termios.h
@@ -13,7 +13,7 @@
 #ifndef _UAPI_ASM_POWERPC_TERMIOS_H
 #define _UAPI_ASM_POWERPC_TERMIOS_H
=20
-
+#include <linux/types.h>
 #include <asm/ioctls.h>
 #include <asm/termbits.h>
=20
@@ -58,7 +58,8 @@ struct termio {
 	unsigned short c_lflag;		/* local mode flags */
 	unsigned char c_line;		/* line discipline */
 	unsigned char c_cc[NCC];	/* control characters */
-};
+	__uapi_arch_pad8;
+} __uapi_arch_align;
=20
 /* c_cc characters */
 #define _VINTR	0
diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/u=
api/asm/ptrace.h
index 18988a5f1a63..403a845a5669 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -64,7 +64,8 @@ struct __riscv_f_ext_state {
 struct __riscv_d_ext_state {
 	__u64 f[32];
 	__u32 fcsr;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 struct __riscv_q_ext_state {
 	__u64 f[64] __attribute__((aligned(16)));
diff --git a/arch/riscv/include/uapi/asm/sigcontext.h b/arch/riscv/inclu=
de/uapi/asm/sigcontext.h
index d22d0815d605..0a679b51b487 100644
--- a/arch/riscv/include/uapi/asm/sigcontext.h
+++ b/arch/riscv/include/uapi/asm/sigcontext.h
@@ -20,6 +20,9 @@
=20
 struct __sc_riscv_v_state {
 	struct __riscv_v_ext_state v_state;
+#if __riscv_xlen =3D=3D 32
+	unsigned long long :64;
+#endif
 } __attribute__((aligned(16)));
=20
 /*
diff --git a/arch/s390/include/uapi/asm/chsc.h b/arch/s390/include/uapi/=
asm/chsc.h
index 83a574e95b3a..484324d72f00 100644
--- a/arch/s390/include/uapi/asm/chsc.h
+++ b/arch/s390/include/uapi/asm/chsc.h
@@ -57,10 +57,11 @@ struct chsc_chp_cd {
 struct chsc_cu_cd {
 	__u16 cun;
 	__u8 cssid;
+	__uapi_arch_pad8;
 	int m;
 	int fmt;
 	struct chsc_response_struct cucb;
-};
+} __uapi_arch_align;
=20
 struct chsc_sch_cud {
 	struct subchannel_id schid;
@@ -72,7 +73,8 @@ struct conf_id {
 	int m;
 	__u8 cssid;
 	__u8 ssid;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 struct chsc_conf_info {
 	struct conf_id id;
@@ -102,6 +104,7 @@ struct chsc_comp_list {
 		int fmt;
 		struct ccl_parm_chpid chpid;
 		struct ccl_parm_cssids cssids;
+		__uapi_arch_pad16;
 	} req;
 	struct chsc_response_struct sccl;
 };
diff --git a/arch/s390/include/uapi/asm/dasd.h b/arch/s390/include/uapi/=
asm/dasd.h
index 7c364b33c84d..be4fc173416b 100644
--- a/arch/s390/include/uapi/asm/dasd.h
+++ b/arch/s390/include/uapi/asm/dasd.h
@@ -32,8 +32,10 @@ typedef struct dasd_information2_t {
 	unsigned int schid;	    /* S/390 subchannel identifier */
 	unsigned int cu_type  : 16; /* from SenseID */
 	unsigned int cu_model :  8; /* from SenseID */
+	unsigned int :8;
 	unsigned int dev_type : 16; /* from SenseID */
 	unsigned int dev_model : 8; /* from SenseID */
+	unsigned int :8;
 	unsigned int open_count;
 	unsigned int req_queue_len;
 	unsigned int chanq_len;     /* length of chanq */
@@ -104,8 +106,10 @@ typedef struct dasd_information_t {
 	unsigned int schid;	    /* S/390 subchannel identifier */
 	unsigned int cu_type  : 16; /* from SenseID */
 	unsigned int cu_model :  8; /* from SenseID */
+	unsigned int :8;
 	unsigned int dev_type : 16; /* from SenseID */
 	unsigned int dev_model : 8; /* from SenseID */
+	unsigned int :8;
 	unsigned int open_count;
 	unsigned int req_queue_len;
 	unsigned int chanq_len;     /* length of chanq */
diff --git a/arch/s390/include/uapi/asm/ipcbuf.h b/arch/s390/include/uap=
i/asm/ipcbuf.h
index 9277e76d6d72..8a8b299240a2 100644
--- a/arch/s390/include/uapi/asm/ipcbuf.h
+++ b/arch/s390/include/uapi/asm/ipcbuf.h
@@ -2,7 +2,7 @@
 #ifndef __S390_IPCBUF_H__
 #define __S390_IPCBUF_H__
=20
-#include <linux/posix_types.h>
+#include <linux/types.h>
=20
 /*
  * The user_ipc_perm structure for S/390 architecture.
@@ -24,6 +24,7 @@ struct ipc64_perm
 	__kernel_mode_t		mode;
 	unsigned short		__pad1;
 	unsigned short		seq;
+	__uapi_arch_pad_long;
 	unsigned long		__unused1;
 	unsigned long		__unused2;
 };
diff --git a/arch/s390/include/uapi/asm/kvm.h b/arch/s390/include/uapi/a=
sm/kvm.h
index 60345dd2cba2..00758cab74e8 100644
--- a/arch/s390/include/uapi/asm/kvm.h
+++ b/arch/s390/include/uapi/asm/kvm.h
@@ -315,6 +315,7 @@ struct kvm_s390_zpci_op {
 			__u8 isc;       /* Guest interrupt subclass */
 			__u8 sbo;       /* Offset of guest summary bit vector */
 			__u16 pad;
+			__uapi_arch_pad32;
 		} reg_aen;
 		__u64 reserved[8];
 	} u;
@@ -361,6 +362,7 @@ struct kvm_s390_io_adapter {
=20
 struct kvm_s390_ais_req {
 	__u8 isc;
+	__uapi_arch_pad8;
 	__u16 mode;
 };
=20
@@ -403,6 +405,9 @@ struct kvm_s390_io_adapter_req {
=20
 struct kvm_s390_vm_tod_clock {
 	__u8  epoch_idx;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+	__uapi_arch_pad32;
 	__u64 tod;
 };
=20
@@ -517,6 +522,7 @@ struct kvm_sregs {
 /* for KVM_GET_FPU and KVM_SET_FPU */
 struct kvm_fpu {
 	__u32 fpc;
+	__uapi_arch_pad32;
 	__u64 fprs[16];
 };
=20
diff --git a/arch/s390/include/uapi/asm/msgbuf.h b/arch/s390/include/uap=
i/asm/msgbuf.h
new file mode 100644
index 000000000000..a1722ad85204
--- /dev/null
+++ b/arch/s390/include/uapi/asm/msgbuf.h
@@ -0,0 +1,7 @@
+#include <linux/types.h>
+#include <asm-generic/msgbuf.h>
+
+#ifndef __s390x__
+#define __uapi_arch_pad_msqid_pid
+#define __uapi_arch_pad_msqid
+#endif
diff --git a/arch/s390/include/uapi/asm/pkey.h b/arch/s390/include/uapi/=
asm/pkey.h
index ca42e941675d..4682a3c61cd9 100644
--- a/arch/s390/include/uapi/asm/pkey.h
+++ b/arch/s390/include/uapi/asm/pkey.h
@@ -200,8 +200,9 @@ struct pkey_verifykey {
 	__u16  cardnr;			       /* out: card number	  */
 	__u16  domain;			       /* out: domain number	  */
 	__u16  keysize;			       /* out: key size in bits   */
+	__uapi_arch_pad16;
 	__u32  attributes;		       /* out: attribute bits	  */
-};
+} __uapi_arch_align;
=20
 #define PKEY_VERIFYKEY _IOWR(PKEY_IOCTL_MAGIC, 0x07, struct pkey_verify=
key)
 #define PKEY_VERIFY_ATTR_AES	   0x00000001  /* key is an AES key */
@@ -233,7 +234,8 @@ struct pkey_kblob2pkey {
 	__u8 __user *key;		/* in: the key blob	   */
 	__u32 keylen;			/* in: the key blob length */
 	struct pkey_protkey protkey;	/* out: the protected key  */
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 #define PKEY_KBLOB2PROTK _IOWR(PKEY_IOCTL_MAGIC, 0x0A, struct pkey_kblo=
b2pkey)
=20
@@ -266,7 +268,8 @@ struct pkey_genseck2 {
 	__u8 __user *key;	    /* in: pointer to key blob buffer	  */
 	__u32 keylen;		    /* in: available key blob buffer size */
 				    /* out: actual key blob size	  */
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 #define PKEY_GENSECK2 _IOWR(PKEY_IOCTL_MAGIC, 0x11, struct pkey_genseck=
2)
=20
@@ -301,7 +304,8 @@ struct pkey_clr2seck2 {
 	__u8 __user *key;	    /* in: pointer to key blob buffer	   */
 	__u32 keylen;		    /* in: available key blob buffer size  */
 				    /* out: actual key blob size	   */
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 #define PKEY_CLR2SECK2 _IOWR(PKEY_IOCTL_MAGIC, 0x12, struct pkey_clr2se=
ck2)
=20
@@ -339,7 +343,8 @@ struct pkey_verifykey2 {
 	enum pkey_key_type type;    /* out: the key type		 */
 	enum pkey_key_size size;    /* out: the key size		 */
 	__u32 flags;		    /* out: additional key info flags	 */
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 #define PKEY_VERIFYKEY2 _IOWR(PKEY_IOCTL_MAGIC, 0x17, struct pkey_verif=
ykey2)
=20
@@ -359,10 +364,12 @@ struct pkey_verifykey2 {
 struct pkey_kblob2pkey2 {
 	__u8 __user *key;	     /* in: pointer to key blob		   */
 	__u32 keylen;		     /* in: key blob size		   */
+	__uapi_arch_pad_long;
 	struct pkey_apqn __user *apqns; /* in: ptr to list of apqn targets */
 	__u32 apqn_entries;	     /* in: # of apqn target list entries  */
 	struct pkey_protkey protkey; /* out: the protected key		   */
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 #define PKEY_KBLOB2PROTK2 _IOWR(PKEY_IOCTL_MAGIC, 0x1A, struct pkey_kbl=
ob2pkey2)
=20
@@ -399,7 +406,8 @@ struct pkey_apqns4key {
 	struct pkey_apqn __user *apqns; /* in/out: ptr to list of apqn targets=
*/
 	__u32 apqn_entries;	   /* in: max # of apqn entries in the list   */
 				   /* out: # apqns stored into the list	      */
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 #define PKEY_APQNS4K _IOWR(PKEY_IOCTL_MAGIC, 0x1B, struct pkey_apqns4ke=
y)
=20
@@ -439,7 +447,8 @@ struct pkey_apqns4keytype {
 	struct pkey_apqn __user *apqns; /* in/out: ptr to list of apqn targets=
*/
 	__u32 apqn_entries;	   /* in: max # of apqn entries in the list   */
 				   /* out: # apqns stored into the list	      */
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 #define PKEY_APQNS4KT _IOWR(PKEY_IOCTL_MAGIC, 0x1C, struct pkey_apqns4k=
eytype)
=20
@@ -461,12 +470,14 @@ struct pkey_apqns4keytype {
 struct pkey_kblob2pkey3 {
 	__u8 __user *key;	     /* in: pointer to key blob		   */
 	__u32 keylen;		     /* in: key blob size		   */
+	__uapi_arch_pad_long;
 	struct pkey_apqn __user *apqns; /* in: ptr to list of apqn targets */
 	__u32 apqn_entries;	     /* in: # of apqn target list entries  */
 	__u32 pkeytype;		/* out: prot key type (enum pkey_key_type) */
 	__u32 pkeylen;	 /* in/out: size of pkey buffer/actual len of pkey */
+	__uapi_arch_pad_long;
 	__u8 __user *pkey;		 /* in: pkey blob buffer space ptr */
-};
+} __uapi_arch_align;
=20
 #define PKEY_KBLOB2PROTK3 _IOWR(PKEY_IOCTL_MAGIC, 0x1D, struct pkey_kbl=
ob2pkey3)
=20
diff --git a/arch/s390/include/uapi/asm/posix_types.h b/arch/s390/includ=
e/uapi/asm/posix_types.h
index ad5ab940d192..265ba531aced 100644
--- a/arch/s390/include/uapi/asm/posix_types.h
+++ b/arch/s390/include/uapi/asm/posix_types.h
@@ -19,6 +19,7 @@ typedef long            __kernel_ssize_t;
=20
 typedef unsigned short	__kernel_old_dev_t;
 #define __kernel_old_dev_t __kernel_old_dev_t
+#define __uapi_arch_pad_old_dev_t __uapi_arch_pad16
=20
 #ifdef __KERNEL__
 typedef unsigned short __kernel_old_uid_t;
@@ -28,6 +29,7 @@ typedef unsigned short __kernel_old_gid_t;
=20
 typedef unsigned int    __kernel_ino_t;
 typedef unsigned int    __kernel_mode_t;
+#define __uapi_arch_pad_mode_t __uapi_arch_pad16
 typedef int             __kernel_ipc_pid_t;
 typedef unsigned int    __kernel_uid_t;
 typedef unsigned int    __kernel_gid_t;
diff --git a/arch/s390/include/uapi/asm/ptrace.h b/arch/s390/include/uap=
i/asm/ptrace.h
index ea29ba470e5a..96289ab01f2c 100644
--- a/arch/s390/include/uapi/asm/ptrace.h
+++ b/arch/s390/include/uapi/asm/ptrace.h
@@ -207,8 +207,13 @@ typedef struct {
=20
 typedef struct {
 	unsigned short perc_atmid;
+	__uapi_arch_pad16;
+	__uapi_arch_pad_long;
 	unsigned long address;
 	unsigned char access_id;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+	__uapi_arch_pad_long;
 } per_lowcore_words;
=20
 typedef struct {
@@ -225,10 +230,14 @@ typedef struct {
 	unsigned atmid_psw_bit_16	 : 1;
 	unsigned atmid_psw_bit_17	 : 1;
 	unsigned si			 : 2;
+	unsigned			 :16;
+	__uapi_arch_pad_long;
 	unsigned long address;
 	unsigned			 : 4;
 	unsigned access_id		 : 4;
-} per_lowcore_bits;
+	unsigned			 :24;
+	__uapi_arch_pad_long;
+} __uapi_arch_align per_lowcore_bits;
=20
 typedef struct {
 	union {
@@ -243,6 +252,7 @@ typedef struct {
 	unsigned  single_step	    : 1;
 	unsigned  instruction_fetch : 1;
 	unsigned		    : 30;
+	__uapi_arch_pad_long;
 	/*
 	 * These addresses are copied into cr10 & cr11 if single
 	 * stepping is switched off
@@ -257,6 +267,7 @@ typedef struct {
=20
 typedef struct {
 	unsigned int  len;
+	__uapi_arch_pad_long;
 	unsigned long kernel_addr;
 	unsigned long process_addr;
 } ptrace_area;
@@ -300,6 +311,7 @@ typedef struct {
 	unsigned long lowaddr;
 	unsigned long hiaddr;
 	ptprot_flags prot;
+	__uapi_arch_pad_long;
 } ptprot_area;
=20
 /* Sequence of bytes for breakpoint illegal instruction.  */
diff --git a/arch/s390/include/uapi/asm/qeth.h b/arch/s390/include/uapi/=
asm/qeth.h
index fac9995dfe33..231252508f2b 100644
--- a/arch/s390/include/uapi/asm/qeth.h
+++ b/arch/s390/include/uapi/asm/qeth.h
@@ -111,6 +111,7 @@ struct qeth_query_oat_data {
 	__u32 command;
 	__u32 buffer_len;
 	__u32 response_len;
+	__uapi_arch_pad32;
 	__u64 ptr;
-};
+} __uapi_arch_align;
 #endif /* __ASM_S390_QETH_IOCTL_H__ */
diff --git a/arch/s390/include/uapi/asm/signal.h b/arch/s390/include/uap=
i/asm/signal.h
index e74d6ba1bd3b..9bd9813ff069 100644
--- a/arch/s390/include/uapi/asm/signal.h
+++ b/arch/s390/include/uapi/asm/signal.h
@@ -108,8 +108,9 @@ struct sigaction {
 typedef struct sigaltstack {
         void __user *ss_sp;
         int ss_flags;
+	__uapi_arch_pad_long;
 	__kernel_size_t ss_size;
-} stack_t;
+} __uapi_arch_align stack_t;
=20
=20
 #endif /* _UAPI_ASMS390_SIGNAL_H */
diff --git a/arch/s390/include/uapi/asm/ucontext.h b/arch/s390/include/u=
api/asm/ucontext.h
index c95f42e85337..90fd364711d3 100644
--- a/arch/s390/include/uapi/asm/ucontext.h
+++ b/arch/s390/include/uapi/asm/ucontext.h
@@ -8,6 +8,9 @@
 #ifndef _ASM_S390_UCONTEXT_H
 #define _ASM_S390_UCONTEXT_H
=20
+#include <asm/signal.h>
+#include <asm/sigcontext.h>
+
 #define UC_GPRS_HIGH	1	/* uc_mcontext_ext has valid high gprs */
 #define UC_VXRS		2	/* uc_mcontext_ext has valid vector regs */
=20
diff --git a/arch/s390/include/uapi/asm/zcrypt.h b/arch/s390/include/uap=
i/asm/zcrypt.h
index f4785abe1b9f..b9cd47444798 100644
--- a/arch/s390/include/uapi/asm/zcrypt.h
+++ b/arch/s390/include/uapi/asm/zcrypt.h
@@ -38,11 +38,13 @@
 struct ica_rsa_modexpo {
 	__u8 __user  *inputdata;
 	__u32	      inputdatalength;
+	__uapi_arch_pad_long;
 	__u8 __user  *outputdata;
 	__u32	      outputdatalength;
+	__uapi_arch_pad_long;
 	__u8 __user  *b_key;
 	__u8 __user  *n_modulus;
-};
+} __uapi_arch_align;
=20
 /**
  * struct ica_rsa_modexpo_crt
@@ -61,14 +63,16 @@ struct ica_rsa_modexpo {
 struct ica_rsa_modexpo_crt {
 	__u8 __user  *inputdata;
 	__u32	      inputdatalength;
+	__uapi_arch_pad_long;
 	__u8 __user  *outputdata;
 	__u32	      outputdatalength;
+	__uapi_arch_pad_long;
 	__u8 __user  *bp_key;
 	__u8 __user  *bq_key;
 	__u8 __user  *np_prime;
 	__u8 __user  *nq_prime;
 	__u8 __user  *u_mult_inv;
-};
+} __uapi_arch_align;
=20
 /**
  * CPRBX
diff --git a/arch/sh/include/uapi/asm/msgbuf.h b/arch/sh/include/uapi/as=
m/msgbuf.h
new file mode 100644
index 000000000000..2823a5a36a27
--- /dev/null
+++ b/arch/sh/include/uapi/asm/msgbuf.h
@@ -0,0 +1,7 @@
+#include <linux/types.h>
+#include <asm-generic/msgbuf.h>
+
+#define __uapi_arch_pad_msqid_pid
+#define __uapi_arch_pad_msqid __uapi_arch_pad16
+
+
diff --git a/arch/sh/include/uapi/asm/posix_types_32.h b/arch/sh/include=
/uapi/asm/posix_types_32.h
index ea0f51d1ac55..1847c732250c 100644
--- a/arch/sh/include/uapi/asm/posix_types_32.h
+++ b/arch/sh/include/uapi/asm/posix_types_32.h
@@ -4,6 +4,7 @@
=20
 typedef unsigned short	__kernel_mode_t;
 #define __kernel_mode_t __kernel_mode_t
+#define __uapi_arch_pad_mode_t
 typedef unsigned short	__kernel_ipc_pid_t;
 #define __kernel_ipc_pid_t __kernel_ipc_pid_t
 typedef unsigned short	__kernel_uid_t;
@@ -17,6 +18,7 @@ typedef unsigned short	__kernel_old_gid_t;
 #define __kernel_old_gid_t __kernel_old_gid_t
 typedef unsigned short	__kernel_old_dev_t;
 #define __kernel_old_dev_t __kernel_old_dev_t
+#define __uapi_arch_pad_old_dev_t __uapi_arch_pad16
=20
 #include <asm-generic/posix_types.h>
=20
diff --git a/arch/sh/include/uapi/asm/stat.h b/arch/sh/include/uapi/asm/=
stat.h
index b0ca755ea08d..9892b669e8b2 100644
--- a/arch/sh/include/uapi/asm/stat.h
+++ b/arch/sh/include/uapi/asm/stat.h
@@ -10,6 +10,7 @@ struct __old_kernel_stat {
 	unsigned short st_uid;
 	unsigned short st_gid;
 	unsigned short st_rdev;
+	unsigned short :16;
 	unsigned long  st_size;
 	unsigned long  st_atime;
 	unsigned long  st_mtime;
diff --git a/arch/sh/include/uapi/asm/types.h b/arch/sh/include/uapi/asm=
/types.h
new file mode 100644
index 000000000000..a3f70faa8ddd
--- /dev/null
+++ b/arch/sh/include/uapi/asm/types.h
@@ -0,0 +1,3 @@
+#define __uapi_arch_pad32
+#include <asm-generic/types.h>
+
diff --git a/arch/sparc/include/uapi/asm/fcntl.h b/arch/sparc/include/ua=
pi/asm/fcntl.h
index 67dae75e5274..1efc3aeaae20 100644
--- a/arch/sparc/include/uapi/asm/fcntl.h
+++ b/arch/sparc/include/uapi/asm/fcntl.h
@@ -49,8 +49,8 @@
 #define F_WRLCK		2
 #define F_UNLCK		3
=20
-#define __ARCH_FLOCK_PAD	short __unused;
-#define __ARCH_FLOCK64_PAD	short __unused;
+#define __ARCH_FLOCK_PAD	short __unused; short :16;
+#define __ARCH_FLOCK64_PAD	short __unused; short :16;
=20
 #include <asm-generic/fcntl.h>
=20
diff --git a/arch/sparc/include/uapi/asm/ipcbuf.h b/arch/sparc/include/u=
api/asm/ipcbuf.h
index 0ea1240d2ea1..5b899a6df499 100644
--- a/arch/sparc/include/uapi/asm/ipcbuf.h
+++ b/arch/sparc/include/uapi/asm/ipcbuf.h
@@ -3,6 +3,7 @@
 #define __SPARC_IPCBUF_H
=20
 #include <linux/posix_types.h>
+#include <linux/types.h>
=20
 /*
  * The ipc64_perm structure for sparc/sparc64 architecture.
@@ -28,6 +29,7 @@ struct ipc64_perm
 	__kernel_mode_t		mode;
 	unsigned short		__pad1;
 	unsigned short		seq;
+	__uapi_arch_pad32;
 	unsigned long long	__unused1;
 	unsigned long long	__unused2;
 };
diff --git a/arch/sparc/include/uapi/asm/msgbuf.h b/arch/sparc/include/u=
api/asm/msgbuf.h
index 0954552da188..c737770b0372 100644
--- a/arch/sparc/include/uapi/asm/msgbuf.h
+++ b/arch/sparc/include/uapi/asm/msgbuf.h
@@ -2,6 +2,7 @@
 #ifndef _SPARC_MSGBUF_H
 #define _SPARC_MSGBUF_H
=20
+#include <linux/types.h>
 #include <asm/ipcbuf.h>
=20
 /*
@@ -33,5 +34,12 @@ struct msqid64_ds {
 	__kernel_pid_t msg_lrpid;	/* last receive pid */
 	unsigned long  __unused1;
 	unsigned long  __unused2;
+	__uapi_arch_pad_long_to_u64;
 };
+
+#ifndef __arch64__
+#define __uapi_arch_pad_msqid_pid
+#define __uapi_arch_pad_msqid __uapi_arch_pad16
+#endif
+
 #endif /* _SPARC_MSGBUF_H */
diff --git a/arch/sparc/include/uapi/asm/openpromio.h b/arch/sparc/inclu=
de/uapi/asm/openpromio.h
index 2a73ec77aba6..845808331219 100644
--- a/arch/sparc/include/uapi/asm/openpromio.h
+++ b/arch/sparc/include/uapi/asm/openpromio.h
@@ -4,6 +4,7 @@
=20
 #include <linux/compiler.h>
 #include <linux/ioctl.h>
+#include <linux/types.h>
=20
 /*
  * SunOS and Solaris /dev/openprom definitions. The ioctl values
@@ -54,8 +55,9 @@ struct opiocdesc
 	int	op_namelen;		/* Length of op_name. */
 	char	__user *op_name;	/* Pointer to the property name. */
 	int	op_buflen;		/* Length of op_buf (value-result) */
+	__uapi_arch_pad_long;
 	char	__user *op_buf;		/* Pointer to buffer. */
-};
+} __uapi_arch_align;
=20
 #define	OPIOCGET	_IOWR('O', 1, struct opiocdesc)
 #define	OPIOCSET	_IOW('O', 2, struct opiocdesc)
diff --git a/arch/sparc/include/uapi/asm/oradax.h b/arch/sparc/include/u=
api/asm/oradax.h
index 0dace69058ab..05744065f240 100644
--- a/arch/sparc/include/uapi/asm/oradax.h
+++ b/arch/sparc/include/uapi/asm/oradax.h
@@ -35,6 +35,7 @@ struct ccb_info_result {
 struct ccb_exec_result {
 	__u64	status_data;	/* additional status data (e.g. bad VA) */
 	__u32	status;		/* one of DAX_SUBMIT_* */
+	__uapi_arch_pad32;
 };
=20
 union ccb_result {
diff --git a/arch/sparc/include/uapi/asm/posix_types.h b/arch/sparc/incl=
ude/uapi/asm/posix_types.h
index f139e0048628..f061c5ee36ef 100644
--- a/arch/sparc/include/uapi/asm/posix_types.h
+++ b/arch/sparc/include/uapi/asm/posix_types.h
@@ -22,10 +22,14 @@ typedef int		       __kernel_suseconds_t;
 typedef long		__kernel_long_t;
 typedef unsigned long	__kernel_ulong_t;
 #define __kernel_long_t __kernel_long_t
+#define __uapi_arch_pad_kernel_long_t __uapi_arch_pad_long
=20
 struct __kernel_old_timeval {
 	__kernel_long_t tv_sec;
 	__kernel_suseconds_t tv_usec;
+#ifdef __arch64__
+	unsigned int :32;
+#endif
 };
 #define __kernel_old_timeval __kernel_old_timeval
=20
@@ -46,12 +50,14 @@ typedef unsigned short         __kernel_gid_t;
=20
 typedef unsigned short         __kernel_mode_t;
 #define __kernel_mode_t __kernel_mode_t
+#define __uapi_arch_pad_mode_t
=20
 typedef long                   __kernel_daddr_t;
 #define __kernel_daddr_t __kernel_daddr_t
=20
 typedef unsigned short	       __kernel_old_dev_t;
 #define __kernel_old_dev_t __kernel_old_dev_t
+#define __uapi_arch_pad_old_dev_t __uapi_arch_pad16
=20
 #endif /* defined(__sparc__) && defined(__arch64__) */
=20
diff --git a/arch/sparc/include/uapi/asm/sembuf.h b/arch/sparc/include/u=
api/asm/sembuf.h
index 10621d066d79..4c27f739fd81 100644
--- a/arch/sparc/include/uapi/asm/sembuf.h
+++ b/arch/sparc/include/uapi/asm/sembuf.h
@@ -2,6 +2,7 @@
 #ifndef _SPARC_SEMBUF_H
 #define _SPARC_SEMBUF_H
=20
+#include <linux/types.h>
 #include <asm/ipcbuf.h>
=20
 /*
@@ -27,6 +28,7 @@ struct semid64_ds {
 	unsigned long	sem_nsems;		/* no. of semaphores in array */
 	unsigned long	__unused1;
 	unsigned long	__unused2;
+	__uapi_arch_pad_long_to_u64;
 };
=20
 #endif /* _SPARC64_SEMBUF_H */
diff --git a/arch/sparc/include/uapi/asm/signal.h b/arch/sparc/include/u=
api/asm/signal.h
index 9c64d7cb85c2..ffce2068faca 100644
--- a/arch/sparc/include/uapi/asm/signal.h
+++ b/arch/sparc/include/uapi/asm/signal.h
@@ -2,6 +2,7 @@
 #ifndef _UAPI__SPARC_SIGNAL_H
 #define _UAPI__SPARC_SIGNAL_H
=20
+#include <linux/types.h>
 #include <asm/sigcontext.h>
 #include <linux/compiler.h>
=20
@@ -118,7 +119,8 @@ struct sigstack {
 	/* XXX 32-bit pointers pinhead XXX */
 	char *the_stack;
 	int   cur_status;
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 /* Sigvec flags */
 #define _SV_SSTACK    1u    /* This signal handler should use sig-stack=
 */
@@ -172,8 +174,9 @@ struct __old_sigaction {
 typedef struct sigaltstack {
 	void			__user *ss_sp;
 	int			ss_flags;
+	__uapi_arch_pad_long;
 	__kernel_size_t		ss_size;
-} stack_t;
+} __uapi_arch_align stack_t;
=20
=20
 #endif /* !(__ASSEMBLER__) */
diff --git a/arch/sparc/include/uapi/asm/stat.h b/arch/sparc/include/uap=
i/asm/stat.h
index 47f54133a141..0de04c1f8a63 100644
--- a/arch/sparc/include/uapi/asm/stat.h
+++ b/arch/sparc/include/uapi/asm/stat.h
@@ -8,12 +8,15 @@
 /* 64 bit sparc */
 struct stat {
 	unsigned int st_dev;
+	__uapi_arch_pad_long;
 	__kernel_ino_t st_ino;
 	__kernel_mode_t st_mode;
 	short   st_nlink;
+	__uapi_arch_pad16;
 	__kernel_uid32_t st_uid;
 	__kernel_gid32_t st_gid;
 	unsigned int st_rdev;
+	__uapi_arch_pad_long;
 	long    st_size;
 	long    st_atime;
 	long    st_mtime;
@@ -51,12 +54,14 @@ struct stat64 {
 /* 32 bit sparc */
 struct stat {
 	unsigned short	st_dev;
+	__uapi_arch_pad16;
 	__kernel_ino_t	st_ino;
 	__kernel_mode_t	st_mode;
 	short		st_nlink;
 	unsigned short	st_uid;
 	unsigned short	st_gid;
 	unsigned short	st_rdev;
+	__uapi_arch_pad16;
 	long		st_size;
 	long		st_atime;
 	unsigned long	st_atime_nsec;
diff --git a/arch/sparc/include/uapi/asm/termbits.h b/arch/sparc/include=
/uapi/asm/termbits.h
index 0da2b1adc0f5..a7c1212ada6b 100644
--- a/arch/sparc/include/uapi/asm/termbits.h
+++ b/arch/sparc/include/uapi/asm/termbits.h
@@ -2,6 +2,7 @@
 #ifndef _UAPI_SPARC_TERMBITS_H
 #define _UAPI_SPARC_TERMBITS_H
=20
+#include <linux/types.h>
 #include <asm-generic/termbits-common.h>
=20
 #if defined(__sparc__) && defined(__arch64__)
@@ -19,6 +20,7 @@ struct termios {
 	cc_t c_line;			/* line discipline */
 #ifndef __KERNEL__
 	cc_t c_cc[NCCS];		/* control characters */
+	__uapi_arch_pad16;
 #else
 	cc_t c_cc[NCCS+2];	/* kernel needs 2 more to hold vmin/vtime */
 #define SIZEOF_USER_TERMIOS sizeof (struct termios) - (2*sizeof (cc_t))
diff --git a/arch/sparc/include/uapi/asm/termios.h b/arch/sparc/include/=
uapi/asm/termios.h
index cceb32260881..b2de285d339b 100644
--- a/arch/sparc/include/uapi/asm/termios.h
+++ b/arch/sparc/include/uapi/asm/termios.h
@@ -2,6 +2,7 @@
 #ifndef _UAPI_SPARC_TERMIOS_H
 #define _UAPI_SPARC_TERMIOS_H
=20
+#include <linux/types.h>
 #include <asm/ioctls.h>
 #include <asm/termbits.h>
=20
@@ -48,6 +49,7 @@ struct termio {
 	unsigned short c_lflag;		/* local mode flags */
 	unsigned char c_line;		/* line discipline */
 	unsigned char c_cc[NCC];	/* control characters */
+	__uapi_arch_pad8;
 };
=20
 #endif /* _UAPI_SPARC_TERMIOS_H */
diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uap=
i/asm/amd_hsmp.h
index 92d8f256d096..cbf0c8d83adc 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -65,7 +65,8 @@ struct hsmp_message {
 	__u16	response_sz;		/* Number of expected output/response words */
 	__u32	args[HSMP_MAX_MSG_LEN];	/* argument/response buffer */
 	__u16	sock_ind;		/* socket number */
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 enum hsmp_msg_type {
 	HSMP_RSVD =3D -1,
diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm=
/kvm.h
index 7ceff6583652..d63ab3558573 100644
--- a/arch/x86/include/uapi/asm/kvm.h
+++ b/arch/x86/include/uapi/asm/kvm.h
@@ -218,8 +218,9 @@ struct kvm_msr_filter_range {
 	__u32 flags;
 	__u32 nmsrs; /* number of msrs in bitmap */
 	__u32 base;  /* MSR index the bitmap starts at */
+	__uapi_arch_pad_long;
 	__u8 *bitmap; /* a 1 bit allows the operations in flags, 0 denies */
-};
+} __uapi_arch_align;
=20
 #define KVM_MSR_FILTER_MAX_RANGES 16
 struct kvm_msr_filter {
@@ -229,8 +230,9 @@ struct kvm_msr_filter {
 #define KVM_MSR_FILTER_DEFAULT_DENY  (1 << 0)
 #define KVM_MSR_FILTER_VALID_MASK (KVM_MSR_FILTER_DEFAULT_DENY)
 	__u32 flags;
+	__uapi_arch_pad_long;
 	struct kvm_msr_filter_range ranges[KVM_MSR_FILTER_MAX_RANGES];
-};
+} __uapi_arch_align;
=20
 struct kvm_cpuid_entry {
 	__u32 function;
diff --git a/arch/x86/include/uapi/asm/ldt.h b/arch/x86/include/uapi/asm=
/ldt.h
index a82c039d8e6a..6d431e5cdb94 100644
--- a/arch/x86/include/uapi/asm/ldt.h
+++ b/arch/x86/include/uapi/asm/ldt.h
@@ -37,7 +37,10 @@ struct user_desc {
 	 * actual value.
 	 */
 	unsigned int  lm:1;
+#else
+	unsigned int  :1;
 #endif
+	unsigned int  :24;
 };
=20
 #define MODIFY_LDT_CONTENTS_DATA	0
diff --git a/arch/x86/include/uapi/asm/mce.h b/arch/x86/include/uapi/asm=
/mce.h
index cb6b48a7c22b..25178ef9b6d2 100644
--- a/arch/x86/include/uapi/asm/mce.h
+++ b/arch/x86/include/uapi/asm/mce.h
@@ -36,6 +36,7 @@ struct mce {
 	__u64 ipid;		/* MCA_IPID MSR: only valid on SMCA systems */
 	__u64 ppin;		/* Protected Processor Inventory Number */
 	__u32 microcode;	/* Microcode revision */
+	__uapi_arch_pad32;	/* pad */
 	__u64 kflags;		/* Internal kernel use */
 };
=20
diff --git a/arch/x86/include/uapi/asm/msgbuf.h b/arch/x86/include/uapi/=
asm/msgbuf.h
index ac83e25bbf37..04ae437d337f 100644
--- a/arch/x86/include/uapi/asm/msgbuf.h
+++ b/arch/x86/include/uapi/asm/msgbuf.h
@@ -32,4 +32,9 @@ struct msqid64_ds {
=20
 #endif
=20
+#ifndef __x86_64__
+#define __uapi_arch_pad_msqid_pid
+#define __uapi_arch_pad_msqid		__uapi_arch_pad16
+#endif
+
 #endif /* __ASM_GENERIC_MSGBUF_H */
diff --git a/arch/x86/include/uapi/asm/posix_types_32.h b/arch/x86/inclu=
de/uapi/asm/posix_types_32.h
index 840659f4b96f..6a87d9194715 100644
--- a/arch/x86/include/uapi/asm/posix_types_32.h
+++ b/arch/x86/include/uapi/asm/posix_types_32.h
@@ -10,6 +10,7 @@
=20
 typedef unsigned short	__kernel_mode_t;
 #define __kernel_mode_t __kernel_mode_t
+#define __uapi_arch_pad_mode_t
=20
 typedef unsigned short	__kernel_ipc_pid_t;
 #define __kernel_ipc_pid_t __kernel_ipc_pid_t
@@ -20,6 +21,7 @@ typedef unsigned short	__kernel_gid_t;
=20
 typedef unsigned short	__kernel_old_dev_t;
 #define __kernel_old_dev_t __kernel_old_dev_t
+#define __uapi_arch_pad_old_dev_t __uapi_arch_pad16
=20
 #include <asm-generic/posix_types.h>
=20
diff --git a/arch/x86/include/uapi/asm/posix_types_64.h b/arch/x86/inclu=
de/uapi/asm/posix_types_64.h
index 515afb8059ce..d3b16d807a0d 100644
--- a/arch/x86/include/uapi/asm/posix_types_64.h
+++ b/arch/x86/include/uapi/asm/posix_types_64.h
@@ -14,6 +14,7 @@ typedef unsigned short __kernel_old_gid_t;
=20
 typedef unsigned long	__kernel_old_dev_t;
 #define __kernel_old_dev_t __kernel_old_dev_t
+#define __uapi_arch_pad_old_dev_t
=20
 #include <asm-generic/posix_types.h>
=20
diff --git a/arch/x86/include/uapi/asm/posix_types_x32.h b/arch/x86/incl=
ude/uapi/asm/posix_types_x32.h
index f60479b07fc8..eb9dc5073a88 100644
--- a/arch/x86/include/uapi/asm/posix_types_x32.h
+++ b/arch/x86/include/uapi/asm/posix_types_x32.h
@@ -14,6 +14,7 @@
 typedef long long __kernel_long_t;
 typedef unsigned long long __kernel_ulong_t;
 #define __kernel_long_t __kernel_long_t
+#define __uapi_arch_pad_kernel_long_t
=20
 #include <asm/posix_types_64.h>
=20
diff --git a/arch/x86/include/uapi/asm/signal.h b/arch/x86/include/uapi/=
asm/signal.h
index 1067efabf18b..a7ce90b700be 100644
--- a/arch/x86/include/uapi/asm/signal.h
+++ b/arch/x86/include/uapi/asm/signal.h
@@ -103,8 +103,9 @@ struct sigaction {
 typedef struct sigaltstack {
 	void __user *ss_sp;
 	int ss_flags;
+	__uapi_arch_pad_long;
 	__kernel_size_t ss_size;
-} stack_t;
+} __uapi_arch_align stack_t;
=20
 #endif /* __ASSEMBLER__ */
=20
diff --git a/arch/x86/include/uapi/asm/stat.h b/arch/x86/include/uapi/as=
m/stat.h
index 9e3982d95d0f..14b0a3b0d8de 100644
--- a/arch/x86/include/uapi/asm/stat.h
+++ b/arch/x86/include/uapi/asm/stat.h
@@ -2,7 +2,7 @@
 #ifndef _ASM_X86_STAT_H
 #define _ASM_X86_STAT_H
=20
-#include <asm/posix_types.h>
+#include <linux/types.h>
=20
 #define STAT_HAVE_NSEC 1
=20
@@ -53,6 +53,7 @@ struct stat64 {
=20
 	unsigned long long	st_rdev;
 	unsigned char	__pad3[4];
+	__uapi_arch_pad32;
=20
 	long long	st_size;
 	unsigned long	st_blksize;
@@ -65,12 +66,13 @@ struct stat64 {
=20
 	unsigned long	st_mtime;
 	unsigned int	st_mtime_nsec;
+	__uapi_arch_pad_long;
=20
 	unsigned long	st_ctime;
 	unsigned long	st_ctime_nsec;
=20
 	unsigned long long	st_ino;
-};
+} __uapi_arch_align;
=20
 /* We don't need to memset the whole thing just to initialize the paddi=
ng */
 #define INIT_STRUCT_STAT64_PADDING(st) do {		\
@@ -122,6 +124,7 @@ struct __old_kernel_stat {
 	unsigned short st_uid;
 	unsigned short st_gid;
 	unsigned short st_rdev;
+	__uapi_arch_pad16;
 #ifdef __i386__
 	unsigned long  st_size;
 	unsigned long  st_atime;
@@ -133,6 +136,6 @@ struct __old_kernel_stat {
 	unsigned int  st_mtime;
 	unsigned int  st_ctime;
 #endif
-};
+} __uapi_arch_align;
=20
 #endif /* _ASM_X86_STAT_H */
diff --git a/arch/x86/include/uapi/asm/types.h b/arch/x86/include/uapi/a=
sm/types.h
new file mode 100644
index 000000000000..b3ef80c82153
--- /dev/null
+++ b/arch/x86/include/uapi/asm/types.h
@@ -0,0 +1,11 @@
+#ifndef __X86_ASM_TYPES_H
+#define __X86_ASM_TYPES_H
+
+/* i386 has only aligns 64-bit types to 32-bit addresses */
+#ifndef __x86_64
+#define __uapi_arch_pad32
+#endif
+
+#include <asm-generic/int-ll64.h>
+
+#endif
diff --git a/arch/x86/include/uapi/asm/ucontext.h b/arch/x86/include/uap=
i/asm/ucontext.h
index 5657b7a49f03..e83136e1a4a7 100644
--- a/arch/x86/include/uapi/asm/ucontext.h
+++ b/arch/x86/include/uapi/asm/ucontext.h
@@ -51,6 +51,8 @@
 #define UC_STRICT_RESTORE_SS	0x4
 #endif
=20
+#include <asm/signal.h>
+#include <asm/sigcontext.h>
 #include <asm-generic/ucontext.h>
=20
 #endif /* _ASM_X86_UCONTEXT_H */
diff --git a/arch/x86/include/uapi/asm/vm86.h b/arch/x86/include/uapi/as=
m/vm86.h
index 18909b8050bc..e27f812636eb 100644
--- a/arch/x86/include/uapi/asm/vm86.h
+++ b/arch/x86/include/uapi/asm/vm86.h
@@ -13,6 +13,7 @@
  * Linus
  */
=20
+#include <linux/types.h>
 #include <asm/processor-flags.h>
=20
 #define BIOSSEG		0x0f000
@@ -78,6 +79,7 @@ struct vm86_regs {
 	long orig_eax;
 	long eip;
 	unsigned short cs, __csh;
+	__uapi_arch_pad_long;
 	long eflags;
 	long esp;
 	unsigned short ss, __ssh;
@@ -88,7 +90,8 @@ struct vm86_regs {
 	unsigned short ds, __dsh;
 	unsigned short fs, __fsh;
 	unsigned short gs, __gsh;
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 struct revectored_struct {
 	unsigned long __map[8];			/* 256 bits */
@@ -115,7 +118,9 @@ struct vm86plus_info_struct {
 	unsigned long unused:28;
 	unsigned long is_vm86pus:1;	      /* for vm86 internal use */
 	unsigned char vm86dbg_intxxtab[32];   /* for debugger */
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
+
 struct vm86plus_struct {
 	struct vm86_regs regs;
 	unsigned long flags;
diff --git a/arch/xtensa/include/uapi/asm/msgbuf.h b/arch/xtensa/include=
/uapi/asm/msgbuf.h
index 1ed2c85b693a..2c00d8e8324b 100644
--- a/arch/xtensa/include/uapi/asm/msgbuf.h
+++ b/arch/xtensa/include/uapi/asm/msgbuf.h
@@ -47,4 +47,7 @@ struct msqid64_ds {
 	unsigned long  __unused5;
 };
=20
+#define __uapi_arch_pad_msqid_pid
+#define __uapi_arch_pad_msqid __uapi_arch_pad16
+
 #endif	/* _XTENSA_MSGBUF_H */
diff --git a/arch/xtensa/include/uapi/asm/posix_types.h b/arch/xtensa/in=
clude/uapi/asm/posix_types.h
index 1dc67592881f..42b18a5d15a8 100644
--- a/arch/xtensa/include/uapi/asm/posix_types.h
+++ b/arch/xtensa/include/uapi/asm/posix_types.h
@@ -34,6 +34,7 @@ typedef unsigned short	__kernel_old_gid_t;
=20
 typedef unsigned short	__kernel_old_dev_t;
 #define __kernel_old_dev_t __kernel_old_dev_t
+#define __uapi_arch_pad_old_dev_t	__uapi_arch_pad16
=20
 #include <asm-generic/posix_types.h>
=20
diff --git a/include/uapi/asm-generic/fcntl.h b/include/uapi/asm-generic=
/fcntl.h
index 613475285643..80d1c2682156 100644
--- a/include/uapi/asm-generic/fcntl.h
+++ b/include/uapi/asm-generic/fcntl.h
@@ -191,30 +191,37 @@ struct f_owner_ex {
 #define F_LINUX_SPECIFIC_BASE	1024
=20
 #ifndef HAVE_ARCH_STRUCT_FLOCK
+
+#ifndef __ARCH_FLOCK_PAD
+#define __ARCH_FLOCK_PAD __uapi_arch_pad_long;
+#endif
+
+#ifndef __ARCH_FLOCK64_PAD
+#define __ARCH_FLOCK64_PAD __uapi_arch_pad32;
+#endif
+
 struct flock {
 	short	l_type;
 	short	l_whence;
+	__uapi_arch_pad_long;
 	__kernel_off_t	l_start;
 	__kernel_off_t	l_len;
 	__kernel_pid_t	l_pid;
 #ifdef	__ARCH_FLOCK_EXTRA_SYSID
 	__ARCH_FLOCK_EXTRA_SYSID
 #endif
-#ifdef	__ARCH_FLOCK_PAD
 	__ARCH_FLOCK_PAD
-#endif
-};
+} __uapi_arch_align;
=20
 struct flock64 {
 	short  l_type;
 	short  l_whence;
+	__uapi_arch_pad32;
 	__kernel_loff_t l_start;
 	__kernel_loff_t l_len;
 	__kernel_pid_t  l_pid;
-#ifdef	__ARCH_FLOCK64_PAD
 	__ARCH_FLOCK64_PAD
-#endif
-};
+} __uapi_arch_align;
 #endif /* HAVE_ARCH_STRUCT_FLOCK */
=20
 #endif /* _ASM_GENERIC_FCNTL_H */
diff --git a/include/uapi/asm-generic/ipcbuf.h b/include/uapi/asm-generi=
c/ipcbuf.h
index 41a01b494fc7..36882434deeb 100644
--- a/include/uapi/asm-generic/ipcbuf.h
+++ b/include/uapi/asm-generic/ipcbuf.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_GENERIC_IPCBUF_H
 #define __ASM_GENERIC_IPCBUF_H
=20
-#include <linux/posix_types.h>
+#include <linux/types.h>
=20
 /*
  * The generic ipc64_perm structure:
@@ -30,8 +30,9 @@ struct ipc64_perm {
 	unsigned char		__pad1[4 - sizeof(__kernel_mode_t)];
 	unsigned short		seq;
 	unsigned short		__pad2;
+	__uapi_arch_pad_long;
 	__kernel_ulong_t	__unused1;
 	__kernel_ulong_t	__unused2;
-};
+} __uapi_arch_align;
=20
 #endif /* __ASM_GENERIC_IPCBUF_H */
diff --git a/include/uapi/asm-generic/posix_types.h b/include/uapi/asm-g=
eneric/posix_types.h
index 0a90ad92dbf3..02d7591fbb56 100644
--- a/include/uapi/asm-generic/posix_types.h
+++ b/include/uapi/asm-generic/posix_types.h
@@ -14,6 +14,7 @@
 #ifndef __kernel_long_t
 typedef long		__kernel_long_t;
 typedef unsigned long	__kernel_ulong_t;
+#define __uapi_arch_pad_kernel_long_t	__uapi_arch_pad_long
 #endif
=20
 #ifndef __kernel_ino_t
@@ -22,6 +23,7 @@ typedef __kernel_ulong_t __kernel_ino_t;
=20
 #ifndef __kernel_mode_t
 typedef unsigned int	__kernel_mode_t;
+#define __uapi_arch_pad_mode_t __uapi_arch_pad16
 #endif
=20
 #ifndef __kernel_pid_t
@@ -57,6 +59,7 @@ typedef __kernel_gid_t	__kernel_old_gid_t;
=20
 #ifndef __kernel_old_dev_t
 typedef unsigned int	__kernel_old_dev_t;
+#define __uapi_arch_pad_old_dev_t
 #endif
=20
 /*
diff --git a/include/uapi/asm-generic/siginfo.h b/include/uapi/asm-gener=
ic/siginfo.h
index 5a1ca43b5fc6..ed39d5f4859a 100644
--- a/include/uapi/asm-generic/siginfo.h
+++ b/include/uapi/asm-generic/siginfo.h
@@ -47,6 +47,7 @@ union __sifields {
 		int _overrun;		/* overrun count */
 		sigval_t _sigval;	/* same as below */
 		int _sys_private;       /* Not used by the kernel. Historic leftover.=
 Always 0. */
+		__uapi_arch_pad_long;
 	} _timer;
=20
 	/* POSIX.1b signals */
@@ -61,6 +62,7 @@ union __sifields {
 		__kernel_pid_t _pid;	/* which child */
 		__kernel_uid32_t _uid;	/* sender's uid */
 		int _status;		/* exit code */
+		__u8 __pad[sizeof(__ARCH_SI_CLOCK_T) - sizeof(int)];
 		__ARCH_SI_CLOCK_T _utime;
 		__ARCH_SI_CLOCK_T _stime;
 	} _sigchld;
@@ -103,6 +105,7 @@ union __sifields {
 	struct {
 		__ARCH_SI_BAND_T _band;	/* POLL_IN, POLL_OUT, POLL_MSG */
 		int _fd;
+		__u8 _si_band_pad[sizeof(__ARCH_SI_BAND_T) - sizeof(int)];
 	} _sigpoll;
=20
 	/* SIGSYS */
@@ -119,6 +122,7 @@ struct {				\
 	int si_signo;			\
 	int si_errno;			\
 	int si_code;			\
+	__uapi_arch_pad_long;		\
 	union __sifields _sifields;	\
 }
 #else
diff --git a/include/uapi/asm-generic/signal.h b/include/uapi/asm-generi=
c/signal.h
index 0eb69dc8e572..f851843eb1bf 100644
--- a/include/uapi/asm-generic/signal.h
+++ b/include/uapi/asm-generic/signal.h
@@ -85,6 +85,7 @@ struct sigaction {
 typedef struct sigaltstack {
 	void __user *ss_sp;
 	int ss_flags;
+	__uapi_arch_pad_long;
 	__kernel_size_t ss_size;
 } stack_t;
=20
diff --git a/include/uapi/asm-generic/statfs.h b/include/uapi/asm-generi=
c/statfs.h
index bd35c7619ca2..56ab1db43dd4 100644
--- a/include/uapi/asm-generic/statfs.h
+++ b/include/uapi/asm-generic/statfs.h
@@ -43,6 +43,13 @@ struct statfs {
 #define ARCH_PACK_STATFS64
 #endif
=20
+/*
+ * 32-bit architectures and alpha have 32-bit extra padding
+ */
+#ifndef __uapi_arch_pad_statfs64
+#define __uapi_arch_pad_statfs64 __uapi_arch_pad_long_to_u64
+#endif
+
 struct statfs64 {
 	__statfs_word f_type;
 	__statfs_word f_bsize;
@@ -56,6 +63,7 @@ struct statfs64 {
 	__statfs_word f_frsize;
 	__statfs_word f_flags;
 	__statfs_word f_spare[4];
+	__uapi_arch_pad_statfs64;
 } ARCH_PACK_STATFS64;
=20
 /*=20
@@ -64,6 +72,9 @@ struct statfs64 {
  */
 #ifndef ARCH_PACK_COMPAT_STATFS64
 #define ARCH_PACK_COMPAT_STATFS64
+#define __uapi_arch_pad_compat_statfs64 __uapi_arch_pad32
+#else
+#define __uapi_arch_pad_compat_statfs64
 #endif
=20
 struct compat_statfs64 {
@@ -79,6 +90,9 @@ struct compat_statfs64 {
 	__u32 f_frsize;
 	__u32 f_flags;
 	__u32 f_spare[4];
+	__uapi_arch_pad_compat_statfs64;
 } ARCH_PACK_COMPAT_STATFS64;
=20
+#undef __compat_statfs64_pad
+
 #endif /* _UAPI_GENERIC_STATFS_H */
diff --git a/include/uapi/asm-generic/termios.h b/include/uapi/asm-gener=
ic/termios.h
index cf892933a363..bb7d2ad5480b 100644
--- a/include/uapi/asm-generic/termios.h
+++ b/include/uapi/asm-generic/termios.h
@@ -9,6 +9,7 @@
  * New architectures should not provide their own version.
  */
=20
+#include <linux/types.h>
 #include <asm/termbits.h>
 #include <asm/ioctls.h>
=20
@@ -27,6 +28,7 @@ struct termio {
 	unsigned short c_lflag;		/* local mode flags */
 	unsigned char c_line;		/* line discipline */
 	unsigned char c_cc[NCC];	/* control characters */
+	__uapi_arch_pad8;
 };
=20
 /* modem lines */
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm=
.h
index 351c2fb2df90..87db7d958b28 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -714,7 +714,8 @@ struct drm_amdgpu_gem_metadata {
 		__u64	tiling_info;
 		__u32	data_size_bytes;
 		__u32	data[64];
-	} data;
+		__uapi_arch_pad32;
+	} __uapi_arch_align data;
 };
=20
 struct drm_amdgpu_gem_mmap_in {
@@ -1511,6 +1512,7 @@ struct drm_amdgpu_info_device {
 	__u64 high_va_max;
 	/* gfx10 pa_sc_tile_steering_override */
 	__u32 pa_sc_tile_steering_override;
+	__uapi_arch_pad32;
 	/* disabled TCCs */
 	__u64 tcc_disabled_mask;
 	__u64 min_engine_clock;
@@ -1536,7 +1538,8 @@ struct drm_amdgpu_info_device {
 	/* Userq IP mask (1 << AMDGPU_HW_IP_*) */
 	__u32 userq_ip_mask;
 	__u32 pad;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 struct drm_amdgpu_info_hw_ip {
 	/** Version of h/w IP */
@@ -1554,7 +1557,8 @@ struct drm_amdgpu_info_hw_ip {
 	__u32  ip_discovery_version;
 	/* Userq available slots */
 	__u32  userq_num_slots;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 struct drm_amdgpu_info_num_handles {
 	/** Max handles as supported by firmware for UVD */
diff --git a/include/uapi/drm/armada_drm.h b/include/uapi/drm/armada_drm=
.h
index af1c14c837c5..4cbec706d4f2 100644
--- a/include/uapi/drm/armada_drm.h
+++ b/include/uapi/drm/armada_drm.h
@@ -45,7 +45,8 @@ struct drm_armada_gem_pwrite {
 	__u32 handle;
 	__u32 offset;
 	__u32 size;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
 #define DRM_IOCTL_ARMADA_GEM_PWRITE \
 	ARMADA_IOCTL(IOW, GEM_PWRITE, gem_pwrite)
=20
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 27cc159c1d27..889207cdaa48 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -105,8 +105,9 @@ struct drm_clip_rect {
  */
 struct drm_drawable_info {
 	unsigned int num_rects;
+	__uapi_arch_pad_long;
 	struct drm_clip_rect *rects;
-};
+} __uapi_arch_align;
=20
 /*
  * Texture region,
@@ -140,13 +141,14 @@ struct drm_version {
 	int version_major;	  /**< Major version */
 	int version_minor;	  /**< Minor version */
 	int version_patchlevel;	  /**< Patch level */
+	__uapi_arch_pad_long;
 	__kernel_size_t name_len;	  /**< Length of name buffer */
 	char __user *name;	  /**< Name of driver */
 	__kernel_size_t date_len;	  /**< Length of date buffer */
 	char __user *date;	  /**< User-space buffer to hold date */
 	__kernel_size_t desc_len;	  /**< Length of desc buffer */
 	char __user *desc;	  /**< User-space buffer to hold desc */
-};
+} __uapi_arch_align;
=20
 /*
  * DRM_IOCTL_GET_UNIQUE ioctl argument type.
@@ -160,6 +162,7 @@ struct drm_unique {
=20
 struct drm_list {
 	int count;		  /**< Length of user-space structures */
+	__uapi_arch_pad_long;
 	struct drm_version __user *version;
 };
=20
@@ -210,8 +213,9 @@ enum drm_map_flags {
=20
 struct drm_ctx_priv_map {
 	unsigned int ctx_id;	 /**< Context requesting private mapping */
+	__uapi_arch_pad_long;
 	void *handle;		 /**< Handle of map */
-};
+} __uapi_arch_align;
=20
 /*
  * DRM_IOCTL_GET_MAP, DRM_IOCTL_ADD_MAP and DRM_IOCTL_RM_MAP ioctls
@@ -227,8 +231,9 @@ struct drm_map {
 	void *handle;		 /**< User-space: "Handle" to pass to mmap() */
 				 /**< Kernel-space: kernel-virtual address */
 	int mtrr;		 /**< MTRR slot used */
+	__uapi_arch_pad_long;
 	/*   Private data */
-};
+} __uapi_arch_align;
=20
 /*
  * DRM_IOCTL_GET_CLIENT ioctl argument type.
@@ -270,7 +275,12 @@ struct drm_stats {
 	struct {
 		unsigned long value;
 		enum drm_stat_type type;
-	} data[15];
+		__uapi_arch_pad_long;
+#ifdef __hexagon__
+		/* hexagon uses short enums */
+		__u8 :8, :8, :8;
+#endif
+	} __uapi_arch_align data[15];
 };
=20
 /*
@@ -344,6 +354,7 @@ struct drm_buf_desc {
 		_DRM_FB_BUFFER =3D 0x08,	/**< Buffer is in frame buffer */
 		_DRM_PCI_BUFFER_RO =3D 0x10 /**< Map PCI DMA buffer read-only */
 	} flags;
+	__uapi_arch_pad_long;
 	unsigned long agp_start; /**<
 				  * Start address of where the AGP buffers are
 				  * in the AGP aperture
@@ -355,16 +366,18 @@ struct drm_buf_desc {
  */
 struct drm_buf_info {
 	int count;		/**< Entries in list */
+	__uapi_arch_pad_long;
 	struct drm_buf_desc __user *list;
-};
+} __uapi_arch_align;
=20
 /*
  * DRM_IOCTL_FREE_BUFS ioctl argument type.
  */
 struct drm_buf_free {
 	int count;
+	__uapi_arch_pad_long;
 	int __user *list;
-};
+} __uapi_arch_align;
=20
 /*
  * Buffer information
@@ -375,21 +388,23 @@ struct drm_buf_pub {
 	int idx;		       /**< Index into the master buffer list */
 	int total;		       /**< Buffer size */
 	int used;		       /**< Amount of buffer in use (for DMA) */
+	__uapi_arch_pad_long;
 	void __user *address;	       /**< Address of buffer */
-};
+} __uapi_arch_align;
=20
 /*
  * DRM_IOCTL_MAP_BUFS ioctl argument type.
  */
 struct drm_buf_map {
 	int count;		/**< Length of the buffer list */
+	__uapi_arch_pad_long;
 #ifdef __cplusplus
 	void __user *virt;
 #else
 	void __user *virtual;		/**< Mmap'd area in user-virtual */
 #endif
 	struct drm_buf_pub __user *list;	/**< Buffer information */
-};
+} __uapi_arch_align;
=20
 /*
  * DRM_IOCTL_DMA ioctl argument type.
@@ -406,10 +421,12 @@ struct drm_dma {
 	enum drm_dma_flags flags;	  /**< Flags */
 	int request_count;		  /**< Number of buffers requested */
 	int request_size;		  /**< Desired size for buffers */
+	__uapi_arch_pad_long;
 	int __user *request_indices;	  /**< Buffer information */
 	int __user *request_sizes;
 	int granted_count;		  /**< Number of buffers granted */
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 enum drm_ctx_flags {
 	_DRM_CONTEXT_PRESERVED =3D 0x01,
@@ -431,8 +448,9 @@ struct drm_ctx {
  */
 struct drm_ctx_res {
 	int count;
+	__uapi_arch_pad_long;
 	struct drm_ctx __user *contexts;
-};
+} __uapi_arch_align;
=20
 /*
  * DRM_IOCTL_ADD_DRAW and DRM_IOCTL_RM_DRAW ioctl argument type.
@@ -452,8 +470,9 @@ struct drm_update_draw {
 	drm_drawable_t handle;
 	unsigned int type;
 	unsigned int num;
+	__uapi_arch_pad32;
 	unsigned long long data;
-};
+} __uapi_arch_align;
=20
 /*
  * DRM_IOCTL_GET_MAGIC and DRM_IOCTL_AUTH_MAGIC ioctl argument type.
@@ -577,7 +596,8 @@ struct drm_agp_info {
 	/* PCI information */
 	unsigned short id_vendor;
 	unsigned short id_device;
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 /*
  * DRM_IOCTL_SG_ALLOC ioctl argument type.
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index cbbbfc1dfe2b..3479458f0fe5 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -360,7 +360,8 @@ struct drm_mode_get_plane {
 struct drm_mode_get_plane_res {
 	__u64 plane_id_ptr;
 	__u32 count_planes;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 #define DRM_MODE_ENCODER_NONE	0
 #define DRM_MODE_ENCODER_DAC	1
@@ -638,14 +639,16 @@ struct drm_mode_obj_get_properties {
 	__u32 count_props;
 	__u32 obj_id;
 	__u32 obj_type;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 struct drm_mode_obj_set_property {
 	__u64 value;
 	__u32 prop_id;
 	__u32 obj_id;
 	__u32 obj_type;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 struct drm_mode_get_blob {
 	__u32 blob_id;
@@ -733,8 +736,9 @@ struct drm_mode_fb_cmd2 {
 	 * constants in ``drm_fourcc.h``. All planes must use the same
 	 * modifier. Ignored unless &DRM_MODE_FB_MODIFIERS is set in @flags.
 	 */
+	__uapi_arch_pad32;
 	__u64 modifier[4];
-};
+} __uapi_arch_align;
=20
 #define DRM_MODE_FB_DIRTY_ANNOTATE_COPY 0x01
 #define DRM_MODE_FB_DIRTY_ANNOTATE_FILL 0x02
@@ -1088,7 +1092,8 @@ struct hdr_output_metadata {
 	union {
 		struct hdr_metadata_infoframe hdmi_metadata_type1;
 	};
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /**
  * DRM_MODE_PAGE_FLIP_EVENT
diff --git a/include/uapi/drm/etnaviv_drm.h b/include/uapi/drm/etnaviv_d=
rm.h
index af024d90453d..abd0cafa231f 100644
--- a/include/uapi/drm/etnaviv_drm.h
+++ b/include/uapi/drm/etnaviv_drm.h
@@ -140,6 +140,7 @@ struct drm_etnaviv_gem_submit_reloc {
 	__u32 reloc_idx;      /* in, index of reloc_bo buffer */
 	__u64 reloc_offset;   /* in, offset from start of reloc_bo */
 	__u32 flags;          /* in, placeholder for now, no defined values */
+	__uapi_arch_pad32;
 };
=20
 /* Each buffer referenced elsewhere in the cmdstream submit (ie. the
@@ -263,7 +264,8 @@ struct drm_etnaviv_pm_signal {
 	__u16 iter;       /* in/out, select pm source at index iter */
 	__u16 id;         /* out, id of signal */
 	char  name[64];   /* out, name of domain */
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 #define DRM_ETNAVIV_GET_PARAM          0x00
 /* placeholder:
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 535cb68fdb5c..0292837b2aaa 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -28,6 +28,7 @@
 #define _UAPI_I915_DRM_H_
=20
 #include "drm.h"
+#include <linux/stddef.h>
=20
 #if defined(__cplusplus)
 extern "C" {
@@ -559,6 +560,7 @@ typedef struct drm_i915_batchbuffer {
 	int DR1;		/* hw flags for GFX_OP_DRAWRECT_INFO */
 	int DR4;		/* window origin for GFX_OP_DRAWRECT_INFO */
 	int num_cliprects;	/* mulitpass with multiple cliprects? */
+	__uapi_arch_pad_long;
 	struct drm_clip_rect __user *cliprects;	/* pointer to userspace clipre=
cts */
 } drm_i915_batchbuffer_t;
=20
@@ -820,6 +822,7 @@ typedef struct drm_i915_irq_wait {
 struct drm_i915_getparam {
 	/** @param: Driver parameter to query. */
 	__s32 param;
+	__uapi_arch_pad_long;
=20
 	/**
 	 * @value: Address of memory where queried value should be put.
@@ -828,7 +831,7 @@ struct drm_i915_getparam {
 	 * compat32 code. Don't repeat this mistake.
 	 */
 	int __user *value;
-};
+} __uapi_arch_align;
=20
 /**
  * typedef drm_i915_getparam_t - Driver parameter query structure.
@@ -857,8 +860,9 @@ typedef struct drm_i915_mem_alloc {
 	int region;
 	int alignment;
 	int size;
+	__uapi_arch_pad_long;
 	int __user *region_offset;	/* offset from start of fb or agp */
-} drm_i915_mem_alloc_t;
+} __uapi_arch_align drm_i915_mem_alloc_t;
=20
 typedef struct drm_i915_mem_free {
 	int region;
@@ -3422,7 +3426,16 @@ struct drm_i915_query_perf_config {
 		 * String formatted like "%08x-%04x-%04x-%04x-%012x"
 		 */
 		char uuid[36];
-	};
+
+		/*
+		 * uuid is the longest field in the union but is not a multiple
+		 * of alignof(__u64) in size, which leads to a -Wpadded warning.
+		 * add an explicit union member here with the correct size on
+		 * the architectures that need padding or zero length on those
+		 * that do not.
+		 */
+		struct { __uapi_arch_pad32; } __pad[10];
+	} __uapi_arch_align;
=20
 	/**
 	 * @flags:
@@ -3447,8 +3460,11 @@ struct drm_i915_query_perf_config {
 	 *  - &drm_i915_perf_oa_config.n_boolean_regs
 	 *  - &drm_i915_perf_oa_config.n_flex_regs
 	 */
-	__u8 data[];
-};
+	union {
+		__uapi_arch_pad32; /* pad to alignof(__u64) */
+		__DECLARE_FLEX_ARRAY(__u8, data);
+	};
+} __uapi_arch_align;
=20
 /**
  * enum drm_i915_gem_memory_class - Supported memory classes
@@ -3867,7 +3883,8 @@ struct drm_i915_gem_create_ext_protected_content {
 	struct i915_user_extension base;
 	/** @flags: reserved for future usage, currently MBZ */
 	__u32 flags;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /**
  * struct drm_i915_gem_create_ext_set_pat - The
diff --git a/include/uapi/drm/ivpu_accel.h b/include/uapi/drm/ivpu_accel=
.h
index 264505d54f93..f80a580a21bc 100644
--- a/include/uapi/drm/ivpu_accel.h
+++ b/include/uapi/drm/ivpu_accel.h
@@ -389,7 +389,8 @@ struct drm_ivpu_submit {
 	 * %DRM_IVPU_JOB_PRIORITY_REALTIME
 	 */
 	__u32 priority;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /**
  * struct drm_ivpu_cmdq_submit - Submit commands to the VPU using expli=
cit command queue
@@ -488,7 +489,8 @@ struct drm_ivpu_metric_streamer_start {
 	__u32 sample_size;
 	/** @max_data_size: Returned max @data_size from %DRM_IOCTL_IVPU_METRI=
C_STREAMER_GET_DATA */
 	__u32 max_data_size;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /**
  * struct drm_ivpu_metric_streamer_get_data - Copy collected metric data
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 5c67294edc95..dd117ad443ea 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -429,7 +429,8 @@ struct drm_msm_wait_fence {
 	__u32 flags;          /* in, bitmask of MSM_WAIT_FENCE_x */
 	struct drm_msm_timespec timeout;   /* in */
 	__u32 queueid;         /* in, submitqueue id */
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /* madvise provides a way to tell the kernel in case a buffers contents
  * can be discarded under memory pressure, which is useful for userspace
diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost=
_drm.h
index 50d5337f35ef..f5b1e3b56897 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -402,14 +402,16 @@ struct panfrost_dump_object_header {
 			__u32 gpu_id;
 			__u32 major;
 			__u32 minor;
+			__uapi_arch_pad32;
 			__u64 nbos;
-		} reghdr;
+		} __uapi_arch_align reghdr;
=20
 		struct {
 			__u32 valid;
+			__uapi_arch_pad32;
 			__u64 iova;
 			__u32 data[2];
-		} bomap;
+		} __uapi_arch_align bomap;
=20
 		/*
 		 * Force same size in case we want to expand the header
diff --git a/include/uapi/drm/radeon_drm.h b/include/uapi/drm/radeon_drm=
.h
index 490a59cc4532..95db5d8eea49 100644
--- a/include/uapi/drm/radeon_drm.h
+++ b/include/uapi/drm/radeon_drm.h
@@ -569,6 +569,7 @@ typedef struct drm_radeon_init {
 		RADEON_INIT_R300_CP =3D 0x04,
 		RADEON_INIT_R600_CP =3D 0x05
 	} func;
+	__uapi_arch_pad_long;
 	unsigned long sarea_priv_offset;
 	int is_pci;
 	int cp_mode;
@@ -581,6 +582,7 @@ typedef struct drm_radeon_init {
 	unsigned int back_offset, back_pitch;
 	unsigned int depth_bpp;
 	unsigned int depth_offset, depth_pitch;
+	__uapi_arch_pad_long;
=20
 	unsigned long fb_offset;
 	unsigned long mmio_offset;
@@ -588,7 +590,7 @@ typedef struct drm_radeon_init {
 	unsigned long ring_rptr_offset;
 	unsigned long buffers_offset;
 	unsigned long gart_textures_offset;
-} drm_radeon_init_t;
+} __uapi_arch_align drm_radeon_init_t;
=20
 typedef struct drm_radeon_cp_stop {
 	int flush;
@@ -619,8 +621,9 @@ typedef struct drm_radeon_clear {
 	unsigned int clear_depth;
 	unsigned int color_mask;
 	unsigned int depth_mask;	/* misnamed field:  should be stencil */
+	__uapi_arch_pad_long;
 	drm_radeon_clear_rect_t __user *depth_boxes;
-} drm_radeon_clear_t;
+} __uapi_arch_align drm_radeon_clear_t;
=20
 typedef struct drm_radeon_vertex {
 	int prim;
@@ -645,10 +648,12 @@ typedef struct drm_radeon_vertex2 {
 	int idx;		/* Index of vertex buffer */
 	int discard;		/* Client finished with buffer? */
 	int nr_states;
+	__uapi_arch_pad_long;
 	drm_radeon_state_t __user *state;
 	int nr_prims;
+	__uapi_arch_pad_long;
 	drm_radeon_prim_t __user *prim;
-} drm_radeon_vertex2_t;
+} __uapi_arch_align drm_radeon_vertex2_t;
=20
 /* v1.3 - obsoletes drm_radeon_vertex2
  *      - allows arbitrarily large cliprect list
@@ -662,10 +667,12 @@ typedef struct drm_radeon_vertex2 {
  */
 typedef struct drm_radeon_cmd_buffer {
 	int bufsz;
+	__uapi_arch_pad_long;
 	char __user *buf;
 	int nbox;
+	__uapi_arch_pad_long;
 	struct drm_clip_rect __user *boxes;
-} drm_radeon_cmd_buffer_t;
+} __uapi_arch_align drm_radeon_cmd_buffer_t;
=20
 typedef struct drm_radeon_tex_image {
 	unsigned int x, y;	/* Blit coordinates */
@@ -679,6 +686,7 @@ typedef struct drm_radeon_texture {
 	int format;
 	int width;		/* Texture image coordinates */
 	int height;
+	__uapi_arch_pad_long;
 	drm_radeon_tex_image_t __user *image;
 } drm_radeon_texture_t;
=20
@@ -723,8 +731,9 @@ typedef struct drm_radeon_indirect {
=20
 typedef struct drm_radeon_getparam {
 	int param;
+	__uapi_arch_pad_long;
 	void __user *value;
-} drm_radeon_getparam_t;
+} __uapi_arch_align drm_radeon_getparam_t;
=20
 /* 1.6: Set up a memory manager for regions of shared memory:
  */
@@ -735,8 +744,9 @@ typedef struct drm_radeon_mem_alloc {
 	int region;
 	int alignment;
 	int size;
+	__uapi_arch_pad_long;
 	int __user *region_offset;	/* offset from start of fb or GART */
-} drm_radeon_mem_alloc_t;
+} __uapi_arch_align drm_radeon_mem_alloc_t;
=20
 typedef struct drm_radeon_mem_free {
 	int region;
@@ -765,8 +775,9 @@ typedef struct drm_radeon_irq_wait {
=20
 typedef struct drm_radeon_setparam {
 	unsigned int param;
+	__uapi_arch_pad32;
 	__s64 value;
-} drm_radeon_setparam_t;
+} __uapi_arch_align drm_radeon_setparam_t;
=20
 #define RADEON_SETPARAM_FB_LOCATION    1	/* determined framebuffer loca=
tion */
 #define RADEON_SETPARAM_SWITCH_TILING  2	/* enable/disable color tiling=
 */
@@ -816,7 +827,8 @@ struct drm_radeon_gem_create {
 	__u32	handle;
 	__u32	initial_domain;
 	__u32	flags;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /*
  * This is not a reliable API and you should expect it to fail for any
diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
index d9b01f4c3a04..626e0619770d 100644
--- a/include/uapi/drm/v3d_drm.h
+++ b/include/uapi/drm/v3d_drm.h
@@ -354,6 +354,8 @@ struct drm_v3d_submit_csd {
 	__u32 cfg[7];
 	__u32 coef[4];
=20
+	__uapi_arch_pad32;
+
 	/* Pointer to a u32 array of the BOs that are referenced by the job.
 	 */
 	__u64 bo_handles;
@@ -379,7 +381,7 @@ struct drm_v3d_submit_csd {
 	__u32 flags;
=20
 	__u32 pad;
-};
+} __uapi_arch_align;
=20
 /**
  * struct drm_v3d_indirect_csd - ioctl extension for the CPU job to cre=
ate an
diff --git a/include/uapi/drm/vc4_drm.h b/include/uapi/drm/vc4_drm.h
index 2cac6277a1d7..bdfaabe35474 100644
--- a/include/uapi/drm/vc4_drm.h
+++ b/include/uapi/drm/vc4_drm.h
@@ -432,8 +432,9 @@ struct drm_vc4_perfmon_destroy {
  */
 struct drm_vc4_perfmon_get_values {
 	__u32 id;
+	__uapi_arch_pad32;
 	__u64 values_ptr;
-};
+} __uapi_arch_align;
=20
 #if defined(__cplusplus)
 }
diff --git a/include/uapi/drm/vmwgfx_drm.h b/include/uapi/drm/vmwgfx_drm=
.h
index 7d786a0cc835..11553d87e1b7 100644
--- a/include/uapi/drm/vmwgfx_drm.h
+++ b/include/uapi/drm/vmwgfx_drm.h
@@ -227,6 +227,9 @@ struct drm_vmw_surface_create_req {
 struct drm_vmw_surface_arg {
 	__s32 sid;
 	enum drm_vmw_handle_type handle_type;
+#ifdef __hexagon__
+	__u8 :8, :8, :8;
+#endif
 };
=20
 /**
@@ -865,6 +868,9 @@ enum drm_vmw_shader_type {
  */
 struct drm_vmw_shader_create_arg {
 	enum drm_vmw_shader_type shader_type;
+#ifdef __hexagon__
+	__u8 :8, :8, :8;
+#endif
 	__u32 size;
 	__u32 buffer_handle;
 	__u32 shader_handle;
@@ -941,6 +947,9 @@ struct drm_vmw_gb_surface_create_req {
 	__u32 format;
 	__u32 mip_levels;
 	enum drm_vmw_surface_flags drm_surface_flags;
+#ifdef __hexagon__
+	__u8 :8, :8, :8;
+#endif
 	__u32 multisample_count;
 	__u32 autogen_filter;
 	__u32 buffer_handle;
@@ -1170,6 +1179,10 @@ enum drm_vmw_surface_version {
 struct drm_vmw_gb_surface_create_ext_req {
 	struct drm_vmw_gb_surface_create_req base;
 	enum drm_vmw_surface_version version;
+#ifdef __hexagon__
+	/* hexagon uses short enums */
+	__u8 :8, :8, :8;
+#endif
 	__u32 svga3d_flags_upper_32_bits;
 	__u32 multisample_pattern;
 	__u32 quality_level;
diff --git a/include/uapi/linux/a.out.h b/include/uapi/linux/a.out.h
index 5fafde3798e5..a41f3f421eee 100644
--- a/include/uapi/linux/a.out.h
+++ b/include/uapi/linux/a.out.h
@@ -6,6 +6,7 @@
=20
 #ifndef __STRUCT_EXEC_OVERRIDE__
=20
+#include <linux/types.h>
 #include <asm/a.out.h>
=20
 #endif /* __STRUCT_EXEC_OVERRIDE__ */
@@ -152,8 +153,9 @@ struct nlist {
   unsigned char n_type;
   char n_other;
   short n_desc;
+  __uapi_arch_pad_long;
   unsigned long n_value;
-};
+} __uapi_arch_align;
 #endif /* no N_NLIST_DECLARED.  */
=20
 #if !defined (N_UNDF)
diff --git a/include/uapi/linux/acct.h b/include/uapi/linux/acct.h
index 0e591152aa8a..a05b11eff428 100644
--- a/include/uapi/linux/acct.h
+++ b/include/uapi/linux/acct.h
@@ -60,10 +60,7 @@ struct acct
 	comp_t		ac_minflt;		/* Minor Pagefaults */
 	comp_t		ac_majflt;		/* Major Pagefaults */
 	comp_t		ac_swaps;		/* Number of Swaps */
-/* m68k had no padding here. */
-#if !defined(CONFIG_M68K) || !defined(__KERNEL__)
 	__u16		ac_ahz;			/* AHZ */
-#endif
 	__u32		ac_exitcode;		/* Exitcode */
 	char		ac_comm[ACCT_COMM + 1];	/* Command Name */
 	__u8		ac_etime_hi;		/* Elapsed Time MSB */
diff --git a/include/uapi/linux/acrn.h b/include/uapi/linux/acrn.h
index 79e7855a8c42..5b1c0bb1b28a 100644
--- a/include/uapi/linux/acrn.h
+++ b/include/uapi/linux/acrn.h
@@ -57,7 +57,8 @@ struct acrn_pio_request {
 	__u64	address;
 	__u64	size;
 	__u32	value;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /**
  * struct acrn_pci_request - Info of a PCI I/O request
@@ -81,7 +82,8 @@ struct acrn_pci_request {
 	__u32	dev;
 	__u32	func;
 	__u32	reg;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /**
  * struct acrn_io_request - 256-byte ACRN I/O request
@@ -158,6 +160,7 @@ struct acrn_io_request {
 	__u32	reserved1;
 	__u32	kernel_handled;
 	__u32	processed;
+	struct { __u32 pad_to_alignment[29]; };
 } __attribute__((aligned(256)));
=20
 struct acrn_io_request_buffer {
@@ -304,7 +307,8 @@ struct acrn_regs {
 	__le16				gs_sel;
 	__le16				ldt_sel;
 	__le16				tr_sel;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /**
  * struct acrn_vcpu_regs - Info of vCPU registers state
@@ -414,8 +418,9 @@ struct acrn_pcidev {
 	__u16	phys_bdf;
 	__u8	intr_line;
 	__u8	intr_pin;
+	__uapi_arch_pad16;
 	__u32	bar[ACRN_PCI_NUM_BARS];
-};
+} __uapi_arch_align;
=20
 /**
  * struct acrn_mmio_dev_res - MMIO device resource description
@@ -512,9 +517,12 @@ struct acrn_acpi_generic_address {
 struct acrn_cstate_data {
 	struct acrn_acpi_generic_address	cx_reg;
 	__u8					type;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	__u32					latency;
+	__uapi_arch_pad32;
 	__u64					power;
-};
+} __uapi_arch_align;
=20
 /**
  * struct acrn_pstate_data - A P state package defined in ACPI
diff --git a/include/uapi/linux/agpgart.h b/include/uapi/linux/agpgart.h
index 9cc3448c0b5b..d4c1cced264d 100644
--- a/include/uapi/linux/agpgart.h
+++ b/include/uapi/linux/agpgart.h
@@ -62,12 +62,13 @@ typedef struct _agp_info {
 	struct agp_version version;	/* version of the driver        */
 	__u32 bridge_id;	/* bridge vendor/device         */
 	__u32 agp_mode;		/* mode info of bridge          */
+	__uapi_arch_pad_long;
 	unsigned long aper_base;/* base of aperture             */
 	__kernel_size_t aper_size;	/* size of aperture             */
 	__kernel_size_t pg_total;	/* max pages (swap + system)    */
 	__kernel_size_t pg_system;	/* max pages (system)           */
 	__kernel_size_t pg_used;	/* current pages used           */
-} agp_info;
+} __uapi_arch_align agp_info;
=20
 typedef struct _agp_setup {
 	__u32 agp_mode;		/* mode info of bridge          */
@@ -80,28 +81,32 @@ typedef struct _agp_segment {
 	__kernel_off_t pg_start;	/* starting page to populate    */
 	__kernel_size_t pg_count;	/* number of pages              */
 	int prot;			/* prot flags for mmap          */
-} agp_segment;
+	__uapi_arch_pad_long;
+} __uapi_arch_align agp_segment;
=20
 typedef struct _agp_region {
 	__kernel_pid_t pid;		/* pid of process       */
+	__uapi_arch_pad_long;
 	__kernel_size_t seg_count;	/* number of segments   */
 	struct _agp_segment *seg_list;
-} agp_region;
+} __uapi_arch_align agp_region;
=20
 typedef struct _agp_allocate {
 	int key;		/* tag of allocation            */
+	__uapi_arch_pad_long;
 	__kernel_size_t pg_count;/* number of pages             */
 	__u32 type;		/* 0 =3D=3D normal, other devspec   */
    	__u32 physical;         /* device specific (some devices =20
 				 * need a phys address of the    =20
 				 * actual page behind the gatt   =20
 				 * table)                        */
-} agp_allocate;
+} __uapi_arch_align agp_allocate;
=20
 typedef struct _agp_bind {
 	int key;		/* tag of allocation            */
+	__uapi_arch_pad_long;
 	__kernel_off_t pg_start;/* starting page to populate    */
-} agp_bind;
+} __uapi_arch_align agp_bind;
=20
 typedef struct _agp_unbind {
 	int key;		/* tag of allocation            */
diff --git a/include/uapi/linux/am437x-vpfe.h b/include/uapi/linux/am437=
x-vpfe.h
index beae3521ca91..ba1cb1377233 100644
--- a/include/uapi/linux/am437x-vpfe.h
+++ b/include/uapi/linux/am437x-vpfe.h
@@ -68,13 +68,17 @@ enum vpfe_ccdc_gamma_width {
 struct vpfe_ccdc_a_law {
 	/* Enable/disable A-Law */
 	unsigned char enable;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	/* Gamma Width Input */
 	enum vpfe_ccdc_gamma_width gamma_wd;
-};
+} __uapi_arch_align;
=20
 /* structure for Black Clamping */
 struct vpfe_ccdc_black_clamp {
 	unsigned char enable;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	/* only if bClampEnable is TRUE */
 	enum vpfe_ccdc_sample_length sample_pixel;
 	/* only if bClampEnable is TRUE */
@@ -85,7 +89,8 @@ struct vpfe_ccdc_black_clamp {
 	unsigned short sgain;
 	/* only if bClampEnable is FALSE */
 	unsigned short dc_sub;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /* structure for Black Level Compensation */
 struct vpfe_ccdc_black_compensation {
diff --git a/include/uapi/linux/android/binder.h b/include/uapi/linux/an=
droid/binder.h
index 03ee4c7010d7..9216e8a6c3d5 100644
--- a/include/uapi/linux/android/binder.h
+++ b/include/uapi/linux/android/binder.h
@@ -360,9 +360,12 @@ struct binder_pri_desc {
=20
 struct binder_pri_ptr_cookie {
 	__s32 priority;
+#ifndef BINDER_IPC_32BIT
+	__uapi_arch_pad32;
+#endif
 	binder_uintptr_t ptr;
 	binder_uintptr_t cookie;
-};
+} __uapi_arch_align;
=20
 enum binder_driver_return_protocol {
 	BR_ERROR =3D _IOR('r', 0, __s32),
diff --git a/include/uapi/linux/atalk.h b/include/uapi/linux/atalk.h
index 8b96460b46b1..a1bfb4b10684 100644
--- a/include/uapi/linux/atalk.h
+++ b/include/uapi/linux/atalk.h
@@ -27,19 +27,22 @@
 struct atalk_addr {
 	__be16	s_net;
 	__u8	s_node;
-};
+	__uapi_arch_pad8;
+} __uapi_arch_align;
=20
 struct sockaddr_at {
 	__kernel_sa_family_t sat_family;
 	__u8		  sat_port;
+	__uapi_arch_pad8;
 	struct atalk_addr sat_addr;
 	char		  sat_zero[8];
-};
+} __uapi_arch_align;
=20
 struct atalk_netrange {
 	__u8	nr_phase;
+	__uapi_arch_pad8;
 	__be16	nr_firstnet;
 	__be16	nr_lastnet;
-};
+} __uapi_arch_align;
=20
 #endif /* _UAPI__LINUX_ATALK_H__ */
diff --git a/include/uapi/linux/atm.h b/include/uapi/linux/atm.h
index 95ebdcf4fe88..0af72e5ee163 100644
--- a/include/uapi/linux/atm.h
+++ b/include/uapi/linux/atm.h
@@ -135,6 +135,8 @@
=20
 struct atm_trafprm {
 	unsigned char	traffic_class;	/* traffic class (ATM_UBR, ...) */
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	int		max_pcr;	/* maximum PCR in cells per second */
 	int		pcr;		/* desired PCR in cells per second */
 	int		min_pcr;	/* minimum PCR in cells per second */
@@ -155,14 +157,17 @@ struct atm_trafprm {
 	unsigned int adtf      :10;     /* ACR Decrease Time Factor (10-bit) */
 	unsigned int cdf       :3;      /* Cutoff Decrease Factor (3-bit) */
         unsigned int spare     :9;      /* spare bits */=20
-};
+} __uapi_arch_align;
=20
 struct atm_qos {
 	struct atm_trafprm txtp;	/* parameters in TX direction */
 	struct atm_trafprm rxtp __ATM_API_ALIGN;
 					/* parameters in RX direction */
 	unsigned char aal __ATM_API_ALIGN;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+	__uapi_arch_atm_pad;
+} __uapi_arch_align;
=20
 /* PVC addressing */
=20
@@ -175,6 +180,8 @@ struct atm_qos {
=20
 struct sockaddr_atmpvc {
 	unsigned short 	sap_family;	/* address family, AF_ATMPVC  */
+	__uapi_arch_pad16;
+	__uapi_arch_atm_pad;
 	struct {			/* PVC address */
 		short	itf;		/* ATM interface */
 		short	vpi;		/* VPI (only 8 bits at UNI) */
@@ -205,14 +212,17 @@ struct sockaddr_atmpvc {
=20
 struct sockaddr_atmsvc {
     unsigned short 	sas_family;	/* address family, AF_ATMSVC */
+    __uapi_arch_pad16;
+    __uapi_arch_atm_pad;
     struct {				/* SVC address */
         unsigned char	prv[ATM_ESA_LEN];/* private ATM address */
         char		pub[ATM_E164_LEN+1]; /* public address (E.164) */
     					/* unused addresses must be bzero'ed */
 	char		lij_type;	/* role in LIJ call; one of ATM_LIJ* */
+        __uapi_arch_pad16;
 	__u32	lij_id;		/* LIJ call identifier */
-    } sas_addr __ATM_API_ALIGN;		/* SVC address */
-};
+    } sas_addr __uapi_arch_align __ATM_API_ALIGN; /* SVC address */
+} __uapi_arch_align;
=20
=20
 static __inline__ int atmsvc_addr_in_use(struct sockaddr_atmsvc addr)
diff --git a/include/uapi/linux/atm_he.h b/include/uapi/linux/atm_he.h
index 9f4b43293988..1cc912ea3ed3 100644
--- a/include/uapi/linux/atm_he.h
+++ b/include/uapi/linux/atm_he.h
@@ -5,6 +5,7 @@
 #define LINUX_ATM_HE_H
=20
 #include <linux/atmioc.h>
+#include <linux/types.h>
=20
 #define HE_GET_REG	_IOW('a', ATMIOC_SARPRV, struct atmif_sioc)
=20
@@ -16,6 +17,8 @@
 struct he_ioctl_reg {
 	unsigned addr, val;
 	char type;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 #endif /* LINUX_ATM_HE_H */
diff --git a/include/uapi/linux/atm_tcp.h b/include/uapi/linux/atm_tcp.h
index 7309e1bc8867..a5aa123421d2 100644
--- a/include/uapi/linux/atm_tcp.h
+++ b/include/uapi/linux/atm_tcp.h
@@ -35,10 +35,12 @@ struct atmtcp_hdr {
 struct atmtcp_control {
 	struct atmtcp_hdr hdr;	/* must be first */
 	int type;		/* message type; both directions */
+	__uapi_arch_atm_pad;
 	atm_kptr_t vcc;		/* both directions */
 	struct sockaddr_atmpvc addr; /* suggested value from kernel */
 	struct atm_qos	qos;	/* both directions */
 	int result;		/* to kernel only */
+	__uapi_arch_atm_pad;
 } __ATM_API_ALIGN;
=20
 /*
diff --git a/include/uapi/linux/atmapi.h b/include/uapi/linux/atmapi.h
index c9bf5c23a71f..610b73090dc6 100644
--- a/include/uapi/linux/atmapi.h
+++ b/include/uapi/linux/atmapi.h
@@ -11,8 +11,12 @@
 /* such alignment is not required on 32 bit sparcs, but we can't
    figure that we are on a sparc64 while compiling user-space programs.=
 */
 #define __ATM_API_ALIGN	__attribute__((aligned(8)))
+#define __uapi_arch_atm_pad unsigned:32
+#define __uapi_arch_atm_blli_pad char :8, :8, :8, :8, :8, :8
 #else
 #define __ATM_API_ALIGN
+#define __uapi_arch_atm_pad
+#define __uapi_arch_atm_blli_pad
 #endif
=20
=20
diff --git a/include/uapi/linux/atmbr2684.h b/include/uapi/linux/atmbr26=
84.h
index d47c47d06f11..da7ef08f13f0 100644
--- a/include/uapi/linux/atmbr2684.h
+++ b/include/uapi/linux/atmbr2684.h
@@ -54,10 +54,11 @@
  */
 struct atm_newif_br2684 {
 	atm_backend_t backend_num;	/* ATM_BACKEND_BR2684 */
+	__uapi_arch_pad16;
 	int media;		/* BR2684_MEDIA_*, flags in upper bits */
 	char ifname[IFNAMSIZ];
 	int mtu;
-};
+} __uapi_arch_align;
=20
 /*
  * This structure is used to specify a br2684 interface - either by a
@@ -81,6 +82,7 @@ struct br2684_if_spec {
  */
 struct atm_backend_br2684 {
 	atm_backend_t backend_num;	/* ATM_BACKEND_BR2684 */
+	__uapi_arch_pad16;
 	struct br2684_if_spec ifspec;
 	int fcs_in;		/* BR2684_FCSIN_* */
 	int fcs_out;		/* BR2684_FCSOUT_* */
@@ -88,9 +90,10 @@ struct atm_backend_br2684 {
 	int encaps;		/* BR2684_ENCAPS_* */
 	int has_vpiid;		/* 1: use vpn_id - Unsupported */
 	__u8 vpn_id[7];
+	__uapi_arch_pad8;
 	int send_padding;	/* unsupported */
 	int min_size;		/* we will pad smaller packets than this */
-};
+} __uapi_arch_align;
=20
 /*
  * The BR2684_SETFILT ioctl is an experimental mechanism for folks
diff --git a/include/uapi/linux/atmdev.h b/include/uapi/linux/atmdev.h
index 20b0215084fc..bbea1b3d101b 100644
--- a/include/uapi/linux/atmdev.h
+++ b/include/uapi/linux/atmdev.h
@@ -49,6 +49,7 @@ struct atm_dev_stats {
 	struct atm_aal_stats aal0;
 	struct atm_aal_stats aal34;
 	struct atm_aal_stats aal5;
+	__uapi_arch_atm_pad;
 } __ATM_API_ALIGN;
=20
=20
@@ -155,8 +156,9 @@ struct atm_dev_stats {
=20
 struct atm_iobuf {
 	int length;
+	__uapi_arch_pad_long;
 	void __user *buffer;
-};
+} __uapi_arch_align;
=20
 /* for ATM_GETCIRANGE / ATM_SETCIRANGE */
=20
diff --git a/include/uapi/linux/atmlec.h b/include/uapi/linux/atmlec.h
index c68346bb40e6..58762d9a5185 100644
--- a/include/uapi/linux/atmlec.h
+++ b/include/uapi/linux/atmlec.h
@@ -46,6 +46,7 @@ struct atmlec_config_msg {
 	unsigned int maximum_unknown_frame_count;
 	unsigned int max_unknown_frame_time;
 	unsigned short max_retry_count;
+	__uapi_arch_pad16;
 	unsigned int aging_time;
 	unsigned int forward_delay_time;
 	unsigned int arp_response_time;
@@ -63,6 +64,7 @@ struct atmlec_msg {
 		struct {
 			unsigned char mac_addr[ETH_ALEN];
 			unsigned char atm_addr[ATM_ESA_LEN];
+			__uapi_arch_pad16;
 			unsigned int flag;	/*
 						 * Topology_change flag,
 						 * remoteflag, permanent flag,
@@ -70,23 +72,29 @@ struct atmlec_msg {
 						 */
 			unsigned int targetless_le_arp;	/* LANE2 */
 			unsigned int no_source_le_narp;	/* LANE2 */
-		} normal;
+		} __uapi_arch_align normal;
 		struct atmlec_config_msg config;
 		struct {
 			__u16 lec_id;				/* requestor lec_id  */
+			__uapi_arch_pad16;
 			__u32 tran_id;				/* transaction id    */
 			unsigned char mac_addr[ETH_ALEN];	/* dst mac addr      */
 			unsigned char atm_addr[ATM_ESA_LEN];	/* reqestor ATM addr */
-		} proxy;	/*
+			__uapi_arch_pad16;
+		} __uapi_arch_align proxy;
+				/*
 				 * For mapping LE_ARP requests to responses. Filled by
 				 * zeppelin, returned by kernel. Used only when proxying
 				 */
 	} content;
+	__uapi_arch_atm_pad;
 } __ATM_API_ALIGN;
=20
 struct atmlec_ioc {
 	int dev_num;
 	unsigned char atm_addr[ATM_ESA_LEN];
 	unsigned char receive;	/* 1=3D receive vcc, 0 =3D send vcc */
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
 #endif /* _ATMLEC_H_ */
diff --git a/include/uapi/linux/atmmpc.h b/include/uapi/linux/atmmpc.h
index cc17f4304839..6b72974531f3 100644
--- a/include/uapi/linux/atmmpc.h
+++ b/include/uapi/linux/atmmpc.h
@@ -23,22 +23,27 @@ typedef struct in_ctrl_info {
         __u8   Last_NHRP_CIE_code;
         __u8   Last_Q2931_cause_value;
         __u8   eg_MPC_ATM_addr[ATM_ESA_LEN];
+	__uapi_arch_pad16;
         __be32  tag;
         __be32  in_dst_ip;      /* IP address this ingress MPC sends pa=
ckets to */
         __u16  holding_time;
+	__uapi_arch_pad16;
         __u32  request_id;
-} in_ctrl_info;
+} __uapi_arch_align in_ctrl_info;
=20
 typedef struct eg_ctrl_info {
         __u8   DLL_header[256];
         __u8   DH_length;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
         __be32  cache_id;
         __be32  tag;
         __be32  mps_ip;
         __be32  eg_dst_ip;      /* IP address to which ingress MPC send=
s packets */
         __u8   in_MPC_data_ATM_addr[ATM_ESA_LEN];
         __u16  holding_time;
-} eg_ctrl_info;
+	__uapi_arch_pad16;
+} __uapi_arch_align eg_ctrl_info;
=20
 struct mpc_parameters {
         __u16 mpc_p1;   /* Shortcut-Setup Frame Count    */
@@ -51,6 +56,7 @@ struct mpc_parameters {
=20
 struct k_message {
         __u16 type;
+	__uapi_arch_pad16;
         __be32 ip_mask;
         __u8  MPS_ctrl[ATM_ESA_LEN];
         union {
diff --git a/include/uapi/linux/atmppp.h b/include/uapi/linux/atmppp.h
index 504b9989675b..d5e5e8d5dd67 100644
--- a/include/uapi/linux/atmppp.h
+++ b/include/uapi/linux/atmppp.h
@@ -19,7 +19,8 @@
  */
 struct atm_backend_ppp {
 	atm_backend_t	backend_num;	/* ATM_BACKEND_PPP */
+	__uapi_arch_pad16;
 	int		encaps;		/* PPPOATM_ENCAPS_* */
-};
+} __uapi_arch_align;
=20
 #endif	/* _LINUX_ATMPPP_H */
diff --git a/include/uapi/linux/atmsap.h b/include/uapi/linux/atmsap.h
index fc052481eae0..3a91760f8159 100644
--- a/include/uapi/linux/atmsap.h
+++ b/include/uapi/linux/atmsap.h
@@ -134,6 +134,7 @@ struct atm_blli {
 				  /* (only if ipi =3D=3D NLPID_IEEE802_1_SNAP) */
 	} tr9577;
     } l3;
+    __uapi_arch_atm_blli_pad;
 } __ATM_API_ALIGN;
=20
=20
@@ -150,6 +151,7 @@ struct atm_bhli {
=20
 struct atm_sap {
 	struct atm_bhli bhli;		/* local SAP, high-layer information */
+	__uapi_arch_atm_pad;
 	struct atm_blli blli[ATM_MAX_BLLI] __ATM_API_ALIGN;
 					/* local SAP, low-layer info */
 };
diff --git a/include/uapi/linux/atmsvc.h b/include/uapi/linux/atmsvc.h
index 137b5f853449..0e347188315d 100644
--- a/include/uapi/linux/atmsvc.h
+++ b/include/uapi/linux/atmsvc.h
@@ -22,6 +22,7 @@ enum atmsvc_msg_type { as_catch_null, as_bind, as_conn=
ect, as_accept, as_reject,
=20
 struct atmsvc_msg {
 	enum atmsvc_msg_type type;
+	__uapi_arch_atm_pad;
 	atm_kptr_t vcc;
 	atm_kptr_t listen_vcc;		/* indicate */
 	int reply;			/* for okay and close:		   */
@@ -30,11 +31,13 @@ struct atmsvc_msg {
 					/*   =3D=3D0: success		   */
 				        /*   > 0: error when active (still */
 					/*        need to close)	   */
+	__uapi_arch_atm_pad;
 	struct sockaddr_atmpvc pvc;	/* indicate, okay (connect) */
 	struct sockaddr_atmsvc local;	/* local SVC address */
 	struct atm_qos qos;		/* QOS parameters */
 	struct atm_sap sap;		/* SAP */
 	unsigned int session;		/* for p2pm */
+	__uapi_arch_atm_pad;
 	struct sockaddr_atmsvc svc;	/* SVC address */
 } __ATM_API_ALIGN;
=20
diff --git a/include/uapi/linux/auto_fs.h b/include/uapi/linux/auto_fs.h
index 8081df849743..310e03cec864 100644
--- a/include/uapi/linux/auto_fs.h
+++ b/include/uapi/linux/auto_fs.h
@@ -34,8 +34,10 @@
  */
 #if defined(__ia64__) || defined(__alpha__) /* pure 64bit architectures=
 */
 typedef unsigned long autofs_wqt_t;
+#define __uapi_arch_pad_autofs_wqt __uapi_arch_pad_long
 #else
 typedef unsigned int autofs_wqt_t;
+#define __uapi_arch_pad_autofs_wqt
 #endif
=20
 /* Packet types */
@@ -52,6 +54,7 @@ struct autofs_packet_missing {
 	autofs_wqt_t wait_queue_token;
 	int len;
 	char name[NAME_MAX+1];
+	__uapi_arch_pad_autofs_wqt;
 };=09
=20
 /* v3 expire (via ioctl) */
@@ -178,6 +181,7 @@ struct autofs_packet_expire_multi {
 	autofs_wqt_t wait_queue_token;
 	int len;
 	char name[NAME_MAX+1];
+	__uapi_arch_pad_autofs_wqt;
 };
=20
 union autofs_packet_union {
@@ -192,6 +196,7 @@ struct autofs_v5_packet {
 	struct autofs_packet_hdr hdr;
 	autofs_wqt_t wait_queue_token;
 	__u32 dev;
+	__uapi_arch_pad_autofs_wqt;
 	__u64 ino;
 	__u32 uid;
 	__u32 gid;
@@ -199,7 +204,8 @@ struct autofs_v5_packet {
 	__u32 tgid;
 	__u32 len;
 	char name[NAME_MAX+1];
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 typedef struct autofs_v5_packet autofs_packet_missing_indirect_t;
 typedef struct autofs_v5_packet autofs_packet_expire_indirect_t;
diff --git a/include/uapi/linux/ax25.h b/include/uapi/linux/ax25.h
index b496b9d8452f..d333ae25c999 100644
--- a/include/uapi/linux/ax25.h
+++ b/include/uapi/linux/ax25.h
@@ -8,6 +8,11 @@
 #define	AX25_KERNEL_H
=20
 #include <linux/socket.h>
+#include <linux/types.h>
+
+#ifndef __KERNEL__
+#include <sys/types.h>
+#endif
=20
 #define AX25_MTU	256
 #define AX25_MAX_DIGIS  8
@@ -50,7 +55,9 @@ typedef struct {
 struct sockaddr_ax25 {
 	__kernel_sa_family_t sax25_family;
 	ax25_address	sax25_call;
-	int		sax25_ndigis;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+	int		sax25_ndigis __uapi_arch_align;
 	/* Digipeater ax25_address sets follow */
 };
=20
@@ -71,6 +78,7 @@ struct ax25_routes_struct {
 struct ax25_route_opt_struct {
 	ax25_address	port_addr;
 	ax25_address	dest_addr;
+	__uapi_arch_pad16;
 	int		cmd;
 	int		arg;
 };
@@ -79,11 +87,17 @@ struct ax25_ctl_struct {
         ax25_address            port_addr;
         ax25_address            source_addr;
         ax25_address            dest_addr;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
         unsigned int            cmd;
+	__uapi_arch_pad_long;
         unsigned long           arg;
         unsigned char           digi_count;
         ax25_address            digi_addr[AX25_MAX_DIGIS];
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 /* this will go away. Please do not export to user land */
 struct ax25_info_struct_deprecated {
diff --git a/include/uapi/linux/baycom.h b/include/uapi/linux/baycom.h
index 478cb565ae52..3d1192c6a260 100644
--- a/include/uapi/linux/baycom.h
+++ b/include/uapi/linux/baycom.h
@@ -8,6 +8,8 @@
 #ifndef _BAYCOM_H
 #define _BAYCOM_H
=20
+#include <linux/types.h>
+
 /* --------------------------------------------------------------------=
 */
 /*
  * structs for the IOCTL commands
@@ -21,10 +23,11 @@ struct baycom_debug_data {
=20
 struct baycom_ioctl {
 	int cmd;
+	__uapi_arch_pad_long;
 	union {
 		struct baycom_debug_data dbg;
 	} data;
-};
+} __uapi_arch_align;
=20
 /* --------------------------------------------------------------------=
 */
=20
diff --git a/include/uapi/linux/blkpg.h b/include/uapi/linux/blkpg.h
index d0a64ee97c6d..8b768c9b5a7c 100644
--- a/include/uapi/linux/blkpg.h
+++ b/include/uapi/linux/blkpg.h
@@ -4,6 +4,7 @@
=20
 #include <linux/compiler.h>
 #include <linux/ioctl.h>
+#include <linux/types.h>
=20
 #define BLKPG      _IO(0x12,105)
=20
@@ -12,8 +13,9 @@ struct blkpg_ioctl_arg {
         int op;
         int flags;
         int datalen;
+	__uapi_arch_pad_long;
         void __user *data;
-};
+} __uapi_arch_align;
=20
 /* The subfunctions (for the op field) */
 #define BLKPG_ADD_PARTITION	1
@@ -31,6 +33,7 @@ struct blkpg_partition {
 	int pno;			/* partition number */
 	char devname[BLKPG_DEVNAMELTH];	/* unused / ignored */
 	char volname[BLKPG_VOLNAMELTH];	/* unused / ignore */
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 #endif /* _UAPI__LINUX_BLKPG_H */
diff --git a/include/uapi/linux/blktrace_api.h b/include/uapi/linux/blkt=
race_api.h
index 7c092d9f3aa4..8ce55cceacb0 100644
--- a/include/uapi/linux/blktrace_api.h
+++ b/include/uapi/linux/blktrace_api.h
@@ -172,12 +172,15 @@ enum {
 struct blk_user_trace_setup {
 	char name[BLKTRACE_BDEV_SIZE];	/* output */
 	__u16 act_mask;			/* input */
+	__uapi_arch_pad16;
 	__u32 buf_size;			/* input */
 	__u32 buf_nr;			/* input */
+	__uapi_arch_pad32;
 	__u64 start_lba;
 	__u64 end_lba;
 	__u32 pid;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /*
  * User setup structure passed with BLKTRACESETUP2
diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index 84ced3ed2d21..2f4a87e83757 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -111,7 +111,8 @@ struct bpf_lpm_trie_key_u8 {
 struct bpf_cgroup_storage_key {
 	__u64	cgroup_inode_id;	/* cgroup inode id */
 	__u32	attach_type;		/* program attach type (enum bpf_attach_type) */
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 enum bpf_cgroup_iter_order {
 	BPF_CGROUP_ITER_ORDER_UNSPEC =3D 0,
@@ -1543,10 +1544,12 @@ union bpf_attr {
 		__aligned_u64 excl_prog_hash;
 		/* Size of the passed excl_prog_hash. */
 		__u32 excl_prog_hash_size;
+		__u32		:32;
 	};
=20
 	struct { /* anonymous struct used by BPF_MAP_*_ELEM and BPF_MAP_FREEZE=
 commands */
 		__u32		map_fd;
+		__u32		:32;
 		__aligned_u64	key;
 		union {
 			__aligned_u64 value;
@@ -1649,6 +1652,7 @@ union bpf_attr {
 		 * if BPF_F_PATH_FD flag is not set, AT_FDCWD is assumed.
 		 */
 		__s32		path_fd;
+		__u32		:32;
 	};
=20
 	struct { /* anonymous struct used by BPF_PROG_ATTACH/DETACH commands */
@@ -1689,6 +1693,7 @@ union bpf_attr {
 		__u32		flags;
 		__u32		cpu;
 		__u32		batch_size;
+		__u32		:32;
 	} test;
=20
 	struct { /* anonymous struct used by BPF_*_GET_*_ID */
@@ -1790,6 +1795,7 @@ union bpf_attr {
 			struct {
 				__aligned_u64	iter_info;	/* extra bpf_iter_link_info */
 				__u32		iter_info_len;	/* iter_info length */
+				__u32		:32;
 			};
 			struct {
 				/* black box user-provided value passed through
@@ -1808,12 +1814,13 @@ union bpf_attr {
 			struct {
 				/* this is overlaid with the target_btf_id above. */
 				__u32		target_btf_id;
+				__uapi_arch_pad32;
 				/* black box user-provided value passed through
 				 * to BPF program at the execution time and
 				 * accessible through bpf_get_attach_cookie() BPF helper
 				 */
 				__u64		cookie;
-			} tracing;
+			} __uapi_arch_align tracing;
 			struct {
 				__u32		pf;
 				__u32		hooknum;
@@ -1825,8 +1832,9 @@ union bpf_attr {
 					__u32	relative_fd;
 					__u32	relative_id;
 				};
+				__uapi_arch_pad32;
 				__u64		expected_revision;
-			} tcx;
+			} __uapi_arch_align tcx;
 			struct {
 				__aligned_u64	path;
 				__aligned_u64	offsets;
@@ -1835,12 +1843,14 @@ union bpf_attr {
 				__u32		cnt;
 				__u32		flags;
 				__u32		pid;
+				__u32		:32;
 			} uprobe_multi;
 			struct {
 				union {
 					__u32	relative_fd;
 					__u32	relative_id;
 				};
+				__uapi_arch_pad32;
 				__u64		expected_revision;
 			} netkit;
 			struct {
@@ -1848,6 +1858,7 @@ union bpf_attr {
 					__u32	relative_fd;
 					__u32	relative_id;
 				};
+				__uapi_arch_pad32;
 				__u64		expected_revision;
 			} cgroup;
 		};
@@ -1903,6 +1914,7 @@ union bpf_attr {
 		__u32		stream_buf_len;
 		__u32		stream_id;
 		__u32		prog_fd;
+		__u32		:32;
 	} prog_stream_read;
=20
 	struct {
@@ -6627,6 +6639,7 @@ struct sk_reuseport_md {
 	__u32 ip_protocol;	/* IP protocol. e.g. IPPROTO_TCP, IPPROTO_UDP */
 	__u32 bind_inany;	/* Is sock bound to an INANY address? */
 	__u32 hash;		/* A hash of the packet 4 tuples */
+	__u32 :32;
 	/* When reuse->migrating_sk is NULL, it is selecting a sk for the
 	 * new incoming connection request (e.g. selecting a listen sk for
 	 * the received SYN in the TCP case).  reuse->sk is one of the sk
@@ -6641,7 +6654,7 @@ struct sk_reuseport_md {
 	 */
 	__bpf_md_ptr(struct bpf_sock *, sk);
 	__bpf_md_ptr(struct bpf_sock *, migrating_sk);
-};
+} __uapi_arch_align;
=20
 #define BPF_TAG_SIZE	8
=20
@@ -6685,6 +6698,7 @@ struct bpf_prog_info {
 	__u32 verified_insns;
 	__u32 attach_btf_obj_id;
 	__u32 attach_btf_id;
+	__u32 :32; /* alignment pad */
 } __attribute__((aligned(8)));
=20
 struct bpf_map_info {
@@ -6706,6 +6720,7 @@ struct bpf_map_info {
 	__u64 map_extra;
 	__aligned_u64 hash;
 	__u32 hash_size;
+	__u32 :32; /* alignment pad */
 } __attribute__((aligned(8)));
=20
 struct bpf_btf_info {
@@ -6721,6 +6736,7 @@ struct bpf_link_info {
 	__u32 type;
 	__u32 id;
 	__u32 prog_id;
+	__u32 :32; /* pad to alignof(__aligned_u64) */
 	union {
 		struct {
 			__aligned_u64 tp_name; /* in/out: tp_name buffer ptr */
@@ -6738,6 +6754,7 @@ struct bpf_link_info {
 		struct {
 			__u64 cgroup_id;
 			__u32 attach_type;
+			__uapi_arch_pad32;
 		} cgroup;
 		struct {
 			__aligned_u64 target_name; /* in/out: target_name buffer ptr */
@@ -6756,11 +6773,16 @@ struct bpf_link_info {
 				struct {
 					__u64 cgroup_id;
 					__u32 order;
+					__uapi_arch_pad32;
 				} cgroup;
 				struct {
 					__u32 tid;
 					__u32 pid;
 				} task;
+				struct {
+					__u64 :64;
+					__u64 :64;
+				};
 			};
 		} iter;
 		struct  {
@@ -6875,6 +6897,7 @@ struct bpf_sock_addr {
 	__u32 msg_src_ip6[4];	/* Allows 1,2,4,8-byte read and 4,8-byte write.
 				 * Stored in network byte order.
 				 */
+	__u32 :32;		/* pad to alignof(u64) */
 	__bpf_md_ptr(struct bpf_sock *, sk);
 };
=20
@@ -7534,6 +7557,7 @@ struct bpf_sk_lookup {
 	__u32 local_ip6[4];	/* Network byte order */
 	__u32 local_port;	/* Host byte order */
 	__u32 ingress_ifindex;		/* The arriving interface. Determined by inet_=
iif. */
+	__u32 :32;
 };
=20
 /*
diff --git a/include/uapi/linux/bpf_perf_event.h b/include/uapi/linux/bp=
f_perf_event.h
index eb1b9d21250c..61264bdda988 100644
--- a/include/uapi/linux/bpf_perf_event.h
+++ b/include/uapi/linux/bpf_perf_event.h
@@ -8,6 +8,7 @@
 #ifndef _UAPI__LINUX_BPF_PERF_EVENT_H__
 #define _UAPI__LINUX_BPF_PERF_EVENT_H__
=20
+#include <linux/types.h>
 #include <asm/bpf_perf_event.h>
=20
 struct bpf_perf_event_data {
diff --git a/include/uapi/linux/bpqether.h b/include/uapi/linux/bpqether=
.h
index d1d63e2acdeb..9d9ac5b4a2af 100644
--- a/include/uapi/linux/bpqether.h
+++ b/include/uapi/linux/bpqether.h
@@ -31,10 +31,12 @@ struct bpq_req  {
     int clockmode;		/* unused */
     int txdelay;
     unsigned char persist;	/* unused */
+    __uapi_arch_pad8;
+    __uapi_arch_pad16;
     int slotime;		/* unused */
     int squeldelay;
     int dmachan;		/* unused */
     int irq;			/* unused */
-};
+} __uapi_arch_align;
=20
 #endif
diff --git a/include/uapi/linux/btrfs.h b/include/uapi/linux/btrfs.h
index e8fd92789423..81727da775dc 100644
--- a/include/uapi/linux/btrfs.h
+++ b/include/uapi/linux/btrfs.h
@@ -140,7 +140,8 @@ struct btrfs_ioctl_vol_args_v2 {
 		struct {
 			__u64 size;
 			struct btrfs_qgroup_inherit __user *qgroup_inherit;
-		};
+			__uapi_arch_pad_long_to_u64;
+		} __uapi_arch_align;
 		__u64 unused[4];
 	};
 	union {
@@ -207,7 +208,9 @@ struct btrfs_ioctl_dev_replace_start_params {
 						 * above */
 	__u8 srcdev_name[BTRFS_DEVICE_PATH_NAME_MAX + 1];	/* in */
 	__u8 tgtdev_name[BTRFS_DEVICE_PATH_NAME_MAX + 1];	/* in */
-};
+	__uapi_arch_pad16;
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 #define BTRFS_IOCTL_DEV_REPLACE_STATE_NEVER_STARTED	0
 #define BTRFS_IOCTL_DEV_REPLACE_STATE_STARTED		1
@@ -797,7 +800,8 @@ struct btrfs_ioctl_qgroup_create_args {
 struct btrfs_ioctl_timespec {
 	__u64 sec;
 	__u32 nsec;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 struct btrfs_ioctl_received_subvol_args {
 	char	uuid[BTRFS_UUID_SIZE];	/* in */
@@ -852,11 +856,12 @@ struct btrfs_ioctl_send_args {
 	__s64 send_fd;			/* in */
 	__u64 clone_sources_count;	/* in */
 	__u64 __user *clone_sources;	/* in */
+	__uapi_arch_pad_long_to_u64;
 	__u64 parent_root;		/* in */
 	__u64 flags;			/* in */
 	__u32 version;			/* in */
 	__u8  reserved[28];		/* in */
-};
+} __uapi_arch_align;
=20
 /*
  * Information about a fs tree root.
diff --git a/include/uapi/linux/caif/caif_socket.h b/include/uapi/linux/=
caif/caif_socket.h
index d9970bbaa156..9ba3787d828f 100644
--- a/include/uapi/linux/caif/caif_socket.h
+++ b/include/uapi/linux/caif/caif_socket.h
@@ -141,6 +141,7 @@ enum caif_debug_service {
  */
 struct sockaddr_caif {
 	__kernel_sa_family_t  family;
+	__uapi_arch_pad16;
 	union {
 		struct {
 			__u8  type;		/* type: enum caif_at_type */
@@ -151,6 +152,8 @@ struct sockaddr_caif {
 		union {
 			__u32 connection_id;
 			__u8  nsapi;
+			__uapi_arch_pad8;
+			__uapi_arch_pad16;
 		} dgm;				/* CAIFPROTO_DATAGRAM(_LOOP)*/
 		struct {
 			__u32 connection_id;
@@ -161,7 +164,7 @@ struct sockaddr_caif {
 			__u8  service;		/* service:caif_debug_service */
 		} dbg;				/* CAIFPROTO_DEBUG */
 	} u;
-};
+} __uapi_arch_align;
=20
 /**
  * enum caif_socket_opts - CAIF option values for getsockopt and setsoc=
kopt.
diff --git a/include/uapi/linux/can.h b/include/uapi/linux/can.h
index 42abf0679fb4..76fb233b343c 100644
--- a/include/uapi/linux/can.h
+++ b/include/uapi/linux/can.h
@@ -246,6 +246,7 @@ struct canxl_frame {
  */
 struct sockaddr_can {
 	__kernel_sa_family_t can_family;
+	__uapi_arch_pad16;
 	int         can_ifindex;
 	union {
 		/* transport protocol class address information (e.g. ISOTP) */
@@ -266,11 +267,13 @@ struct sockaddr_can {
=20
 			/* 1 byte address */
 			__u8 addr;
+			__uapi_arch_pad8;
+			__uapi_arch_pad16;
 		} j1939;
=20
 		/* reserved for future CAN protocols address information */
 	} can_addr;
-};
+} __uapi_arch_align;
=20
 /**
  * struct can_filter - CAN ID based filter in can_register().
diff --git a/include/uapi/linux/can/bcm.h b/include/uapi/linux/can/bcm.h
index f1e45f533a72..4b79ad703510 100644
--- a/include/uapi/linux/can/bcm.h
+++ b/include/uapi/linux/can/bcm.h
@@ -68,11 +68,13 @@ struct bcm_msg_head {
 	__u32 opcode;
 	__u32 flags;
 	__u32 count;
+	__uapi_arch_pad_long; /* padding on 64-bit architectures */
 	struct bcm_timeval ival1, ival2;
 	canid_t can_id;
 	__u32 nframes;
+	__uapi_arch_pad_long_to_aligned_u64;
 	struct can_frame frames[];
-};
+} __uapi_arch_align;
=20
 enum {
 	TX_SETUP =3D 1,	/* create (cyclic) transmission task */
diff --git a/include/uapi/linux/can/j1939.h b/include/uapi/linux/can/j19=
39.h
index 38936460f668..476b3ec3b3c4 100644
--- a/include/uapi/linux/can/j1939.h
+++ b/include/uapi/linux/can/j1939.h
@@ -101,6 +101,8 @@ struct j1939_filter {
 	pgn_t pgn_mask;
 	__u8 addr;
 	__u8 addr_mask;
+	__uapi_arch_pad16;
+	__uapi_arch_pad32;
 };
=20
 #define J1939_FILTER_MAX 512 /* maximum number of j1939_filter set via =
setsockopt() */
diff --git a/include/uapi/linux/cciss_ioctl.h b/include/uapi/linux/cciss=
_ioctl.h
index 562230199461..6a4c92a03403 100644
--- a/include/uapi/linux/cciss_ioctl.h
+++ b/include/uapi/linux/cciss_ioctl.h
@@ -43,8 +43,9 @@ typedef struct _IOCTL_Command_struct {
   RequestBlock_struct      Request;
   ErrorInfo_struct  	   error_info;=20
   WORD			   buf_size;  /* size in bytes of the buf */
+  __uapi_arch_pad16;
   BYTE			   __user *buf;
-} IOCTL_Command_struct;
+} __uapi_arch_align IOCTL_Command_struct;
=20
 typedef struct _BIG_IOCTL_Command_struct {
   LUNAddr_struct	   LUN_info;
@@ -53,8 +54,9 @@ typedef struct _BIG_IOCTL_Command_struct {
   DWORD			   malloc_size; /* < MAX_KMALLOC_SIZE in cciss.c */
   DWORD			   buf_size;    /* size in bytes of the buf */
   				        /* < malloc_size * MAXSGENTRIES */
+  __uapi_arch_pad_long;
   BYTE			   __user *buf;
-} BIG_IOCTL_Command_struct;
+} __uapi_arch_align BIG_IOCTL_Command_struct;
=20
 typedef struct _LogvolInfo_struct{
 	__u32	LunID;
diff --git a/include/uapi/linux/cdrom.h b/include/uapi/linux/cdrom.h
index 011e594e4a0d..8360cfe43773 100644
--- a/include/uapi/linux/cdrom.h
+++ b/include/uapi/linux/cdrom.h
@@ -213,9 +213,11 @@ struct cdrom_subchnl
 	__u8	cdsc_ctrl:	4;
 	__u8	cdsc_trk;
 	__u8	cdsc_ind;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	union cdrom_addr cdsc_absaddr;
 	union cdrom_addr cdsc_reladdr;
-};
+} __uapi_arch_align;
=20
=20
 /* This struct is used by the CDROMREADTOCENTRY ioctl */
@@ -225,26 +227,34 @@ struct cdrom_tocentry
 	__u8	cdte_adr	:4;
 	__u8	cdte_ctrl	:4;
 	__u8	cdte_format;
+	__uapi_arch_pad8;
 	union cdrom_addr cdte_addr;
 	__u8	cdte_datamode;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /* This struct is used by the CDROMREADMODE1, and CDROMREADMODE2 ioctls=
 */
 struct cdrom_read     =20
 {
 	int	cdread_lba;
+	__uapi_arch_pad_long;
 	char 	*cdread_bufaddr;
 	int	cdread_buflen;
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 /* This struct is used by the CDROMREADAUDIO ioctl */
 struct cdrom_read_audio
 {
 	union cdrom_addr addr; /* frame address */
 	__u8 addr_format;      /* CDROM_LBA or CDROM_MSF */
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	int nframes;           /* number of 2352-byte-frames to read at once */
+	__uapi_arch_pad_long;
 	__u8 __user *buf;      /* frame buffer (size: nframes*2352 bytes) */
-};
+} __uapi_arch_align;
=20
 /* This struct is used with the CDROMMULTISESSION ioctl */
 struct cdrom_multisession
@@ -254,7 +264,8 @@ struct cdrom_multisession
 	                           if the "xa_flag" is true. */
 	__u8 xa_flag;        /* 1: "is XA disk" */
 	__u8 addr_format;    /* CDROM_LBA or CDROM_MSF */
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /* This struct is used with the CDROM_GET_MCN ioctl. =20
  * Very few audio discs actually have Universal Product Code informatio=
n,=20
@@ -271,7 +282,8 @@ struct cdrom_blk
 {
 	unsigned from;
 	unsigned short len;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 #define CDROM_PACKET_SIZE	12
=20
@@ -284,18 +296,22 @@ struct cdrom_blk
 struct cdrom_generic_command
 {
 	unsigned char 		cmd[CDROM_PACKET_SIZE];
+	__uapi_arch_pad_long;
 	unsigned char		__user *buffer;
 	unsigned int 		buflen;
 	int			stat;
 	struct request_sense	__user *sense;
 	unsigned char		data_direction;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	int			quiet;
 	int			timeout;
+	__uapi_arch_pad_long;
 	union {
 		void		__user *reserved[1];	/* unused, actually */
 		void            __user *unused;
 	};
-};
+} __uapi_arch_align;
=20
 /* This struct is used by CDROM_TIMED_MEDIA_CHANGE */
 struct cdrom_timed_media_change_info {
@@ -551,24 +567,38 @@ struct dvd_layer {
 	__u8 book_type		: 4;
 	__u8 min_rate		: 4;
 	__u8 disc_size		: 4;
+
 	__u8 layer_type		: 4;
 	__u8 track_path		: 1;
 	__u8 nlayers		: 2;
+#ifndef __m68k__
+	/* padding starting with gcc-4.4, but not on m68k */
+	__u8			: 1;
+#endif
+
 	__u8 track_density	: 4;
 	__u8 linear_density	: 4;
+
 	__u8 bca		: 1;
+#ifndef __m68k__
+	__u8			: 7;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+#endif
+
 	__u32 start_sector;
 	__u32 end_sector;
 	__u32 end_sector_l0;
-};
+} __uapi_arch_align;
=20
 #define DVD_LAYERS	4
=20
 struct dvd_physical {
 	__u8 type;
 	__u8 layer_num;
+	__uapi_arch_pad16;
 	struct dvd_layer layer[DVD_LAYERS];
-};
+} __uapi_arch_align;
=20
 struct dvd_copyright {
 	__u8 type;
@@ -582,23 +612,32 @@ struct dvd_disckey {
 	__u8 type;
=20
 	unsigned agid		: 2;
+	unsigned		: 6;
 	__u8 value[2048];
-};
+	/*
+	 *  the 'unsigned agid' type makes the structure alignment
+	 * 32-bit on all architectures other than m68k
+	 */
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 struct dvd_bca {
 	__u8 type;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
=20
 	int len;
 	__u8 value[188];
-};
+} __uapi_arch_align;
=20
 struct dvd_manufact {
 	__u8 type;
=20
 	__u8 layer_num;
+	__uapi_arch_pad16;
 	int len;
 	__u8 value[2048];
-};
+} __uapi_arch_align;
=20
 typedef union {
 	__u8 type;
@@ -639,25 +678,33 @@ typedef __u8 dvd_challenge[10];	/* 80-bit value, M=
SB is first elem. */
 struct dvd_lu_send_agid {
 	__u8 type;
 	unsigned agid		: 2;
-};
+	__u8			: 6;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 struct dvd_host_send_challenge {
 	__u8 type;
 	unsigned agid		: 2;
+	unsigned :6;
=20
 	dvd_challenge chal;
-};
+} __uapi_arch_align;
=20
 struct dvd_send_key {
 	__u8 type;
 	unsigned agid		: 2;
+	unsigned :6;
=20
 	dvd_key key;
-};
+#ifndef __m68k__
+	__uapi_arch_pad8;
+#endif
+} __uapi_arch_align;
=20
 struct dvd_lu_send_challenge {
 	__u8 type;
 	unsigned agid		: 2;
+	unsigned :6;
=20
 	dvd_challenge chal;
 };
@@ -675,20 +722,28 @@ struct dvd_lu_send_challenge {
 struct dvd_lu_send_title_key {
 	__u8 type;
 	unsigned agid		: 2;
+	unsigned		: 6;
=20
 	dvd_key title_key;
+	__uapi_arch_pad8;
 	int lba;
 	unsigned cpm		: 1;
 	unsigned cp_sec		: 1;
 	unsigned cgms		: 2;
-};
+	unsigned		: 4;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 struct dvd_lu_send_asf {
 	__u8 type;
 	unsigned agid		: 2;
=20
 	unsigned asf		: 1;
-};
+	unsigned		: 5;
+
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 struct dvd_host_send_rpcstate {
 	__u8 type;
@@ -863,6 +918,7 @@ typedef struct {
         __u8 dbc_v			: 1;
 	__u8 did_v			: 1;
 #endif
+
 	__u8 disc_type;
 	__u8 n_sessions_msb;
 	__u8 first_track_msb;
@@ -873,7 +929,8 @@ typedef struct {
 	__u8 disc_bar_code[8];
 	__u8 reserved3;
 	__u8 n_opc;
-} disc_information;
+	__uapi_arch_pad16;
+} disc_information __uapi_arch_align;
=20
 typedef struct {
 	__be16 track_information_length;
diff --git a/include/uapi/linux/cec-funcs.h b/include/uapi/linux/cec-fun=
cs.h
index 189ecf0e13cd..be9f0ba27d1b 100644
--- a/include/uapi/linux/cec-funcs.h
+++ b/include/uapi/linux/cec-funcs.h
@@ -154,9 +154,10 @@ struct cec_op_dvb_data {
=20
 struct cec_op_channel_data {
 	__u8 channel_number_fmt;
+	__uapi_arch_pad8;
 	__u16 major;
 	__u16 minor;
-};
+} __uapi_arch_align;
=20
 struct cec_op_digital_service_id {
 	__u8 service_id_method;
@@ -171,13 +172,16 @@ struct cec_op_digital_service_id {
=20
 struct cec_op_record_src {
 	__u8 type;
+	__uapi_arch_pad8;
 	union {
 		struct cec_op_digital_service_id digital;
 		struct {
 			__u8 ana_bcast_type;
+			__uapi_arch_pad8;
 			__u16 ana_freq;
 			__u8 bcast_system;
-		} analog;
+			__uapi_arch_pad8;
+		} __uapi_arch_align analog;
 		struct {
 			__u8 plug;
 		} ext_plug;
@@ -867,7 +871,7 @@ static inline void cec_ops_report_features(const str=
uct cec_msg *msg,
 	*cec_version =3D msg->msg[2];
 	*all_device_types =3D msg->msg[3];
 	*rc_profile =3D p;
-	*dev_features =3D NULL;
+	*dev_features =3D (void *)0;
 	while (p < &msg->msg[14] && (*p & CEC_OP_FEAT_EXT))
 		p++;
 	if (!(*p & CEC_OP_FEAT_EXT)) {
@@ -876,7 +880,7 @@ static inline void cec_ops_report_features(const str=
uct cec_msg *msg,
 			p++;
 	}
 	if (*p & CEC_OP_FEAT_EXT)
-		*rc_profile =3D *dev_features =3D NULL;
+		*rc_profile =3D *dev_features =3D (void *)0;
 }
=20
 static inline void cec_msg_give_features(struct cec_msg *msg,
@@ -953,15 +957,18 @@ struct cec_op_tuner_device_info {
 	__u8 rec_flag;
 	__u8 tuner_display_info;
 	__u8 is_analog;
+	__uapi_arch_pad8;
 	union {
 		struct cec_op_digital_service_id digital;
 		struct {
 			__u8 ana_bcast_type;
+			__uapi_arch_pad8;
 			__u16 ana_freq;
 			__u8 bcast_system;
-		} analog;
+			__uapi_arch_pad8;
+		} __uapi_arch_align analog;
 	};
-};
+} __uapi_arch_align;
=20
 static inline void cec_msg_tuner_device_status_analog(struct cec_msg *m=
sg,
 						      __u8 rec_flag,
diff --git a/include/uapi/linux/cec.h b/include/uapi/linux/cec.h
index b2af1dddd4d7..e660048e0f3a 100644
--- a/include/uapi/linux/cec.h
+++ b/include/uapi/linux/cec.h
@@ -69,7 +69,8 @@ struct cec_msg {
 	__u8 tx_nack_cnt;
 	__u8 tx_low_drive_cnt;
 	__u8 tx_error_cnt;
-};
+	__uapi_arch_pad8;
+} __uapi_arch_align;
=20
 /**
  * cec_msg_initiator - return the initiator's logical address.
@@ -395,7 +396,8 @@ struct cec_log_addrs {
 	/* CEC 2.0 */
 	__u8 all_device_types[CEC_MAX_LOG_ADDRS];
 	__u8 features[CEC_MAX_LOG_ADDRS][12];
-};
+	__uapi_arch_pad8;
+} __uapi_arch_align;
=20
 /* Allow a fallback to unregistered */
 #define CEC_LOG_ADDRS_FL_ALLOW_UNREG_FALLBACK	(1 << 0)
diff --git a/include/uapi/linux/chio.h b/include/uapi/linux/chio.h
index e1cad4c319ee..1038f56e3276 100644
--- a/include/uapi/linux/chio.h
+++ b/include/uapi/linux/chio.h
@@ -6,6 +6,8 @@
 #ifndef _UAPI_LINUX_CHIO_H
 #define _UAPI_LINUX_CHIO_H
=20
+#include <linux/types.h>
+
 /* changer element types */
 #define CHET_MT   0	/* media transport element (robot) */
 #define CHET_ST   1	/* storage element (media slots) */
@@ -100,8 +102,9 @@ struct changer_position {
  */
 struct changer_element_status {
 	int             ces_type;
+	__uapi_arch_pad_long;
 	unsigned char   __user *ces_data;
-};
+} __uapi_arch_align;
 #define CESTATUS_FULL     0x01 /* full */
 #define CESTATUS_IMPEXP   0x02	/* media was imported (inserted by sysop=
) */
 #define CESTATUS_EXCEPT   0x04	/* error condition */
diff --git a/include/uapi/linux/coda.h b/include/uapi/linux/coda.h
index aa34c2dcae8d..665040cdcf45 100644
--- a/include/uapi/linux/coda.h
+++ b/include/uapi/linux/coda.h
@@ -114,6 +114,12 @@ typedef short		     int16_t;
 typedef unsigned short	   u_int16_t;
 typedef int		     int32_t;
 typedef unsigned int	   u_int32_t;
+typedef long long	     int64_t;
+typedef unsigned long long u_int64_t;
+typedef u_int16_t	u_short;
+typedef unsigned long	u_long;
+typedef u_long ino_t;
+typedef void * caddr_t;
 #endif
=20
=20
@@ -203,17 +209,21 @@ enum coda_vtype	{ C_VNON, C_VREG, C_VDIR, C_VBLK, =
C_VCHR, C_VLNK, C_VSOCK, C_VFI
 struct coda_timespec {
 	int64_t		tv_sec;		/* seconds */
 	long		tv_nsec;	/* nanoseconds */
-};
+	__uapi_arch_pad_long_to_u64;
+} __uapi_arch_align;
=20
 struct coda_vattr {
 	long     	va_type;	/* vnode type (for create) */
-	u_short		va_mode;	/* files access mode and type */
+	u_int16_t	va_mode;	/* files access mode and type */
 	short		va_nlink;	/* number of references to file */
 	vuid_t		va_uid;		/* owner user id */
 	vgid_t		va_gid;		/* owner group id */
+	__uapi_arch_pad_long;
 	long		va_fileid;	/* file id */
+	__uapi_arch_pad_long_to_u64;
 	u_quad_t	va_size;	/* file size in bytes */
 	long		va_blocksize;	/* blocksize preferred for i/o */
+	__uapi_arch_pad_long_to_u64;
 	struct coda_timespec va_atime;	/* time of last access */
 	struct coda_timespec va_mtime;	/* time of last modification */
 	struct coda_timespec va_ctime;	/* time file changed */
@@ -282,11 +292,13 @@ struct coda_statfs {
=20
 #define CIOC_KERNEL_VERSION _IOWR('c', 10, size_t)
=20
+#if 0
 //      CODA_KERNEL_VERSION 0 /* don't care about kernel version number=
 */
 //      CODA_KERNEL_VERSION 1 /* The old venus 4.6 compatible interface=
 */
 //      CODA_KERNEL_VERSION 2 /* venus_lookup gets an extra parameter */
 //      CODA_KERNEL_VERSION 3 /* 128-bit file identifiers */
 //      CODA_KERNEL_VERSION 4 /* 64-bit timespec */
+#endif
 #define CODA_KERNEL_VERSION 5 /* access intent support */
=20
 /*
@@ -326,8 +338,10 @@ struct coda_open_in {
=20
 struct coda_open_out {
     struct coda_out_hdr oh;
+    __uapi_arch_pad32;
     cdev_t	dev;
     ino_t	inode;
+    __uapi_arch_pad_long_to_u64;
 };
=20
=20
@@ -389,16 +403,18 @@ struct coda_getattr_in {
=20
 struct coda_getattr_out {
     struct coda_out_hdr oh;
+    __uapi_arch_pad32;
     struct coda_vattr attr;
-};
+} __uapi_arch_align;
=20
=20
 /* coda_setattr: NO_OUT */
 struct coda_setattr_in {
     struct coda_in_hdr ih;
     struct CodaFid VFid;
+    __uapi_arch_pad32;
     struct coda_vattr attr;
-};
+} __uapi_arch_align;
=20
 struct coda_setattr_out {
     struct coda_out_hdr out;
@@ -439,17 +455,20 @@ struct coda_lookup_out {
 struct coda_create_in {
     struct coda_in_hdr ih;
     struct CodaFid VFid;
+    __uapi_arch_pad32;
     struct coda_vattr attr;
     int excl;
     int mode;
     int 	name;		/* Place holder for data. */
-};
+    __uapi_arch_pad32;
+} __uapi_arch_align;
=20
 struct coda_create_out {
     struct coda_out_hdr oh;
     struct CodaFid VFid;
+    __uapi_arch_pad32;
     struct coda_vattr attr;
-};
+} __uapi_arch_align;
=20
=20
 /* coda_remove: NO_OUT */
@@ -493,15 +512,18 @@ struct coda_rename_out {
 struct coda_mkdir_in {
     struct coda_in_hdr ih;
     struct CodaFid VFid;
+    __uapi_arch_pad32;
     struct coda_vattr attr;
     int	   name;		/* Place holder for data. */
-};
+    __uapi_arch_pad32;
+} __uapi_arch_align;
=20
 struct coda_mkdir_out {
     struct coda_out_hdr oh;
     struct CodaFid VFid;
+    __uapi_arch_pad32;
     struct coda_vattr attr;
-};
+} __uapi_arch_align;
=20
=20
 /* coda_rmdir: NO_OUT */
@@ -522,7 +544,8 @@ struct coda_symlink_in {
     int srcname;
     struct coda_vattr attr;
     int tname;
-};
+    __uapi_arch_pad32;
+} __uapi_arch_align;
=20
 struct coda_symlink_out {
     struct coda_out_hdr out;
@@ -737,13 +760,15 @@ struct ViceIoctl {
         void __user *out;       /* Data to be transferred out */
         u_short in_size;        /* Size of input buffer <=3D 2K */
         u_short out_size;       /* Maximum size of output buffer, <=3D =
2K */
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 struct PioctlData {
         const char __user *path;
         int follow;
+	__uapi_arch_pad_long;
         struct ViceIoctl vi;
-};
+} __uapi_arch_align;
=20
 #define CODA_CONTROL		".CONTROL"
 #define CODA_CONTROLLEN		8
diff --git a/include/uapi/linux/comedi.h b/include/uapi/linux/comedi.h
index 7314e5ee0a1e..7ff82397e0f5 100644
--- a/include/uapi/linux/comedi.h
+++ b/include/uapi/linux/comedi.h
@@ -10,6 +10,8 @@
 #ifndef _COMEDI_H
 #define _COMEDI_H
=20
+#include <linux/types.h>
+
 #define COMEDI_MAJORVERSION	0
 #define COMEDI_MINORVERSION	7
 #define COMEDI_MICROVERSION	76
@@ -495,7 +497,8 @@ struct comedi_insn {
 	unsigned int subdev;
 	unsigned int chanspec;
 	unsigned int unused[3];
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 /**
  * struct comedi_insnlist - list of COMEDI instructions
@@ -506,8 +509,9 @@ struct comedi_insn {
  */
 struct comedi_insnlist {
 	unsigned int n_insns;
+	__uapi_arch_pad_long;
 	struct comedi_insn __user *insns;
-};
+} __uapi_arch_align;
=20
 /**
  * struct comedi_cmd - COMEDI asynchronous acquisition command details
@@ -607,10 +611,12 @@ struct comedi_cmd {
=20
 	unsigned int *chanlist;
 	unsigned int chanlist_len;
+	__uapi_arch_pad_long;
=20
 	short __user *data;
 	unsigned int data_len;
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 /**
  * struct comedi_chaninfo - used to retrieve per-channel information
@@ -632,11 +638,12 @@ struct comedi_cmd {
  */
 struct comedi_chaninfo {
 	unsigned int subdev;
+	__uapi_arch_pad_long;
 	unsigned int __user *maxdata_list;
 	unsigned int __user *flaglist;
 	unsigned int __user *rangelist;
 	unsigned int unused[4];
-};
+} __uapi_arch_align;;
=20
 /**
  * struct comedi_rangeinfo - used to retrieve the range table for a cha=
nnel
@@ -657,8 +664,9 @@ struct comedi_chaninfo {
  */
 struct comedi_rangeinfo {
 	unsigned int range_type;
+	__uapi_arch_pad_long;
 	void __user *range_ptr;
-};
+} __uapi_arch_align;
=20
 /**
  * struct comedi_krange - describes a range in a range table
diff --git a/include/uapi/linux/counter.h b/include/uapi/linux/counter.h
index 350b45d616bb..9c47bedb1fbe 100644
--- a/include/uapi/linux/counter.h
+++ b/include/uapi/linux/counter.h
@@ -115,6 +115,7 @@ struct counter_event {
 	__aligned_u64 value;
 	struct counter_watch watch;
 	__u8 status;
+	__uapi_arch_pad8;
 };
=20
 /* Count direction values */
diff --git a/include/uapi/linux/cycx_cfm.h b/include/uapi/linux/cycx_cfm=
.h
index 91778c8024b1..208296d75203 100644
--- a/include/uapi/linux/cycx_cfm.h
+++ b/include/uapi/linux/cycx_cfm.h
@@ -19,6 +19,8 @@
 #ifndef	_CYCX_CFM_H
 #define	_CYCX_CFM_H
=20
+#include <linux/types.h>
+
 /* Defines */
=20
 #define	CFM_VERSION	2
@@ -64,13 +66,18 @@ struct cycx_fw_info {
 	unsigned short	codeid;
 	unsigned short	version;
 	unsigned short	adapter[CFM_MAX_CYCX];
+	__uapi_arch_pad16;
 	unsigned long	memsize;
 	unsigned short	reserved[2];
 	unsigned short	startoffs;
 	unsigned short	winoffs;
 	unsigned short	codeoffs;
+	__uapi_arch_pad16;
+	__uapi_arch_pad_long;
 	unsigned long	codesize;
 	unsigned short	dataoffs;
+	__uapi_arch_pad16;
+	__uapi_arch_pad_long;
 	unsigned long	datasize;
 };
=20
diff --git a/include/uapi/linux/dcbnl.h b/include/uapi/linux/dcbnl.h
index 7e15214aa5dd..c63329ed4d65 100644
--- a/include/uapi/linux/dcbnl.h
+++ b/include/uapi/linux/dcbnl.h
@@ -158,7 +158,9 @@ struct ieee_pfc {
 	__u8	pfc_cap;
 	__u8	pfc_en;
 	__u8	mbc;
+	__uapi_arch_pad8;
 	__u16	delay;
+	__uapi_arch_pad16;
 	__u64	requests[IEEE_8021QAZ_MAX_TCS];
 	__u64	indications[IEEE_8021QAZ_MAX_TCS];
 };
diff --git a/include/uapi/linux/dlm.h b/include/uapi/linux/dlm.h
index 4eaf835780b0..b28cadcb7601 100644
--- a/include/uapi/linux/dlm.h
+++ b/include/uapi/linux/dlm.h
@@ -63,8 +63,11 @@ struct dlm_lksb {
 	int 	 sb_status;
 	__u32	 sb_lkid;
 	char 	 sb_flags;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+	__uapi_arch_pad_long;
 	char *	 sb_lvbptr;
-};
+} __uapi_arch_align;
=20
 /* dlm_new_lockspace() flags */
=20
diff --git a/include/uapi/linux/dlm_device.h b/include/uapi/linux/dlm_de=
vice.h
index e83954c69fff..b9d2b833ffba 100644
--- a/include/uapi/linux/dlm_device.h
+++ b/include/uapi/linux/dlm_device.h
@@ -45,8 +45,11 @@ struct dlm_lock_params {
 	void __user *bastaddr;
 	struct dlm_lksb __user *lksb;
 	char lvb[DLM_USER_LVB_LEN];
-	char name[];
-};
+	union {
+		__uapi_arch_pad_long_to_u64;
+		__DECLARE_FLEX_ARRAY(char, name);
+	};
+} __uapi_arch_align;
=20
 struct dlm_lspace_params {
 	__u32 flags;
diff --git a/include/uapi/linux/dm-ioctl.h b/include/uapi/linux/dm-ioctl=
.h
index 3225e025e30e..6b6a6c9dc893 100644
--- a/include/uapi/linux/dm-ioctl.h
+++ b/include/uapi/linux/dm-ioctl.h
@@ -192,7 +192,10 @@ struct dm_name_list {
 	__u64 dev;
 	__u32 next;		/* offset to the next record from
 				   the _start_ of this */
-	char name[];
+	union {
+		__uapi_arch_pad32;
+		__DECLARE_FLEX_ARRAY(char, name);
+	} __uapi_arch_align;
=20
 	/*
 	 * The following members can be accessed by taking a pointer that
@@ -204,7 +207,7 @@ struct dm_name_list {
 	 * __u32 flags;
 	 * char uuid[0];
 	 */
-};
+} __uapi_arch_align;
=20
 #define DM_NAME_LIST_FLAG_HAS_UUID		1
 #define DM_NAME_LIST_FLAG_DOESNT_HAVE_UUID	2
diff --git a/include/uapi/linux/dqblk_xfs.h b/include/uapi/linux/dqblk_x=
fs.h
index 8cda3e62e0e7..1bc6881ccff0 100644
--- a/include/uapi/linux/dqblk_xfs.h
+++ b/include/uapi/linux/dqblk_xfs.h
@@ -160,12 +160,16 @@ typedef struct fs_qfilestat {
 	__u64		qfs_ino;	/* inode number */
 	__u64		qfs_nblks;	/* number of BBs 512-byte-blks */
 	__u32		qfs_nextents;	/* number of extents */
-} fs_qfilestat_t;
+	__uapi_arch_pad32;
+} fs_qfilestat_t __uapi_arch_align;
=20
 typedef struct fs_quota_stat {
 	__s8		qs_version;	/* version number for future changes */
+	__uapi_arch_pad8;
 	__u16		qs_flags;	/* FS_QUOTA_{U,P,G}DQ_{ACCT,ENFD} */
 	__s8		qs_pad;		/* unused */
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	fs_qfilestat_t	qs_uquota;	/* user quota storage information */
 	fs_qfilestat_t	qs_gquota;	/* group quota storage information */
 	__u32		qs_incoredqs;	/* number of dquots incore */
@@ -174,7 +178,8 @@ typedef struct fs_quota_stat {
 	__s32		qs_rtbtimelimit;/* limit for rt blks timer */=09
 	__u16		qs_bwarnlimit;	/* limit for num warnings */
 	__u16		qs_iwarnlimit;	/* limit for num warnings */
-} fs_quota_stat_t;
+	__uapi_arch_pad32;
+} fs_quota_stat_t __uapi_arch_align;
=20
 /*
  * fs_quota_statv is used by Q_XGETQSTATV for a given file system. It p=
rovides
diff --git a/include/uapi/linux/dvb/dmx.h b/include/uapi/linux/dvb/dmx.h
index 7b16375f94e2..65b06b72b592 100644
--- a/include/uapi/linux/dvb/dmx.h
+++ b/include/uapi/linux/dvb/dmx.h
@@ -158,12 +158,13 @@ struct dmx_filter {
 struct dmx_sct_filter_params {
 	__u16             pid;
 	struct dmx_filter filter;
+	__uapi_arch_pad16;
 	__u32             timeout;
 	__u32             flags;
 #define DMX_CHECK_CRC       1
 #define DMX_ONESHOT         2
 #define DMX_IMMEDIATE_START 4
-};
+} __uapi_arch_align;
=20
 /**
  * struct dmx_pes_filter_params - Specifies Packetized Elementary Strea=
m (PES)
@@ -177,11 +178,12 @@ struct dmx_sct_filter_params {
  */
 struct dmx_pes_filter_params {
 	__u16           pid;
+	__uapi_arch_pad16;
 	enum dmx_input  input;
 	enum dmx_output output;
 	enum dmx_ts_pes pes_type;
 	__u32           flags;
-};
+} __uapi_arch_align;
=20
 /**
  * struct dmx_stc - Stores System Time Counter (STC) information.
diff --git a/include/uapi/linux/dvb/frontend.h b/include/uapi/linux/dvb/=
frontend.h
index 8d38c6befda8..a8580e719168 100644
--- a/include/uapi/linux/dvb/frontend.h
+++ b/include/uapi/linux/dvb/frontend.h
@@ -180,8 +180,10 @@ struct dvb_diseqc_master_cmd {
 struct dvb_diseqc_slave_reply {
 	__u8 msg[4];
 	__u8 msg_len;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	int  timeout;
-};
+} __uapi_arch_align;
=20
 /**
  * enum fe_sec_voltage - DC Voltage used to feed the LNBf
@@ -920,8 +922,9 @@ struct dtv_property {
  */
 struct dtv_properties {
 	__u32 num;
+	__uapi_arch_pad_long;
 	struct dtv_property *props;
-};
+} __uapi_arch_align;
=20
 /*
  * When set, this flag will disable any zigzagging or other "normal" tu=
ning
@@ -1011,6 +1014,10 @@ typedef enum fe_delivery_system fe_delivery_syste=
m_t;
 struct dvb_qpsk_parameters {
 	__u32		symbol_rate;  /* symbol rate in Symbols per second */
 	fe_code_rate_t	fec_inner;    /* forward error correction (see above) */
+#ifdef __hexagon__
+	/* hexagon uses short enums */
+	__u8 :8, :8, :8;
+#endif
 };
=20
 struct dvb_qam_parameters {
diff --git a/include/uapi/linux/dvb/net.h b/include/uapi/linux/dvb/net.h
index 7cbb47ac38ef..d1a416e17a7b 100644
--- a/include/uapi/linux/dvb/net.h
+++ b/include/uapi/linux/dvb/net.h
@@ -33,7 +33,8 @@ struct dvb_net_if {
 	__u8  feedtype;
 #define DVB_NET_FEEDTYPE_MPE 0	/* multi protocol encapsulation */
 #define DVB_NET_FEEDTYPE_ULE 1	/* ultra lightweight encapsulation */
-};
+	__uapi_arch_pad8;
+} __uapi_arch_align;
=20
=20
 #define NET_ADD_IF    _IOWR('o', 52, struct dvb_net_if)
diff --git a/include/uapi/linux/dvb/osd.h b/include/uapi/linux/dvb/osd.h
index 6003b108ba45..d3e47b53f820 100644
--- a/include/uapi/linux/dvb/osd.h
+++ b/include/uapi/linux/dvb/osd.h
@@ -13,6 +13,7 @@
 #define _DVBOSD_H_
=20
 #include <linux/compiler.h>
+#include <linux/types.h>
=20
 typedef enum {
 	/* All functions return -2 on "not open" */
@@ -155,9 +156,10 @@ typedef enum {
=20
 typedef struct osd_cap_s {
 	int  cmd;
+	__uapi_arch_pad_long;
 #define OSD_CAP_MEMSIZE         1  /* memory size */
 	long val;
-} osd_cap_t;
+} __uapi_arch_align osd_cap_t;
=20
=20
 #define OSD_SEND_CMD            _IOW('o', 160, osd_cmd_t)
diff --git a/include/uapi/linux/dvb/video.h b/include/uapi/linux/dvb/vid=
eo.h
index 9910b73737e0..0eb7bc5a64c8 100644
--- a/include/uapi/linux/dvb/video.h
+++ b/include/uapi/linux/dvb/video.h
@@ -34,6 +34,10 @@ typedef struct {
 	int w;
 	int h;
 	video_format_t aspect_ratio;
+#ifdef __hexagon__
+	/* hexagon uses short enums */
+	__u8 :8, :8, :8;
+#endif
 } video_size_t;
=20
 typedef enum {
@@ -106,6 +110,7 @@ struct video_command {
=20
 struct video_event {
 	__s32 type;
+	__uapi_arch_pad_long;
 #define VIDEO_EVENT_SIZE_CHANGED	1
 #define VIDEO_EVENT_FRAME_RATE_CHANGED	2
 #define VIDEO_EVENT_DECODER_STOPPED	3
@@ -117,7 +122,8 @@ struct video_event {
 		unsigned int frame_rate;	/* in frames per 1000sec */
 		unsigned char vsync_field;	/* unknown/odd/even/progressive */
 	} u;
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
=20
 struct video_status {
@@ -132,7 +138,8 @@ struct video_status {
 struct video_still_picture {
 	char __user *iFrame;        /* pointer to a single iframe in memory */
 	__s32 size;
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
=20
 typedef __u16 video_attributes_t;
diff --git a/include/uapi/linux/edd.h b/include/uapi/linux/edd.h
index 0fe3e02aec65..7b0230c3cf06 100644
--- a/include/uapi/linux/edd.h
+++ b/include/uapi/linux/edd.h
@@ -185,7 +185,8 @@ struct edd {
 	struct edd_info edd_info[EDDMAXNR];
 	unsigned char mbr_signature_nr;
 	unsigned char edd_info_nr;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 #endif				/*!__ASSEMBLY__ */
=20
diff --git a/include/uapi/linux/efs_fs_sb.h b/include/uapi/linux/efs_fs_=
sb.h
index 6bad29a10faa..57ac9a3deb96 100644
--- a/include/uapi/linux/efs_fs_sb.h
+++ b/include/uapi/linux/efs_fs_sb.h
@@ -32,6 +32,7 @@ struct efs_super {
 	__be16		fs_heads;       /* heads per cylinder */
 	__be16		fs_ncg;         /* # of cylinder groups in filesystem */
 	__be16		fs_dirty;       /* fs needs to be fsck'd */
+	__uapi_arch_pad16;
 	__be32		fs_time;        /* last super-block update */
 	__be32		fs_magic;       /* magic number */
 	char		fs_fname[6];    /* file system name */
@@ -44,7 +45,7 @@ struct efs_super {
 	__be32		fs_lastialloc;  /* last allocated inode */
 	char		fs_spare[20];   /* space for expansion - MUST BE ZERO */
 	__be32		fs_checksum;    /* checksum of volume portion of fs */
-};
+} __uapi_arch_align;
=20
 /* efs superblock information in memory */
 struct efs_sb_info {
diff --git a/include/uapi/linux/elf-fdpic.h b/include/uapi/linux/elf-fdp=
ic.h
index ec23f0871129..d020f732b673 100644
--- a/include/uapi/linux/elf-fdpic.h
+++ b/include/uapi/linux/elf-fdpic.h
@@ -37,11 +37,13 @@ struct elf64_fdpic_loadseg {
 	Elf64_Addr	addr;		/* core address to which mapped */
 	Elf64_Addr	p_vaddr;	/* VMA recorded in file */
 	Elf64_Word	p_memsz;	/* allocation size recorded in file */
+	__uapi_arch_pad32;
 };
=20
 struct elf64_fdpic_loadmap {
 	Elf64_Half	version;	/* version of these structures, just in case... */
 	Elf64_Half	nsegs;		/* number of segments */
+	__uapi_arch_pad32;
 	struct elf64_fdpic_loadseg segs[];
 };
=20
diff --git a/include/uapi/linux/errqueue.h b/include/uapi/linux/errqueue=
.h
index 1ea47309d772..0782c895ce43 100644
--- a/include/uapi/linux/errqueue.h
+++ b/include/uapi/linux/errqueue.h
@@ -4,6 +4,9 @@
=20
 #include <linux/types.h>
 #include <linux/time_types.h>
+#ifndef __KERNEL__
+#include <sys/time.h>
+#endif
=20
 /* RFC 4884: return offset to extension struct + validation */
 struct sock_ee_data_rfc4884 {
diff --git a/include/uapi/linux/ethtool.h b/include/uapi/linux/ethtool.h
index eb7ff2602fbb..b5614c648b47 100644
--- a/include/uapi/linux/ethtool.h
+++ b/include/uapi/linux/ethtool.h
@@ -213,7 +213,8 @@ struct ethtool_wolinfo {
 	__u32	supported;
 	__u32	wolopts;
 	__u8	sopass[SOPASS_MAX];
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /* for passing single values */
 struct ethtool_value {
@@ -1247,7 +1248,9 @@ struct ethtool_tcpip4_spec {
 	__be16	psrc;
 	__be16	pdst;
 	__u8    tos;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /**
  * struct ethtool_ah_espip4_spec - flow specification for IPsec/IPv4
@@ -1263,7 +1266,9 @@ struct ethtool_ah_espip4_spec {
 	__be32	ip4dst;
 	__be32	spi;
 	__u8    tos;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 #define	ETH_RX_NFC_IP4	1
=20
@@ -1283,7 +1288,8 @@ struct ethtool_usrip4_spec {
 	__u8    tos;
 	__u8    ip_ver;
 	__u8    proto;
-};
+	__uapi_arch_pad8;
+} __uapi_arch_align;
=20
 /**
  * struct ethtool_tcpip6_spec - flow specification for TCP/IPv6 etc.
@@ -1301,7 +1307,9 @@ struct ethtool_tcpip6_spec {
 	__be16	psrc;
 	__be16	pdst;
 	__u8    tclass;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /**
  * struct ethtool_ah_espip6_spec - flow specification for IPsec/IPv6
@@ -1317,7 +1325,9 @@ struct ethtool_ah_espip6_spec {
 	__be32	ip6dst[4];
 	__be32	spi;
 	__u8    tclass;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /**
  * struct ethtool_usrip6_spec - general flow specification for IPv6
@@ -1333,7 +1343,8 @@ struct ethtool_usrip6_spec {
 	__be32	l4_4_bytes;
 	__u8    tclass;
 	__u8    l4_proto;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 union ethtool_flow_union {
 	struct ethtool_tcpip4_spec		tcp_ip4_spec;
@@ -1395,9 +1406,11 @@ struct ethtool_rx_flow_spec {
 	struct ethtool_flow_ext h_ext;
 	union ethtool_flow_union m_u;
 	struct ethtool_flow_ext m_ext;
+	__uapi_arch_pad32;
 	__u64		ring_cookie;
 	__u32		location;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /* How rings are laid out when accessing virtual functions or
  * offloaded queues is device specific. To allow users to do flow
@@ -1494,8 +1507,11 @@ struct ethtool_rxnfc {
 		__u32			rule_cnt;
 		__u32			rss_context;
 	};
-	__u32				rule_locs[];
-};
+	union {
+		__uapi_arch_pad32;
+		__DECLARE_FLEX_ARRAY(__u32, rule_locs);
+	};
+} __uapi_arch_align;
=20
=20
 /**
@@ -1598,6 +1614,7 @@ struct ethtool_rx_ntuple_flow_spec {
 	__u64		data_mask;
=20
 	__s32		action;
+	__uapi_arch_pad32;
 #define ETHTOOL_RXNTUPLE_ACTION_DROP	(-1)	/* drop packet */
 #define ETHTOOL_RXNTUPLE_ACTION_CLEAR	(-2)	/* clear filter */
 };
@@ -1609,6 +1626,7 @@ struct ethtool_rx_ntuple_flow_spec {
  */
 struct ethtool_rx_ntuple {
 	__u32					cmd;
+	__uapi_arch_pad32;
 	struct ethtool_rx_ntuple_flow_spec	fs;
 };
=20
diff --git a/include/uapi/linux/eventpoll.h b/include/uapi/linux/eventpo=
ll.h
index 4f4b948ef381..621585faf58c 100644
--- a/include/uapi/linux/eventpoll.h
+++ b/include/uapi/linux/eventpoll.h
@@ -77,11 +77,14 @@
 #ifdef __x86_64__
 #define EPOLL_PACKED __attribute__((packed))
 #else
-#define EPOLL_PACKED
+#define EPOLL_PACKED __uapi_arch_align
 #endif
=20
 struct epoll_event {
 	__poll_t events;
+#ifndef __x86_64__
+	__uapi_arch_pad32;
+#endif
 	__u64 data;
 } EPOLL_PACKED;
=20
diff --git a/include/uapi/linux/ext4.h b/include/uapi/linux/ext4.h
index 9c683991c32f..1c7cdcdb7dca 100644
--- a/include/uapi/linux/ext4.h
+++ b/include/uapi/linux/ext4.h
@@ -102,13 +102,14 @@ struct move_extent {
 /* Used to pass group descriptor data when online resize is done */
 struct ext4_new_group_input {
 	__u32 group;		/* Group number for this data */
+	__uapi_arch_pad32;
 	__u64 block_bitmap;	/* Absolute block number of block bitmap */
 	__u64 inode_bitmap;	/* Absolute block number of inode bitmap */
 	__u64 inode_table;	/* Absolute block number of inode table start */
 	__u32 blocks_count;	/* Total number of blocks in this group */
 	__u16 reserved_blocks;	/* Number of reserved blocks in this group */
 	__u16 unused;
-};
+} __uapi_arch_align;
=20
 struct ext4_tune_sb_params {
 	__u32 set_flags;
@@ -138,8 +139,8 @@ struct ext4_tune_sb_params {
 	__u32 clear_feature_compat_mask;
 	__u32 clear_feature_incompat_mask;
 	__u32 clear_feature_ro_compat_mask;
-	__u8  mount_opts[64];
-	__u8  pad[68];
+	__u8  mount_opts[68];
+	__u8  pad[64];
 };
=20
 #define EXT4_TUNE_FL_ERRORS_BEHAVIOR	0x00000001
diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
index 795e26258355..18425c89ae91 100644
--- a/include/uapi/linux/f2fs.h
+++ b/include/uapi/linux/f2fs.h
@@ -72,9 +72,10 @@ enum {
=20
 struct f2fs_gc_range {
 	__u32 sync;
+	__uapi_arch_pad32;
 	__u64 start;
 	__u64 len;
-};
+} __uapi_arch_align;
=20
 struct f2fs_defragment {
 	__u64 start;
@@ -83,10 +84,11 @@ struct f2fs_defragment {
=20
 struct f2fs_move_range {
 	__u32 dst_fd;		/* destination fd */
+	__uapi_arch_pad32;
 	__u64 pos_in;		/* start position in src_fd */
 	__u64 pos_out;		/* start position in dst_fd */
 	__u64 len;		/* size to move */
-};
+} __uapi_arch_align;
=20
 struct f2fs_flush_device {
 	__u32 dev_num;		/* device number to flush */
diff --git a/include/uapi/linux/fanotify.h b/include/uapi/linux/fanotify=
.h
index e710967c7c26..cab7d85624d4 100644
--- a/include/uapi/linux/fanotify.h
+++ b/include/uapi/linux/fanotify.h
@@ -207,8 +207,9 @@ struct fanotify_event_info_range {
=20
 struct fanotify_event_info_mnt {
 	struct fanotify_event_info_header hdr;
+	__uapi_arch_pad32;
 	__u64 mnt_id;
-};
+} __uapi_arch_align;
=20
 /*
  * User space may need to record additional information about its decis=
ion.
diff --git a/include/uapi/linux/fb.h b/include/uapi/linux/fb.h
index 22acaaec7b1c..3e085bd953ce 100644
--- a/include/uapi/linux/fb.h
+++ b/include/uapi/linux/fb.h
@@ -166,7 +166,9 @@ struct fb_fix_screeninfo {
 	__u16 xpanstep;			/* zero if no hardware panning  */
 	__u16 ypanstep;			/* zero if no hardware panning  */
 	__u16 ywrapstep;		/* zero if no hardware ywrap    */
+	__uapi_arch_pad16;
 	__u32 line_length;		/* length of a line in bytes    */
+	__uapi_arch_pad_long;
 	unsigned long mmio_start;	/* Start of Memory Mapped I/O   */
 					/* (physical address) */
 	__u32 mmio_len;			/* Length of Memory Mapped I/O  */
@@ -174,7 +176,8 @@ struct fb_fix_screeninfo {
 					/*  specific chip/card we have	*/
 	__u16 capabilities;		/* see FB_CAP_*			*/
 	__u16 reserved[2];		/* Reserved for future compatibility */
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /* Interpretation of offset for color fields: All offsets are from the =
right,
  * inside a "pixel" value, which is exactly 'bits_per_pixel' wide (mean=
s: you
@@ -359,9 +362,12 @@ struct fb_image {
 	__u32 fg_color;		/* Only used when a mono bitmap */
 	__u32 bg_color;
 	__u8  depth;		/* Depth of the image */
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+	__uapi_arch_pad_long;
 	const char *data;	/* Pointer to image data */
 	struct fb_cmap cmap;	/* color map info */
-};
+} __uapi_arch_align;
=20
 /*
  * hardware cursor control
@@ -383,10 +389,12 @@ struct fb_cursor {
 	__u16 set;		/* what to set */
 	__u16 enable;		/* cursor on/off */
 	__u16 rop;		/* bitop operation */
+	__uapi_arch_pad16;
 	const char *mask;	/* cursor mask bits */
 	struct fbcurpos hot;	/* cursor hot spot */
+	__uapi_arch_pad_long;
 	struct fb_image	image;	/* Cursor image */
-};
+} __uapi_arch_align;
=20
 /* Settings for the generic backlight code */
 #define FB_BACKLIGHT_LEVELS	128
diff --git a/include/uapi/linux/fd.h b/include/uapi/linux/fd.h
index 7022e3413dbc..76dc5066dc41 100644
--- a/include/uapi/linux/fd.h
+++ b/include/uapi/linux/fd.h
@@ -4,6 +4,7 @@
=20
 #include <linux/ioctl.h>
 #include <linux/compiler.h>
+#include <linux/types.h>
=20
 /* New file layout: Now the ioctl definitions immediately follow the
  * definitions of the structures that they use */
@@ -126,6 +127,9 @@ typedef char floppy_drive_name[16];
  */
 struct floppy_drive_params {
 	signed char cmos;		/* CMOS type */
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+	__uapi_arch_pad_long;
=20
 	/* Spec2 is (HLD<<1 | ND), where HLD is head load time (1=3D2ms, 2=3D4=
 ms
 	 * etc) and ND is set means no DMA. Hardcoded to 6 (HLD=3D6ms, use DMA=
).
@@ -144,11 +148,14 @@ struct floppy_drive_params {
 	unsigned char select_delay;	/* delay to wait after select */
 	unsigned char rps;		/* rotations per second */
 	unsigned char tracks;		/* maximum number of tracks */
+	__uapi_arch_pad_long;
 	unsigned long timeout;		/* timeout for interrupt requests */
=20
 	unsigned char interleave_sect;	/* if there are more sectors, use
 					 * interleave */
=20
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	struct floppy_max_errors max_errors;
=20
 	char flags;			/* various flags, including ftd_msg */
@@ -176,11 +183,13 @@ struct floppy_drive_params {
 #define FD_AUTODETECT_SIZE 8
=20
 	short autodetect[FD_AUTODETECT_SIZE]; /* autodetected formats */
+	__uapi_arch_pad16;
=20
 	int checkfreq; /* how often should the drive be checked for disk
 			* changes */
 	int native_format; /* native format of this drive */
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 enum {
 	FD_NEED_TWADDLE_BIT,	/* more magic */
@@ -234,7 +243,8 @@ struct floppy_drive_struct {
=20
 	char *dmabuf;
 	int bufblocks;
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 #define FDGETDRVSTAT _IOR(2, 0x12, struct floppy_drive_struct)
 #define FDPOLLDRVSTAT _IOR(2, 0x13, struct floppy_drive_struct)
@@ -261,12 +271,16 @@ struct floppy_fdc_state {
 	int dtr;
 	unsigned char version;	/* FDC version code */
 	unsigned char dor;
+	__uapi_arch_pad16;
 	unsigned long address;	/* io address */
 	unsigned int rawcmd:2;
 	unsigned int reset:1;
 	unsigned int need_configure:1;
 	unsigned int perp_mode:2;
 	unsigned int has_fifo:1;
+	unsigned int :1;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	unsigned int driver_version;	/* version code for floppy driver */
 #define FD_DRIVER_VERSION 0x100
 /* user programs using the floppy API should use floppy_fdc_state to
@@ -284,8 +298,8 @@ struct floppy_fdc_state {
 	 * disagreement, it will be possible to reset the FDC without
 	 * incurring the expensive cost of repositioning all heads.
 	 * Right now, these positions are hard wired to 0. */
-
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 #define FDGETFDCSTAT _IOR(2, 0x15, struct floppy_fdc_state)
=20
@@ -306,8 +320,10 @@ struct floppy_write_errors {
 				     * encountered */
=20
 	/* position of first and last write errors */
+	__uapi_arch_pad_long;
 	unsigned long first_error_sector;
 	int           first_error_generation;
+	__uapi_arch_pad_long;
 	unsigned long last_error_sector;
 	int           last_error_generation;
=20
@@ -351,6 +367,7 @@ struct floppy_raw_cmd {
 #define FD_RAW_FAILURE 0x10000 /* command sent to fdc, fdc returned err=
or */
 #define FD_RAW_HARDFAILURE 0x20000 /* fdc had to be reset, or timed out=
 */
=20
+	__uapi_arch_pad_long;
 	void __user *data;
 	char *kernel_data; /* location of data buffer in the kernel */
 	struct floppy_raw_cmd *next; /* used for chaining of raw cmd's
@@ -379,12 +396,13 @@ struct floppy_raw_cmd {
 		};
 		unsigned char fullcmd[FD_RAW_CMD_FULLSIZE];
 	};
+	__uapi_arch_pad8;
 	int track;
 	int resultcode;
=20
 	int reserved1;
 	int reserved2;
-};
+} __uapi_arch_align;
=20
 #define FDRAWCMD _IO(2, 0x58)
 /* send a raw command to the fdc. Structure size not included, because =
of
diff --git a/include/uapi/linux/filter.h b/include/uapi/linux/filter.h
index 13f5b65a888f..be5013d2b20a 100644
--- a/include/uapi/linux/filter.h
+++ b/include/uapi/linux/filter.h
@@ -30,8 +30,10 @@ struct sock_filter {	/* Filter block */
=20
 struct sock_fprog {	/* Required for SO_ATTACH_FILTER. */
 	unsigned short		len;	/* Number of filter blocks */
+	__uapi_arch_pad16;
+	__uapi_arch_pad_long;
 	struct sock_filter __user *filter;
-};
+} __uapi_arch_align;
=20
 /* ret - BPF_K and BPF_X also apply */
 #define BPF_RVAL(code)  ((code) & 0x18)
diff --git a/include/uapi/linux/firewire-cdev.h b/include/uapi/linux/fir=
ewire-cdev.h
index 05e3aa8fa8bc..147c449a0732 100644
--- a/include/uapi/linux/firewire-cdev.h
+++ b/include/uapi/linux/firewire-cdev.h
@@ -67,7 +67,8 @@
 struct fw_cdev_event_common {
 	__u64 closure;
 	__u32 type;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /**
  * struct fw_cdev_event_bus_reset - Sent when a bus reset occurred
@@ -97,7 +98,8 @@ struct fw_cdev_event_bus_reset {
 	__u32 irm_node_id;
 	__u32 root_node_id;
 	__u32 generation;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /**
  * struct fw_cdev_event_response - Sent when a response packet was rece=
ived
@@ -117,8 +119,11 @@ struct fw_cdev_event_response {
 	__u32 type;
 	__u32 rcode;
 	__u32 length;
-	__u32 data[];
-};
+	union {
+		__uapi_arch_pad32;
+		__DECLARE_FLEX_ARRAY(__u32, data);
+	} __uapi_arch_align;
+} __uapi_arch_align;
=20
 /**
  * struct fw_cdev_event_response2 - Sent when a response packet was rec=
eived
@@ -347,7 +352,10 @@ struct fw_cdev_event_iso_interrupt {
 	__u32 type;
 	__u32 cycle;
 	__u32 header_length;
-	__u32 header[];
+	union {
+		__uapi_arch_pad32;
+		__DECLARE_FLEX_ARRAY(__u32, header);
+	};
 };
=20
 /**
@@ -435,8 +443,11 @@ struct fw_cdev_event_phy_packet {
 	__u32 type;
 	__u32 rcode;
 	__u32 length;
-	__u32 data[];
-};
+	union {
+		__uapi_arch_pad32;
+		__DECLARE_FLEX_ARRAY(__u32, data);
+	};
+} __uapi_arch_align;
=20
 /**
  * struct fw_cdev_event_phy_packet2 - A PHY packet was transmitted or r=
eceived with time stamp.
@@ -626,7 +637,8 @@ struct fw_cdev_get_info {
 	__u64 bus_reset;
 	__u64 bus_reset_closure;
 	__u32 card;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /**
  * struct fw_cdev_send_request - Send an asynchronous request packet
@@ -650,7 +662,8 @@ struct fw_cdev_send_request {
 	__u64 closure;
 	__u64 data;
 	__u32 generation;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /**
  * struct fw_cdev_send_response - Send an asynchronous response packet
@@ -670,7 +683,8 @@ struct fw_cdev_send_response {
 	__u32 length;
 	__u64 data;
 	__u32 handle;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /**
  * struct fw_cdev_allocate - Allocate a CSR in an address range
@@ -841,7 +855,8 @@ struct fw_cdev_create_iso_context {
 	__u32 speed;
 	__u64 closure;
 	__u32 handle;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /**
  * struct fw_cdev_set_iso_channels - Select channels in multichannel re=
ception
@@ -857,7 +872,8 @@ struct fw_cdev_create_iso_context {
 struct fw_cdev_set_iso_channels {
 	__u64 channels;
 	__u32 handle;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 #define FW_CDEV_ISO_PAYLOAD_LENGTH(v)	(v)
 #define FW_CDEV_ISO_INTERRUPT		(1 << 16)
@@ -1034,7 +1050,8 @@ struct fw_cdev_flush_iso {
 struct fw_cdev_get_cycle_timer {
 	__u64 local_time;
 	__u32 cycle_timer;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /**
  * struct fw_cdev_get_cycle_timer2 - read cycle timer register
@@ -1060,7 +1077,8 @@ struct fw_cdev_get_cycle_timer2 {
 	__s32 tv_nsec;
 	__s32 clk_id;
 	__u32 cycle_timer;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /**
  * struct fw_cdev_allocate_iso_resource - (De)allocate a channel or ban=
dwidth
@@ -1159,7 +1177,8 @@ struct fw_cdev_send_phy_packet {
 	__u64 closure;
 	__u32 data[2];
 	__u32 generation;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /**
  * struct fw_cdev_receive_phy_packets - start reception of PHY packets
diff --git a/include/uapi/linux/fsi.h b/include/uapi/linux/fsi.h
index a2e730fc6309..fbb9a62311b5 100644
--- a/include/uapi/linux/fsi.h
+++ b/include/uapi/linux/fsi.h
@@ -40,7 +40,8 @@ struct scom_access {
 #define SCOM_PIB_PARITY_ERR	6	/* Parity error on the PIB bus */
 #define SCOM_PIB_TIMEOUT	7	/* Bus timeout */
 	__u8	pad;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /* Flags for SCOM check */
 #define SCOM_CHECK_SUPPORTED	0x00000001	/* Interface supported */
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index c13e1f9a2f12..a35d908ccb3e 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -245,9 +245,9 @@
 #ifndef _LINUX_FUSE_H
 #define _LINUX_FUSE_H
=20
-#ifdef __KERNEL__
 #include <linux/types.h>
-#else
+
+#ifndef __KERNEL__
 #include <stdint.h>
 #endif
=20
diff --git a/include/uapi/linux/gen_stats.h b/include/uapi/linux/gen_sta=
ts.h
index 852f234f1fd6..9a188bd12454 100644
--- a/include/uapi/linux/gen_stats.h
+++ b/include/uapi/linux/gen_stats.h
@@ -26,7 +26,8 @@ enum {
 struct gnet_stats_basic {
 	__u64	bytes;
 	__u32	packets;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /**
  * struct gnet_stats_rate_est - rate estimator
diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index f7cb8ae87df7..d7634da7a2c2 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -500,7 +500,8 @@ struct gpioevent_request {
 struct gpioevent_data {
 	__u64 timestamp;
 	__u32 id;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /*
  * v1 and v2 ioctl()s
diff --git a/include/uapi/linux/hdlc/ioctl.h b/include/uapi/linux/hdlc/i=
octl.h
index b06341acab5e..f3fa809b6939 100644
--- a/include/uapi/linux/hdlc/ioctl.h
+++ b/include/uapi/linux/hdlc/ioctl.h
@@ -2,6 +2,7 @@
 #ifndef __HDLC_IOCTL_H__
 #define __HDLC_IOCTL_H__
=20
+#include <linux/types.h>
=20
 #define GENERIC_HDLC_VERSION 4	/* For synchronization with sethdlc util=
ity */
=20
@@ -41,14 +42,16 @@ typedef struct {
 	unsigned int clock_rate; /* bits per second */
 	unsigned int clock_type; /* internal, external, TX-internal etc. */
 	unsigned short loopback;
-} sync_serial_settings;          /* V.35, V.24, X.21 */
+	__uapi_arch_pad16;
+} __uapi_arch_align sync_serial_settings; /* V.35, V.24, X.21 */
=20
 typedef struct {
 	unsigned int clock_rate; /* bits per second */
 	unsigned int clock_type; /* internal, external, TX-internal etc. */
 	unsigned short loopback;
+	__uapi_arch_pad16;
 	unsigned int slot_map;
-} te1_settings;                  /* T1, E1 */
+} __uapi_arch_align te1_settings;     /* T1, E1 */
=20
 typedef struct {
 	unsigned short encoding;
@@ -71,7 +74,7 @@ typedef struct {
=20
 typedef struct {
 	unsigned int dlci;
-	char master[IFNAMSIZ];	/* Name of master FRAD device */
+	char master[16];	/* Name of master FRAD device */
 }fr_proto_pvc_info;		/* for returning PVC information only */
=20
 typedef struct {
@@ -81,12 +84,13 @@ typedef struct {
=20
 typedef struct {
 	unsigned short dce; /* 1 for DCE (network side) operation */
+	__uapi_arch_pad16;
 	unsigned int modulo; /* modulo (8 =3D basic / 128 =3D extended) */
 	unsigned int window; /* frame window size */
 	unsigned int t1; /* timeout t1 */
 	unsigned int t2; /* timeout t2 */
 	unsigned int n2; /* frame retry counter */
-} x25_hdlc_proto;
+} __uapi_arch_align x25_hdlc_proto;
=20
 /* PPP doesn't need any info now - supply length =3D 0 to ioctl */
=20
diff --git a/include/uapi/linux/hdlcdrv.h b/include/uapi/linux/hdlcdrv.h
index 9fe9499403a6..36e2b1e97f20 100644
--- a/include/uapi/linux/hdlcdrv.h
+++ b/include/uapi/linux/hdlcdrv.h
@@ -8,6 +8,8 @@
 #ifndef _UAPI_HDLCDRV_H
 #define _UAPI_HDLCDRV_H
=20
+#include <linux/types.h>
+
 /* --------------------------------------------------------------------=
 */
 /*
  * structs for the IOCTL commands
@@ -42,14 +44,16 @@ struct hdlcdrv_channel_state {
  	int ptt;
  	int dcd;
  	int ptt_keyed;
+	__uapi_arch_pad_long;
  	unsigned long tx_packets;
  	unsigned long tx_errors;
  	unsigned long rx_packets;
  	unsigned long rx_errors;
-};
+} __uapi_arch_align;
=20
 struct hdlcdrv_ioctl {
 	int cmd;
+	__uapi_arch_pad_long;
 	union {
 		struct hdlcdrv_params mp;
 		struct hdlcdrv_channel_params cp;
@@ -60,7 +64,7 @@ struct hdlcdrv_ioctl {
 		char modename[128];
 		char drivername[32];
 	} data;
-};
+} __uapi_arch_align;
=20
 /* --------------------------------------------------------------------=
 */
=20
diff --git a/include/uapi/linux/hdreg.h b/include/uapi/linux/hdreg.h
index aeee62ebf83c..b7cf0fd1fa5e 100644
--- a/include/uapi/linux/hdreg.h
+++ b/include/uapi/linux/hdreg.h
@@ -54,8 +54,9 @@ typedef union ide_reg_valid_s {
 		unsigned hcyl_hob		: 1;
 		unsigned select_hob		: 1;
 		unsigned control_hob		: 1;
-	} b;
-} ide_reg_valid_t;
+		__uapi_arch_pad16; /* padding to sizeof(unsigned) */
+	} b __uapi_arch_align;
+} __uapi_arch_align ide_reg_valid_t;
=20
 typedef struct ide_task_request_s {
 	__u8		io_ports[8];
@@ -325,8 +326,9 @@ struct hd_geometry {
       unsigned char heads;
       unsigned char sectors;
       unsigned short cylinders;
+	__uapi_arch_pad_long;
       unsigned long start;
-};
+} __uapi_arch_align;
=20
 /* hd/ide ctl's that pass (arg) ptrs to user space are numbered 0x030n/=
0x031n */
 #define HDIO_GETGEO		0x0301	/* get device geometry */
diff --git a/include/uapi/linux/hiddev.h b/include/uapi/linux/hiddev.h
index 53d6cad7a999..c72bb5156347 100644
--- a/include/uapi/linux/hiddev.h
+++ b/include/uapi/linux/hiddev.h
@@ -47,8 +47,9 @@ struct hiddev_devinfo {
 	__s16 vendor;
 	__s16 product;
 	__s16 version;
+	__uapi_arch_pad16;
 	__u32 num_applications;
-};
+} __uapi_arch_align;
=20
 struct hiddev_collection_info {
 	__u32 index;
diff --git a/include/uapi/linux/hpet.h b/include/uapi/linux/hpet.h
index 30e535644b43..5f875627690e 100644
--- a/include/uapi/linux/hpet.h
+++ b/include/uapi/linux/hpet.h
@@ -3,14 +3,15 @@
 #define _UAPI__HPET__
=20
 #include <linux/compiler.h>
-
+#include <linux/types.h>
=20
 struct hpet_info {
 	unsigned long hi_ireqfreq;	/* Hz */
 	unsigned long hi_flags;	/* information */
 	unsigned short hi_hpet;
 	unsigned short hi_timer;
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 #define HPET_INFO_PERIODIC	0x0010	/* periodic-capable comparator */
=20
diff --git a/include/uapi/linux/hyperv.h b/include/uapi/linux/hyperv.h
index aaa502a7bff4..476cb2b49aa0 100644
--- a/include/uapi/linux/hyperv.h
+++ b/include/uapi/linux/hyperv.h
@@ -399,7 +399,16 @@ struct hv_kvp_msg {
 		struct hv_kvp_msg_enumerate	kvp_enum_data;
 		struct hv_kvp_ipaddr_value      kvp_ip_val;
 		struct hv_kvp_register		kvp_register;
-	} body;
+		/*
+		 * hv_kvp_register is 7426 bytes, but union has 4-byte alignment
+		 * because of hv_kvp_msg_delete member alignment.
+		 * Add a member to fix the correct size.
+		 */
+		struct {
+			char			__pad[7426];
+			__uapi_arch_pad16;
+		} __uapi_arch_align;
+	} __uapi_arch_align body;
 } __attribute__((packed));
=20
 struct hv_kvp_ip_msg {
diff --git a/include/uapi/linux/i2c-dev.h b/include/uapi/linux/i2c-dev.h
index 1c4cec4ddd84..c0373980e41b 100644
--- a/include/uapi/linux/i2c-dev.h
+++ b/include/uapi/linux/i2c-dev.h
@@ -42,14 +42,16 @@
 struct i2c_smbus_ioctl_data {
 	__u8 read_write;
 	__u8 command;
+	__uapi_arch_pad16;
 	__u32 size;
 	union i2c_smbus_data __user *data;
-};
+} __uapi_arch_align;
=20
 /* This is the structure as used in the I2C_RDWR ioctl call */
 struct i2c_rdwr_ioctl_data {
 	struct i2c_msg __user *msgs;	/* pointers to i2c_msgs */
 	__u32 nmsgs;			/* number of i2c_msgs */
+	__uapi_arch_pad_long;
 };
=20
 #define  I2C_RDWR_IOCTL_MAX_MSGS	42
diff --git a/include/uapi/linux/i2c.h b/include/uapi/linux/i2c.h
index 2a226657d9f8..8c711c08896e 100644
--- a/include/uapi/linux/i2c.h
+++ b/include/uapi/linux/i2c.h
@@ -84,8 +84,9 @@ struct i2c_msg {
 #define I2C_M_NOSTART		0x4000	/* use only if I2C_FUNC_NOSTART */
 #define I2C_M_STOP		0x8000	/* use only if I2C_FUNC_PROTOCOL_MANGLING */
 	__u16 len;
+	__uapi_arch_pad16;
 	__u8 *buf;
-};
+} __uapi_arch_align;
=20
 /* To determine what functionality is present */
=20
diff --git a/include/uapi/linux/i2o-dev.h b/include/uapi/linux/i2o-dev.h
index b1cd407c47d5..23151c254640 100644
--- a/include/uapi/linux/i2o-dev.h
+++ b/include/uapi/linux/i2o-dev.h
@@ -53,44 +53,51 @@ struct i2o_cmd_passthru32 {
=20
 struct i2o_cmd_passthru {
 	unsigned int iop;	/* IOP unit number */
+	__uapi_arch_pad_long;
 	void __user *msg;	/* message */
-};
+} __uapi_arch_align;
=20
 struct i2o_cmd_hrtlct {
 	unsigned int iop;	/* IOP unit number */
+	__uapi_arch_pad_long;
 	void __user *resbuf;	/* Buffer for result */
 	unsigned int __user *reslen;	/* Buffer length in bytes */
-};
+} __uapi_arch_align;
=20
 struct i2o_cmd_psetget {
 	unsigned int iop;	/* IOP unit number */
 	unsigned int tid;	/* Target device TID */
 	void __user *opbuf;	/* Operation List buffer */
 	unsigned int oplen;	/* Operation List buffer length in bytes */
+	__uapi_arch_pad_long;
 	void __user *resbuf;	/* Result List buffer */
 	unsigned int __user *reslen;	/* Result List buffer length in bytes */
-};
+} __uapi_arch_align;
=20
 struct i2o_sw_xfer {
 	unsigned int iop;	/* IOP unit number */
 	unsigned char flags;	/* Flags field */
 	unsigned char sw_type;	/* Software type */
+	__uapi_arch_pad16;
 	unsigned int sw_id;	/* Software ID */
+	__uapi_arch_pad_long;
 	void __user *buf;	/* Pointer to software buffer */
 	unsigned int __user *swlen;	/* Length of software data */
 	unsigned int __user *maxfrag;	/* Maximum fragment count */
 	unsigned int __user *curfrag;	/* Current fragment count */
-};
+} __uapi_arch_align;
=20
 struct i2o_html {
 	unsigned int iop;	/* IOP unit number */
 	unsigned int tid;	/* Target device ID */
 	unsigned int page;	/* HTML page */
+	__uapi_arch_pad_long;
 	void __user *resbuf;	/* Buffer for reply HTML page */
 	unsigned int __user *reslen;	/* Length in bytes of reply buffer */
 	void __user *qbuf;	/* Pointer to HTTP query string */
 	unsigned int qlen;	/* Length in bytes of query string buffer */
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 #define I2O_EVT_Q_LEN 32
=20
diff --git a/include/uapi/linux/idxd.h b/include/uapi/linux/idxd.h
index 3d1987e1bb2d..24a1b824a980 100644
--- a/include/uapi/linux/idxd.h
+++ b/include/uapi/linux/idxd.h
@@ -3,9 +3,9 @@
 #ifndef _USR_IDXD_H_
 #define _USR_IDXD_H_
=20
-#ifdef __KERNEL__
 #include <linux/types.h>
-#else
+
+#ifndef __KERNEL__
 #include <stdint.h>
 #endif
=20
@@ -211,6 +211,9 @@ struct dsa_hw_desc {
 			uint32_t	max_delta_size;
 			uint32_t 	delt_rsvd;
 			uint8_t 	expected_res_mask;
+			__uapi_arch_pad8;
+			__uapi_arch_pad16;
+			__uapi_arch_pad32;
 		};
 		uint32_t	delta_rec_size;
 		uint64_t	dest2;
@@ -261,7 +264,8 @@ struct dsa_hw_desc {
 		struct {
 			uint64_t	transl_fetch_res;
 			uint32_t	region_stride;
-		};
+			__uapi_arch_pad32;
+		} __uapi_arch_align;
=20
 		/* DIX generate */
 		struct {
diff --git a/include/uapi/linux/if.h b/include/uapi/linux/if.h
index 797ba2c1562a..1c13f4ba8831 100644
--- a/include/uapi/linux/if.h
+++ b/include/uapi/linux/if.h
@@ -200,8 +200,10 @@ struct ifmap {
 	unsigned char irq;
 	unsigned char dma;
 	unsigned char port;
-	/* 3 bytes spare */
-};
+	/* 3 bytes spare: */
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
 #endif /* __UAPI_DEF_IF_IFMAP */
=20
 struct if_settings {
@@ -285,11 +287,12 @@ struct ifreq {
 #if __UAPI_DEF_IF_IFCONF
 struct ifconf  {
 	int	ifc_len;			/* size of buffer	*/
+	__uapi_arch_pad_long;
 	union {
 		char __user *ifcu_buf;
 		struct ifreq __user *ifcu_req;
 	} ifc_ifcu;
-};
+} __uapi_arch_align;
 #endif /* __UAPI_DEF_IF_IFCONF */
=20
 #define	ifc_buf	ifc_ifcu.ifcu_buf		/* buffer address	*/
diff --git a/include/uapi/linux/if_arcnet.h b/include/uapi/linux/if_arcn=
et.h
index 473569eaf692..ff304042438a 100644
--- a/include/uapi/linux/if_arcnet.h
+++ b/include/uapi/linux/if_arcnet.h
@@ -123,6 +123,7 @@ struct archdr {
 		struct arc_rfc1051   rfc1051;
 		struct arc_eth_encap eth_encap;
 		struct arc_cap       cap;
+		__u8 __pad[16];
 		__u8 raw[0];	/* 508 bytes				*/
 	} soft;
 };
diff --git a/include/uapi/linux/if_bonding.h b/include/uapi/linux/if_bon=
ding.h
index 3bcc03f3aa4f..a28d75d485ea 100644
--- a/include/uapi/linux/if_bonding.h
+++ b/include/uapi/linux/if_bonding.h
@@ -117,8 +117,9 @@ typedef struct ifslave {
 	char slave_name[IFNAMSIZ];
 	__s8 link;
 	__s8 state;
+	__uapi_arch_pad16;
 	__u32  link_failure_count;
-} ifslave;
+} ifslave __uapi_arch_align;
=20
 struct ad_info {
 	__u16 aggregator_id;
diff --git a/include/uapi/linux/if_bridge.h b/include/uapi/linux/if_brid=
ge.h
index e52f8207ab27..c99486a62ec3 100644
--- a/include/uapi/linux/if_bridge.h
+++ b/include/uapi/linux/if_bridge.h
@@ -88,7 +88,8 @@ struct __port_info {
 	__u32 message_age_timer_value;
 	__u32 forward_delay_timer_value;
 	__u32 hold_timer_value;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 struct __fdb_entry {
 	__u8 mac_addr[ETH_ALEN];
@@ -291,7 +292,8 @@ struct br_mrp_instance {
 	__u32 p_ifindex;
 	__u32 s_ifindex;
 	__u16 prio;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 struct br_mrp_ring_state {
 	__u32 ring_id;
@@ -314,21 +316,24 @@ struct br_mrp_start_test {
 struct br_mrp_in_state {
 	__u32 in_state;
 	__u16 in_id;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 struct br_mrp_in_role {
 	__u32 ring_id;
 	__u32 in_role;
 	__u32 i_ifindex;
 	__u16 in_id;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 struct br_mrp_start_in_test {
 	__u32 interval;
 	__u32 max_miss;
 	__u32 period;
 	__u16 in_id;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 enum {
 	IFLA_BRIDGE_CFM_UNSPEC,
@@ -691,8 +696,10 @@ enum {
=20
 struct br_port_msg {
 	__u8  family;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	__u32 ifindex;
-};
+} __uapi_arch_align;
=20
 struct br_mdb_entry {
 	__u32 ifindex;
@@ -713,8 +720,9 @@ struct br_mdb_entry {
 			unsigned char mac_addr[ETH_ALEN];
 		} u;
 		__be16		proto;
-	} addr;
-};
+		__uapi_arch_pad16;
+	} addr __uapi_arch_align;
+} __uapi_arch_align;
=20
 enum {
 	MDBA_SET_ENTRY_UNSPEC,
diff --git a/include/uapi/linux/if_link.h b/include/uapi/linux/if_link.h
index 3b491d96e52e..2a7c325a6827 100644
--- a/include/uapi/linux/if_link.h
+++ b/include/uapi/linux/if_link.h
@@ -273,7 +273,8 @@ struct rtnl_link_ifmap {
 	__u16	irq;
 	__u8	dma;
 	__u8	port;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /*
  * IFLA_AF_SPEC
@@ -1633,7 +1634,8 @@ struct ifla_vf_vlan_info {
 	__u32 vlan; /* 0 - 4095, 0 disables VLAN filter */
 	__u32 qos;
 	__be16 vlan_proto; /* VLAN protocol either 802.1Q or 802.1ad */
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 struct ifla_vf_tx_rate {
 	__u32 vf;
@@ -1653,8 +1655,9 @@ struct ifla_vf_spoofchk {
=20
 struct ifla_vf_guid {
 	__u32 vf;
+	__uapi_arch_pad32;
 	__u64 guid;
-};
+} __uapi_arch_align;
=20
 enum {
 	IFLA_VF_LINK_STATE_AUTO,	/* link state of the uplink */
diff --git a/include/uapi/linux/if_packet.h b/include/uapi/linux/if_pack=
et.h
index 6cd1d7a41dfb..0687974d94c9 100644
--- a/include/uapi/linux/if_packet.h
+++ b/include/uapi/linux/if_packet.h
@@ -140,7 +140,8 @@ struct tpacket_hdr {
 	unsigned short	tp_net;
 	unsigned int	tp_sec;
 	unsigned int	tp_usec;
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 #define TPACKET_ALIGNMENT	16
 #define TPACKET_ALIGN(x)	(((x)+TPACKET_ALIGNMENT-1)&~(TPACKET_ALIGNMENT=
-1))
diff --git a/include/uapi/linux/if_plip.h b/include/uapi/linux/if_plip.h
index 054d86a9c6e6..f179d4fd6609 100644
--- a/include/uapi/linux/if_plip.h
+++ b/include/uapi/linux/if_plip.h
@@ -13,14 +13,17 @@
 #define _UAPI_LINUX_IF_PLIP_H
=20
 #include <linux/sockios.h>
+#include <linux/types.h>
=20
 #define	SIOCDEVPLIP	SIOCDEVPRIVATE
=20
 struct plipconf {
 	unsigned short pcmd;
+	__uapi_arch_pad16;
+	__uapi_arch_pad_long;
 	unsigned long  nibble;
 	unsigned long  trigger;
-};
+} __uapi_arch_align;
=20
 #define PLIP_GET_TIMEOUT	0x1
 #define PLIP_SET_TIMEOUT	0x2
diff --git a/include/uapi/linux/if_pppox.h b/include/uapi/linux/if_pppox=
.h
index 23a8391391d1..1a685334328f 100644
--- a/include/uapi/linux/if_pppox.h
+++ b/include/uapi/linux/if_pppox.h
@@ -51,8 +51,9 @@ struct pppoe_addr {
  */
 struct pptp_addr {
 	__u16		call_id;
+	__uapi_arch_pad16;
 	struct in_addr	sin_addr;
-};
+} __uapi_arch_align;
=20
 /**********************************************************************=
**
  * Protocols supported by AF_PPPOX
diff --git a/include/uapi/linux/if_vlan.h b/include/uapi/linux/if_vlan.h
index 90a2c89afc8f..6dec9d332263 100644
--- a/include/uapi/linux/if_vlan.h
+++ b/include/uapi/linux/if_vlan.h
@@ -14,6 +14,7 @@
 #ifndef _UAPI_LINUX_IF_VLAN_H_
 #define _UAPI_LINUX_IF_VLAN_H_
=20
+#include <linux/types.h>
=20
 /* VLAN IOCTLs are found in sockios.h */
=20
@@ -61,6 +62,7 @@ struct vlan_ioctl_args {
         } u;
=20
 	short vlan_qos;  =20
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 #endif /* _UAPI_LINUX_IF_VLAN_H_ */
diff --git a/include/uapi/linux/if_xdp.h b/include/uapi/linux/if_xdp.h
index 23a062781468..9292f1de1fa4 100644
--- a/include/uapi/linux/if_xdp.h
+++ b/include/uapi/linux/if_xdp.h
@@ -150,10 +150,12 @@ struct xsk_tx_metadata {
 			/* Offset from csum_start where checksum should be stored. */
 			__u16 csum_offset;
=20
+			__uapi_arch_pad32;
+
 			/* XDP_TXMD_FLAGS_LAUNCH_TIME */
 			/* Launch time in nanosecond against the PTP HW Clock */
 			__u64 launch_time;
-		} request;
+		} __uapi_arch_align request;
=20
 		struct {
 			/* XDP_TXMD_FLAGS_TIMESTAMP */
diff --git a/include/uapi/linux/in.h b/include/uapi/linux/in.h
index ced0fc3c3aa5..8f99eb027d77 100644
--- a/include/uapi/linux/in.h
+++ b/include/uapi/linux/in.h
@@ -213,31 +213,35 @@ struct ip_msfilter {
=20
 struct group_req {
 	__u32				 gr_interface;	/* interface index */
+	__uapi_arch_pad_long;
 	struct __kernel_sockaddr_storage gr_group;	/* group address */
-};
+} __uapi_arch_align;
=20
 struct group_source_req {
 	__u32				 gsr_interface;	/* interface index */
+	__uapi_arch_pad_long;
 	struct __kernel_sockaddr_storage gsr_group;	/* group address */
 	struct __kernel_sockaddr_storage gsr_source;	/* source address */
-};
+} __uapi_arch_align;
=20
 struct group_filter {
 	union {
 		struct {
 			__u32				 gf_interface_aux; /* interface index */
+			__uapi_arch_pad_long;
 			struct __kernel_sockaddr_storage gf_group_aux;	   /* multicast addre=
ss */
 			__u32				 gf_fmode_aux;	   /* filter mode */
 			__u32				 gf_numsrc_aux;	   /* number of sources */
 			struct __kernel_sockaddr_storage gf_slist[1];	   /* interface index =
*/
-		};
+		} __uapi_arch_align;
 		struct {
 			__u32				 gf_interface;	  /* interface index */
+			__uapi_arch_pad_long;
 			struct __kernel_sockaddr_storage gf_group;	  /* multicast address */
 			__u32				 gf_fmode;	  /* filter mode */
 			__u32				 gf_numsrc;	  /* number of sources */
 			struct __kernel_sockaddr_storage gf_slist_flex[]; /* interface index=
 */
-		};
+		} __uapi_arch_align;
 	};
 };
=20
diff --git a/include/uapi/linux/inet_diag.h b/include/uapi/linux/inet_di=
ag.h
index 86bb2e8b17c9..99de2dbe6d25 100644
--- a/include/uapi/linux/inet_diag.h
+++ b/include/uapi/linux/inet_diag.h
@@ -103,9 +103,10 @@ enum {
 struct inet_diag_hostcond {
 	__u8	family;
 	__u8	prefix_len;
+	__uapi_arch_pad16;
 	int	port;
 	__be32	addr[];
-};
+} __uapi_arch_align;
=20
 struct inet_diag_markcond {
 	__u32 mark;
diff --git a/include/uapi/linux/input.h b/include/uapi/linux/input.h
index 6aa703fcfcfb..b597b3d74ec1 100644
--- a/include/uapi/linux/input.h
+++ b/include/uapi/linux/input.h
@@ -412,9 +412,10 @@ struct ff_periodic_effect {
=20
 	struct ff_envelope envelope;
=20
+	__uapi_arch_pad16;
 	__u32 custom_len;
 	__s16 __user *custom_data;
-};
+} __uapi_arch_align;
=20
 /**
  * struct ff_rumble_effect - defines parameters of a periodic force-fee=
dback effect
@@ -442,6 +443,7 @@ struct ff_haptic_effect {
 	__u16 hid_usage;
 	__u16 vendor_id;
 	__u8  vendor_waveform_page;
+	__u8 :8;
 	__u16 intensity;
 	__u16 repeat_count;
 	__u16 retrigger_period;
@@ -477,6 +479,7 @@ struct ff_effect {
 	struct ff_trigger trigger;
 	struct ff_replay replay;
=20
+	__uapi_arch_pad16;
 	union {
 		struct ff_constant_effect constant;
 		struct ff_ramp_effect ramp;
@@ -485,7 +488,7 @@ struct ff_effect {
 		struct ff_rumble_effect rumble;
 		struct ff_haptic_effect haptic;
 	} u;
-};
+} __uapi_arch_align;
=20
 /*
  * Force feedback effect types
diff --git a/include/uapi/linux/ip6_tunnel.h b/include/uapi/linux/ip6_tu=
nnel.h
index 85182a839d42..a4f67d6fd4b7 100644
--- a/include/uapi/linux/ip6_tunnel.h
+++ b/include/uapi/linux/ip6_tunnel.h
@@ -30,11 +30,12 @@ struct ip6_tnl_parm {
 	__u8 proto;		/* tunnel protocol */
 	__u8 encap_limit;	/* encapsulation limit for tunnel */
 	__u8 hop_limit;		/* hop limit for tunnel */
+	__uapi_arch_pad8;
 	__be32 flowinfo;	/* traffic class and flowlabel for tunnel */
 	__u32 flags;		/* tunnel flags */
 	struct in6_addr laddr;	/* local tunnel end-point address */
 	struct in6_addr raddr;	/* remote tunnel end-point address */
-};
+} __uapi_arch_align;
=20
 struct ip6_tnl_parm2 {
 	char name[IFNAMSIZ];	/* name of tunnel device */
@@ -42,6 +43,7 @@ struct ip6_tnl_parm2 {
 	__u8 proto;		/* tunnel protocol */
 	__u8 encap_limit;	/* encapsulation limit for tunnel */
 	__u8 hop_limit;		/* hop limit for tunnel */
+	__uapi_arch_pad8;
 	__be32 flowinfo;	/* traffic class and flowlabel for tunnel */
 	__u32 flags;		/* tunnel flags */
 	struct in6_addr laddr;	/* local tunnel end-point address */
@@ -51,6 +53,6 @@ struct ip6_tnl_parm2 {
 	__be16			o_flags;
 	__be32			i_key;
 	__be32			o_key;
-};
+} __uapi_arch_align;
=20
 #endif
diff --git a/include/uapi/linux/ip_vs.h b/include/uapi/linux/ip_vs.h
index 1ed234e7f251..95a750bae381 100644
--- a/include/uapi/linux/ip_vs.h
+++ b/include/uapi/linux/ip_vs.h
@@ -144,8 +144,10 @@ enum {
 struct ip_vs_service_user {
 	/* virtual service addresses */
 	__u16		protocol;
+	__uapi_arch_pad16;
 	__be32			addr;		/* virtual ip address */
 	__be16			port;
+	__uapi_arch_pad16;
 	__u32		fwmark;		/* firwall mark of service */
=20
 	/* virtual service options */
@@ -153,13 +155,14 @@ struct ip_vs_service_user {
 	unsigned int		flags;		/* virtual service flags */
 	unsigned int		timeout;	/* persistent timeout in sec */
 	__be32			netmask;	/* persistent netmask */
-};
+} __uapi_arch_align;
=20
=20
 struct ip_vs_dest_user {
 	/* destination server address */
 	__be32			addr;
 	__be16			port;
+	__uapi_arch_pad16;
=20
 	/* real server options */
 	unsigned int		conn_flags;	/* connection flags */
@@ -168,7 +171,7 @@ struct ip_vs_dest_user {
 	/* thresholds for active connections */
 	__u32		u_threshold;	/* upper threshold */
 	__u32		l_threshold;	/* lower threshold */
-};
+} __uapi_arch_align;
=20
=20
 /*
@@ -178,6 +181,7 @@ struct ip_vs_stats_user {
 	__u32                   conns;          /* connections scheduled */
 	__u32                   inpkts;         /* incoming packets */
 	__u32                   outpkts;        /* outgoing packets */
+	__uapi_arch_pad32;
 	__u64                   inbytes;        /* incoming bytes */
 	__u64                   outbytes;       /* outgoing bytes */
=20
@@ -186,7 +190,8 @@ struct ip_vs_stats_user {
 	__u32			outpps;		/* current out packet rate */
 	__u32			inbps;		/* current in byte rate */
 	__u32			outbps;		/* current out byte rate */
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
=20
 /* The argument to IP_VS_SO_GET_INFO */
@@ -206,8 +211,10 @@ struct ip_vs_getinfo {
 struct ip_vs_service_entry {
 	/* which service: user fills in these */
 	__u16		protocol;
+	__uapi_arch_pad16;
 	__be32			addr;		/* virtual address */
 	__be16			port;
+	__uapi_arch_pad16;
 	__u32		fwmark;		/* firwall mark of service */
=20
 	/* service options */
@@ -221,12 +228,13 @@ struct ip_vs_service_entry {
=20
 	/* statistics */
 	struct ip_vs_stats_user stats;
-};
+} __uapi_arch_align;
=20
=20
 struct ip_vs_dest_entry {
 	__be32			addr;		/* destination address */
 	__be16			port;
+	__uapi_arch_pad16;
 	unsigned int		conn_flags;	/* connection flags */
 	int			weight;		/* destination weight */
=20
@@ -236,32 +244,37 @@ struct ip_vs_dest_entry {
 	__u32		activeconns;	/* active connections */
 	__u32		inactconns;	/* inactive connections */
 	__u32		persistconns;	/* persistent connections */
+	__uapi_arch_pad32;
=20
 	/* statistics */
 	struct ip_vs_stats_user stats;
-};
+} __uapi_arch_align;
=20
=20
 /* The argument to IP_VS_SO_GET_DESTS */
 struct ip_vs_get_dests {
 	/* which service: user fills in these */
 	__u16		protocol;
+	__uapi_arch_pad16;
 	__be32			addr;		/* virtual address */
 	__be16			port;
+	__uapi_arch_pad16;
 	__u32		fwmark;		/* firwall mark of service */
=20
 	/* number of real servers */
 	unsigned int		num_dests;
+	__uapi_arch_pad32;
=20
 	/* the real servers */
 	struct ip_vs_dest_entry	entrytable[];
-};
+} __uapi_arch_align;
=20
=20
 /* The argument to IP_VS_SO_GET_SERVICES */
 struct ip_vs_get_services {
 	/* number of virtual services */
 	unsigned int		num_services;
+	__uapi_arch_pad32;
=20
 	/* service table */
 	struct ip_vs_service_entry entrytable[];
diff --git a/include/uapi/linux/ipc.h b/include/uapi/linux/ipc.h
index 5995fc9d675e..851a205347be 100644
--- a/include/uapi/linux/ipc.h
+++ b/include/uapi/linux/ipc.h
@@ -9,14 +9,17 @@
 /* Obsolete, used only for backwards compatibility and libc5 compiles */
 struct ipc_perm
 {
-	__kernel_key_t	key;
-	__kernel_uid_t	uid;
+	__kernel_key_t	key; /* always 32 */
+	__kernel_uid_t	uid; /* 16 on arm/m68k/s390/sh/sparc/i386 */
 	__kernel_gid_t	gid;
 	__kernel_uid_t	cuid;
 	__kernel_gid_t	cgid;
-	__kernel_mode_t	mode;=20
+/* 96 or 160 */
+	__kernel_mode_t	mode; /* 16 on arm/m68k/microblaze/parisc32/s390-32/sh=
/sparc32 */
 	unsigned short	seq;
-};
+	/* hole at end of structure for 32-bit mode_t */
+	__uapi_arch_pad_mode_t;
+} __uapi_arch_align;
=20
 /* Include the definition of ipc64_perm */
 #include <asm/ipcbuf.h>
diff --git a/include/uapi/linux/ipmi.h b/include/uapi/linux/ipmi.h
index 966c3070959b..7b941e437078 100644
--- a/include/uapi/linux/ipmi.h
+++ b/include/uapi/linux/ipmi.h
@@ -17,6 +17,7 @@
=20
 #include <linux/ipmi_msgdefs.h>
 #include <linux/compiler.h>
+#include <linux/types.h>
=20
 /*
  * This file describes an interface to an IPMI driver.  You have to
@@ -54,7 +55,8 @@ struct ipmi_addr {
 	int   addr_type;
 	short channel;
 	char  data[IPMI_MAX_ADDR_SIZE];
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /*
  * When the address is not used, the type will be set to this value.
@@ -66,7 +68,8 @@ struct ipmi_system_interface_addr {
 	int           addr_type;
 	short         channel;
 	unsigned char lun;
-};
+	__uapi_arch_pad8;
+} __uapi_arch_align;
=20
 /* An IPMB Address. */
 #define IPMI_IPMB_ADDR_TYPE		0x01
@@ -92,7 +95,9 @@ struct ipmi_ipmb_direct_addr {
 	unsigned char slave_addr;
 	unsigned char rs_lun;
 	unsigned char rq_lun;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /*
  * A LAN Address.  This is an address to/from a LAN interface bridged
@@ -120,7 +125,8 @@ struct ipmi_lan_addr {
 	unsigned char remote_SWID;
 	unsigned char local_SWID;
 	unsigned char lun;
-};
+	__uapi_arch_pad8;
+} __uapi_arch_align;
=20
=20
 /*
@@ -149,15 +155,17 @@ struct ipmi_msg {
 	unsigned char  netfn;
 	unsigned char  cmd;
 	unsigned short data_len;
+	__uapi_arch_pad_long;
 	unsigned char  __user *data;
-};
+} __uapi_arch_align;
=20
 struct kernel_ipmi_msg {
 	unsigned char  netfn;
 	unsigned char  cmd;
 	unsigned short data_len;
+	__uapi_arch_pad_long;
 	unsigned char  *data;
-};
+} __uapi_arch_align;
=20
 /*
  * Various defines that are useful for IPMI applications.
@@ -247,6 +255,7 @@ struct kernel_ipmi_msg {
 struct ipmi_req {
 	unsigned char __user *addr; /* Address to send the message to. */
 	unsigned int  addr_len;
+	__uapi_arch_pad_long;
=20
 	long    msgid; /* The sequence number for the message.  This
 			  exact value will be reported back in the
@@ -255,7 +264,7 @@ struct ipmi_req {
 			  the sequence value for the response.  */
=20
 	struct ipmi_msg msg;
-};
+} __uapi_arch_align;
 /*
  * Send a message to the interfaces.  error values are:
  *   - EFAULT - an address supplied was invalid.
@@ -293,6 +302,7 @@ struct ipmi_req_settime {
 struct ipmi_recv {
 	int     recv_type; /* Is this a command, response or an
 			      asyncronous event. */
+	__uapi_arch_pad_long;
=20
 	unsigned char __user *addr;    /* Address the message was from is put
 				   here.  The caller must supply the
@@ -303,6 +313,7 @@ struct ipmi_recv {
 				   the actual message length when the
 				   message is received. */
=20
+	__uapi_arch_pad_long;
 	long    msgid; /* The sequence number specified in the request
 			  if this is a response.  If this is a command,
 			  this will be the sequence number from the
@@ -405,7 +416,8 @@ struct ipmi_cmdspec_chans {
 struct ipmi_channel_lun_address_set {
 	unsigned short channel;
 	unsigned char  value;
-};
+	__uapi_arch_pad8;
+} __uapi_arch_align;
 #define IPMICTL_SET_MY_CHANNEL_ADDRESS_CMD \
 	_IOR(IPMI_IOC_MAGIC, 24, struct ipmi_channel_lun_address_set)
 #define IPMICTL_GET_MY_CHANNEL_ADDRESS_CMD \
diff --git a/include/uapi/linux/ipmi_ssif_bmc.h b/include/uapi/linux/ipm=
i_ssif_bmc.h
index 1c6a753dad08..e8b08c9a0784 100644
--- a/include/uapi/linux/ipmi_ssif_bmc.h
+++ b/include/uapi/linux/ipmi_ssif_bmc.h
@@ -13,6 +13,7 @@
 struct ipmi_ssif_msg {
 	unsigned int len;
 	__u8    payload[IPMI_SSIF_PAYLOAD_MAX];
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 #endif /* _UAPI_LINUX_IPMI_SSIF_BMC_H */
diff --git a/include/uapi/linux/ipv6_route.h b/include/uapi/linux/ipv6_r=
oute.h
index 593800a18799..e19924c2551c 100644
--- a/include/uapi/linux/ipv6_route.h
+++ b/include/uapi/linux/ipv6_route.h
@@ -48,10 +48,11 @@ struct in6_rtmsg {
 	__u16			rtmsg_dst_len;
 	__u16			rtmsg_src_len;
 	__u32			rtmsg_metric;
+	__uapi_arch_pad_long;
 	unsigned long		rtmsg_info;
         __u32			rtmsg_flags;
 	int			rtmsg_ifindex;
-};
+} __uapi_arch_align;
=20
 #define RTMSG_NEWDEVICE		0x11
 #define RTMSG_DELDEVICE		0x12
diff --git a/include/uapi/linux/isst_if.h b/include/uapi/linux/isst_if.h
index 40aa545101a3..401133635215 100644
--- a/include/uapi/linux/isst_if.h
+++ b/include/uapi/linux/isst_if.h
@@ -160,8 +160,9 @@ struct isst_if_msr_cmd {
  */
 struct isst_if_msr_cmds {
 	__u32 cmd_count;
+	__uapi_arch_pad32;
 	struct isst_if_msr_cmd msr_cmd[1];
-};
+} __uapi_arch_align;
=20
 /**
  * struct isst_core_power - Structure to get/set core_power feature
@@ -205,7 +206,8 @@ struct isst_clos_param {
 	__u16 min_freq_mhz;
 	__u16 max_freq_mhz;
 	__u8 prop_prio;
-};
+	__uapi_arch_pad8;
+} __uapi_arch_align;
=20
 /**
  * struct isst_if_clos_assoc - Structure to assign clos to a CPU
@@ -424,10 +426,13 @@ struct isst_perf_level_cpu_mask {
 	__u8 power_domain_id;
 	__u8 level;
 	__u8 punit_cpu_map;
+	__uapi_arch_pad32;
 	__u64 mask;
 	__u16 cpu_buffer_size;
 	__s8 cpu_buffer[1];
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /**
  * struct isst_base_freq_info - Structure to get SST-BF frequencies
diff --git a/include/uapi/linux/ivtvfb.h b/include/uapi/linux/ivtvfb.h
index 9e9b072375de..8fa2a266b53d 100644
--- a/include/uapi/linux/ivtvfb.h
+++ b/include/uapi/linux/ivtvfb.h
@@ -31,7 +31,8 @@ struct ivtvfb_dma_frame {
 	void __user *source;
 	unsigned long dest_offset;
 	int count;
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 #define IVTVFB_IOC_DMA_FRAME 	_IOW('V', BASE_VIDIOC_PRIVATE+0, struct i=
vtvfb_dma_frame)
=20
diff --git a/include/uapi/linux/kcov.h b/include/uapi/linux/kcov.h
index ed95dba9fa37..350a5b25cfaf 100644
--- a/include/uapi/linux/kcov.h
+++ b/include/uapi/linux/kcov.h
@@ -12,6 +12,7 @@ struct kcov_remote_arg {
 	__u32		trace_mode;	/* KCOV_TRACE_PC or KCOV_TRACE_CMP */
 	__u32		area_size;	/* Length of coverage buffer in words */
 	__u32		num_handles;	/* Size of handles array */
+	__u32		:32;		/* pad to __aligned_u64 */
 	__aligned_u64	common_handle;
 	__aligned_u64	handles[];
 };
diff --git a/include/uapi/linux/kd.h b/include/uapi/linux/kd.h
index 6b384065c013..1b6efc94f374 100644
--- a/include/uapi/linux/kd.h
+++ b/include/uapi/linux/kd.h
@@ -14,8 +14,9 @@
 struct consolefontdesc {
 	unsigned short charcount;	/* characters in font (256 or 512) */
 	unsigned short charheight;	/* scan lines per character (1-32) */
+	__uapi_arch_pad_long;
 	char __user *chardata;		/* font data in expanded form */
-};
+} __uapi_arch_align;
=20
 #define PIO_FONTRESET   0x4B6D	/* reset to default font */
=20
@@ -65,8 +66,10 @@ struct unipair {
 };
 struct unimapdesc {
 	unsigned short entry_ct;
+	__uapi_arch_pad16;
+	__uapi_arch_pad_long;
 	struct unipair __user *entries;
-};
+} __uapi_arch_align;
 #define PIO_UNIMAP	0x4B67	/* put unicode-to-font mapping in kernel */
 #define PIO_UNIMAPCLR	0x4B68	/* clear table, possibly advise hash algor=
ithm */
 struct unimapinit {
@@ -161,18 +164,20 @@ struct console_font_op {
 	unsigned int flags;	/* KD_FONT_FLAG_* */
 	unsigned int width, height;	/* font size */
 	unsigned int charcount;
+	__uapi_arch_pad_long;
 	unsigned char __user *data;	/* font data with vpitch fixed to 32 for
 					 * KD_FONT_OP_SET/GET
 					 */
-};
+} __uapi_arch_align;
=20
 struct console_font {
 	unsigned int width, height;	/* font size */
 	unsigned int charcount;
+	__uapi_arch_pad_long;
 	unsigned char *data;	/* font data with vpitch fixed to 32 for
 				 * KD_FONT_OP_SET/GET
 				 */
-};
+} __uapi_arch_align;
=20
 #define KD_FONT_OP_SET		0	/* Set font */
 #define KD_FONT_OP_GET		1	/* Get font */
diff --git a/include/uapi/linux/keyctl.h b/include/uapi/linux/keyctl.h
index 4c8884eea808..b03fdc9fa59f 100644
--- a/include/uapi/linux/keyctl.h
+++ b/include/uapi/linux/keyctl.h
@@ -88,7 +88,8 @@ struct keyctl_kdf_params {
 	char __user *otherinfo;
 	__u32 otherinfolen;
 	__u32 __spare[8];
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 #define KEYCTL_SUPPORTS_ENCRYPT		0x01
 #define KEYCTL_SUPPORTS_DECRYPT		0x02
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioc=
tl.h
index 6e91875c10ba..33eb7439aa7a 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -712,7 +712,8 @@ struct kfd_ioctl_criu_args {
 	__u32 num_objects;	/* Used during ops: PROCESS_INFO, RESTORE */
 	__u32 pid;		/* Used during ops: PROCESS_INFO, RESUME */
 	__u32 op;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 struct kfd_criu_device_bucket {
 	__u32 user_gpu_id;
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index dddb781b0507..5bc275a36978 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -124,6 +124,7 @@ struct kvm_hyperv_exit {
 struct kvm_xen_exit {
 #define KVM_EXIT_XEN_HCALL          1
 	__u32 type;
+	__uapi_arch_pad32;
 	union {
 		struct {
 			__u32 longmode;
@@ -133,7 +134,7 @@ struct kvm_xen_exit {
 			__u64 params[6];
 		} hcall;
 	} u;
-};
+} __uapi_arch_align;
=20
 #define KVM_S390_GET_SKEYS_NONE   1
 #define KVM_S390_SKEYS_MAX        1048576
@@ -238,7 +239,8 @@ struct kvm_run {
 		struct {
 			__u64 hardware_entry_failure_reason;
 			__u32 cpu;
-		} fail_entry;
+			__uapi_arch_pad32;
+		} __uapi_arch_align fail_entry;
 		/* KVM_EXIT_EXCEPTION */
 		struct {
 			__u32 exception;
@@ -264,14 +266,18 @@ struct kvm_run {
 			__u8  data[8];
 			__u32 len;
 			__u8  is_write;
-		} mmio;
+			__uapi_arch_pad8;
+			__uapi_arch_pad16;
+		} __uapi_arch_align mmio;
 		/* KVM_EXIT_LOONGARCH_IOCSR */
 		struct {
 			__u64 phys_addr;
 			__u8  data[8];
 			__u32 len;
 			__u8  is_write;
-		} iocsr_io;
+			__uapi_arch_pad8;
+			__uapi_arch_pad16;
+		} __uapi_arch_align iocsr_io;
 		/* KVM_EXIT_HYPERCALL */
 		struct {
 			__u64 nr;
@@ -294,6 +300,7 @@ struct kvm_run {
 		/* KVM_EXIT_S390_SIEIC */
 		struct {
 			__u8 icptcode;
+			__uapi_arch_pad8;
 			__u16 ipa;
 			__u32 ipb;
 		} s390_sieic;
@@ -303,12 +310,15 @@ struct kvm_run {
 		struct {
 			__u64 trans_exc_code;
 			__u32 pgm_code;
-		} s390_ucontrol;
+			__uapi_arch_pad32;
+		} __uapi_arch_align s390_ucontrol;
 		/* KVM_EXIT_DCR (deprecated) */
 		struct {
 			__u32 dcrn;
 			__u32 data;
 			__u8  is_write;
+			__uapi_arch_pad8;
+			__uapi_arch_pad16;
 		} dcr;
 		/* KVM_EXIT_INTERNAL_ERROR */
 		struct {
@@ -364,6 +374,8 @@ struct kvm_run {
 			__u32 io_int_word;
 			__u32 ipb;
 			__u8 dequeued;
+			__uapi_arch_pad8;
+			__uapi_arch_pad16;
 		} s390_tsch;
 		/* KVM_EXIT_EPR */
 		struct {
@@ -395,7 +407,8 @@ struct kvm_run {
 			__u8 fc;
 			__u8 sel1;
 			__u16 sel2;
-		} s390_stsi;
+			__uapi_arch_pad16;
+		} __uapi_arch_align s390_stsi;
 		/* KVM_EXIT_IOAPIC_EOI */
 		struct {
 			__u8 vector;
@@ -1088,7 +1101,8 @@ struct kvm_config_tlb {
 struct kvm_dirty_tlb {
 	__u64 bitmap;
 	__u32 num_dirty;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /* Available with KVM_CAP_ONE_REG */
=20
diff --git a/include/uapi/linux/llc.h b/include/uapi/linux/llc.h
index cf8806b14d5f..d10bc0594ebd 100644
--- a/include/uapi/linux/llc.h
+++ b/include/uapi/linux/llc.h
@@ -81,6 +81,7 @@ struct llc_pktinfo {
 	int lpi_ifindex;
 	unsigned char lpi_sap;
 	unsigned char lpi_mac[IFHWADDRLEN];
-};
+	__uapi_arch_pad8;
+} __uapi_arch_align;
=20
 #endif /* _UAPI__LINUX_LLC_H */
diff --git a/include/uapi/linux/loop.h b/include/uapi/linux/loop.h
index 6f63527dd2ed..4e0454b824b1 100644
--- a/include/uapi/linux/loop.h
+++ b/include/uapi/linux/loop.h
@@ -34,11 +34,15 @@ enum {
 #include <linux/types.h>	/* for __u64 */
=20
 /* Backwards compatibility version */
+#if defined(__powerpc64__) || defined(__x86_64__)
 struct loop_info {
 	int		   lo_number;		/* ioctl r/o */
+	/* 64-bit __kernel_old_dev_t needs 4 byte padding before */
+	__uapi_arch_pad_long;
 	__kernel_old_dev_t lo_device; 		/* ioctl r/o */
 	unsigned long	   lo_inode; 		/* ioctl r/o */
 	__kernel_old_dev_t lo_rdevice; 		/* ioctl r/o */
+	__uapi_arch_pad_old_dev_t;
 	int		   lo_offset;
 	int		   lo_encrypt_type;		/* obsolete, ignored */
 	int		   lo_encrypt_key_size; 	/* ioctl w/o */
@@ -47,7 +51,29 @@ struct loop_info {
 	unsigned char	   lo_encrypt_key[LO_KEY_SIZE]; /* ioctl w/o */
 	unsigned long	   lo_init[2];
 	char		   reserved[4];
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
+#else
+struct loop_info {
+	int		   lo_number;		/* ioctl r/o */
+	/* 16-bit __kernel_old_dev_t needs 2 byte padding after */
+	__kernel_old_dev_t lo_device; 		/* ioctl r/o */
+	__uapi_arch_pad_old_dev_t;
+	unsigned long	   lo_inode; 		/* ioctl r/o */
+	__kernel_old_dev_t lo_rdevice; 		/* ioctl r/o */
+	__uapi_arch_pad_old_dev_t;
+	int		   lo_offset;
+	int		   lo_encrypt_type;		/* obsolete, ignored */
+	int		   lo_encrypt_key_size; 	/* ioctl w/o */
+	int		   lo_flags;
+	char		   lo_name[LO_NAME_SIZE];
+	unsigned char	   lo_encrypt_key[LO_KEY_SIZE]; /* ioctl w/o */
+	__uapi_arch_pad_long;
+	unsigned long	   lo_init[2];
+	char		   reserved[4];
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
+#endif
=20
 struct loop_info64 {
 	__u64		   lo_device;			/* ioctl r/o */
diff --git a/include/uapi/linux/mctp.h b/include/uapi/linux/mctp.h
index 19ad12a0cd4b..fea4b248d91a 100644
--- a/include/uapi/linux/mctp.h
+++ b/include/uapi/linux/mctp.h
@@ -43,7 +43,9 @@ struct sockaddr_mctp_ext {
 struct mctp_fq_addr {
 	unsigned int	net;
 	mctp_eid_t	eid;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 #define MCTP_NET_ANY		0x0
=20
@@ -102,7 +104,8 @@ struct mctp_ioc_tag_ctl2 {
 	 * a prior SIOCMCTPALLOCTAG2 call (and so must have TO and PREALLOC se=
t).
 	 */
 	__u8		tag;
-
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 #endif /* __UAPI_MCTP_H */
diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 1c80b1d6bbaf..8db1a504cd4f 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -212,6 +212,7 @@ struct media_entity_desc {
 struct media_pad_desc {
 	__u32 entity;		/* entity ID */
 	__u16 index;		/* pad index */
+	__uapi_arch_pad16;
 	__u32 flags;		/* pad flags */
 	__u32 reserved[2];
 };
@@ -234,6 +235,7 @@ struct media_link_desc {
=20
 struct media_links_enum {
 	__u32 entity;
+	__uapi_arch_pad_long;
 	/* Should have enough room for pads elements */
 	struct media_pad_desc __user *pads;
 	/* Should have enough room for links elements */
diff --git a/include/uapi/linux/media/arm/mali-c55-config.h b/include/ua=
pi/linux/media/arm/mali-c55-config.h
index 109082c5694f..96bf111999dc 100644
--- a/include/uapi/linux/media/arm/mali-c55-config.h
+++ b/include/uapi/linux/media/arm/mali-c55-config.h
@@ -462,6 +462,7 @@ struct mali_c55_params_aexp_weights {
 	__u8 nodes_used_horiz;
 	__u8 nodes_used_vert;
 	__u8 zone_weights[MALI_C55_MAX_ZONES];
+	__u8 :8, :8, :8, :8, :8;
 };
=20
 /**
@@ -478,6 +479,8 @@ struct mali_c55_params_aexp_weights {
 struct mali_c55_params_digital_gain {
 	struct v4l2_isp_params_block_header header;
 	__u16 gain;
+	__u16 :16;
+	__u32 :32;
 };
=20
 /**
@@ -709,6 +712,7 @@ struct mali_c55_params_mesh_shading_config {
 	__u8 mesh_page_b;
 	__u8 mesh_width;
 	__u8 mesh_height;
+	__u8 :8;
 	__u32 mesh[MALI_C55_NUM_MESH_SHADING_ELEMENTS];
 };
=20
diff --git a/include/uapi/linux/minix_fs.h b/include/uapi/linux/minix_fs=
.h
index 8d9ca8b2c357..2a127bac3c88 100644
--- a/include/uapi/linux/minix_fs.h
+++ b/include/uapi/linux/minix_fs.h
@@ -93,7 +93,8 @@ struct minix3_super_block {
 	__u16 s_pad2;
 	__u16 s_blocksize;
 	__u8  s_disk_version;
-};
+	__uapi_arch_pad8;
+} __uapi_arch_align;
=20
 struct minix_dir_entry {
 	__u16 inode;
diff --git a/include/uapi/linux/mptcp.h b/include/uapi/linux/mptcp.h
index 72a5d030154e..072d3595a436 100644
--- a/include/uapi/linux/mptcp.h
+++ b/include/uapi/linux/mptcp.h
@@ -54,6 +54,7 @@ struct mptcp_info {
 	__u8	mptcpi_add_addr_accepted_max;
 	#define mptcpi_limit_add_addr_accepted mptcpi_add_addr_accepted_max
 	/* 16-bit hole that can no longer be filled */
+	__uapi_arch_pad16;
 	__u32	mptcpi_flags;
 	__u32	mptcpi_token;
 	__u64	mptcpi_write_seq;
@@ -64,6 +65,7 @@ struct mptcp_info {
 	#define mptcpi_endp_subflow_max mptcpi_local_addr_max
 	__u8	mptcpi_csum_enabled;
 	/* 8-bit hole that can no longer be filled */
+	__uapi_arch_pad8;
 	__u32	mptcpi_retransmits;
 	__u64	mptcpi_bytes_retrans;
 	__u64	mptcpi_bytes_sent;
@@ -76,7 +78,7 @@ struct mptcp_info {
 	__u32	mptcpi_last_data_sent;
 	__u32	mptcpi_last_data_recv;
 	__u32	mptcpi_last_ack_recv;
-};
+} __uapi_arch_align;
=20
 /* MPTCP Reset reason codes, rfc8684 */
 #define MPTCP_RST_EUNSPEC	0
@@ -112,8 +114,9 @@ struct mptcp_subflow_addrs {
=20
 struct mptcp_subflow_info {
 	__u32				id;
+	__uapi_arch_pad_long;
 	struct mptcp_subflow_addrs	addrs;
-};
+} __uapi_arch_align;
=20
 struct mptcp_full_info {
 	__u32		size_tcpinfo_kernel;	/* must be 0, set by kernel */
@@ -131,6 +134,12 @@ struct mptcp_full_info {
 	__aligned_u64		subflow_info;
 	__aligned_u64		tcp_info;
 	struct mptcp_info	mptcp_info;
+#ifdef __m68k__
+	__u16 :16;				 /* sizeof(mptcp_full_info) needs to be padded to
+						 * 64 bits, but the mptcp_info member on m68k is
+						 * two bytes short.
+						 */
+#endif
 };
=20
 /* MPTCP socket options */
diff --git a/include/uapi/linux/mroute.h b/include/uapi/linux/mroute.h
index 1a42f5f9b31b..71ffe2f44b2e 100644
--- a/include/uapi/linux/mroute.h
+++ b/include/uapi/linux/mroute.h
@@ -82,11 +82,12 @@ struct mfcctl {
 	struct in_addr mfcc_mcastgrp;		/* Group in question	*/
 	vifi_t	mfcc_parent;			/* Where it arrived	*/
 	unsigned char mfcc_ttls[MAXVIFS];	/* Where it is going	*/
+	__uapi_arch_pad16;
 	unsigned int mfcc_pkt_cnt;		/* pkt count for src-grp */
 	unsigned int mfcc_byte_cnt;
 	unsigned int mfcc_wrong_if;
 	int	     mfcc_expire;
-};
+} __uapi_arch_align;
=20
 /*  Group count retrieval for mrouted */
 struct sioc_sg_req {
@@ -100,11 +101,13 @@ struct sioc_sg_req {
 /* To get vif packet counts */
 struct sioc_vif_req {
 	vifi_t	vifi;		/* Which iface */
+	__uapi_arch_pad16;
+	__uapi_arch_pad_long;
 	unsigned long icount;	/* In packets */
 	unsigned long ocount;	/* Out packets */
 	unsigned long ibytes;	/* In bytes */
 	unsigned long obytes;	/* Out bytes */
-};
+} __uapi_arch_align;
=20
 /* This is the format the mroute daemon expects to see IGMP control
  * data. Magically happens to be like an IP packet as per the original
diff --git a/include/uapi/linux/mroute6.h b/include/uapi/linux/mroute6.h
index 1d90c21a6251..d5fa2897d501 100644
--- a/include/uapi/linux/mroute6.h
+++ b/include/uapi/linux/mroute6.h
@@ -76,8 +76,9 @@ struct mif6ctl {
 	unsigned char mif6c_flags;	/* MIFF_ flags */
 	unsigned char vifc_threshold;	/* ttl limit */
 	__u16	 mif6c_pifi;		/* the index of the physical IF */
+	__uapi_arch_pad16;
 	unsigned int vifc_rate_limit;	/* Rate limiter values (NI) */
-};
+} __uapi_arch_align;
=20
 #define MIFF_REGISTER	0x1	/* register vif	*/
=20
@@ -89,8 +90,9 @@ struct mf6cctl {
 	struct sockaddr_in6 mf6cc_origin;		/* Origin of mcast	*/
 	struct sockaddr_in6 mf6cc_mcastgrp;		/* Group in question	*/
 	mifi_t	mf6cc_parent;			/* Where it arrived	*/
+	__uapi_arch_pad16;
 	struct if_set mf6cc_ifset;		/* Where it is going */
-};
+} __uapi_arch_align;
=20
 /*
  *	Group count retrieval for pim6sd
@@ -110,11 +112,13 @@ struct sioc_sg_req6 {
=20
 struct sioc_mif_req6 {
 	mifi_t	mifi;		/* Which iface */
+	__uapi_arch_pad16;
+	__uapi_arch_pad_long;
 	unsigned long icount;	/* In packets */
 	unsigned long ocount;	/* Out packets */
 	unsigned long ibytes;	/* In bytes */
 	unsigned long obytes;	/* Out bytes */
-};
+} __uapi_arch_align;
=20
 /*
  *	That's all usermode folks
diff --git a/include/uapi/linux/msdos_fs.h b/include/uapi/linux/msdos_fs=
.h
index a5773899f4d9..d697c6195d9a 100644
--- a/include/uapi/linux/msdos_fs.h
+++ b/include/uapi/linux/msdos_fs.h
@@ -92,7 +92,9 @@ struct __fat_dirent {
 	__kernel_off_t	d_off;
 	unsigned short	d_reclen;
 	char		d_name[256]; /* We must not include limits.h! */
-};
+	__uapi_arch_pad16;
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 /*
  * ioctl commands
@@ -156,6 +158,7 @@ struct fat_boot_sector {
 			__u8	vol_label[MSDOS_NAME];	/* volume label */
 			__u8	fs_type[8];		/* file system type */
 			/* other fields are not added here */
+			__uapi_arch_pad16;
 		} fat32;
 	};
 };
diff --git a/include/uapi/linux/msg.h b/include/uapi/linux/msg.h
index 01ee8d54c1c8..260749261132 100644
--- a/include/uapi/linux/msg.h
+++ b/include/uapi/linux/msg.h
@@ -14,9 +14,21 @@
 #define MSG_EXCEPT      020000  /* recv any msg except of specified typ=
e.*/
 #define MSG_COPY        040000  /* copy (not remove) all queue messages=
 */
=20
+/* Include the definition of msqid64_ds */
+#include <asm/msgbuf.h>
+
+#ifndef __uapi_arch_pad_msqid_pid
+#define __uapi_arch_pad_msqid_pid __uapi_arch_pad16
+#endif
+
+#ifndef __uapi_arch_pad_msqid
+#define __uapi_arch_pad_msqid
+#endif
+
 /* Obsolete, used only for backwards compatibility and libc5 compiles */
 struct msqid_ds {
 	struct ipc_perm msg_perm;
+	__uapi_arch_pad_long;
 	struct msg *msg_first;		/* first message on queue,unused  */
 	struct msg *msg_last;		/* last message in queue,unused */
 	__kernel_old_time_t msg_stime;	/* last msgsnd time */
@@ -27,18 +39,22 @@ struct msqid_ds {
 	unsigned short msg_cbytes;	/* current number of bytes on queue */
 	unsigned short msg_qnum;	/* number of messages in queue */
 	unsigned short msg_qbytes;	/* max number of bytes on queue */
+	__uapi_arch_pad_msqid_pid;
 	__kernel_ipc_pid_t msg_lspid;	/* pid of last msgsnd */
 	__kernel_ipc_pid_t msg_lrpid;	/* last receive pid */
-};
-
-/* Include the definition of msqid64_ds */
-#include <asm/msgbuf.h>
+	__uapi_arch_pad_msqid;
+} __uapi_arch_align;
=20
 /* message buffer for msgsnd and msgrcv calls */
 struct msgbuf {
 	__kernel_long_t mtype;          /* type of message */
 	char mtext[1];                  /* message text */
-};
+
+	/* padding overlaps with mtext[] */
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+	__uapi_arch_pad_kernel_long_t;
+} __uapi_arch_align;
=20
 /* buffer for msgctl calls IPC_INFO, MSG_INFO */
 struct msginfo {
@@ -50,7 +66,8 @@ struct msginfo {
 	int msgssz;=20
 	int msgtql;=20
 	unsigned short  msgseg;=20
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /*
  * MSGMNI, MSGMAX and MSGMNB are default values which can be
diff --git a/include/uapi/linux/mtio.h b/include/uapi/linux/mtio.h
index a1191fecc592..7b1a4c085f2a 100644
--- a/include/uapi/linux/mtio.h
+++ b/include/uapi/linux/mtio.h
@@ -19,8 +19,9 @@
 /* structure for MTIOCTOP - mag tape op command */
 struct	mtop {
 	short	mt_op;		/* operations defined below */
+	__uapi_arch_pad16;
 	int	mt_count;	/* how many of them */
-};
+} __uapi_arch_align;
=20
 /* Magnetic Tape operations [Not all operations supported by all driver=
s]: */
 #define MTRESET 0	/* +reset drive in case of problems */
diff --git a/include/uapi/linux/net_dropmon.h b/include/uapi/linux/net_d=
ropmon.h
index 87cbef48d4c7..dd07d5a21fb2 100644
--- a/include/uapi/linux/net_dropmon.h
+++ b/include/uapi/linux/net_dropmon.h
@@ -17,11 +17,13 @@ struct net_dm_drop_point {
=20
 struct net_dm_config_entry {
 	__u32 type;
+	__u32 :32;
 	__u64 data __attribute__((aligned(8)));
 };
=20
 struct net_dm_config_msg {
 	__u32 entries;
+	__u32 :32;
 	struct net_dm_config_entry options[];
 };
=20
diff --git a/include/uapi/linux/netfilter/ipset/ip_set.h b/include/uapi/=
linux/netfilter/ipset/ip_set.h
index 333807efd32b..c8a822cf6a9f 100644
--- a/include/uapi/linux/netfilter/ipset/ip_set.h
+++ b/include/uapi/linux/netfilter/ipset/ip_set.h
@@ -268,12 +268,20 @@ enum {
 /* Backward compatibility for set match v3 */
 struct ip_set_counter_match0 {
 	__u8 op;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+	__uapi_arch_pad32;
 	__u64 value;
-};
+} __uapi_arch_align;
=20
 struct ip_set_counter_match {
 	__aligned_u64 value;
 	__u8 op;
+
+	/* not __uapi_arch_pad* because value is always aligned */
+	__u8 :8;
+	__u16 :16;
+	__u32 :32;
 };
=20
 /* Interface to iptables/ip6tables */
diff --git a/include/uapi/linux/netfilter/nf_nat.h b/include/uapi/linux/=
netfilter/nf_nat.h
index a64586e77b24..0520fcfbb0e9 100644
--- a/include/uapi/linux/netfilter/nf_nat.h
+++ b/include/uapi/linux/netfilter/nf_nat.h
@@ -50,6 +50,7 @@ struct nf_nat_range2 {
 	union nf_conntrack_man_proto	min_proto;
 	union nf_conntrack_man_proto	max_proto;
 	union nf_conntrack_man_proto	base_proto;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 #endif /* _NETFILTER_NF_NAT_H */
diff --git a/include/uapi/linux/netfilter/x_tables.h b/include/uapi/linu=
x/netfilter/x_tables.h
index 796af83a963a..7aeb09514ee4 100644
--- a/include/uapi/linux/netfilter/x_tables.h
+++ b/include/uapi/linux/netfilter/x_tables.h
@@ -19,10 +19,12 @@ struct xt_entry_match {
 		} user;
 		struct {
 			__u16 match_size;
+			__uapi_arch_pad16;
+			__uapi_arch_pad_long;
=20
 			/* Used inside the kernel */
 			struct xt_match *match;
-		} kernel;
+		} kernel __uapi_arch_align;
=20
 		/* Total length */
 		__u16 match_size;
@@ -42,10 +44,12 @@ struct xt_entry_target {
 		} user;
 		struct {
 			__u16 target_size;
+			__uapi_arch_pad16;
+			__uapi_arch_pad_long;
=20
 			/* Used inside the kernel */
 			struct xt_target *target;
-		} kernel;
+		} kernel __uapi_arch_align;
=20
 		/* Total length */
 		__u16 target_size;
@@ -65,12 +69,14 @@ struct xt_entry_target {
 struct xt_standard_target {
 	struct xt_entry_target target;
 	int verdict;
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 struct xt_error_target {
 	struct xt_entry_target target;
 	char errorname[XT_FUNCTION_MAXNAMELEN];
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /* The argument to IPT_SO_GET_REVISION_*.  Returns highest revision
  * kernel supports, if >=3D revision. */
@@ -92,10 +98,11 @@ struct xt_get_revision {
  */
 struct _xt_align {
 	__u8 u8;
+	__uapi_arch_pad8;
 	__u16 u16;
 	__u32 u32;
 	__u64 u64;
-};
+} __uapi_arch_align;
=20
 #define XT_ALIGN(s) __ALIGN_KERNEL((s), __alignof__(struct _xt_align))
=20
@@ -118,9 +125,10 @@ struct xt_counters_info {
=20
 	unsigned int num_counters;
=20
+	__uapi_arch_pad32;
 	/* The counters (actually `number' of these). */
 	struct xt_counters counters[];
-};
+} __uapi_arch_align;
=20
 #define XT_INV_PROTO		0x40	/* Invert the sense of PROTO. */
=20
diff --git a/include/uapi/linux/netfilter/xt_CT.h b/include/uapi/linux/n=
etfilter/xt_CT.h
index 868fa08e1fbb..465882c367b3 100644
--- a/include/uapi/linux/netfilter/xt_CT.h
+++ b/include/uapi/linux/netfilter/xt_CT.h
@@ -22,9 +22,11 @@ struct xt_ct_target_info {
 	__u32 ct_events;
 	__u32 exp_events;
 	char helper[16];
+	__u32 :32;
=20
 	/* Used internally by the kernel */
 	struct nf_conn	*ct __attribute__((aligned(8)));
+	__uapi_arch_pad_long_to_aligned_u64;
 };
=20
 struct xt_ct_target_info_v1 {
@@ -34,9 +36,11 @@ struct xt_ct_target_info_v1 {
 	__u32 exp_events;
 	char helper[16];
 	char timeout[32];
+	__u32 :32;
=20
 	/* Used internally by the kernel */
 	struct nf_conn	*ct __attribute__((aligned(8)));
+	__uapi_arch_pad_long_to_aligned_u64;
 };
=20
 #endif /* _XT_CT_H */
diff --git a/include/uapi/linux/netfilter/xt_HMARK.h b/include/uapi/linu=
x/netfilter/xt_HMARK.h
index 2d4b751a7115..3faac841c618 100644
--- a/include/uapi/linux/netfilter/xt_HMARK.h
+++ b/include/uapi/linux/netfilter/xt_HMARK.h
@@ -44,9 +44,10 @@ struct xt_hmark_info {
 	union hmark_ports	port_set;
 	__u32			flags;
 	__u16			proto_mask;
+	__uapi_arch_pad16;
 	__u32			hashrnd;
 	__u32			hmodulus;
 	__u32			hoffset;	/* Mark offset to start from */
-};
+} __uapi_arch_align;
=20
 #endif /* XT_HMARK_H_ */
diff --git a/include/uapi/linux/netfilter/xt_IDLETIMER.h b/include/uapi/=
linux/netfilter/xt_IDLETIMER.h
index 7bfb31a66fc9..19c5d87c4282 100644
--- a/include/uapi/linux/netfilter/xt_IDLETIMER.h
+++ b/include/uapi/linux/netfilter/xt_IDLETIMER.h
@@ -26,6 +26,7 @@ struct idletimer_tg_info {
=20
 	/* for kernel module internal use only */
 	struct idletimer_tg *timer __attribute__((aligned(8)));
+	__uapi_arch_pad_long_to_aligned_u64;
 };
=20
 struct idletimer_tg_info_v1 {
@@ -35,8 +36,11 @@ struct idletimer_tg_info_v1 {
=20
 	__u8 send_nl_msg;   /* unused: for compatibility with Android */
 	__u8 timer_type;
+	__u16 :16;
+	__u32 :32;
=20
 	/* for kernel module internal use only */
 	struct idletimer_tg *timer __attribute__((aligned(8)));
+	__uapi_arch_pad_long_to_aligned_u64;
 };
 #endif
diff --git a/include/uapi/linux/netfilter/xt_LED.h b/include/uapi/linux/=
netfilter/xt_LED.h
index 4fe0f1395807..890968736f95 100644
--- a/include/uapi/linux/netfilter/xt_LED.h
+++ b/include/uapi/linux/netfilter/xt_LED.h
@@ -11,6 +11,7 @@ struct xt_led_info {
=20
 	/* Kernel data used in the module */
 	void *internal_data __attribute__((aligned(8)));
+	__uapi_arch_pad_long_to_aligned_u64;
 };
=20
 #endif /* _XT_LED_H */
diff --git a/include/uapi/linux/netfilter/xt_RATEEST.h b/include/uapi/li=
nux/netfilter/xt_RATEEST.h
index 2b87a71e6266..05ebb9d29e21 100644
--- a/include/uapi/linux/netfilter/xt_RATEEST.h
+++ b/include/uapi/linux/netfilter/xt_RATEEST.h
@@ -9,9 +9,12 @@ struct xt_rateest_target_info {
 	char			name[IFNAMSIZ];
 	__s8			interval;
 	__u8		ewma_log;
+	__u16 :16;
+	__u32 :32;
=20
 	/* Used internally by the kernel */
 	struct xt_rateest	*est __attribute__((aligned(8)));
+	__uapi_arch_pad_long_to_aligned_u64;
 };
=20
 #endif /* _XT_RATEEST_TARGET_H */
diff --git a/include/uapi/linux/netfilter/xt_SECMARK.h b/include/uapi/li=
nux/netfilter/xt_SECMARK.h
index beb2cadba8a9..532eda3af942 100644
--- a/include/uapi/linux/netfilter/xt_SECMARK.h
+++ b/include/uapi/linux/netfilter/xt_SECMARK.h
@@ -16,14 +16,18 @@
=20
 struct xt_secmark_target_info {
 	__u8 mode;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	__u32 secid;
 	char secctx[SECMARK_SECCTX_MAX];
-};
+} __uapi_arch_align;
=20
 struct xt_secmark_target_info_v1 {
 	__u8 mode;
 	char secctx[SECMARK_SECCTX_MAX];
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	__u32 secid;
-};
+} __uapi_arch_align;
=20
 #endif /*_XT_SECMARK_H_target */
diff --git a/include/uapi/linux/netfilter/xt_TEE.h b/include/uapi/linux/=
netfilter/xt_TEE.h
index eb854917f828..58e917e02400 100644
--- a/include/uapi/linux/netfilter/xt_TEE.h
+++ b/include/uapi/linux/netfilter/xt_TEE.h
@@ -10,6 +10,7 @@ struct xt_tee_tginfo {
=20
 	/* used internally by the kernel */
 	struct xt_tee_priv *priv __attribute__((aligned(8)));
+	__uapi_arch_pad_long_to_aligned_u64;
 };
=20
 #endif /* _XT_TEE_TARGET_H */
diff --git a/include/uapi/linux/netfilter/xt_TPROXY.h b/include/uapi/lin=
ux/netfilter/xt_TPROXY.h
index 348957b02a82..132b0df4a195 100644
--- a/include/uapi/linux/netfilter/xt_TPROXY.h
+++ b/include/uapi/linux/netfilter/xt_TPROXY.h
@@ -13,13 +13,15 @@ struct xt_tproxy_target_info {
 	__u32 mark_value;
 	__be32 laddr;
 	__be16 lport;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 struct xt_tproxy_target_info_v1 {
 	__u32 mark_mask;
 	__u32 mark_value;
 	union nf_inet_addr laddr;
 	__be16 lport;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 #endif /* _XT_TPROXY_H */
diff --git a/include/uapi/linux/netfilter/xt_bpf.h b/include/uapi/linux/=
netfilter/xt_bpf.h
index a05adda26d3e..011da3705eb4 100644
--- a/include/uapi/linux/netfilter/xt_bpf.h
+++ b/include/uapi/linux/netfilter/xt_bpf.h
@@ -13,10 +13,16 @@ struct bpf_prog;
=20
 struct xt_bpf_info {
 	__u16 bpf_program_num_elem;
+	__uapi_arch_pad16;
 	struct sock_filter bpf_program[XT_BPF_MAX_NUM_INSTR];
+#ifdef __m68k__
+	__u16 :16;
+#endif
+	__u32 :32;
=20
 	/* only used in the kernel */
 	struct bpf_prog *filter __attribute__((aligned(8)));
+	__uapi_arch_pad_long_to_aligned_u64;
 };
=20
 enum xt_bpf_modes {
@@ -37,6 +43,7 @@ struct xt_bpf_info_v1 {
=20
 	/* only used in the kernel */
 	struct bpf_prog *filter __attribute__((aligned(8)));
+	__uapi_arch_pad_long_to_aligned_u64;
 };
=20
 #endif /*_XT_BPF_H */
diff --git a/include/uapi/linux/netfilter/xt_cgroup.h b/include/uapi/lin=
ux/netfilter/xt_cgroup.h
index b74e370d6133..1692b7a2d881 100644
--- a/include/uapi/linux/netfilter/xt_cgroup.h
+++ b/include/uapi/linux/netfilter/xt_cgroup.h
@@ -20,6 +20,7 @@ struct xt_cgroup_info_v1 {
=20
 	/* kernel internal data */
 	void		*priv __attribute__((aligned(8)));
+	__uapi_arch_pad_long_to_aligned_u64;
 };
=20
 #define XT_CGROUP_PATH_MAX	512
@@ -33,9 +34,11 @@ struct xt_cgroup_info_v2 {
 		char	path[XT_CGROUP_PATH_MAX];
 		__u32	classid;
 	};
+	__u32		:32;
=20
 	/* kernel internal data */
 	void		*priv __attribute__((aligned(8)));
+	__uapi_arch_pad_long_to_aligned_u64;
 };
=20
 #endif /* _UAPI_XT_CGROUP_H */
diff --git a/include/uapi/linux/netfilter/xt_connbytes.h b/include/uapi/=
linux/netfilter/xt_connbytes.h
index 0bae507db23e..a03339ca2df5 100644
--- a/include/uapi/linux/netfilter/xt_connbytes.h
+++ b/include/uapi/linux/netfilter/xt_connbytes.h
@@ -23,5 +23,9 @@ struct xt_connbytes_info {
 	} count;
 	__u8 what;		/* ipt_connbytes_what */
 	__u8 direction;	/* ipt_connbytes_direction */
+
+	/* pad to 64-bit alignment */
+	__u16 :16;
+	__u32 :32;
 };
 #endif
diff --git a/include/uapi/linux/netfilter/xt_connlimit.h b/include/uapi/=
linux/netfilter/xt_connlimit.h
index d4d1943dcd11..7323e1ca18af 100644
--- a/include/uapi/linux/netfilter/xt_connlimit.h
+++ b/include/uapi/linux/netfilter/xt_connlimit.h
@@ -28,6 +28,7 @@ struct xt_connlimit_info {
=20
 	/* Used internally by the kernel */
 	struct nf_conncount_data *data __attribute__((aligned(8)));
+	__uapi_arch_pad_long_to_aligned_u64;
 };
=20
 #endif /* _XT_CONNLIMIT_H */
diff --git a/include/uapi/linux/netfilter/xt_connmark.h b/include/uapi/l=
inux/netfilter/xt_connmark.h
index 41b578ccd03b..59e61f85979d 100644
--- a/include/uapi/linux/netfilter/xt_connmark.h
+++ b/include/uapi/linux/netfilter/xt_connmark.h
@@ -22,16 +22,21 @@ enum {
 struct xt_connmark_tginfo1 {
 	__u32 ctmark, ctmask, nfmask;
 	__u8 mode;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __arch_uapi_align;
=20
 struct xt_connmark_tginfo2 {
 	__u32 ctmark, ctmask, nfmask;
 	__u8 shift_dir, shift_bits, mode;
-};
+	__uapi_arch_pad8;
+} __uapi_arch_align;
=20
 struct xt_connmark_mtinfo1 {
 	__u32 mark, mask;
 	__u8 invert;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 #endif /*_XT_CONNMARK_H*/
diff --git a/include/uapi/linux/netfilter/xt_conntrack.h b/include/uapi/=
linux/netfilter/xt_conntrack.h
index cdd14a83d29d..83c2807a6c1d 100644
--- a/include/uapi/linux/netfilter/xt_conntrack.h
+++ b/include/uapi/linux/netfilter/xt_conntrack.h
@@ -59,7 +59,8 @@ struct xt_conntrack_mtinfo2 {
 	__be16 replsrc_port, repldst_port;
 	__u16 match_flags, invert_flags;
 	__u16 state_mask, status_mask;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 struct xt_conntrack_mtinfo3 {
 	union nf_inet_addr origsrc_addr, origsrc_mask;
@@ -74,6 +75,7 @@ struct xt_conntrack_mtinfo3 {
 	__u16 state_mask, status_mask;
 	__u16 origsrc_port_high, origdst_port_high;
 	__u16 replsrc_port_high, repldst_port_high;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 #endif /*_XT_CONNTRACK_H*/
diff --git a/include/uapi/linux/netfilter/xt_dccp.h b/include/uapi/linux=
/netfilter/xt_dccp.h
index 564e61c5703f..0f107b2bd3ed 100644
--- a/include/uapi/linux/netfilter/xt_dccp.h
+++ b/include/uapi/linux/netfilter/xt_dccp.h
@@ -20,7 +20,8 @@ struct xt_dccp_info {
=20
 	__u16 typemask;
 	__u8 option;
-};
+	__uapi_arch_pad8;
+} __uapi_arch_align;
=20
 #endif /* _XT_DCCP_H_ */
=20
diff --git a/include/uapi/linux/netfilter/xt_esp.h b/include/uapi/linux/=
netfilter/xt_esp.h
index fa57a208f684..f1dca091c356 100644
--- a/include/uapi/linux/netfilter/xt_esp.h
+++ b/include/uapi/linux/netfilter/xt_esp.h
@@ -7,7 +7,9 @@
 struct xt_esp {
 	__u32 spis[2];	/* Security Parameter Index */
 	__u8  invflags;	/* Inverse flags */
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /* Values for "invflags" field in struct xt_esp. */
 #define XT_ESP_INV_SPI	0x01	/* Invert the sense of spi. */
diff --git a/include/uapi/linux/netfilter/xt_hashlimit.h b/include/uapi/=
linux/netfilter/xt_hashlimit.h
index 721a8de6c5b3..cbb8fa6645a6 100644
--- a/include/uapi/linux/netfilter/xt_hashlimit.h
+++ b/include/uapi/linux/netfilter/xt_hashlimit.h
@@ -44,6 +44,7 @@ struct hashlimit_cfg {
 struct xt_hashlimit_info {
 	char name [IFNAMSIZ];		/* name */
 	struct hashlimit_cfg cfg;
+	__uapi_arch_pad_long;
=20
 	/* Used internally by the kernel */
 	struct xt_hashlimit_htable *hinfo;
@@ -65,7 +66,8 @@ struct hashlimit_cfg1 {
 	__u32 expire;	/* when do entries expire? */
=20
 	__u8 srcmask, dstmask;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 struct hashlimit_cfg2 {
 	__u64 avg;		/* Average secs between packets * scale */
@@ -79,7 +81,8 @@ struct hashlimit_cfg2 {
 	__u32 expire;		/* when do entries expire? */
=20
 	__u8 srcmask, dstmask;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 struct hashlimit_cfg3 {
 	__u64 avg;		/* Average secs between packets * scale */
@@ -94,30 +97,48 @@ struct hashlimit_cfg3 {
=20
 	__u32 interval;
 	__u8 srcmask, dstmask;
-};
+	__uapi_arch_pad16;
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 struct xt_hashlimit_mtinfo1 {
 	char name[IFNAMSIZ];
 	struct hashlimit_cfg1 cfg;
+#ifdef __m68k__
+	__u16 :16;
+#endif
=20
 	/* Used internally by the kernel */
 	struct xt_hashlimit_htable *hinfo __attribute__((aligned(8)));
+	__uapi_arch_pad_long_to_aligned_u64;
 };
=20
 struct xt_hashlimit_mtinfo2 {
 	char name[NAME_MAX];
+	__uapi_arch_pad8;
 	struct hashlimit_cfg2 cfg;
+#ifdef __m68k__
+	__u16 :16;
+#endif
=20
 	/* Used internally by the kernel */
 	struct xt_hashlimit_htable *hinfo __attribute__((aligned(8)));
+	__uapi_arch_pad_long_to_aligned_u64;
 };
=20
 struct xt_hashlimit_mtinfo3 {
 	char name[NAME_MAX];
+	__uapi_arch_pad8;
 	struct hashlimit_cfg3 cfg;
-
+#ifdef __m68k__
+	__u16 :16;
+#endif
+#if defined(__i386__) || defined(__csky__) || defined(__m68k__) || defi=
ned(__microblaze__) || defined(__arc__) || defined(__nios2__) || defined=
(__or1k__) || defined(__sh__)
+	__u32 :32;
+#endif
 	/* Used internally by the kernel */
 	struct xt_hashlimit_htable *hinfo __attribute__((aligned(8)));
+	__uapi_arch_pad_long_to_aligned_u64;
 };
=20
 #endif /* _UAPI_XT_HASHLIMIT_H */
diff --git a/include/uapi/linux/netfilter/xt_helper.h b/include/uapi/lin=
ux/netfilter/xt_helper.h
index 53aa1458d6b7..b9d79f35e24b 100644
--- a/include/uapi/linux/netfilter/xt_helper.h
+++ b/include/uapi/linux/netfilter/xt_helper.h
@@ -2,8 +2,11 @@
 #ifndef _XT_HELPER_H
 #define _XT_HELPER_H
=20
+#include <linux/types.h>
+
 struct xt_helper_info {
 	int invert;
 	char name[30];
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
 #endif /* _XT_HELPER_H */
diff --git a/include/uapi/linux/netfilter/xt_ipcomp.h b/include/uapi/lin=
ux/netfilter/xt_ipcomp.h
index 69b12e76eaf7..949169166e5e 100644
--- a/include/uapi/linux/netfilter/xt_ipcomp.h
+++ b/include/uapi/linux/netfilter/xt_ipcomp.h
@@ -8,7 +8,8 @@ struct xt_ipcomp {
 	__u32 spis[2];	/* Security Parameter Index */
 	__u8 invflags;	/* Inverse flags */
 	__u8 hdrres;	/* Test of the Reserved Filed */
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /* Values for "invflags" field in struct xt_ipcomp. */
 #define XT_IPCOMP_INV_SPI	0x01	/* Invert the sense of spi. */
diff --git a/include/uapi/linux/netfilter/xt_iprange.h b/include/uapi/li=
nux/netfilter/xt_iprange.h
index 551bec7a22fc..12721ebb5537 100644
--- a/include/uapi/linux/netfilter/xt_iprange.h
+++ b/include/uapi/linux/netfilter/xt_iprange.h
@@ -16,6 +16,8 @@ struct xt_iprange_mtinfo {
 	union nf_inet_addr src_min, src_max;
 	union nf_inet_addr dst_min, dst_max;
 	__u8 flags;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 #endif /* _LINUX_NETFILTER_XT_IPRANGE_H */
diff --git a/include/uapi/linux/netfilter/xt_l2tp.h b/include/uapi/linux=
/netfilter/xt_l2tp.h
index 990b52a49fab..2d83af4d4949 100644
--- a/include/uapi/linux/netfilter/xt_l2tp.h
+++ b/include/uapi/linux/netfilter/xt_l2tp.h
@@ -16,7 +16,8 @@ struct xt_l2tp_info {
 	__u8 version;			/* L2TP protocol version */
 	__u8 type;			/* L2TP packet type */
 	__u8 flags;			/* which fields to match */
-};
+	__uapi_arch_pad8;
+} __uapi_arch_align;
=20
 enum {
 	XT_L2TP_TID	=3D (1 << 0),	/* match L2TP tunnel id */
diff --git a/include/uapi/linux/netfilter/xt_length.h b/include/uapi/lin=
ux/netfilter/xt_length.h
index 513f653e2f6b..dddd49c5a02a 100644
--- a/include/uapi/linux/netfilter/xt_length.h
+++ b/include/uapi/linux/netfilter/xt_length.h
@@ -7,6 +7,7 @@
 struct xt_length_info {
     __u16	min, max;
     __u8	invert;
-};
+    __uapi_arch_pad8;
+} __uapi_arch_align;
=20
 #endif /*_XT_LENGTH_H*/
diff --git a/include/uapi/linux/netfilter/xt_limit.h b/include/uapi/linu=
x/netfilter/xt_limit.h
index 1d6e4ce9a646..d71e9674bd11 100644
--- a/include/uapi/linux/netfilter/xt_limit.h
+++ b/include/uapi/linux/netfilter/xt_limit.h
@@ -19,7 +19,8 @@ struct xt_rateinfo {
 	unsigned long prev; /* moved to xt_limit_priv */
 	__u32 credit; /* moved to xt_limit_priv */
 	__u32 credit_cap, cost;
+	__uapi_arch_pad_long;
=20
 	struct xt_limit_priv *master;
-};
+} __uapi_arch_align;
 #endif /*_XT_RATE_H*/
diff --git a/include/uapi/linux/netfilter/xt_mac.h b/include/uapi/linux/=
netfilter/xt_mac.h
index c4dd5185cfc4..f7926a7121c4 100644
--- a/include/uapi/linux/netfilter/xt_mac.h
+++ b/include/uapi/linux/netfilter/xt_mac.h
@@ -5,7 +5,8 @@
 #include <linux/if_ether.h>
=20
 struct xt_mac_info {
-    unsigned char srcaddr[ETH_ALEN];
-    int invert;
-};
+	unsigned char srcaddr[ETH_ALEN];
+	__uapi_arch_pad16;
+	int invert;
+} __uapi_arch_align;
 #endif /*_XT_MAC_H*/
diff --git a/include/uapi/linux/netfilter/xt_mark.h b/include/uapi/linux=
/netfilter/xt_mark.h
index 9d0526ced8f0..1450159186db 100644
--- a/include/uapi/linux/netfilter/xt_mark.h
+++ b/include/uapi/linux/netfilter/xt_mark.h
@@ -11,6 +11,8 @@ struct xt_mark_tginfo2 {
 struct xt_mark_mtinfo1 {
 	__u32 mark, mask;
 	__u8 invert;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 #endif /*_XT_MARK_H*/
diff --git a/include/uapi/linux/netfilter/xt_nfacct.h b/include/uapi/lin=
ux/netfilter/xt_nfacct.h
index b5123ab8d54a..449059469be9 100644
--- a/include/uapi/linux/netfilter/xt_nfacct.h
+++ b/include/uapi/linux/netfilter/xt_nfacct.h
@@ -3,6 +3,7 @@
 #define _XT_NFACCT_MATCH_H
=20
 #include <linux/netfilter/nfnetlink_acct.h>
+#include <linux/types.h>
=20
 struct nf_acct;
=20
@@ -14,6 +15,7 @@ struct xt_nfacct_match_info {
 struct xt_nfacct_match_info_v1 {
 	char		name[NFACCT_NAME_MAX];
 	struct nf_acct	*nfacct __attribute__((aligned(8)));
+	__uapi_arch_pad_long_to_aligned_u64;
 };
=20
 #endif /* _XT_NFACCT_MATCH_H */
diff --git a/include/uapi/linux/netfilter/xt_owner.h b/include/uapi/linu=
x/netfilter/xt_owner.h
index 5108df4d0313..da63366cb023 100644
--- a/include/uapi/linux/netfilter/xt_owner.h
+++ b/include/uapi/linux/netfilter/xt_owner.h
@@ -20,6 +20,7 @@ struct xt_owner_match_info {
 	__u32 uid_min, uid_max;
 	__u32 gid_min, gid_max;
 	__u8 match, invert;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 #endif /* _XT_OWNER_MATCH_H */
diff --git a/include/uapi/linux/netfilter/xt_policy.h b/include/uapi/lin=
ux/netfilter/xt_policy.h
index 4cf2ce2a8a44..201d3688c4f1 100644
--- a/include/uapi/linux/netfilter/xt_policy.h
+++ b/include/uapi/linux/netfilter/xt_policy.h
@@ -28,6 +28,7 @@ struct xt_policy_spec {
 			mode:1,
 			spi:1,
 			reqid:1;
+	__u8 :2;
 };
=20
 #ifndef __KERNEL__
diff --git a/include/uapi/linux/netfilter/xt_quota.h b/include/uapi/linu=
x/netfilter/xt_quota.h
index f3ba5d9e58b6..88e6317685f3 100644
--- a/include/uapi/linux/netfilter/xt_quota.h
+++ b/include/uapi/linux/netfilter/xt_quota.h
@@ -18,6 +18,7 @@ struct xt_quota_info {
=20
 	/* Used internally by the kernel */
 	struct xt_quota_priv	*master;
+	__uapi_arch_pad_long_to_aligned_u64;
 };
=20
 #endif /* _XT_QUOTA_H */
diff --git a/include/uapi/linux/netfilter/xt_rateest.h b/include/uapi/li=
nux/netfilter/xt_rateest.h
index 52a37bdc1837..e58063aa9e84 100644
--- a/include/uapi/linux/netfilter/xt_rateest.h
+++ b/include/uapi/linux/netfilter/xt_rateest.h
@@ -30,10 +30,13 @@ struct xt_rateest_match_info {
 	__u32		pps1;
 	__u32		bps2;
 	__u32		pps2;
+	__u32		:32;
=20
 	/* Used internally by the kernel */
 	struct xt_rateest	*est1 __attribute__((aligned(8)));
+	__uapi_arch_pad_long_to_aligned_u64;
 	struct xt_rateest	*est2 __attribute__((aligned(8)));
+	__uapi_arch_pad_long_to_aligned_u64;
 };
=20
 #endif /* _XT_RATEEST_MATCH_H */
diff --git a/include/uapi/linux/netfilter/xt_realm.h b/include/uapi/linu=
x/netfilter/xt_realm.h
index 252aa9f79cf8..c372badbae4a 100644
--- a/include/uapi/linux/netfilter/xt_realm.h
+++ b/include/uapi/linux/netfilter/xt_realm.h
@@ -8,6 +8,8 @@ struct xt_realm_info {
 	__u32 id;
 	__u32 mask;
 	__u8 invert;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 #endif /* _XT_REALM_H */
diff --git a/include/uapi/linux/netfilter/xt_recent.h b/include/uapi/lin=
ux/netfilter/xt_recent.h
index e2c33996a802..acaee62950f9 100644
--- a/include/uapi/linux/netfilter/xt_recent.h
+++ b/include/uapi/linux/netfilter/xt_recent.h
@@ -32,7 +32,8 @@ struct xt_recent_mtinfo {
 	__u8 invert;
 	char name[XT_RECENT_NAME_LEN];
 	__u8 side;
-};
+	__uapi_arch_pad8;
+} __uapi_arch_align;
=20
 struct xt_recent_mtinfo_v1 {
 	__u32 seconds;
@@ -41,7 +42,8 @@ struct xt_recent_mtinfo_v1 {
 	__u8 invert;
 	char name[XT_RECENT_NAME_LEN];
 	__u8 side;
+	__uapi_arch_pad8;
 	union nf_inet_addr mask;
-};
+} __uapi_arch_align;
=20
 #endif /* _LINUX_NETFILTER_XT_RECENT_H */
diff --git a/include/uapi/linux/netfilter/xt_set.h b/include/uapi/linux/=
netfilter/xt_set.h
index 8c1ca66c8a06..b6a754d4de89 100644
--- a/include/uapi/linux/netfilter/xt_set.h
+++ b/include/uapi/linux/netfilter/xt_set.h
@@ -16,15 +16,17 @@
=20
 struct xt_set_info_v0 {
 	ip_set_id_t index;
+	__uapi_arch_pad16;
 	union {
 		__u32 flags[IPSET_DIM_MAX + 1];
 		struct {
 			__u32 __flags[IPSET_DIM_MAX];
 			__u8 dim;
 			__u8 flags;
-		} compat;
-	} u;
-};
+			__uapi_arch_pad16;
+		} compat __uapi_arch_align;
+	} u __uapi_arch_align;
+} __uapi_arch_align;
=20
 /* match and target infos */
 struct xt_set_info_match_v0 {
@@ -67,10 +69,12 @@ struct xt_set_info_target_v2 {
=20
 struct xt_set_info_match_v3 {
 	struct xt_set_info match_set;
+	__uapi_arch_pad32;
 	struct ip_set_counter_match0 packets;
 	struct ip_set_counter_match0 bytes;
 	__u32 flags;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /* Revision 3 target */
=20
@@ -86,9 +90,11 @@ struct xt_set_info_target_v3 {
=20
 struct xt_set_info_match_v4 {
 	struct xt_set_info match_set;
+	__u32 :32;
 	struct ip_set_counter_match packets;
 	struct ip_set_counter_match bytes;
 	__u32 flags;
+	__u32 :32;
 };
=20
 #endif /*_XT_SET_H*/
diff --git a/include/uapi/linux/netfilter/xt_statistic.h b/include/uapi/=
linux/netfilter/xt_statistic.h
index bbce6fcb26e3..afb00a118725 100644
--- a/include/uapi/linux/netfilter/xt_statistic.h
+++ b/include/uapi/linux/netfilter/xt_statistic.h
@@ -32,6 +32,7 @@ struct xt_statistic_info {
 		} nth;
 	} u;
 	struct xt_statistic_priv *master __attribute__((aligned(8)));
+	__uapi_arch_pad_long_to_aligned_u64;
 };
=20
 #endif /* _XT_STATISTIC_H */
diff --git a/include/uapi/linux/netfilter/xt_string.h b/include/uapi/lin=
ux/netfilter/xt_string.h
index bedb015d54dd..f80517e0bfb2 100644
--- a/include/uapi/linux/netfilter/xt_string.h
+++ b/include/uapi/linux/netfilter/xt_string.h
@@ -27,9 +27,11 @@ struct xt_string_info {
 			__u8  flags;
 		} v1;
 	} u;
+	__u16 :16;
=20
 	/* Used internally by the kernel */
 	struct ts_config __attribute__((aligned(8))) *config;
+	__uapi_arch_pad_long_to_aligned_u64;
 };
=20
 #endif /*_XT_STRING_H*/
diff --git a/include/uapi/linux/netfilter/xt_tcpmss.h b/include/uapi/lin=
ux/netfilter/xt_tcpmss.h
index 2268f58b4dec..283060d04217 100644
--- a/include/uapi/linux/netfilter/xt_tcpmss.h
+++ b/include/uapi/linux/netfilter/xt_tcpmss.h
@@ -5,8 +5,9 @@
 #include <linux/types.h>
=20
 struct xt_tcpmss_match_info {
-    __u16 mss_min, mss_max;
-    __u8 invert;
-};
+	__u16 mss_min, mss_max;
+	__u8 invert;
+	__uapi_arch_pad8;
+} __uapi_arch_align;
=20
 #endif /*_XT_TCPMSS_MATCH_H*/
diff --git a/include/uapi/linux/netfilter/xt_tcpudp.h b/include/uapi/lin=
ux/netfilter/xt_tcpudp.h
index 658c16999819..7b64406e724f 100644
--- a/include/uapi/linux/netfilter/xt_tcpudp.h
+++ b/include/uapi/linux/netfilter/xt_tcpudp.h
@@ -26,7 +26,8 @@ struct xt_udp {
 	__u16 spts[2];			/* Source port range. */
 	__u16 dpts[2];			/* Destination port range. */
 	__u8 invflags;			/* Inverse flags */
-};
+	__uapi_arch_pad8;
+} __uapi_arch_align;
=20
 /* Values for "invflags" field in struct ipt_udp. */
 #define XT_UDP_INV_SRCPT	0x01	/* Invert the sense of source ports. */
diff --git a/include/uapi/linux/netfilter/xt_time.h b/include/uapi/linux=
/netfilter/xt_time.h
index 7f707c7ec858..6f06e2116bef 100644
--- a/include/uapi/linux/netfilter/xt_time.h
+++ b/include/uapi/linux/netfilter/xt_time.h
@@ -12,7 +12,8 @@ struct xt_time_info {
 	__u32 monthdays_match;
 	__u8 weekdays_match;
 	__u8 flags;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 enum {
 	/* Match against local time (instead of UTC) */
diff --git a/include/uapi/linux/netfilter/xt_u32.h b/include/uapi/linux/=
netfilter/xt_u32.h
index a88505ca72f8..7e7ec0435df4 100644
--- a/include/uapi/linux/netfilter/xt_u32.h
+++ b/include/uapi/linux/netfilter/xt_u32.h
@@ -14,7 +14,9 @@ enum xt_u32_ops {
 struct xt_u32_location_element {
 	__u32 number;
 	__u8 nextop;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 struct xt_u32_value_element {
 	__u32 min;
@@ -32,12 +34,14 @@ struct xt_u32_test {
 	struct xt_u32_value_element value[XT_U32_MAXSIZE+1];
 	__u8 nnums;
 	__u8 nvalues;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 struct xt_u32 {
 	struct xt_u32_test tests[XT_U32_MAXSIZE+1];
 	__u8 ntests;
 	__u8 invert;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 #endif /* _XT_U32_H */
diff --git a/include/uapi/linux/netfilter_arp/arp_tables.h b/include/uap=
i/linux/netfilter_arp/arp_tables.h
index a6ac2463f787..9dd92a83a3e3 100644
--- a/include/uapi/linux/netfilter_arp/arp_tables.h
+++ b/include/uapi/linux/netfilter_arp/arp_tables.h
@@ -68,9 +68,11 @@ struct arpt_arp {
=20
 	/* Flags word */
 	__u8 flags;
+	__uapi_arch_pad8;
 	/* Inverse flags */
 	__u16 invflags;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /* Values for "flag" field in struct arpt_ip (general arp structure).
  * No flags defined yet.
@@ -104,13 +106,14 @@ struct arpt_entry
=20
 	/* Back pointer */
 	unsigned int comefrom;
+	__uapi_arch_pad32;
=20
 	/* Packet and byte counters. */
 	struct xt_counters counters;
=20
 	/* The matches (if any), then the target. */
 	unsigned char elems[];
-};
+} __uapi_arch_align;
=20
 /*
  * New IP firewall options for [gs]etsockopt at the RAW IP level.
@@ -179,10 +182,11 @@ struct arpt_replace {
 	unsigned int num_counters;
 	/* The old entries' counters. */
 	struct xt_counters __user *counters;
+	__uapi_arch_pad_long_to_u64;
=20
 	/* The entries (hang off end: not really an array). */
 	struct arpt_entry entries[];
-};
+} __uapi_arch_align;
=20
 /* The argument to ARPT_SO_GET_ENTRIES. */
 struct arpt_get_entries {
@@ -191,10 +195,11 @@ struct arpt_get_entries {
=20
 	/* User fills this in: total entry size. */
 	unsigned int size;
+	__uapi_arch_pad32;
=20
 	/* The entries. */
 	struct arpt_entry entrytable[];
-};
+} __uapi_arch_align;
=20
 /* Helper functions */
 static __inline__ struct xt_entry_target *arpt_get_target(struct arpt_e=
ntry *e)
diff --git a/include/uapi/linux/netfilter_arp/arpt_mangle.h b/include/ua=
pi/linux/netfilter_arp/arpt_mangle.h
index 60135d5cc223..56f003bf7c5e 100644
--- a/include/uapi/linux/netfilter_arp/arpt_mangle.h
+++ b/include/uapi/linux/netfilter_arp/arpt_mangle.h
@@ -15,8 +15,10 @@ struct arpt_mangle
 		struct in_addr tgt_ip;
 	} u_t;
 	__u8 flags;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	int target;
-};
+} __uapi_arch_align;
=20
 #define ARPT_MANGLE_SDEV 0x01
 #define ARPT_MANGLE_TDEV 0x02
diff --git a/include/uapi/linux/netfilter_bridge/ebt_802_3.h b/include/u=
api/linux/netfilter_bridge/ebt_802_3.h
index 03463e4b0246..e6ee63f246d2 100644
--- a/include/uapi/linux/netfilter_bridge/ebt_802_3.h
+++ b/include/uapi/linux/netfilter_bridge/ebt_802_3.h
@@ -40,8 +40,9 @@ struct hdr_ni {
 	__u8 ssap;
 	__be16 ctrl;
 	__u8  orig[3];
+	__uapi_arch_pad8;
 	__be16 type;
-};
+} __uapi_arch_align;
=20
 struct ebt_802_3_hdr {
 	__u8  daddr[ETH_ALEN];
@@ -56,9 +57,10 @@ struct ebt_802_3_hdr {
=20
 struct ebt_802_3_info {
 	__u8  sap;
+	__uapi_arch_pad8;
 	__be16 type;
 	__u8  bitmask;
 	__u8  invflags;
-};
+} __uapi_arch_align;
=20
 #endif /* _UAPI__LINUX_BRIDGE_EBT_802_3_H */
diff --git a/include/uapi/linux/netfilter_bridge/ebt_arp.h b/include/uap=
i/linux/netfilter_bridge/ebt_arp.h
index 628b4fdae542..863036cd3e13 100644
--- a/include/uapi/linux/netfilter_bridge/ebt_arp.h
+++ b/include/uapi/linux/netfilter_bridge/ebt_arp.h
@@ -23,6 +23,7 @@ struct ebt_arp_info
 	__be16 htype;
 	__be16 ptype;
 	__be16 opcode;
+	__uapi_arch_pad16;
 	__be32 saddr;
 	__be32 smsk;
 	__be32 daddr;
@@ -33,6 +34,7 @@ struct ebt_arp_info
 	unsigned char dmmsk[ETH_ALEN];
 	__u8  bitmask;
 	__u8  invflags;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 #endif
diff --git a/include/uapi/linux/netfilter_bridge/ebt_arpreply.h b/includ=
e/uapi/linux/netfilter_bridge/ebt_arpreply.h
index ed41ae053597..4f03e0859787 100644
--- a/include/uapi/linux/netfilter_bridge/ebt_arpreply.h
+++ b/include/uapi/linux/netfilter_bridge/ebt_arpreply.h
@@ -6,8 +6,9 @@
=20
 struct ebt_arpreply_info {
 	unsigned char mac[ETH_ALEN];
+	__uapi_arch_pad16;
 	int target;
-};
+} __uapi_arch_align;
 #define EBT_ARPREPLY_TARGET "arpreply"
=20
 #endif
diff --git a/include/uapi/linux/netfilter_bridge/ebt_limit.h b/include/u=
api/linux/netfilter_bridge/ebt_limit.h
index c2ac02e1fab6..7e21bdfdbc4a 100644
--- a/include/uapi/linux/netfilter_bridge/ebt_limit.h
+++ b/include/uapi/linux/netfilter_bridge/ebt_limit.h
@@ -20,6 +20,7 @@ struct ebt_limit_info {
 	unsigned long prev;
 	__u32 credit;
 	__u32 credit_cap, cost;
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 #endif
diff --git a/include/uapi/linux/netfilter_bridge/ebt_log.h b/include/uap=
i/linux/netfilter_bridge/ebt_log.h
index f6724155af91..1bb92d883ed8 100644
--- a/include/uapi/linux/netfilter_bridge/ebt_log.h
+++ b/include/uapi/linux/netfilter_bridge/ebt_log.h
@@ -15,7 +15,8 @@
 struct ebt_log_info {
 	__u8 loglevel;
 	__u8 prefix[EBT_LOG_PREFIX_SIZE];
+	__uapi_arch_pad8;
 	__u32 bitmask;
-};
+} __uapi_arch_align;
=20
 #endif
diff --git a/include/uapi/linux/netfilter_bridge/ebt_mark_m.h b/include/=
uapi/linux/netfilter_bridge/ebt_mark_m.h
index 098ac78cd1e6..139e4df8f70a 100644
--- a/include/uapi/linux/netfilter_bridge/ebt_mark_m.h
+++ b/include/uapi/linux/netfilter_bridge/ebt_mark_m.h
@@ -11,7 +11,9 @@ struct ebt_mark_m_info {
 	unsigned long mark, mask;
 	__u8 invert;
 	__u8 bitmask;
-};
+	__uapi_arch_pad16;
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
 #define EBT_MARK_MATCH "mark_m"
=20
 #endif
diff --git a/include/uapi/linux/netfilter_bridge/ebt_mark_t.h b/include/=
uapi/linux/netfilter_bridge/ebt_mark_t.h
index 8810f1c12af3..82bc89f60066 100644
--- a/include/uapi/linux/netfilter_bridge/ebt_mark_t.h
+++ b/include/uapi/linux/netfilter_bridge/ebt_mark_t.h
@@ -2,6 +2,8 @@
 #ifndef __LINUX_BRIDGE_EBT_MARK_T_H
 #define __LINUX_BRIDGE_EBT_MARK_T_H
=20
+#include <linux/types.h>
+
 /* The target member is reused for adding new actions, the
  * value of the real target is -1 to -NUM_STANDARD_TARGETS.
  * For backward compatibility, the 4 lsb (2 would be enough,
@@ -18,7 +20,8 @@ struct ebt_mark_t_info {
 	unsigned long mark;
 	/* EBT_ACCEPT, EBT_DROP, EBT_CONTINUE or EBT_RETURN */
 	int target;
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
 #define EBT_MARK_TARGET "mark"
=20
 #endif
diff --git a/include/uapi/linux/netfilter_bridge/ebt_nat.h b/include/uap=
i/linux/netfilter_bridge/ebt_nat.h
index 49da2f9be021..05810e8113a2 100644
--- a/include/uapi/linux/netfilter_bridge/ebt_nat.h
+++ b/include/uapi/linux/netfilter_bridge/ebt_nat.h
@@ -7,9 +7,10 @@
 #define NAT_ARP_BIT  (0x00000010)
 struct ebt_nat_info {
 	unsigned char mac[ETH_ALEN];
+	__uapi_arch_pad16;
 	/* EBT_ACCEPT, EBT_DROP, EBT_CONTINUE or EBT_RETURN */
 	int target;
-};
+} __uapi_arch_align;
 #define EBT_SNAT_TARGET "snat"
 #define EBT_DNAT_TARGET "dnat"
=20
diff --git a/include/uapi/linux/netfilter_bridge/ebt_stp.h b/include/uap=
i/linux/netfilter_bridge/ebt_stp.h
index 94f68dedc3f6..a5a83015f5c2 100644
--- a/include/uapi/linux/netfilter_bridge/ebt_stp.h
+++ b/include/uapi/linux/netfilter_bridge/ebt_stp.h
@@ -25,8 +25,10 @@
=20
 struct ebt_stp_config_info {
 	__u8 flags;
+	__uapi_arch_pad8;
 	__u16 root_priol, root_priou;
 	char root_addr[6], root_addrmsk[6];
+	__uapi_arch_pad16;
 	__u32 root_costl, root_costu;
 	__u16 sender_priol, sender_priou;
 	char sender_addr[6], sender_addrmsk[6];
@@ -35,13 +37,15 @@ struct ebt_stp_config_info {
 	__u16 max_agel, max_ageu;
 	__u16 hello_timel, hello_timeu;
 	__u16 forward_delayl, forward_delayu;
-};
+} __uapi_arch_align;
=20
 struct ebt_stp_info {
 	__u8 type;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	struct ebt_stp_config_info config;
 	__u16 bitmask;
 	__u16 invflags;
-};
+} __uapi_arch_align;
=20
 #endif
diff --git a/include/uapi/linux/netfilter_bridge/ebt_vlan.h b/include/ua=
pi/linux/netfilter_bridge/ebt_vlan.h
index fb0d8f604c23..a88b73556b5d 100644
--- a/include/uapi/linux/netfilter_bridge/ebt_vlan.h
+++ b/include/uapi/linux/netfilter_bridge/ebt_vlan.h
@@ -13,11 +13,12 @@
 struct ebt_vlan_info {
 	__u16 id;		/* VLAN ID {1-4095} */
 	__u8 prio;		/* VLAN User Priority {0-7} */
+	__uapi_arch_pad8;
 	__be16 encap;		/* VLAN Encapsulated frame code {0-65535} */
 	__u8 bitmask;		/* Args bitmask bit 1=3D1 - ID arg,
 				   bit 2=3D1 User-Priority arg, bit 3=3D1 encap*/
 	__u8 invflags;		/* Inverse bitmask  bit 1=3D1 - inversed ID arg,=20
 				   bit 2=3D1 - inversed Pirority arg */
-};
+} __uapi_arch_align;
=20
 #endif
diff --git a/include/uapi/linux/netfilter_bridge/ebtables.h b/include/ua=
pi/linux/netfilter_bridge/ebtables.h
index 4ff328f3d339..06b7c33a9c02 100644
--- a/include/uapi/linux/netfilter_bridge/ebtables.h
+++ b/include/uapi/linux/netfilter_bridge/ebtables.h
@@ -48,14 +48,16 @@ struct ebt_replace {
 	unsigned int nentries;
 	/* total size of the entries */
 	unsigned int entries_size;
+	__uapi_arch_pad_long;
 	/* start of the chains */
 	struct ebt_entries __user *hook_entry[NF_BR_NUMHOOKS];
 	/* nr of counters userspace expects back */
 	unsigned int num_counters;
+	__uapi_arch_pad_long;
 	/* where the kernel will put the old counters */
 	struct ebt_counter __user *counters;
 	char __user *entries;
-};
+} __uapi_arch_align;
=20
 struct ebt_replace_kernel {
 	char name[EBT_TABLE_MAXNAMELEN];
@@ -64,14 +66,16 @@ struct ebt_replace_kernel {
 	unsigned int nentries;
 	/* total size of the entries */
 	unsigned int entries_size;
+	__uapi_arch_pad_long;
 	/* start of the chains */
 	struct ebt_entries *hook_entry[NF_BR_NUMHOOKS];
 	/* nr of counters userspace expects back */
 	unsigned int num_counters;
+	__uapi_arch_pad_long;
 	/* where the kernel will put the old counters */
 	struct ebt_counter *counters;
 	char *entries;
-};
+} __uapi_arch_align;
=20
 struct ebt_entries {
 	/* this field is always set to zero
@@ -129,8 +133,9 @@ struct ebt_entry_match {
 	} u;
 	/* size of data */
 	unsigned int match_size;
+	__uapi_arch_pad_long;
 	unsigned char data[] __attribute__ ((aligned (__alignof__(struct ebt_r=
eplace))));
-};
+} __uapi_arch_align;
=20
 struct ebt_entry_watcher {
 	union {
@@ -142,8 +147,9 @@ struct ebt_entry_watcher {
 	} u;
 	/* size of data */
 	unsigned int watcher_size;
+	__uapi_arch_pad_long;
 	unsigned char data[] __attribute__ ((aligned (__alignof__(struct ebt_r=
eplace))));
-};
+} __uapi_arch_align;
=20
 struct ebt_entry_target {
 	union {
@@ -155,14 +161,16 @@ struct ebt_entry_target {
 	} u;
 	/* size of data */
 	unsigned int target_size;
+	__uapi_arch_pad_long;
 	unsigned char data[0] __attribute__ ((aligned (__alignof__(struct ebt_=
replace))));
-};
+} __uapi_arch_align;
=20
 #define EBT_STANDARD_TARGET "standard"
 struct ebt_standard_target {
 	struct ebt_entry_target target;
 	int verdict;
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 /* one entry */
 struct ebt_entry {
@@ -182,6 +190,7 @@ struct ebt_entry {
 	unsigned char sourcemsk[ETH_ALEN];
 	unsigned char destmac[ETH_ALEN];
 	unsigned char destmsk[ETH_ALEN];
+	__uapi_arch_pad16;
 	__struct_group(/* no tag */, offsets, /* no attrs */,
 		/* sizeof ebt_entry + matches */
 		unsigned int watchers_offset;
diff --git a/include/uapi/linux/netfilter_ipv4/ip_tables.h b/include/uap=
i/linux/netfilter_ipv4/ip_tables.h
index 1485df28b239..d28a7a1f25a4 100644
--- a/include/uapi/linux/netfilter_ipv4/ip_tables.h
+++ b/include/uapi/linux/netfilter_ipv4/ip_tables.h
@@ -201,10 +201,11 @@ struct ipt_replace {
 	unsigned int num_counters;
 	/* The old entries' counters. */
 	struct xt_counters __user *counters;
+	__uapi_arch_pad_long_to_u64;
=20
 	/* The entries (hang off end: not really an array). */
 	struct ipt_entry entries[];
-};
+} __uapi_arch_align;
=20
 /* The argument to IPT_SO_GET_ENTRIES. */
 struct ipt_get_entries {
@@ -213,10 +214,11 @@ struct ipt_get_entries {
=20
 	/* User fills this in: total entry size. */
 	unsigned int size;
+	__uapi_arch_pad32;
=20
 	/* The entries. */
 	struct ipt_entry entrytable[];
-};
+} __uapi_arch_align;
=20
 /* Helper functions */
 static __inline__ struct xt_entry_target *
diff --git a/include/uapi/linux/netfilter_ipv4/ipt_CLUSTERIP.h b/include=
/uapi/linux/netfilter_ipv4/ipt_CLUSTERIP.h
index ff6599494fe6..0c53b583ba79 100644
--- a/include/uapi/linux/netfilter_ipv4/ipt_CLUSTERIP.h
+++ b/include/uapi/linux/netfilter_ipv4/ipt_CLUSTERIP.h
@@ -28,11 +28,12 @@ struct ipt_clusterip_tgt_info {
 	__u16 num_total_nodes;
 	__u16 num_local_nodes;
 	__u16 local_nodes[CLUSTERIP_MAX_NODES];
+	__uapi_arch_pad16;
 	__u32 hash_mode;
 	__u32 hash_initval;
=20
 	/* Used internally by the kernel */
 	struct clusterip_config *config;
-};
+} __uapi_arch_align;
=20
 #endif /*_IPT_CLUSTERIP_H_target*/
diff --git a/include/uapi/linux/netfilter_ipv4/ipt_ECN.h b/include/uapi/=
linux/netfilter_ipv4/ipt_ECN.h
index e3630fd045b8..67664b33e4fb 100644
--- a/include/uapi/linux/netfilter_ipv4/ipt_ECN.h
+++ b/include/uapi/linux/netfilter_ipv4/ipt_ECN.h
@@ -27,6 +27,7 @@ struct ipt_ECN_info {
 	union {
 		struct {
 			__u8 ece:1, cwr:1; /* TCP ECT bits */
+			__u8 :6;
 		} tcp;
 	} proto;
 };
diff --git a/include/uapi/linux/netfilter_ipv4/ipt_ah.h b/include/uapi/l=
inux/netfilter_ipv4/ipt_ah.h
index 606ce90dbf83..e549de3af1ca 100644
--- a/include/uapi/linux/netfilter_ipv4/ipt_ah.h
+++ b/include/uapi/linux/netfilter_ipv4/ipt_ah.h
@@ -7,7 +7,9 @@
 struct ipt_ah {
 	__u32 spis[2];			/* Security Parameter Index */
 	__u8  invflags;			/* Inverse flags */
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
=20
=20
diff --git a/include/uapi/linux/netfilter_ipv6/ip6_tables.h b/include/ua=
pi/linux/netfilter_ipv6/ip6_tables.h
index 766e8e0bcc68..0bafd0695d14 100644
--- a/include/uapi/linux/netfilter_ipv6/ip6_tables.h
+++ b/include/uapi/linux/netfilter_ipv6/ip6_tables.h
@@ -85,7 +85,9 @@ struct ip6t_ip6 {
 	__u8 flags;
 	/* Inverse flags */
 	__u8 invflags;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /* Values for "flag" field in struct ip6t_ip6 (general ip6 structure). =
*/
 #define IP6T_F_PROTO		0x01	/* Set if rule cares about upper=20
@@ -120,19 +122,21 @@ struct ip6t_entry {
=20
 	/* Back pointer */
 	unsigned int comefrom;
+	__uapi_arch_pad32;
=20
 	/* Packet and byte counters. */
 	struct xt_counters counters;
=20
 	/* The matches (if any), then the target. */
 	unsigned char elems[0];
-};
+} __uapi_arch_align;
=20
 /* Standard entry */
 struct ip6t_standard {
 	struct ip6t_entry entry;
 	struct xt_standard_target target;
-};
+	__uapi_arch_pad_long_to_u64;
+} __uapi_arch_align;
=20
 struct ip6t_error {
 	struct ip6t_entry entry;
@@ -241,10 +245,11 @@ struct ip6t_replace {
 	unsigned int num_counters;
 	/* The old entries' counters. */
 	struct xt_counters __user *counters;
+	__uapi_arch_pad_long_to_u64;
=20
 	/* The entries (hang off end: not really an array). */
 	struct ip6t_entry entries[];
-};
+} __uapi_arch_align;
=20
 /* The argument to IP6T_SO_GET_ENTRIES. */
 struct ip6t_get_entries {
@@ -253,10 +258,11 @@ struct ip6t_get_entries {
=20
 	/* User fills this in: total entry size. */
 	unsigned int size;
+	__uapi_arch_pad32;
=20
 	/* The entries. */
 	struct ip6t_entry entrytable[];
-};
+} __uapi_arch_align;;
=20
 /* Helper functions */
 static __inline__ struct xt_entry_target *
diff --git a/include/uapi/linux/netfilter_ipv6/ip6t_ah.h b/include/uapi/=
linux/netfilter_ipv6/ip6t_ah.h
index 9a4174e08f9c..cc47bfde6d77 100644
--- a/include/uapi/linux/netfilter_ipv6/ip6t_ah.h
+++ b/include/uapi/linux/netfilter_ipv6/ip6t_ah.h
@@ -9,7 +9,8 @@ struct ip6t_ah {
 	__u32 hdrlen;			/* Header Length */
 	__u8  hdrres;			/* Test of the Reserved Filed */
 	__u8  invflags;			/* Inverse flags */
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 #define IP6T_AH_SPI 0x01
 #define IP6T_AH_LEN 0x02
diff --git a/include/uapi/linux/netfilter_ipv6/ip6t_frag.h b/include/uap=
i/linux/netfilter_ipv6/ip6t_frag.h
index 9acac816bba3..d4d4c39a1fda 100644
--- a/include/uapi/linux/netfilter_ipv6/ip6t_frag.h
+++ b/include/uapi/linux/netfilter_ipv6/ip6t_frag.h
@@ -9,7 +9,8 @@ struct ip6t_frag {
 	__u32 hdrlen;			/* Header Length */
 	__u8  flags;			/* Flags */
 	__u8  invflags;			/* Inverse flags */
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 #define IP6T_FRAG_IDS 		0x01
 #define IP6T_FRAG_LEN 		0x02
diff --git a/include/uapi/linux/netfilter_ipv6/ip6t_opts.h b/include/uap=
i/linux/netfilter_ipv6/ip6t_opts.h
index 79f9a477c5ac..c017bf4acd0f 100644
--- a/include/uapi/linux/netfilter_ipv6/ip6t_opts.h
+++ b/include/uapi/linux/netfilter_ipv6/ip6t_opts.h
@@ -12,7 +12,8 @@ struct ip6t_opts {
 	__u8 invflags;			/* Inverse flags */
 	__u16 opts[IP6T_OPTS_OPTSNR];	/* opts */
 	__u8 optsnr;			/* Nr of OPts */
-};
+	__uapi_arch_pad8;
+} __uapi_arch_align;
=20
 #define IP6T_OPTS_LEN 		0x01
 #define IP6T_OPTS_OPTS 		0x02
diff --git a/include/uapi/linux/netfilter_ipv6/ip6t_rt.h b/include/uapi/=
linux/netfilter_ipv6/ip6t_rt.h
index 9c23e8ad20b9..5cf2eaee7947 100644
--- a/include/uapi/linux/netfilter_ipv6/ip6t_rt.h
+++ b/include/uapi/linux/netfilter_ipv6/ip6t_rt.h
@@ -13,9 +13,12 @@ struct ip6t_rt {
 	__u32 hdrlen;			/* Header Length */
 	__u8  flags;			/*  */
 	__u8  invflags;			/* Inverse flags */
+	__uapi_arch_pad16;
 	struct in6_addr addrs[IP6T_RT_HOPS];	/* Hops */
 	__u8 addrnr;			/* Nr of Addresses */
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 #define IP6T_RT_TYP 		0x01
 #define IP6T_RT_SGS 		0x02
diff --git a/include/uapi/linux/netfilter_ipv6/ip6t_srh.h b/include/uapi=
/linux/netfilter_ipv6/ip6t_srh.h
index 80c66c8ece82..8df02e42ef21 100644
--- a/include/uapi/linux/netfilter_ipv6/ip6t_srh.h
+++ b/include/uapi/linux/netfilter_ipv6/ip6t_srh.h
@@ -83,6 +83,7 @@ struct ip6t_srh1 {
 	__u8                    segs_left;
 	__u8                    last_entry;
 	__u16                   tag;
+	__uapi_arch_pad16;
 	struct in6_addr         psid_addr;
 	struct in6_addr         nsid_addr;
 	struct in6_addr         lsid_addr;
@@ -91,6 +92,6 @@ struct ip6t_srh1 {
 	struct in6_addr         lsid_msk;
 	__u16                   mt_flags;
 	__u16                   mt_invflags;
-};
+} __uapi_arch_align;
=20
 #endif /*_IP6T_SRH_H*/
diff --git a/include/uapi/linux/netrom.h b/include/uapi/linux/netrom.h
index 7498ea3c3940..77331df1dacc 100644
--- a/include/uapi/linux/netrom.h
+++ b/include/uapi/linux/netrom.h
@@ -26,12 +26,14 @@ struct nr_route_struct {
 	int		type;
 	ax25_address	callsign;
 	char		device[16];
+	__uapi_arch_pad8;
 	unsigned int	quality;
 	char		mnemonic[7];
 	ax25_address	neighbour;
+	__uapi_arch_pad16;
 	unsigned int	obs_count;
 	unsigned int	ndigis;
 	ax25_address	digipeaters[AX25_MAX_DIGIS];
-};
+} __uapi_arch_align;
=20
 #endif
diff --git a/include/uapi/linux/nfc.h b/include/uapi/linux/nfc.h
index 2f5b4be25261..6de91dcf1dee 100644
--- a/include/uapi/linux/nfc.h
+++ b/include/uapi/linux/nfc.h
@@ -267,22 +267,27 @@ enum nfc_sdp_attr {
=20
 struct sockaddr_nfc {
 	__kernel_sa_family_t sa_family;
+	__uapi_arch_pad16;
 	__u32 dev_idx;
 	__u32 target_idx;
 	__u32 nfc_protocol;
-};
+} __uapi_arch_align;
=20
 #define NFC_LLCP_MAX_SERVICE_NAME 63
 struct sockaddr_nfc_llcp {
 	__kernel_sa_family_t sa_family;
+	__uapi_arch_pad16;
 	__u32 dev_idx;
 	__u32 target_idx;
 	__u32 nfc_protocol;
 	__u8 dsap; /* Destination SAP, if known */
 	__u8 ssap; /* Source SAP to be bound to */
 	char service_name[NFC_LLCP_MAX_SERVICE_NAME]; /* Service name URI */;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+	__uapi_arch_pad_long;
 	__kernel_size_t service_name_len;
-};
+} __uapi_arch_align;
=20
 /* NFC socket protocols */
 #define NFC_SOCKPROTO_RAW	0
diff --git a/include/uapi/linux/nfs4_mount.h b/include/uapi/linux/nfs4_m=
ount.h
index d20bb869bb99..ce88876a07f1 100644
--- a/include/uapi/linux/nfs4_mount.h
+++ b/include/uapi/linux/nfs4_mount.h
@@ -2,6 +2,8 @@
 #ifndef _LINUX_NFS4_MOUNT_H
 #define _LINUX_NFS4_MOUNT_H
=20
+#include <linux/types.h>
+
 /*
  *  linux/include/linux/nfs4_mount.h
  *
@@ -21,8 +23,9 @@
=20
 struct nfs_string {
 	unsigned int len;
+	__uapi_arch_pad_long;
 	const char __user * data;
-};
+} __uapi_arch_align;
=20
 struct nfs4_mount_data {
 	int version;				/* 1 */
@@ -46,6 +49,7 @@ struct nfs4_mount_data {
 	struct nfs_string hostname;		/* 1 */
 	/* Server IP address */
 	unsigned int host_addrlen;		/* 1 */
+	__uapi_arch_pad_long;
 	struct sockaddr __user * host_addr;	/* 1 */
=20
 	/* Transport protocol to use */
@@ -54,7 +58,7 @@ struct nfs4_mount_data {
 	/* Pseudo-flavours to use for authentication. See RFC2623 */
 	int auth_flavourlen;			/* 1 */
 	int __user *auth_flavours;		/* 1 */
-};
+} __uapi_arch_align;
=20
 /* bits in the flags field */
 /* Note: the fields that correspond to existing NFSv2/v3 mount options
diff --git a/include/uapi/linux/nfs_idmap.h b/include/uapi/linux/nfs_idm=
ap.h
index 038e36c96669..1c76af3dbf96 100644
--- a/include/uapi/linux/nfs_idmap.h
+++ b/include/uapi/linux/nfs_idmap.h
@@ -57,9 +57,12 @@ struct idmap_msg {
 	__u8  im_type;
 	__u8  im_conv;
 	char  im_name[IDMAP_NAMESZ];
+	__uapi_arch_pad16;
 	__u32 im_id;
 	__u8  im_status;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
=20
 #endif /* _UAPINFS_IDMAP_H */
diff --git a/include/uapi/linux/nfs_mount.h b/include/uapi/linux/nfs_mou=
nt.h
index e3bcfc6aa3b0..cbba0c00fddb 100644
--- a/include/uapi/linux/nfs_mount.h
+++ b/include/uapi/linux/nfs_mount.h
@@ -42,9 +42,12 @@ struct nfs_mount_data {
 	int		namlen;			/* 2 */
 	unsigned int	bsize;			/* 3 */
 	struct nfs3_fh	root;			/* 4 */
+	__uapi_arch_pad16;
 	int		pseudoflavor;		/* 5 */
 	char		context[NFS_MAX_CONTEXT_LEN + 1];	/* 6 */
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /* bits in the flags field visible to user space */
=20
diff --git a/include/uapi/linux/nilfs2_ondisk.h b/include/uapi/linux/nil=
fs2_ondisk.h
index 3196cc44a002..479e56628e7a 100644
--- a/include/uapi/linux/nilfs2_ondisk.h
+++ b/include/uapi/linux/nilfs2_ondisk.h
@@ -305,6 +305,7 @@ struct nilfs_dir_entry {
 	__u8	file_type;		/* Dir entry type (file, dir, etc) */
 	char	name[NILFS_NAME_LEN];	/* File name */
 	char    pad;
+	__uapi_arch_pad32;
 };
=20
 /*
diff --git a/include/uapi/linux/nvme_ioctl.h b/include/uapi/linux/nvme_i=
octl.h
index 2f76cba67166..4d0a252057ad 100644
--- a/include/uapi/linux/nvme_ioctl.h
+++ b/include/uapi/linux/nvme_ioctl.h
@@ -22,7 +22,8 @@ struct nvme_user_io {
 	__u32	reftag;
 	__u16	apptag;
 	__u16	appmask;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 struct nvme_passthru_cmd {
 	__u8	opcode;
diff --git a/include/uapi/linux/omap3isp.h b/include/uapi/linux/omap3isp=
.h
index d9db7ad43890..8f34fe5c0767 100644
--- a/include/uapi/linux/omap3isp.h
+++ b/include/uapi/linux/omap3isp.h
@@ -77,7 +77,8 @@ struct omap3isp_stat_event_status {
 	__u32 frame_number;
 	__u16 config_counter;
 	__u8 buf_err;
-};
+	__uapi_arch_pad8;
+} __uapi_arch_align;
=20
 /* AE/AWB related structures and flags*/
=20
@@ -156,7 +157,9 @@ struct omap3isp_h3a_aewb_config {
 	__u16 subsample_ver_inc;
 	__u16 subsample_hor_inc;
 	__u8 alaw_enable;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /**
  * struct omap3isp_stat_data - Statistic data sent to or received from =
user
@@ -182,7 +185,9 @@ struct omap3isp_stat_data {
 		__u16 frame_number;
 		__u16 cur_frame;
 		__u16 config_counter;
+		__uapi_arch_pad16;
 	);
+	__uapi_arch_pad_long;
 };
=20
 #ifdef __KERNEL__
@@ -197,6 +202,7 @@ struct omap3isp_stat_data_time32 {
 		__u16 frame_number;
 		__u16 cur_frame;
 		__u16 config_counter;
+		__uapi_arch_pad16;
 	);
 };
 #endif
@@ -248,6 +254,7 @@ struct omap3isp_hist_config {
=20
 	__u8 num_acc_frames;	/* Num of image frames to be processed and
 				   accumulated for each histogram frame */
+	__uapi_arch_pad8;
 	__u16 hist_bins;	/* number of bins: 32, 64, 128, or 256 */
 	__u8 cfa;		/* BAYER or FOVEON X3 */
 	__u8 wg[OMAP3ISP_HIST_MAX_WG];	/* White Balance Gain */
@@ -296,7 +303,8 @@ struct omap3isp_h3a_af_paxel {
 	__u8 h_cnt;	/* Horizontal Count */
 	__u8 v_cnt;	/* vertical Count */
 	__u8 line_inc;	/* Line Increment */
-};
+	__uapi_arch_pad8;
+} __uapi_arch_align;
=20
 /* Contains the parameters required for hardware set up of AF Engine */
 struct omap3isp_h3a_af_config {
@@ -314,7 +322,9 @@ struct omap3isp_h3a_af_config {
 	enum omap3isp_h3a_af_rgbpos rgb_pos;	/* RGB Positions */
 	enum omap3isp_h3a_af_fvmode fvmode;	/* Accumulator mode */
 	__u8 alaw_enable;			/* AF ALAW status */
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /* ISP CCDC structs */
=20
@@ -360,6 +370,7 @@ struct omap3isp_ccdc_lsc_config {
 	__u8 gain_mode_n;
 	__u8 gain_mode_m;
 	__u8 gain_format;
+	__uapi_arch_pad8;
 	__u16 fmtsph;
 	__u16 fmtlnh;
 	__u16 fmtslv;
@@ -392,6 +403,7 @@ struct omap3isp_ccdc_bclamp {
  */
 struct omap3isp_ccdc_fpc {
 	__u16 fpnum;
+	__uapi_arch_pad16;
 	__u32 fpcaddr;
 };
=20
@@ -417,6 +429,7 @@ struct omap3isp_ccdc_blcomp {
  */
 struct omap3isp_ccdc_culling {
 	__u8 v_pattern;
+	__uapi_arch_pad8;
 	__u16 h_odd;
 	__u16 h_even;
 };
@@ -507,8 +520,9 @@ struct omap3isp_prev_cfa {
 	enum omap3isp_cfa_fmt format;
 	__u8 gradthrs_vert;
 	__u8 gradthrs_horz;
+	__uapi_arch_pad16;
 	__u32 table[4][OMAP3ISP_PREV_CFA_BLK_SIZE];
-};
+} __uapi_arch_align;
=20
 /**
  * struct omap3isp_prev_csup - Chrominance Suppression
@@ -600,8 +614,10 @@ struct omap3isp_prev_yclimit {
  */
 struct omap3isp_prev_dcor {
 	__u8 couplet_mode_en;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	__u32 detect_correct[OMAP3ISP_PREV_DETECT_CORRECT_CHANNELS];
-};
+} __uapi_arch_align;
=20
 /**
  * struct omap3isp_prev_nf - Noise Filter
@@ -610,6 +626,8 @@ struct omap3isp_prev_dcor {
  */
 struct omap3isp_prev_nf {
 	__u8 spread;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	__u32 table[OMAP3ISP_PREV_NF_TBL_SIZE];
 };
=20
@@ -657,6 +675,7 @@ struct omap3isp_prev_update_config {
 	__u32 update;
 	__u32 flag;
 	__u32 shading_shift;
+	__uapi_arch_pad_long;
 	struct omap3isp_prev_luma __user *luma;
 	struct omap3isp_prev_hmed __user *hmed;
 	struct omap3isp_prev_cfa __user *cfa;
@@ -669,6 +688,6 @@ struct omap3isp_prev_update_config {
 	struct omap3isp_prev_dcor __user *dcor;
 	struct omap3isp_prev_nf __user *nf;
 	struct omap3isp_prev_gtables __user *gamma;
-};
+} __uapi_arch_align;
=20
 #endif	/* OMAP3_ISP_USER_H */
diff --git a/include/uapi/linux/omapfb.h b/include/uapi/linux/omapfb.h
index 44f43af4c699..d573f868485f 100644
--- a/include/uapi/linux/omapfb.h
+++ b/include/uapi/linux/omapfb.h
@@ -166,10 +166,14 @@ enum omapfb_color_key_type {
=20
 struct omapfb_color_key {
 	__u8  channel_out;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	__u32 background;
 	__u32 trans_key;
 	__u8  key_type;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 enum omapfb_update_mode {
 	OMAPFB_UPDATE_DISABLED =3D 0,
@@ -182,20 +186,21 @@ struct omapfb_memory_read {
 	__u16 y;
 	__u16 w;
 	__u16 h;
-	size_t buffer_size;
+	__kernel_size_t buffer_size;
 	void __user *buffer;
 };
=20
 struct omapfb_ovl_colormode {
 	__u8 overlay_idx;
 	__u8 mode_idx;
+	__uapi_arch_pad16;
 	__u32 bits_per_pixel;
 	__u32 nonstd;
 	struct fb_bitfield red;
 	struct fb_bitfield green;
 	struct fb_bitfield blue;
 	struct fb_bitfield transp;
-};
+} __uapi_arch_align;
=20
 struct omapfb_vram_info {
 	__u32 total;
diff --git a/include/uapi/linux/openvswitch.h b/include/uapi/linux/openv=
switch.h
index 3092c2c6f1d2..8b22ec2d79c2 100644
--- a/include/uapi/linux/openvswitch.h
+++ b/include/uapi/linux/openvswitch.h
@@ -500,7 +500,8 @@ struct ovs_key_arp {
 	__be16 arp_op;
 	__u8   arp_sha[ETH_ALEN];
 	__u8   arp_tha[ETH_ALEN];
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 struct ovs_key_nd {
 	__be32	nd_target[4];
@@ -540,7 +541,9 @@ struct ovs_key_ct_tuple_ipv4 {
 	__be16 src_port;
 	__be16 dst_port;
 	__u8   ipv4_proto;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 struct ovs_key_ct_tuple_ipv6 {
 	__be32 ipv6_src[4];
@@ -548,7 +551,9 @@ struct ovs_key_ct_tuple_ipv6 {
 	__be16 src_port;
 	__be16 dst_port;
 	__u8   ipv6_proto;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 enum ovs_nsh_key_attr {
 	OVS_NSH_KEY_ATTR_UNSPEC,
@@ -719,7 +724,8 @@ struct ovs_action_trunc {
 struct ovs_action_push_mpls {
 	__be32 mpls_lse;
 	__be16 mpls_ethertype; /* Either %ETH_P_MPLS_UC or %ETH_P_MPLS_MC */
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /**
  * struct ovs_action_add_mpls - %OVS_ACTION_ATTR_ADD_MPLS action
diff --git a/include/uapi/linux/papr_pdsm.h b/include/uapi/linux/papr_pd=
sm.h
index 17439925045c..1a9b26ade6cc 100644
--- a/include/uapi/linux/papr_pdsm.h
+++ b/include/uapi/linux/papr_pdsm.h
@@ -108,10 +108,11 @@ struct nd_papr_pdsm_health {
=20
 			/* Extension flag PDSM_DIMM_HEALTH_RUN_GAUGE_VALID */
 			__u16 dimm_fuel_gauge;
+			__uapi_arch_pad16;
=20
 			/* Extension flag PDSM_DIMM_DSC_VALID */
 			__u64 dimm_dsc;
-		};
+		} __uapi_arch_align;
 		__u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
 	};
 };
@@ -127,7 +128,8 @@ struct nd_papr_pdsm_smart_inject {
 			__u32 flags;
 			__u8 fatal_enable;
 			__u8 unsafe_shutdown_enable;
-		};
+			__uapi_arch_pad16;
+		} __uapi_arch_align;
 		__u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
 	};
 };
diff --git a/include/uapi/linux/patchkey.h b/include/uapi/linux/patchkey=
.h
index 3eb246e94733..3d3a3f90e972 100644
--- a/include/uapi/linux/patchkey.h
+++ b/include/uapi/linux/patchkey.h
@@ -11,9 +11,6 @@
  * For kernel code, use <linux/soundcard.h>
  */
=20
-#ifndef _LINUX_PATCHKEY_H_INDIRECT
-#error "patchkey.h included directly"
-#endif
=20
 #ifndef _UAPI_LINUX_PATCHKEY_H
 #define _UAPI_LINUX_PATCHKEY_H
diff --git a/include/uapi/linux/pcitest.h b/include/uapi/linux/pcitest.h
index d6023a45a9d0..ee50691517a2 100644
--- a/include/uapi/linux/pcitest.h
+++ b/include/uapi/linux/pcitest.h
@@ -10,6 +10,8 @@
 #ifndef __UAPI_LINUX_PCITEST_H
 #define __UAPI_LINUX_PCITEST_H
=20
+#include <linux/types.h>
+
 #define PCITEST_BAR		_IO('P', 0x1)
 #define PCITEST_INTX_IRQ	_IO('P', 0x2)
 #define PCITEST_LEGACY_IRQ	PCITEST_INTX_IRQ
@@ -35,6 +37,9 @@
 struct pci_endpoint_test_xfer_param {
 	unsigned long size;
 	unsigned char flags;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 #endif /* __UAPI_LINUX_PCITEST_H */
diff --git a/include/uapi/linux/pfrut.h b/include/uapi/linux/pfrut.h
index b77d5c210c26..a5c57be914b2 100644
--- a/include/uapi/linux/pfrut.h
+++ b/include/uapi/linux/pfrut.h
@@ -152,7 +152,8 @@ struct pfru_com_buf_info {
 	__u64 addr_lo;
 	__u64 addr_hi;
 	__u32 buf_size;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /**
  * struct pfru_updated_result - Platform firmware runtime update result=
 information.
@@ -204,7 +205,8 @@ struct pfrt_log_data_info {
 	__u32 chunk2_size;
 	__u32 rollover_cnt;
 	__u32 reset_cnt;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /**
  * struct pfrt_log_info - Telemetry log information.
diff --git a/include/uapi/linux/pg.h b/include/uapi/linux/pg.h
index 62b6f69bd9fb..ef49106b96f0 100644
--- a/include/uapi/linux/pg.h
+++ b/include/uapi/linux/pg.h
@@ -38,6 +38,8 @@
 #ifndef _UAPI_LINUX_PG_H
 #define _UAPI_LINUX_PG_H
=20
+#include <linux/types.h>
+
 #define PG_MAGIC	'P'
 #define PG_RESET	'Z'
 #define PG_COMMAND	'C'
@@ -48,20 +50,22 @@ struct pg_write_hdr {
=20
 	char	magic;		/* =3D=3D PG_MAGIC */
 	char	func;		/* PG_RESET or PG_COMMAND */
+	__uapi_arch_pad16;
 	int     dlen;		/* number of bytes expected to transfer */
 	int     timeout;	/* number of seconds before timeout */
 	char	packet[12];	/* packet command */
=20
-};
+} __uapi_arch_align;
=20
 struct pg_read_hdr {
=20
 	char	magic;		/* =3D=3D PG_MAGIC */
 	char	scsi;		/* "scsi" status =3D=3D sense key */
+	__uapi_arch_pad16;
 	int	dlen;		/* size of device transfer request */
 	int     duration;	/* time in seconds command took */
 	char    pad[12];	/* not used */
=20
-};
+} __uapi_arch_align;
=20
 #endif /* _UAPI_LINUX_PG_H */
diff --git a/include/uapi/linux/phonet.h b/include/uapi/linux/phonet.h
index a2f6b37a5937..77d637527742 100644
--- a/include/uapi/linux/phonet.h
+++ b/include/uapi/linux/phonet.h
@@ -104,7 +104,7 @@ struct sockaddr_pn {
 	__u8 spn_obj;
 	__u8 spn_dev;
 	__u8 spn_resource;
-	__u8 spn_zero[sizeof(struct sockaddr) - sizeof(__kernel_sa_family_t) -=
 3];
+	__u8 spn_zero[sizeof(struct __kernel_sockaddr) - sizeof(__kernel_sa_fa=
mily_t) - 3];
 } __attribute__((packed));
=20
 /* Well known address */
diff --git a/include/uapi/linux/pkt_cls.h b/include/uapi/linux/pkt_cls.h
index 28d94b11d1aa..ae1d3499f817 100644
--- a/include/uapi/linux/pkt_cls.h
+++ b/include/uapi/linux/pkt_cls.h
@@ -251,6 +251,7 @@ struct tc_u32_sel {
 		unsigned char		flags;
 		unsigned char		offshift;
 		unsigned char		nkeys;
+		__uapi_arch_pad8;
=20
 		__be16			offmask;
 		__u16			off;
@@ -260,7 +261,7 @@ struct tc_u32_sel {
 		__be32			hmask;
 	);
 	struct tc_u32_key	keys[];
-};
+} __uapi_arch_align;
=20
 struct tc_u32_mark {
 	__u32		val;
diff --git a/include/uapi/linux/pkt_sched.h b/include/uapi/linux/pkt_sch=
ed.h
index c2da76e78bad..3c2267a2c776 100644
--- a/include/uapi/linux/pkt_sched.h
+++ b/include/uapi/linux/pkt_sched.h
@@ -41,7 +41,8 @@ struct tc_stats {
 	__u32	pps;			/* Current flow packet rate */
 	__u32	qlen;
 	__u32	backlog;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 struct tc_estimator {
 	signed char	interval;
diff --git a/include/uapi/linux/ppp-ioctl.h b/include/uapi/linux/ppp-ioc=
tl.h
index 1cc5ce0ae062..42b00dd923e0 100644
--- a/include/uapi/linux/ppp-ioctl.h
+++ b/include/uapi/linux/ppp-ioctl.h
@@ -69,6 +69,7 @@ struct pppol2tp_ioc_stats {
 	__u16		tunnel_id;	/* redundant */
 	__u16		session_id;	/* if zero, get tunnel stats */
 	__u32		using_ipsec:1;
+	__u32		:31;
 	__aligned_u64	tx_packets;
 	__aligned_u64	tx_bytes;
 	__aligned_u64	tx_errors;
diff --git a/include/uapi/linux/pps.h b/include/uapi/linux/pps.h
index 009ebcd8ced5..e156cdc0344b 100644
--- a/include/uapi/linux/pps.h
+++ b/include/uapi/linux/pps.h
@@ -70,7 +70,8 @@ struct pps_kinfo {
 	struct pps_ktime assert_tu;	/* time of assert event */
 	struct pps_ktime clear_tu;	/* time of clear event */
 	int current_mode;		/* current mode bits */
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 struct pps_kinfo_compat {
 	__u32 assert_sequence;			/* seq. num. of assert event */
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 9b4afdc85099..dd60afe50a9f 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -146,7 +146,8 @@ struct prctl_mm_map {
 	__u64	*auxv;			/* auxiliary vector */
 	__u32	auxv_size;		/* vector size */
 	__u32	exe_fd;			/* /proc/$pid/exe link file */
-};
+	__uapi_arch_pad_long_to_u64;
+} __uapi_arch_align;
=20
 /*
  * Set specific pid that is allowed to ptrace the current task.
diff --git a/include/uapi/linux/ptrace.h b/include/uapi/linux/ptrace.h
index 5f8ef6156752..9933081e51d1 100644
--- a/include/uapi/linux/ptrace.h
+++ b/include/uapi/linux/ptrace.h
@@ -95,7 +95,10 @@ struct ptrace_syscall_info {
 		struct {
 			__s64 rval;
 			__u8 is_error;
-		} exit;
+			__uapi_arch_pad8;
+			__uapi_arch_pad16;
+			__uapi_arch_pad32;
+		} __uapi_arch_align exit;
 		struct {
 			__u64 nr;
 			__u64 args[6];
diff --git a/include/uapi/linux/qrtr.h b/include/uapi/linux/qrtr.h
index f7e2fb3d752b..cd15d8465a60 100644
--- a/include/uapi/linux/qrtr.h
+++ b/include/uapi/linux/qrtr.h
@@ -10,9 +10,10 @@
=20
 struct sockaddr_qrtr {
 	__kernel_sa_family_t sq_family;
+	__uapi_arch_pad16;
 	__u32 sq_node;
 	__u32 sq_port;
-};
+} __uapi_arch_align;
=20
 enum qrtr_pkt_type {
 	QRTR_TYPE_DATA		=3D 1,
diff --git a/include/uapi/linux/quota.h b/include/uapi/linux/quota.h
index 52090105b828..fd43e3c2b481 100644
--- a/include/uapi/linux/quota.h
+++ b/include/uapi/linux/quota.h
@@ -118,7 +118,8 @@ struct if_dqblk {
 	__u64 dqb_btime;
 	__u64 dqb_itime;
 	__u32 dqb_valid;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 struct if_nextdqblk {
 	__u64 dqb_bhardlimit;
diff --git a/include/uapi/linux/rds.h b/include/uapi/linux/rds.h
index 4f999cb5c28e..c92028339d07 100644
--- a/include/uapi/linux/rds.h
+++ b/include/uapi/linux/rds.h
@@ -263,8 +263,9 @@ struct rds_info_rdma_connection {
 	__u32		rdma_mr_size;
 	__u8		tos;
 	__u8		sl;
+	__uapi_arch_pad16;
 	__u32		cache_allocs;
-};
+} __uapi_arch_align;
=20
 struct rds6_info_rdma_connection {
 	struct in6_addr	src_addr;
@@ -279,8 +280,9 @@ struct rds6_info_rdma_connection {
 	__u32		rdma_mr_size;
 	__u8		tos;
 	__u8		sl;
+	__uapi_arch_pad16;
 	__u32		cache_allocs;
-};
+} __uapi_arch_align;
=20
 /* RDS message Receive Path Latency points */
 enum rds_message_rxpath_latency {
@@ -298,8 +300,9 @@ struct rds_rx_trace_so {
 struct rds_cmsg_rx_trace {
 	__u8 rx_traces;
 	__u8 rx_trace_pos[RDS_MSG_RX_DGRAM_TRACE_MAX];
+	__uapi_arch_pad32;
 	__u64 rx_trace[RDS_MSG_RX_DGRAM_TRACE_MAX];
-};
+} __uapi_arch_align;
=20
 /*
  * Congestion monitoring.
@@ -403,7 +406,8 @@ struct rds_atomic_args {
 struct rds_rdma_notify {
 	__u64		user_token;
 	__s32		status;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 #define RDS_RDMA_SUCCESS	0
 #define RDS_RDMA_REMOTE_ERROR	1
diff --git a/include/uapi/linux/rio_cm_cdev.h b/include/uapi/linux/rio_c=
m_cdev.h
index d05dc3226f8e..6c6c8245a314 100644
--- a/include/uapi/linux/rio_cm_cdev.h
+++ b/include/uapi/linux/rio_cm_cdev.h
@@ -46,7 +46,8 @@ struct rio_cm_channel {
 	__u16 remote_channel;
 	__u16 remote_destid;
 	__u8 mport_id;
-};
+	__uapi_arch_pad8;
+} __uapi_arch_align;
=20
 struct rio_cm_msg {
 	__u16 ch_num;
diff --git a/include/uapi/linux/rio_mport_cdev.h b/include/uapi/linux/ri=
o_mport_cdev.h
index 9bc9f98e353a..4da432dcb138 100644
--- a/include/uapi/linux/rio_mport_cdev.h
+++ b/include/uapi/linux/rio_mport_cdev.h
@@ -221,7 +221,9 @@ struct rio_rdev_info {
 	__u8 pad0;
 	__u32 comptag;
 	char name[RIO_MAX_DEVNAME_SZ + 1];
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /* Driver IOCTL codes */
 #define RIO_MPORT_DRV_MAGIC           'm'
diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rki=
sp1-config.h
index b2d2a71f7baf..e4090e351e04 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -306,6 +306,7 @@ struct rkisp1_cif_isp_bls_config {
 	struct rkisp1_cif_isp_window bls_window1;
 	struct rkisp1_cif_isp_window bls_window2;
 	__u8 bls_samples;
+	__u8 :8;
 	struct rkisp1_cif_isp_bls_fixed_val fixed_val;
 };
=20
@@ -397,6 +398,7 @@ struct rkisp1_cif_isp_sdg_config {
 	struct rkisp1_cif_isp_gamma_corr_curve curve_r;
 	struct rkisp1_cif_isp_gamma_corr_curve curve_g;
 	struct rkisp1_cif_isp_gamma_corr_curve curve_b;
+	__u16 :16;
 	struct rkisp1_cif_isp_gamma_curve_x_axis_pnts xa_pnts;
 };
=20
@@ -557,6 +559,7 @@ struct rkisp1_cif_isp_flt_config {
 	__u8 grn_stage1;
 	__u8 chr_h_mode;
 	__u8 chr_v_mode;
+	__u8 :8;
 	__u32 thresh_bl0;
 	__u32 thresh_bl1;
 	__u32 thresh_sh0;
@@ -636,8 +639,10 @@ struct rkisp1_cif_isp_goc_config {
 struct rkisp1_cif_isp_hst_config {
 	__u32 mode;
 	__u8 histogram_predivider;
+	__u8 :8;
 	struct rkisp1_cif_isp_window meas_window;
 	__u8 hist_weight[RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE];
+	__u8 :8;
 };
=20
 /**
@@ -664,7 +669,9 @@ struct rkisp1_cif_isp_aec_config {
  */
 struct rkisp1_cif_isp_afc_config {
 	__u8 num_afm_win;
+	__u8 :8;
 	struct rkisp1_cif_isp_window afm_win[RKISP1_CIF_ISP_AFM_MAX_WINDOWS];
+	__u16 :16;
 	__u32 thres;
 	__u32 var_shift;
 };
@@ -721,6 +728,7 @@ enum rkisp1_cif_isp_dpf_nll_scale_mode {
  */
 struct rkisp1_cif_isp_dpf_nll {
 	__u16 coeff[RKISP1_CIF_ISP_DPF_MAX_NLF_COEFFS];
+	__u16 :16;
 	__u32 scale_mode;
 };
=20
@@ -826,12 +834,15 @@ struct rkisp1_cif_isp_isp_other_cfg {
 	struct rkisp1_cif_isp_awb_gain_config awb_gain_config;
 	struct rkisp1_cif_isp_flt_config flt_config;
 	struct rkisp1_cif_isp_bdm_config bdm_config;
+	__u8 :8;
 	struct rkisp1_cif_isp_ctk_config ctk_config;
+	__u16 :16;
 	struct rkisp1_cif_isp_goc_config goc_config;
 	struct rkisp1_cif_isp_dpf_config dpf_config;
 	struct rkisp1_cif_isp_dpf_strength_config dpf_strength_config;
 	struct rkisp1_cif_isp_cproc_config cproc_config;
 	struct rkisp1_cif_isp_ie_config ie_config;
+	__u16 :16;
 };
=20
 /**
@@ -917,7 +928,8 @@ struct rkisp1_cif_isp_compand_curve_config {
 struct rkisp1_cif_isp_wdr_tone_curve {
 	__u32 dY[RKISP1_CIF_ISP_WDR_CURVE_NUM_DY_REGS];
 	__u16 ym[RKISP1_CIF_ISP_WDR_CURVE_NUM_COEFF];
-};
+	__u16 :16;
+} ;
=20
 /**
  * struct rkisp1_cif_isp_wdr_iref_config - Illumination reference confi=
g for WDR.
@@ -965,6 +977,7 @@ struct rkisp1_cif_isp_wdr_config {
 	__u8 use_rgb_colorspace;
 	__u8 bypass_chroma_mapping;
 	__u8 use_iref;
+	__u16 :16;
 };
=20
 /*---------- PART2: Measurement Statistics ------------*/
@@ -986,6 +999,7 @@ struct rkisp1_cif_isp_awb_meas {
 	__u8 mean_y_or_g;
 	__u8 mean_cb_or_b;
 	__u8 mean_cr_or_r;
+	__u8 :8;
 };
=20
 /**
@@ -1030,6 +1044,7 @@ struct rkisp1_cif_isp_bls_meas_val {
  */
 struct rkisp1_cif_isp_ae_stat {
 	__u8 exp_mean[RKISP1_CIF_ISP_AE_MEAN_MAX];
+	__u8 :8;
 	struct rkisp1_cif_isp_bls_meas_val bls_val;
 };
=20
@@ -1095,6 +1110,7 @@ struct rkisp1_cif_isp_hist_stat {
 struct rkisp1_cif_isp_stat {
 	struct rkisp1_cif_isp_awb_stat awb;
 	struct rkisp1_cif_isp_ae_stat ae;
+	__u16 :16;
 	struct rkisp1_cif_isp_af_stat af;
 	struct rkisp1_cif_isp_hist_stat hist;
 };
@@ -1198,6 +1214,7 @@ enum rkisp1_ext_params_block_type {
 struct rkisp1_ext_params_bls_config {
 	struct rkisp1_ext_params_block_header header;
 	struct rkisp1_cif_isp_bls_config config;
+	__u32 :32; /* pad to alignment */
 } __attribute__((aligned(8)));
=20
 /**
@@ -1214,6 +1231,7 @@ struct rkisp1_ext_params_bls_config {
 struct rkisp1_ext_params_dpcc_config {
 	struct rkisp1_ext_params_block_header header;
 	struct rkisp1_cif_isp_dpcc_config config;
+	__u32 :32; /* pad to alignment */
 } __attribute__((aligned(8)));
=20
 /**
@@ -1246,6 +1264,7 @@ struct rkisp1_ext_params_sdg_config {
 struct rkisp1_ext_params_lsc_config {
 	struct rkisp1_ext_params_block_header header;
 	struct rkisp1_cif_isp_lsc_config config;
+	__u32 :32; /* pad to alignment */
 } __attribute__((aligned(8)));
=20
 /**
@@ -1293,6 +1312,10 @@ struct rkisp1_ext_params_flt_config {
 struct rkisp1_ext_params_bdm_config {
 	struct rkisp1_ext_params_block_header header;
 	struct rkisp1_cif_isp_bdm_config config;
+	/* pad to alignment */
+	__u8 :8;
+	__u16 :16;
+	__u32 :32;
 } __attribute__((aligned(8)));
=20
 /**
@@ -1356,6 +1379,8 @@ struct rkisp1_ext_params_dpf_config {
 struct rkisp1_ext_params_dpf_strength_config {
 	struct rkisp1_ext_params_block_header header;
 	struct rkisp1_cif_isp_dpf_strength_config config;
+	__u8 :8;
+	__u32 :32; /* pad to alignment */
 } __attribute__((aligned(8)));
=20
 /**
@@ -1372,6 +1397,7 @@ struct rkisp1_ext_params_dpf_strength_config {
 struct rkisp1_ext_params_cproc_config {
 	struct rkisp1_ext_params_block_header header;
 	struct rkisp1_cif_isp_cproc_config config;
+	__u8 :8; /* pad to alignment */
 } __attribute__((aligned(8)));
=20
 /**
@@ -1404,6 +1430,7 @@ struct rkisp1_ext_params_ie_config {
 struct rkisp1_ext_params_awb_meas_config {
 	struct rkisp1_ext_params_block_header header;
 	struct rkisp1_cif_isp_awb_meas_config config;
+	__u32 :32; /* pad to alignment */
 } __attribute__((aligned(8)));
=20
 /**
@@ -1452,6 +1479,7 @@ struct rkisp1_ext_params_aec_config {
 struct rkisp1_ext_params_afc_config {
 	struct rkisp1_ext_params_block_header header;
 	struct rkisp1_cif_isp_afc_config config;
+	__u32 :32; /* pad to alignment */
 } __attribute__((aligned(8)));
=20
 /**
@@ -1505,6 +1533,7 @@ struct rkisp1_ext_params_compand_curve_config {
 struct rkisp1_ext_params_wdr_config {
 	struct rkisp1_ext_params_block_header header;
 	struct rkisp1_cif_isp_wdr_config config;
+	__u32 :32; /* pad to alignment */
 } __attribute__((aligned(8)));
=20
 /*
diff --git a/include/uapi/linux/rose.h b/include/uapi/linux/rose.h
index 19aa4693c8fc..51a8dc0b5e48 100644
--- a/include/uapi/linux/rose.h
+++ b/include/uapi/linux/rose.h
@@ -51,26 +51,31 @@ struct sockaddr_rose {
 	__kernel_sa_family_t srose_family;
 	rose_address	srose_addr;
 	ax25_address	srose_call;
+	__uapi_arch_pad16;
 	int		srose_ndigis;
 	ax25_address	srose_digi;
-};
+	__uapi_arch_pad8;
+} __uapi_arch_align;
=20
 struct full_sockaddr_rose {
 	__kernel_sa_family_t srose_family;
 	rose_address	srose_addr;
 	ax25_address	srose_call;
+	__uapi_arch_pad16;
 	unsigned int	srose_ndigis;
 	ax25_address	srose_digis[ROSE_MAX_DIGIS];
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 struct rose_route_struct {
 	rose_address	address;
+	__uapi_arch_pad8;
 	unsigned short	mask;
 	ax25_address	neighbour;
 	char		device[16];
 	unsigned char	ndigis;
 	ax25_address	digipeaters[AX25_MAX_DIGIS];
-};
+} __uapi_arch_align;
=20
 struct rose_cause_struct {
 	unsigned char	cause;
@@ -83,9 +88,10 @@ struct rose_facilities_struct {
 	unsigned char	source_ndigis, dest_ndigis;
 	ax25_address	source_digis[ROSE_MAX_DIGIS];
 	ax25_address	dest_digis[ROSE_MAX_DIGIS];
+	__uapi_arch_pad16;
 	unsigned int	rand;
 	rose_address	fail_addr;
 	ax25_address	fail_call;
-};
+} __uapi_arch_align;
=20
 #endif
diff --git a/include/uapi/linux/route.h b/include/uapi/linux/route.h
index a0de9a7331a2..fa9facd58741 100644
--- a/include/uapi/linux/route.h
+++ b/include/uapi/linux/route.h
@@ -35,9 +35,12 @@ struct rtentry {
 	struct sockaddr	rt_genmask;	/* target network mask (IP)	*/
 	unsigned short	rt_flags;
 	short		rt_pad2;
+	__uapi_arch_pad_long;
 	unsigned long	rt_pad3;
 	void		*rt_pad4;
 	short		rt_metric;	/* +1 for binary compatibility!	*/
+	__uapi_arch_pad16;
+	__uapi_arch_pad_long;
 	char __user	*rt_dev;	/* forcing the device at add	*/
 	unsigned long	rt_mtu;		/* per route MTU/Window 	*/
 #ifndef __KERNEL__
@@ -45,7 +48,9 @@ struct rtentry {
 #endif
 	unsigned long	rt_window;	/* Window clamping 		*/
 	unsigned short	rt_irtt;	/* Initial RTT			*/
-};
+	__uapi_arch_pad16;
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
=20
 #define	RTF_UP		0x0001		/* route usable		  	*/
diff --git a/include/uapi/linux/rseq.h b/include/uapi/linux/rseq.h
index 1b76d508400c..f5e5bd0e15a7 100644
--- a/include/uapi/linux/rseq.h
+++ b/include/uapi/linux/rseq.h
@@ -142,9 +142,13 @@ struct rseq {
 	__u32 mm_cid;
=20
 	/*
-	 * Flexible array member at end of structure, after last feature field.
+	 * Flexible array member at end of structure, after last feature field,
+	 * but overlapping with the padding.
 	 */
-	char end[];
+	union {
+		__u32 :32;
+		__DECLARE_FLEX_ARRAY(char, end);
+	};
 } __attribute__((aligned(4 * sizeof(__u64))));
=20
 #endif /* _UAPI_LINUX_RSEQ_H */
diff --git a/include/uapi/linux/rtc.h b/include/uapi/linux/rtc.h
index 97aca4503a6a..d9dce6ba7901 100644
--- a/include/uapi/linux/rtc.h
+++ b/include/uapi/linux/rtc.h
@@ -41,8 +41,9 @@ struct rtc_time {
 struct rtc_wkalrm {
 	unsigned char enabled;	/* 0 =3D alarm disabled, 1 =3D alarm enabled */
 	unsigned char pending;  /* 0 =3D alarm not pending, 1 =3D alarm pendin=
g */
+	__uapi_arch_pad16;
 	struct rtc_time time;	/* time the alarm is set to */
-};
+} __uapi_arch_align;
=20
 /*
  * Data structure to control PLL correction some better RTC feature
diff --git a/include/uapi/linux/scc.h b/include/uapi/linux/scc.h
index 947edb17ce9d..60d8ab2fd2e0 100644
--- a/include/uapi/linux/scc.h
+++ b/include/uapi/linux/scc.h
@@ -5,6 +5,7 @@
 #define _UAPI_SCC_H
=20
 #include <linux/sockios.h>
+#include <linux/types.h>
=20
 /* selection of hardware types */
=20
@@ -129,13 +130,16 @@ struct scc_stat {
=20
 	unsigned int maxqueue;	/* allocated tx_buffers */
 	unsigned int bufsize;	/* used buffersize */
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 struct scc_modem {
 	long speed;		/* Line speed, bps */
 	char clocksrc;		/* 0 =3D DPLL, 1 =3D external, 2 =3D divider */
 	char nrz;		/* NRZ instead of NRZI */=09
-};
+	__uapi_arch_pad16;
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 struct scc_kiss_cmd {
 	int  	 command;	/* one of the KISS-Commands defined above */
@@ -151,12 +155,15 @@ struct scc_hw_config {
 	io_port	special;	/* special function port */
=20
 	int	irq;		/* irq */
+	__uapi_arch_pad_long;
 	long	clock;		/* clock */
 	char	option;		/* command for function port */
=20
 	char brand;		/* hardware type */
 	char escc;		/* use ext. features of a 8580/85180/85280 */
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 /* (#) only one INTACK latch allowed. */
=20
@@ -169,6 +176,8 @@ struct scc_mem_config {
 struct scc_calibrate {
 	unsigned int time;
 	unsigned char pattern;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 #endif /* _UAPI_SCC_H */
diff --git a/include/uapi/linux/scif_ioctl.h b/include/uapi/linux/scif_i=
octl.h
index 862a4cc908f7..1ed80d2b1b60 100644
--- a/include/uapi/linux/scif_ioctl.h
+++ b/include/uapi/linux/scif_ioctl.h
@@ -105,7 +105,8 @@ struct scifioctl_msg {
 	__s32	len;
 	__s32	flags;
 	__s32	out_len;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /**
  * struct scifioctl_reg - used for SCIF_REG IOCTL
@@ -155,7 +156,8 @@ struct scifioctl_copy {
 	__s64		roffset;
 	__u64		addr;
 	__s32		flags;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /**
  * struct scifioctl_fence_mark  - used for SCIF_FENCE_MARK IOCTL
@@ -164,8 +166,9 @@ struct scifioctl_copy {
  */
 struct scifioctl_fence_mark {
 	__s32	flags;
+	__uapi_arch_pad32;
 	__u64	mark;
-};
+} __uapi_arch_align;
=20
 /**
  * struct scifioctl_fence_signal - used for SCIF_FENCE_SIGNAL IOCTL
@@ -181,7 +184,8 @@ struct scifioctl_fence_signal {
 	__s64		roff;
 	__u64		rval;
 	__s32		flags;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /**
  * struct scifioctl_node_ids - used for SCIF_GET_NODEIDS IOCTL
@@ -193,7 +197,8 @@ struct scifioctl_node_ids {
 	__u64	nodes;
 	__u64	self;
 	__s32	len;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 #define SCIF_BIND		_IOWR('s', 1, __u64)
 #define SCIF_LISTEN		_IOW('s', 2, __s32)
diff --git a/include/uapi/linux/sctp.h b/include/uapi/linux/sctp.h
index b7d91d4cf0db..c9da4efdb985 100644
--- a/include/uapi/linux/sctp.h
+++ b/include/uapi/linux/sctp.h
@@ -213,13 +213,14 @@ struct sctp_sndrcvinfo {
 	__u16 sinfo_stream;
 	__u16 sinfo_ssn;
 	__u16 sinfo_flags;
+	__uapi_arch_pad16;
 	__u32 sinfo_ppid;
 	__u32 sinfo_context;
 	__u32 sinfo_timetolive;
 	__u32 sinfo_tsn;
 	__u32 sinfo_cumtsn;
 	sctp_assoc_t sinfo_assoc_id;
-};
+} __uapi_arch_align;
=20
 /* 5.3.4 SCTP Send Information Structure (SCTP_SNDINFO)
  *
@@ -250,12 +251,13 @@ struct sctp_rcvinfo {
 	__u16 rcv_sid;
 	__u16 rcv_ssn;
 	__u16 rcv_flags;
+	__uapi_arch_pad16;
 	__u32 rcv_ppid;
 	__u32 rcv_tsn;
 	__u32 rcv_cumtsn;
 	__u32 rcv_context;
 	sctp_assoc_t rcv_assoc_id;
-};
+} __uapi_arch_align;
=20
 /* 5.3.6 SCTP Next Receive Information Structure (SCTP_NXTINFO)
  *
@@ -286,8 +288,9 @@ struct sctp_nxtinfo {
  */
 struct sctp_prinfo {
 	__u16 pr_policy;
+	__uapi_arch_pad16;
 	__u32 pr_value;
-};
+} __uapi_arch_align;
=20
 /* 5.3.8 SCTP AUTH Information Structure (SCTP_AUTHINFO)
  *
@@ -316,7 +319,7 @@ enum sctp_sinfo_flags {
 	SCTP_SENDALL		=3D (1 << 6),
 	SCTP_PR_SCTP_ALL	=3D (1 << 7),
 	SCTP_NOTIFICATION	=3D MSG_NOTIFICATION, /* Next message is not user ms=
g but notification. */
-	SCTP_EOF		=3D MSG_FIN,  /* Initiate graceful shutdown process. */
+	SCTP_EOF		=3D 0x200,  /* Initiate graceful shutdown process. */
 };
=20
 typedef union {
@@ -396,7 +399,7 @@ struct sctp_paddr_change {
 	__u16 spc_type;
 	__u16 spc_flags;
 	__u32 spc_length;
-	struct sockaddr_storage spc_aaddr;
+	struct __kernel_sockaddr_storage spc_aaddr;
 	int spc_state;
 	int spc_error;
 	sctp_assoc_t spc_assoc_id;
@@ -435,9 +438,10 @@ struct sctp_remote_error {
 	__u16 sre_flags;
 	__u32 sre_length;
 	__be16 sre_error;
+	__uapi_arch_pad16;
 	sctp_assoc_t sre_assoc_id;
 	__u8 sre_data[];
-};
+} __uapi_arch_align;
=20
=20
 /*
@@ -748,7 +752,7 @@ struct sctp_assocparams {
  */
 struct sctp_setpeerprim {
 	sctp_assoc_t            sspp_assoc_id;
-	struct sockaddr_storage sspp_addr;
+	struct __kernel_sockaddr_storage sspp_addr;
 } __attribute__((packed, aligned(4)));
=20
 /*
@@ -761,7 +765,7 @@ struct sctp_setpeerprim {
  */
 struct sctp_prim {
 	sctp_assoc_t            ssp_assoc_id;
-	struct sockaddr_storage ssp_addr;
+	struct __kernel_sockaddr_storage ssp_addr;
 } __attribute__((packed, aligned(4)));
=20
 /* For backward compatibility use, define the old name too */
@@ -805,7 +809,7 @@ enum  sctp_spp_flags {
=20
 struct sctp_paddrparams {
 	sctp_assoc_t		spp_assoc_id;
-	struct sockaddr_storage	spp_address;
+	struct __kernel_sockaddr_storage	spp_address;
 	__u32			spp_hbinterval;
 	__u16			spp_pathmaxrxt;
 	__u32			spp_pathmtu;
@@ -813,6 +817,7 @@ struct sctp_paddrparams {
 	__u32			spp_flags;
 	__u32			spp_ipv6_flowlabel;
 	__u8			spp_dscp;
+	__u8			:8;
 } __attribute__((packed, aligned(4)));
=20
 /*
@@ -844,8 +849,11 @@ enum {
=20
 struct sctp_hmacalgo {
 	__u32		shmac_num_idents;
-	__u16		shmac_idents[];
-};
+	union {
+		__uapi_arch_pad32;
+		__DECLARE_FLEX_ARRAY(__u16, shmac_idents);
+	};
+} __uapi_arch_align;
=20
 /* Sadly, user and kernel space have different names for
  * this structure member, so this is to not break anything.
@@ -875,7 +883,8 @@ struct sctp_authkey {
 struct sctp_authkeyid {
 	sctp_assoc_t	scact_assoc_id;
 	__u16		scact_keynumber;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
=20
 /*
@@ -894,19 +903,19 @@ struct sctp_authkeyid {
  */
 struct sctp_sack_info {
 	sctp_assoc_t	sack_assoc_id;
-	uint32_t	sack_delay;
-	uint32_t	sack_freq;
+	__u32	sack_delay;
+	__u32	sack_freq;
 };
=20
 struct sctp_assoc_value {
     sctp_assoc_t            assoc_id;
-    uint32_t                assoc_value;
+    __u32                assoc_value;
 };
=20
 struct sctp_stream_value {
 	sctp_assoc_t assoc_id;
-	uint16_t stream_id;
-	uint16_t stream_value;
+	__u16 stream_id;
+	__u16 stream_value;
 };
=20
 /*
@@ -920,7 +929,7 @@ struct sctp_stream_value {
  */
 struct sctp_paddrinfo {
 	sctp_assoc_t		spinfo_assoc_id;
-	struct sockaddr_storage	spinfo_address;
+	struct __kernel_sockaddr_storage	spinfo_address;
 	__s32			spinfo_state;
 	__u32			spinfo_cwnd;
 	__u32			spinfo_srtt;
@@ -977,7 +986,7 @@ struct sctp_status {
 struct sctp_authchunks {
 	sctp_assoc_t	gauth_assoc_id;
 	__u32		gauth_number_of_chunks;
-	uint8_t		gauth_chunks[];
+	__u8		gauth_chunks[];
 };
=20
 /* The broken spelling has been released already in lksctp-tools header,
@@ -1040,7 +1049,9 @@ struct sctp_getaddrs {
 struct sctp_assoc_stats {
 	sctp_assoc_t	sas_assoc_id;    /* Input */
 					 /* Transport of observed max RTO */
-	struct sockaddr_storage sas_obs_rto_ipaddr;
+	__uapi_arch_pad_long;
+	struct __kernel_sockaddr_storage sas_obs_rto_ipaddr;
+	__uapi_arch_pad_long_to_u64;
 	__u64		sas_maxrto;      /* Maximum Observed RTO for period */
 	__u64		sas_isacks;	 /* SACKs received */
 	__u64		sas_osacks;	 /* SACKs sent */
@@ -1056,7 +1067,7 @@ struct sctp_assoc_stats {
 	__u64		sas_iodchunks;	 /* Ordered data chunks received */
 	__u64		sas_octrlchunks; /* Control chunks sent */
 	__u64		sas_ictrlchunks; /* Control chunks received */
-};
+} __uapi_arch_align;
=20
 /*
  * 8.1 sctp_bindx()
@@ -1085,19 +1096,23 @@ typedef struct {
  */
 struct sctp_paddrthlds {
 	sctp_assoc_t spt_assoc_id;
-	struct sockaddr_storage spt_address;
+	__uapi_arch_pad_long;
+	struct __kernel_sockaddr_storage spt_address;
 	__u16 spt_pathmaxrxt;
 	__u16 spt_pathpfthld;
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 /* Use a new structure with spt_pathcpthld for back compatibility */
 struct sctp_paddrthlds_v2 {
 	sctp_assoc_t spt_assoc_id;
-	struct sockaddr_storage spt_address;
+	__uapi_arch_pad_long;
+	struct __kernel_sockaddr_storage spt_address;
 	__u16 spt_pathmaxrxt;
 	__u16 spt_pathpfthld;
 	__u16 spt_pathcpthld;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /*
  * Socket Option for Getting the Association/Stream-Specific PR-SCTP St=
atus
@@ -1114,7 +1129,8 @@ struct sctp_default_prinfo {
 	sctp_assoc_t pr_assoc_id;
 	__u32 pr_value;
 	__u16 pr_policy;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 struct sctp_info {
 	__u32	sctpi_tag;
@@ -1153,7 +1169,7 @@ struct sctp_info {
 	__u64	sctpi_ictrlchunks;
=20
 	/* primary transport info */
-	struct sockaddr_storage	sctpi_p_address;
+	struct __kernel_sockaddr_storage	sctpi_p_address;
 	__s32	sctpi_p_state;
 	__u32	sctpi_p_cwnd;
 	__u32	sctpi_p_srtt;
@@ -1182,28 +1198,32 @@ struct sctp_info {
=20
 struct sctp_reset_streams {
 	sctp_assoc_t srs_assoc_id;
-	uint16_t srs_flags;
-	uint16_t srs_number_streams;	/* 0 =3D=3D ALL */
-	uint16_t srs_stream_list[];	/* list if srs_num_streams is not 0 */
+	__u16 srs_flags;
+	__u16 srs_number_streams;	/* 0 =3D=3D ALL */
+	__u16 srs_stream_list[];	/* list if srs_num_streams is not 0 */
 };
=20
 struct sctp_add_streams {
 	sctp_assoc_t sas_assoc_id;
-	uint16_t sas_instrms;
-	uint16_t sas_outstrms;
+	__u16 sas_instrms;
+	__u16 sas_outstrms;
 };
=20
 struct sctp_event {
-	sctp_assoc_t se_assoc_id;
-	uint16_t se_type;
-	uint8_t se_on;
-};
+	sctp_assoc_t	se_assoc_id;
+	__u16		se_type;
+	__u8		se_on;
+	__uapi_arch_pad8;
+} __uapi_arch_align;
=20
 struct sctp_udpencaps {
 	sctp_assoc_t sue_assoc_id;
-	struct sockaddr_storage sue_address;
-	uint16_t sue_port;
-};
+	__uapi_arch_pad_long;
+	struct __kernel_sockaddr_storage sue_address;
+	__u16 sue_port;
+	__uapi_arch_pad16;
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 /* SCTP Stream schedulers */
 enum sctp_sched_type {
@@ -1219,8 +1239,10 @@ enum sctp_sched_type {
 /* Probe Interval socket option */
 struct sctp_probeinterval {
 	sctp_assoc_t spi_assoc_id;
-	struct sockaddr_storage spi_address;
+	__uapi_arch_pad_long;
+	struct __kernel_sockaddr_storage spi_address;
 	__u32 spi_interval;
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 #endif /* _UAPI_SCTP_H */
diff --git a/include/uapi/linux/sed-opal.h b/include/uapi/linux/sed-opal=
.h
index 9025dd5a4f0f..210d67db2bfc 100644
--- a/include/uapi/linux/sed-opal.h
+++ b/include/uapi/linux/sed-opal.h
@@ -177,11 +177,15 @@ struct opal_status {
  */
 struct opal_geometry {
 	__u8 align;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	__u32 logical_block_size;
 	__u64 alignment_granularity;
 	__u64 lowest_aligned_lba;
 	__u8  __align[3];
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 struct opal_discovery {
 	__u64 data;
diff --git a/include/uapi/linux/sem.h b/include/uapi/linux/sem.h
index 75aa3b273cd9..70a0b9ab8f04 100644
--- a/include/uapi/linux/sem.h
+++ b/include/uapi/linux/sem.h
@@ -21,9 +21,13 @@
 #define SEM_INFO 19
 #define SEM_STAT_ANY 20
=20
+/* Include the definition of semid64_ds */
+#include <asm/sembuf.h>
+
 /* Obsolete, used only for backwards compatibility and libc5 compiles */
 struct semid_ds {
 	struct ipc_perm	sem_perm;		/* permissions .. see ipc.h */
+	__uapi_arch_pad_long;
 	__kernel_old_time_t sem_otime;		/* last semop time */
 	__kernel_old_time_t sem_ctime;		/* create/last semctl() time */
 	struct sem	*sem_base;		/* ptr to first semaphore in array */
@@ -31,10 +35,9 @@ struct semid_ds {
 	struct sem_queue **sem_pending_last;	/* last pending operation */
 	struct sem_undo	*undo;			/* undo requests on this array */
 	unsigned short	sem_nsems;		/* no. of semaphores in array */
-};
-
-/* Include the definition of semid64_ds */
-#include <asm/sembuf.h>
+	__uapi_arch_pad16;
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 /* semop system calls takes an array of these. */
 struct sembuf {
diff --git a/include/uapi/linux/serial.h b/include/uapi/linux/serial.h
index de9b4733607e..c47cde2e1576 100644
--- a/include/uapi/linux/serial.h
+++ b/include/uapi/linux/serial.h
@@ -32,11 +32,13 @@ struct serial_struct {
 	int	hub6;
 	unsigned short	closing_wait; /* time to wait before closing */
 	unsigned short	closing_wait2; /* no longer used... */
+	__uapi_arch_pad_long;
 	unsigned char	*iomem_base;
 	unsigned short	iomem_reg_shift;
+	__uapi_arch_pad16;
 	unsigned int	port_high;
 	unsigned long	iomap_base;	/* cookie passed into ioremap */
-};
+} __uapi_arch_align;
=20
 /*
  * For the close wait times, 0 means wait forever for serial port to
@@ -86,15 +88,19 @@ struct serial_multiport_struct {
 	int		irq;
 	int		port1;
 	unsigned char	mask1, match1;
+	__uapi_arch_pad16;
 	int		port2;
 	unsigned char	mask2, match2;
+	__uapi_arch_pad16;
 	int		port3;
 	unsigned char	mask3, match3;
+	__uapi_arch_pad16;
 	int		port4;
 	unsigned char	mask4, match4;
+	__uapi_arch_pad16;
 	int		port_monitor;
 	int	reserved[32];
-};
+} __uapi_arch_align;
=20
 /*
  * Serial input interrupt line counters -- external structure
diff --git a/include/uapi/linux/sev-guest.h b/include/uapi/linux/sev-gue=
st.h
index fcdfea767fca..cb8d619666ad 100644
--- a/include/uapi/linux/sev-guest.h
+++ b/include/uapi/linux/sev-guest.h
@@ -49,6 +49,9 @@ struct snp_derived_key_resp {
 struct snp_guest_request_ioctl {
 	/* message version number (must be non-zero) */
 	__u8 msg_version;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+	__uapi_arch_pad32;
=20
 	/* Request and response structure address */
 	__u64 req_data;
@@ -62,7 +65,7 @@ struct snp_guest_request_ioctl {
 			__u32 vmm_error;
 		};
 	};
-};
+} __uapi_arch_align;
=20
 struct snp_ext_report_req {
 	struct snp_report_req data;
@@ -72,7 +75,8 @@ struct snp_ext_report_req {
=20
 	/* length of the certificate blob */
 	__u32 certs_len;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 #define SNP_GUEST_REQ_IOC_TYPE	'S'
=20
diff --git a/include/uapi/linux/shm.h b/include/uapi/linux/shm.h
index 8d1f17a4e08e..d8f1ff1168bd 100644
--- a/include/uapi/linux/shm.h
+++ b/include/uapi/linux/shm.h
@@ -24,6 +24,13 @@
 #define SHMALL (ULONG_MAX - (1UL << 24)) /* max shm system wide (pages)=
 */
 #define SHMSEG SHMMNI			 /* max shared segs per process */
=20
+/* Include the definition of shmid64_ds and shminfo64 */
+#include <asm/shmbuf.h>
+
+#ifndef __uapi_arch_pad_shm_long
+#define __uapi_arch_pad_shm_long __uapi_arch_pad_long
+#endif
+
 /* Obsolete, used only for backwards compatibility and libc5 compiles */
 struct shmid_ds {
 	struct ipc_perm		shm_perm;	/* operation perms */
@@ -35,13 +42,11 @@ struct shmid_ds {
 	__kernel_ipc_pid_t	shm_lpid;	/* pid of last operator */
 	unsigned short		shm_nattch;	/* no. of current attaches */
 	unsigned short 		shm_unused;	/* compatibility */
+	__uapi_arch_pad_shm_long;
 	void 			*shm_unused2;	/* ditto - used by DIPC */
 	void			*shm_unused3;	/* unused */
 };
=20
-/* Include the definition of shmid64_ds and shminfo64 */
-#include <asm/shmbuf.h>
-
 /*
  * shmget() shmflg values.
  */
@@ -100,12 +105,13 @@ struct	shminfo {
=20
 struct shm_info {
 	int used_ids;
+	__uapi_arch_pad_long;
 	__kernel_ulong_t shm_tot;	/* total allocated shm */
 	__kernel_ulong_t shm_rss;	/* total resident shm */
 	__kernel_ulong_t shm_swp;	/* total swapped shm */
 	__kernel_ulong_t swap_attempts;
 	__kernel_ulong_t swap_successes;
-};
+} __uapi_arch_align;
=20
=20
 #endif /* _UAPI_LINUX_SHM_H_ */
diff --git a/include/uapi/linux/smc_diag.h b/include/uapi/linux/smc_diag=
.h
index 58eceb7f5df2..7a5e70560ecc 100644
--- a/include/uapi/linux/smc_diag.h
+++ b/include/uapi/linux/smc_diag.h
@@ -103,6 +103,7 @@ struct smc_diag_fallback {
=20
 struct smcd_diag_dmbinfo {		/* SMC-D Socket internals */
 	__u32		linkid;		/* Link identifier */
+	__u32		:32;		/* pad for alignment */
 	__aligned_u64	peer_gid;	/* Peer GID */
 	__aligned_u64	my_gid;		/* My GID */
 	__aligned_u64	token;		/* Token of DMB */
diff --git a/include/uapi/linux/socket.h b/include/uapi/linux/socket.h
index d3fcd3b5ec53..ef4f4c256966 100644
--- a/include/uapi/linux/socket.h
+++ b/include/uapi/linux/socket.h
@@ -2,6 +2,8 @@
 #ifndef _UAPI_LINUX_SOCKET_H
 #define _UAPI_LINUX_SOCKET_H
=20
+#include <linux/stddef.h>
+
 /*
  * Desired design of maximum size and alignment (see RFC2553)
  */
@@ -9,6 +11,14 @@
=20
 typedef unsigned short __kernel_sa_family_t;
=20
+struct __kernel_sockaddr {
+	__kernel_sa_family_t	sa_family;	/* address family, AF_xxx	*/
+	union {
+		char sa_data_min[14];		/* Minimum 14 bytes of protocol address	*/
+		__DECLARE_FLEX_ARRAY(char, sa_data);
+	};
+};
+
 /*
  * The definition uses anonymous union and struct in order to control t=
he
  * default alignment.
diff --git a/include/uapi/linux/soundcard.h b/include/uapi/linux/soundca=
rd.h
index ac1318793a86..71b19c202df7 100644
--- a/include/uapi/linux/soundcard.h
+++ b/include/uapi/linux/soundcard.h
@@ -38,6 +38,7 @@
=20
 /* In Linux we need to be prepared for cross compiling */
 #include <linux/ioctl.h>
+#include <linux/types.h>
=20
 /* Endian macros. */
 #ifndef __KERNEL__
@@ -219,6 +220,7 @@ struct patch_info {
 		short device_no;	/* Synthesizer number */
 		short instr_no;		/* Midi pgm# */
=20
+		__uapi_arch_pad16;
 		unsigned int mode;
 /*
  * The least significant byte has the same format than the GUS .PAT
@@ -289,6 +291,7 @@ struct patch_info {
 		unsigned char	vibrato_rate;
 		unsigned char	vibrato_depth;
=20
+		__uapi_arch_pad16;
 		int		scale_frequency;
 		unsigned int	scale_factor;		/* from 0 to 2048 or 0 to 2 */
 =09
@@ -297,7 +300,9 @@ struct patch_info {
 		int		reserved1;
 	        int		spare[2];
 		char data[1];	/* The waveform data starts here */
-	};
+		__uapi_arch_pad8;
+		__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 struct sysex_info {
 		short key;		/* Use SYSEX_PATCH or MAUI_PATCH here */
@@ -306,7 +311,9 @@ struct sysex_info {
 		short device_no;	/* Synthesizer number */
 		int len;	/* Size of the sysex data in bytes */
 		unsigned char data[1];	/* Sysex data starts here */
-	};
+		__uapi_arch_pad8;
+		__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /*
  * /dev/sequencer input events.
@@ -479,6 +486,7 @@ struct sbi_instrument {
=20
 struct synth_info {	/* Read only */
 		char	name[30];
+		__uapi_arch_pad16;
 		int	device;		/* 0-N. INITIALIZE BEFORE CALLING */
 		int	synth_type;
 #define SYNTH_TYPE_FM			0
@@ -503,7 +511,7 @@ struct synth_info {	/* Read only */
 #define SYNTH_CAP_OPL3			0x00000002 /* Set if OPL3 supported */
 #define SYNTH_CAP_INPUT			0x00000004 /* Input (MIDI) device */
 		int	dummies[19];	/* Reserve space */
-	};
+	} __uapi_arch_align;
=20
 struct sound_timer_info {
 		char name[32];
@@ -514,11 +522,12 @@ struct sound_timer_info {
=20
 struct midi_info {
 		char		name[30];
+		__uapi_arch_pad16;
 		int		device;		/* 0-N. INITIALIZE BEFORE CALLING */
 		unsigned int	capabilities;	/* To be defined later */
 		int		dev_type;
 		int		dummies[18];	/* Reserve space */
-	};
+	} __uapi_arch_align;
=20
 /********************************************
  * ioctl commands for the /dev/midi##
@@ -615,7 +624,8 @@ typedef struct count_info {
 typedef struct buffmem_desc {
 		unsigned *buffer;
 		int size;
-	} buffmem_desc;
+		__uapi_arch_pad_long;
+	} __uapi_arch_align buffmem_desc;
 #define SNDCTL_DSP_MAPINBUF		_SIOR ('P', 19, buffmem_desc)
 #define SNDCTL_DSP_MAPOUTBUF		_SIOR ('P', 20, buffmem_desc)
 #define SNDCTL_DSP_SETSYNCRO		_SIO  ('P', 21)
diff --git a/include/uapi/linux/switchtec_ioctl.h b/include/uapi/linux/s=
witchtec_ioctl.h
index 2c661a3557e5..46ab1d31ba0c 100644
--- a/include/uapi/linux/switchtec_ioctl.h
+++ b/include/uapi/linux/switchtec_ioctl.h
@@ -77,7 +77,8 @@ struct switchtec_ioctl_event_summary {
 	__u32 padding;
 	__u32 part[48];
 	__u32 pff[255];
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 #define SWITCHTEC_IOCTL_EVENT_STACK_ERROR		0
 #define SWITCHTEC_IOCTL_EVENT_PPU_ERROR			1
diff --git a/include/uapi/linux/synclink.h b/include/uapi/linux/synclink=
.h
index 62f32d4e1021..26ef103ed3a7 100644
--- a/include/uapi/linux/synclink.h
+++ b/include/uapi/linux/synclink.h
@@ -149,16 +149,21 @@ typedef struct _MGSL_PARAMS
=20
 	unsigned long	mode;		/* Asynchronous or HDLC */
 	unsigned char	loopback;	/* internal loopback mode */
+	__uapi_arch_pad8;
=20
 	/* HDLC Only */
=20
 	unsigned short	flags;
 	unsigned char	encoding;	/* NRZ, NRZI, etc. */
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	unsigned long	clock_speed;	/* external clock speed in bits per second =
*/
 	unsigned char	addr_filter;	/* receive HDLC address filter, 0xFF =3D di=
sable */
+	__uapi_arch_pad8;
 	unsigned short	crc_type;	/* None, CRC16-CCITT, or CRC32-CCITT */
 	unsigned char	preamble_length;
 	unsigned char	preamble;
+	__uapi_arch_pad16;
=20
 	/* Async Only */
=20
@@ -166,8 +171,10 @@ typedef struct _MGSL_PARAMS
 	unsigned char	data_bits;	/* 7 or 8 data bits */
 	unsigned char	stop_bits;	/* 1 or 2 stop bits */
 	unsigned char	parity;		/* none, even, or odd */
+	__uapi_arch_pad8;
+	__uapi_arch_pad_long;
=20
-} MGSL_PARAMS, *PMGSL_PARAMS;
+} __uapi_arch_align MGSL_PARAMS, *PMGSL_PARAMS;
=20
 #define MICROGATE_VENDOR_ID 0x13c0
 #define SYNCLINK_DEVICE_ID 0x0010
diff --git a/include/uapi/linux/sysctl.h b/include/uapi/linux/sysctl.h
index 1c7fe0f4dca4..0cb317a2cd29 100644
--- a/include/uapi/linux/sysctl.h
+++ b/include/uapi/linux/sysctl.h
@@ -35,12 +35,13 @@
 struct __sysctl_args {
 	int __user *name;
 	int nlen;
+	__uapi_arch_pad_long;
 	void __user *oldval;
-	size_t __user *oldlenp;
+	__kernel_size_t __user *oldlenp;
 	void __user *newval;
-	size_t newlen;
+	__kernel_size_t newlen;
 	unsigned long __unused[4];
-};
+} __uapi_arch_align;
=20
 /* Define sysctl names first */
=20
diff --git a/include/uapi/linux/sysinfo.h b/include/uapi/linux/sysinfo.h
index 435d5c23f0c0..8f0b471f3c75 100644
--- a/include/uapi/linux/sysinfo.h
+++ b/include/uapi/linux/sysinfo.h
@@ -16,10 +16,12 @@ struct sysinfo {
 	__kernel_ulong_t freeswap;	/* swap space still available */
 	__u16 procs;		   	/* Number of current processes */
 	__u16 pad;		   	/* Explicit padding for m68k */
+	__uapi_arch_pad_kernel_long_t;
 	__kernel_ulong_t totalhigh;	/* Total high memory size */
 	__kernel_ulong_t freehigh;	/* Available high memory size */
 	__u32 mem_unit;			/* Memory unit size in bytes */
 	char _f[20-2*sizeof(__kernel_ulong_t)-sizeof(__u32)];	/* Padding: libc=
5 uses this.. */
+	__uapi_arch_pad_kernel_long_t;
 };
=20
 #endif /* _LINUX_SYSINFO_H */
diff --git a/include/uapi/linux/target_core_user.h b/include/uapi/linux/=
target_core_user.h
index f925a77f19ed..6d4d017ee3d4 100644
--- a/include/uapi/linux/target_core_user.h
+++ b/include/uapi/linux/target_core_user.h
@@ -56,10 +56,16 @@ struct tcmu_mailbox {
=20
 	__u32 cmd_head;
=20
+	__u32 :32; __u32 :32; __u32 :32; __u32 :32; __u32 :32; __u32 :32;
+	__u32 :32; __u32 :32; __u32 :32; __u32 :32; __u32 :32; __u32 :32;
+
 	/* Updated by user. On its own cacheline */
 	__u32 cmd_tail __attribute__((__aligned__(ALIGN_SIZE)));
=20
-} __packed;
+	__u32 :32; __u32 :32; __u32 :32; __u32 :32; __u32 :32; __u32 :32;
+	__u32 :32; __u32 :32; __u32 :32; __u32 :32; __u32 :32; __u32 :32;
+	__u32 :32; __u32 :32; __u32 :32;
+} __packed; /* not actually packed */
=20
 enum tcmu_opcode {
 	TCMU_OP_PAD =3D 0,
@@ -116,11 +122,12 @@ struct tcmu_cmd_entry {
 			__u32 iov_cnt;
 			__u32 iov_bidi_cnt;
 			__u32 iov_dif_cnt;
+			__uapi_arch_pad32;
 			__u64 cdb_off;
 			__u64 __pad1;
 			__u64 __pad2;
 			__DECLARE_FLEX_ARRAY(struct iovec, iov);
-		} req;
+		} __uapi_arch_align req;
 		struct {
 			__u8 scsi_status;
 			__u8 __pad1;
diff --git a/include/uapi/linux/taskstats.h b/include/uapi/linux/tasksta=
ts.h
index 5929030d4e8b..17436e152fc5 100644
--- a/include/uapi/linux/taskstats.h
+++ b/include/uapi/linux/taskstats.h
@@ -45,6 +45,7 @@ struct taskstats {
 	 * Each time the struct is changed, the value should be incremented.
 	 */
 	__u16	version;
+	__uapi_arch_pad16;
 	__u32	ac_exitcode;		/* Exit status */
=20
 	/* The accounting flags of a task as defined in <linux/acct.h>
@@ -53,6 +54,11 @@ struct taskstats {
 	 */
 	__u8	ac_flag;		/* Record flags */
 	__u8	ac_nice;		/* task_nice */
+	__uapi_arch_pad16;
+#ifndef __m68k__
+	/* m68k has no padding here because __uapi_arch_pad16 is empty too */
+	__u32 :32;
+#endif
=20
 	/* Delay accounting fields start
 	 *
@@ -108,6 +114,7 @@ struct taskstats {
 	__u8	ac_sched __attribute__((aligned(8)));
 					/* Scheduling discipline */
 	__u8	ac_pad[3];
+	__u32 :32;
 	__u32	ac_uid __attribute__((aligned(8)));
 					/* User ID */
 	__u32	ac_gid;			/* Group ID */
@@ -115,6 +122,7 @@ struct taskstats {
 	__u32	ac_ppid;		/* Parent process ID */
 	/* __u32 range means times from 1970 to 2106 */
 	__u32	ac_btime;		/* Begin time [sec since 1970] */
+	__u32 :32;
 	__u64	ac_etime __attribute__((aligned(8)));
 					/* Elapsed time [usec] */
 	__u64	ac_utime;		/* User CPU time [usec] */
@@ -181,6 +189,7 @@ struct taskstats {
=20
 	/* v12 begin */
 	__u32   ac_tgid;	/* thread group ID */
+	__u32	:32;
 	/* Thread group walltime up to now. This is total process walltime if
 	 * AGROUP flag is set.
 	 */
@@ -230,7 +239,7 @@ struct taskstats {
=20
 	__u64	irq_delay_max;
 	__u64	irq_delay_min;
-};
+} __uapi_arch_align;
=20
=20
 /*
diff --git a/include/uapi/linux/tc_act/tc_connmark.h b/include/uapi/linu=
x/tc_act/tc_connmark.h
index 9f8f6f709feb..e473dc3131c4 100644
--- a/include/uapi/linux/tc_act/tc_connmark.h
+++ b/include/uapi/linux/tc_act/tc_connmark.h
@@ -8,7 +8,8 @@
 struct tc_connmark {
 	tc_gen;
 	__u16 zone;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 enum {
 	TCA_CONNMARK_UNSPEC,
diff --git a/include/uapi/linux/tc_act/tc_ife.h b/include/uapi/linux/tc_=
act/tc_ife.h
index 8c401f185675..ac0444007de6 100644
--- a/include/uapi/linux/tc_act/tc_ife.h
+++ b/include/uapi/linux/tc_act/tc_ife.h
@@ -13,7 +13,8 @@
 struct tc_ife {
 	tc_gen;
 	__u16 flags;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /*XXX: We need to encode the total number of bytes consumed */
 enum {
diff --git a/include/uapi/linux/tc_act/tc_pedit.h b/include/uapi/linux/t=
c_act/tc_pedit.h
index f5cab7fc96ab..cde4228782fc 100644
--- a/include/uapi/linux/tc_act/tc_pedit.h
+++ b/include/uapi/linux/tc_act/tc_pedit.h
@@ -62,8 +62,9 @@ struct tc_pedit_sel {
 	tc_gen;
 	unsigned char           nkeys;
 	unsigned char           flags;
+	__uapi_arch_pad16;
 	struct tc_pedit_key     keys[] __counted_by(nkeys);
-};
+} __uapi_arch_align;
=20
 #define tc_pedit tc_pedit_sel
=20
diff --git a/include/uapi/linux/tc_act/tc_skbmod.h b/include/uapi/linux/=
tc_act/tc_skbmod.h
index ac62c9a993ea..53aa4eb3c64e 100644
--- a/include/uapi/linux/tc_act/tc_skbmod.h
+++ b/include/uapi/linux/tc_act/tc_skbmod.h
@@ -16,8 +16,9 @@
=20
 struct tc_skbmod {
 	tc_gen;
+	__uapi_arch_pad32;
 	__u64 flags;
-};
+} __uapi_arch_align;
=20
 enum {
 	TCA_SKBMOD_UNSPEC,
diff --git a/include/uapi/linux/tcp.h b/include/uapi/linux/tcp.h
index dce3113787a7..c18785642d84 100644
--- a/include/uapi/linux/tcp.h
+++ b/include/uapi/linux/tcp.h
@@ -235,6 +235,7 @@ struct tcp_info {
 	__u8	tcpi_options;
 	__u8	tcpi_snd_wscale : 4, tcpi_rcv_wscale : 4;
 	__u8	tcpi_delivery_rate_app_limited:1, tcpi_fastopen_client_fail:2;
+	__u8	:5;
=20
 	__u32	tcpi_rto;
 	__u32	tcpi_ato;
diff --git a/include/uapi/linux/time.h b/include/uapi/linux/time.h
index 16ca1ac206fd..cec91dc72184 100644
--- a/include/uapi/linux/time.h
+++ b/include/uapi/linux/time.h
@@ -17,6 +17,9 @@ struct timespec {
 struct timeval {
 	__kernel_old_time_t	tv_sec;		/* seconds */
 	__kernel_suseconds_t	tv_usec;	/* microseconds */
+#if defined(__sparc__) && defined(__arch64__)
+	__u32 :32;
+#endif
 };
=20
 struct itimerspec {
diff --git a/include/uapi/linux/timex.h b/include/uapi/linux/timex.h
index bd627c368d09..90faba947830 100644
--- a/include/uapi/linux/timex.h
+++ b/include/uapi/linux/timex.h
@@ -64,11 +64,13 @@
  */
 struct timex {
 	unsigned int modes;	/* mode selector */
+	__uapi_arch_pad_kernel_long_t;
 	__kernel_long_t offset;	/* time offset (usec) */
 	__kernel_long_t freq;	/* frequency offset (scaled ppm) */
 	__kernel_long_t maxerror;/* maximum error (usec) */
 	__kernel_long_t esterror;/* estimated error (usec) */
 	int status;		/* clock command/status */
+	__uapi_arch_pad_kernel_long_t;
 	__kernel_long_t constant;/* pll time constant */
 	__kernel_long_t precision;/* clock precision (usec) (read only) */
 	__kernel_long_t tolerance;/* clock frequency tolerance (ppm)
@@ -80,6 +82,7 @@ struct timex {
 	__kernel_long_t ppsfreq;/* pps frequency (scaled ppm) (ro) */
 	__kernel_long_t jitter; /* pps jitter (us) (ro) */
 	int shift;              /* interval duration (s) (shift) (ro) */
+	__uapi_arch_pad_kernel_long_t;
 	__kernel_long_t stabil;            /* pps stability (scaled ppm) (ro) =
*/
 	__kernel_long_t jitcnt; /* jitter limit exceeded (ro) */
 	__kernel_long_t calcnt; /* calibration intervals (ro) */
@@ -91,7 +94,7 @@ struct timex {
 	int  :32; int  :32; int  :32; int  :32;
 	int  :32; int  :32; int  :32; int  :32;
 	int  :32; int  :32; int  :32;
-};
+} __uapi_arch_align;
 #endif
=20
 struct __kernel_timex_timeval {
diff --git a/include/uapi/linux/tipc_config.h b/include/uapi/linux/tipc_=
config.h
index c00adf2fe868..8c088970eb5f 100644
--- a/include/uapi/linux/tipc_config.h
+++ b/include/uapi/linux/tipc_config.h
@@ -318,6 +318,7 @@ static inline int TLV_SET(void *tlv, __u16 type, voi=
d *data, __u16 len)
 struct tlv_list_desc {
 	struct tlv_desc *tlv_ptr;	/* ptr to current TLV */
 	__u32 tlv_space;		/* # bytes from curr TLV to list end */
+	__uapi_arch_pad_long;
 };
=20
 static inline void TLV_LIST_INIT(struct tlv_list_desc *list,
diff --git a/include/uapi/linux/types.h b/include/uapi/linux/types.h
index 48b933938877..6bcb63e8b11b 100644
--- a/include/uapi/linux/types.h
+++ b/include/uapi/linux/types.h
@@ -59,5 +59,50 @@ typedef __u32 __bitwise __wsum;
=20
 typedef unsigned __bitwise __poll_t;
=20
+/*
+ * Annotations for padding in uapi structures:
+ * - all architectures align 16-bit members naturally
+ * - all except m68k align 32-bit members
+ * - all 64-bit architectures and most 32-bit ones align 64-bit members
+ *
+ * structures that have holes due to natural alignment should use these
+ * helpers to insert anonymous padding on architectures that need it.
+ *
+ * architectures must override __uapi_arch_pad{16,32} to skip the
+ * padding according to their ABI.
+ */
+#define __uapi_arch_pad8	__u8 :8
+#ifndef __uapi_arch_pad16
+#define __uapi_arch_pad16	__u16 :16
+#endif
+#ifndef __uapi_arch_pad32
+#define __uapi_arch_pad32	__u32 :32
+#endif
+
+/*
+ * Padding that is different between 32-bit and 64-bit targets,
+ * resulting from sizeof(long):
+ *
+ * - between a __u32 and a long/size_t/pointer
+ * - between a long and a __u64
+ * - between a long and an __aligned_u64
+ */
+#if __BITS_PER_LONG =3D=3D 64
+#define __uapi_arch_pad_long			__uapi_arch_pad32
+#define __uapi_arch_pad_long_to_u64
+#define __uapi_arch_pad_long_to_aligned_u64
+#else
+#define __uapi_arch_pad_long
+#define __uapi_arch_pad_long_to_u64		__uapi_arch_pad32
+#define __uapi_arch_pad_long_to_aligned_u64	__u32 :32
+#endif
+
+#ifndef __uapi_arch_align
+#if 0
+#define __uapi_arch_align __attribute__((aligned(sizeof(__u32))))
+#endif
+#define __uapi_arch_align
+#endif
+
 #endif /*  __ASSEMBLY__ */
 #endif /* _UAPI_LINUX_TYPES_H */
diff --git a/include/uapi/linux/ublk_cmd.h b/include/uapi/linux/ublk_cmd=
.h
index ec77dabba45b..9573a37e8ecc 100644
--- a/include/uapi/linux/ublk_cmd.h
+++ b/include/uapi/linux/ublk_cmd.h
@@ -621,7 +621,8 @@ struct ublk_params {
 	struct ublk_param_devt		devt;
 	struct ublk_param_zoned	zoned;
 	struct ublk_param_dma_align	dma;
+	__uapi_arch_pad32;
 	struct ublk_param_segment	seg;
-};
+} __uapi_arch_align;
=20
 #endif
diff --git a/include/uapi/linux/uinput.h b/include/uapi/linux/uinput.h
index c9e677e3af1d..e29eb51d31d2 100644
--- a/include/uapi/linux/uinput.h
+++ b/include/uapi/linux/uinput.h
@@ -101,9 +101,10 @@ struct uinput_setup {
=20
 struct uinput_abs_setup {
 	__u16  code; /* axis code */
+	__uapi_arch_pad16;
 	/* __u16 filler; */
 	struct input_absinfo absinfo;
-};
+} __uapi_arch_align;
=20
 /**
  * UI_ABS_SETUP - Set absolute axis information for the device to setup
diff --git a/include/uapi/linux/um_timetravel.h b/include/uapi/linux/um_=
timetravel.h
index 546a690b0346..fbb5a61331a9 100644
--- a/include/uapi/linux/um_timetravel.h
+++ b/include/uapi/linux/um_timetravel.h
@@ -282,7 +282,8 @@ struct um_timetravel_schedshm {
 			__u64 current_time;
 			__u16 running_id;
 			__u16 max_clients;
-		};
+			__uapi_arch_pad32;
+		} __uapi_arch_align;
 		char hdr[4096]; /* align to 4K page size */
 	};
 	union um_timetravel_schedshm_client clients[];
diff --git a/include/uapi/linux/usb/audio.h b/include/uapi/linux/usb/aud=
io.h
index c917c53070d5..8f7db63fb23b 100644
--- a/include/uapi/linux/usb/audio.h
+++ b/include/uapi/linux/usb/audio.h
@@ -301,7 +301,7 @@ static inline __u8 *uac_mixer_unit_bmControls(struct=
 uac_mixer_unit_descriptor *
 	case UAC_VERSION_3:
 		return &desc->baSourceID[desc->bNrInPins + 2];
 	default:
-		return NULL;
+		return (void *)0;
 	}
 }
=20
@@ -413,7 +413,7 @@ static inline __u8 *uac_processing_unit_bmControls(s=
truct uac_processing_unit_de
 	case UAC_VERSION_3:
 		return &desc->baSourceID[desc->bNrInPins + 2];
 	default:
-		return NULL;
+		return (void *)0;
 	}
 }
=20
diff --git a/include/uapi/linux/usb/raw_gadget.h b/include/uapi/linux/us=
b/raw_gadget.h
index f0224a8dc858..5dcdcbc054a6 100644
--- a/include/uapi/linux/usb/raw_gadget.h
+++ b/include/uapi/linux/usb/raw_gadget.h
@@ -123,6 +123,11 @@ struct usb_raw_ep_caps {
 	__u32	type_int	: 1;
 	__u32	dir_in		: 1;
 	__u32	dir_out		: 1;
+#ifdef __m68k__
+	__u32			: 2;
+#else
+	__u32			:26;
+#endif
 };
=20
 /*
@@ -150,6 +155,9 @@ struct usb_raw_ep_info {
 	__u8				name[USB_RAW_EP_NAME_MAX];
 	__u32				addr;
 	struct usb_raw_ep_caps		caps;
+#ifdef __m68k__
+	__u8				:8;
+#endif
 	struct usb_raw_ep_limits	limits;
 };
=20
diff --git a/include/uapi/linux/usbdevice_fs.h b/include/uapi/linux/usbd=
evice_fs.h
index 74a84e02422a..803eac8631ec 100644
--- a/include/uapi/linux/usbdevice_fs.h
+++ b/include/uapi/linux/usbdevice_fs.h
@@ -44,15 +44,17 @@ struct usbdevfs_ctrltransfer {
 	__u16 wIndex;
 	__u16 wLength;
 	__u32 timeout;  /* in milliseconds */
+	__uapi_arch_pad_long;
  	void __user *data;
-};
+} __uapi_arch_align;
=20
 struct usbdevfs_bulktransfer {
 	unsigned int ep;
 	unsigned int len;
 	unsigned int timeout; /* in milliseconds */
+	__uapi_arch_pad_long;
 	void __user *data;
-};
+} __uapi_arch_align;
=20
 struct usbdevfs_setinterface {
 	unsigned int interface;
@@ -61,8 +63,9 @@ struct usbdevfs_setinterface {
=20
 struct usbdevfs_disconnectsignal {
 	unsigned int signr;
+	__uapi_arch_pad_long;
 	void __user *context;
-};
+} __uapi_arch_align;
=20
 #define USBDEVFS_MAXDRIVERNAME 255
=20
@@ -74,7 +77,9 @@ struct usbdevfs_getdriver {
 struct usbdevfs_connectinfo {
 	unsigned int devnum;
 	unsigned char slow;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 struct usbdevfs_conninfo_ex {
 	__u32 size;		/* Size of the structure from the kernel's */
@@ -117,8 +122,10 @@ struct usbdevfs_iso_packet_desc {
 struct usbdevfs_urb {
 	unsigned char type;
 	unsigned char endpoint;
+	__uapi_arch_pad16;
 	int status;
 	unsigned int flags;
+	__uapi_arch_pad_long;
 	void __user *buffer;
 	int buffer_length;
 	int actual_length;
@@ -131,8 +138,8 @@ struct usbdevfs_urb {
 	unsigned int signr;	/* signal to be sent on completion,
 				  or 0 if none should be sent. */
 	void __user *usercontext;
-	struct usbdevfs_iso_packet_desc iso_frame_desc[];
-};
+		struct usbdevfs_iso_packet_desc iso_frame_desc[];
+} __uapi_arch_align;
=20
 /* ioctls for talking directly to drivers */
 struct usbdevfs_ioctl {
diff --git a/include/uapi/linux/userfaultfd.h b/include/uapi/linux/userf=
aultfd.h
index 2841e4ea8f2c..986a67676485 100644
--- a/include/uapi/linux/userfaultfd.h
+++ b/include/uapi/linux/userfaultfd.h
@@ -119,7 +119,8 @@ struct uffd_msg {
 			union {
 				__u32 ptid;
 			} feat;
-		} pagefault;
+			__uapi_arch_pad32;
+		} __uapi_arch_align pagefault;
=20
 		struct {
 			__u32	ufd;
diff --git a/include/uapi/linux/uvcvideo.h b/include/uapi/linux/uvcvideo=
.h
index cbe15bca9569..cf1c521072ae 100644
--- a/include/uapi/linux/uvcvideo.h
+++ b/include/uapi/linux/uvcvideo.h
@@ -64,6 +64,7 @@ struct uvc_xu_control_mapping {
=20
 	__u8 size;
 	__u8 offset;
+	__uapi_arch_pad8;
 	__u32 v4l2_type;
 	__u32 data_type;
=20
@@ -71,16 +72,19 @@ struct uvc_xu_control_mapping {
 	__u32 menu_count;
=20
 	__u32 reserved[4];
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 struct uvc_xu_control_query {
 	__u8 unit;
 	__u8 selector;
 	__u8 query;		/* Video Class-Specific Request Code, */
 				/* defined in linux/usb/video.h A.8.  */
+	__uapi_arch_pad8;
 	__u16 size;
+	__uapi_arch_pad16;
 	__u8 __user *data;
-};
+} __uapi_arch_align;
=20
 #define UVCIOC_CTRL_MAP		_IOWR('u', 0x20, struct uvc_xu_control_mapping)
 #define UVCIOC_CTRL_QUERY	_IOWR('u', 0x21, struct uvc_xu_control_query)
diff --git a/include/uapi/linux/vboxguest.h b/include/uapi/linux/vboxgue=
st.h
index 15125f6ec60d..20d954204934 100644
--- a/include/uapi/linux/vboxguest.h
+++ b/include/uapi/linux/vboxguest.h
@@ -196,6 +196,9 @@ struct vbg_ioctl_log {
 			char msg[1];
 		} in;
 	} u;
+	/* architecture-specific padding to alignof(struct vbg_ioctl_hdr) */
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 };
=20
 #define VBG_IOCTL_LOG(s)		_IO('V', 9)
diff --git a/include/uapi/linux/vduse.h b/include/uapi/linux/vduse.h
index 10ad71aa00d6..e346fcee4684 100644
--- a/include/uapi/linux/vduse.h
+++ b/include/uapi/linux/vduse.h
@@ -74,6 +74,9 @@ struct vduse_iotlb_entry {
 #define VDUSE_ACCESS_WO 0x2
 #define VDUSE_ACCESS_RW 0x3
 	__u8 perm;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+	__uapi_arch_pad32;
 };
=20
 /*
@@ -180,7 +183,10 @@ struct vduse_vq_info {
 		struct vduse_vq_state_packed packed;
 	};
 	__u8 ready;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /* Get the specified virtqueue's information. Caller should set index f=
ield. */
 #define VDUSE_VQ_GET_INFO	_IOWR(VDUSE_BASE, 0x15, struct vduse_vq_info)
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index ac2329f24141..b8347144ca04 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -1567,9 +1567,10 @@ struct vfio_iommu_type1_info_cap_iova_range {
 struct vfio_iommu_type1_info_cap_migration {
 	struct	vfio_info_cap_header header;
 	__u32	flags;
+	__uapi_arch_pad32;
 	__u64	pgsize_bitmap;
 	__u64	max_dirty_bitmap_size;		/* in bytes */
-};
+} __uapi_arch_align;
=20
 /*
  * The DMA available capability allows to report the current number of
@@ -1619,7 +1620,8 @@ struct vfio_bitmap {
 	__u64        pgsize;	/* page size for bitmap in bytes */
 	__u64        size;	/* in bytes */
 	__u64 __user *data;	/* one bit per page */
-};
+	__uapi_arch_pad_long_to_u64;
+} __uapi_arch_align;
=20
 /**
  * VFIO_IOMMU_UNMAP_DMA - _IOWR(VFIO_TYPE, VFIO_BASE + 14,
@@ -1784,10 +1786,11 @@ struct vfio_eeh_pe_op {
 	__u32 argsz;
 	__u32 flags;
 	__u32 op;
+	__uapi_arch_pad32;
 	union {
 		struct vfio_eeh_pe_err err;
 	};
-};
+} __uapi_arch_align;
=20
 #define VFIO_EEH_PE_DISABLE		0	/* Disable EEH functionality */
 #define VFIO_EEH_PE_ENABLE		1	/* Enable EEH functionality  */
diff --git a/include/uapi/linux/vfio_zdev.h b/include/uapi/linux/vfio_zd=
ev.h
index 77f2aff1f27e..a61ce98f91e2 100644
--- a/include/uapi/linux/vfio_zdev.h
+++ b/include/uapi/linux/vfio_zdev.h
@@ -31,8 +31,9 @@ struct vfio_device_info_cap_zpci_base {
 	__u8 gid;		/* PCI function group ID */
 	/* End of version 1 */
 	__u32 fh;		/* PCI function handle */
+	__uapi_arch_pad32;
 	/* End of version 2 */
-};
+} __uapi_arch_align;
=20
 /**
  * VFIO_DEVICE_INFO_CAP_ZPCI_GROUP - Base PCI Function Group information
@@ -53,8 +54,10 @@ struct vfio_device_info_cap_zpci_group {
 	/* End of version 1 */
 	__u8 reserved;
 	__u16 imaxstbl;		/* Maximum Interpreted Store Block Length */
+	__uapi_arch_pad16;
+	__uapi_arch_pad32;
 	/* End of version 2 */
-};
+} __uapi_arch_align;
=20
 /**
  * VFIO_DEVICE_INFO_CAP_ZPCI_UTIL - Utility String
diff --git a/include/uapi/linux/vhost_types.h b/include/uapi/linux/vhost=
_types.h
index 1c39cc5f5a31..5ef7f1108d62 100644
--- a/include/uapi/linux/vhost_types.h
+++ b/include/uapi/linux/vhost_types.h
@@ -88,18 +88,21 @@ struct vhost_iotlb_msg {
 #define VHOST_IOTLB_BATCH_BEGIN    5
 #define VHOST_IOTLB_BATCH_END      6
 	__u8 type;
-};
+	__uapi_arch_pad16;
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 #define VHOST_IOTLB_MSG 0x1
 #define VHOST_IOTLB_MSG_V2 0x2
=20
 struct vhost_msg {
 	int type;
+	__uapi_arch_pad32;
 	union {
 		struct vhost_iotlb_msg iotlb;
 		__u8 padding[64];
 	};
-};
+} __uapi_arch_align;
=20
 struct vhost_msg_v2 {
 	__u32 type;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videode=
v2.h
index add08188f068..3fb3713439b8 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1180,6 +1180,7 @@ struct v4l2_buffer {
 	__u32			bytesused;
 	__u32			flags;
 	__u32			field;
+	__uapi_arch_pad32; /* not for 32-bit time_t! */
 #ifdef __KERNEL__
 	struct __kernel_v4l2_timeval timestamp;
 #else
@@ -1202,7 +1203,8 @@ struct v4l2_buffer {
 		__s32		request_fd;
 		__u32		reserved;
 	};
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 #ifndef __KERNEL__
 /**
@@ -1337,9 +1339,13 @@ struct v4l2_window {
 	__u32			chromakey;
 	struct v4l2_clip	*clips;
 	__u32			clipcount;
+	__uapi_arch_pad_long;
 	void			__user *bitmap;
 	__u8                    global_alpha;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 /*
  *	C A P T U R E   P A R A M E T E R S
@@ -1541,12 +1547,14 @@ typedef __u64 v4l2_std_id;
=20
 struct v4l2_standard {
 	__u32		     index;
+	__uapi_arch_pad32;
 	v4l2_std_id          id;
 	__u8		     name[24];
 	struct v4l2_fract    frameperiod; /* Frames, not fields */
 	__u32		     framelines;
 	__u32		     reserved[4];
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /*
  *	D V	B T	T I M I N G S
@@ -1799,7 +1807,8 @@ struct v4l2_input {
 	__u32	     status;
 	__u32	     capabilities;
 	__u32	     reserved[3];
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /*  Values for the 'type' field */
 #define V4L2_INPUT_TYPE_TUNER		1
@@ -1924,8 +1933,9 @@ struct v4l2_ext_controls {
 	__u32 error_idx;
 	__s32 request_fd;
 	__u32 reserved[1];
+	__uapi_arch_pad_long;
 	struct v4l2_ext_control *controls;
-};
+} __uapi_arch_align;
=20
 #define V4L2_CTRL_ID_MASK	  (0x0fffffff)
 #ifndef __KERNEL__
@@ -2336,9 +2346,10 @@ struct v4l2_sliced_vbi_format {
 				 (equals frame lines 313-336 for 625 line video
 				  standards, 263-286 for 525 line standards) */
 	__u16   service_lines[2][24];
+	__uapi_arch_pad16;
 	__u32   io_size;
 	__u32   reserved[2];            /* must be zero */
-};
+} __uapi_arch_align;
=20
 /* Teletext World System Teletext
    (WST), defined on ITU-R BT.653-2 */
@@ -2360,9 +2371,10 @@ struct v4l2_sliced_vbi_cap {
 				 (equals frame lines 313-336 for 625 line video
 				  standards, 263-286 for 525 line standards) */
 	__u16   service_lines[2][24];
+	__uapi_arch_pad16;
 	__u32	type;		/* enum v4l2_buf_type */
 	__u32   reserved[3];    /* must be 0 */
-};
+} __uapi_arch_align;
=20
 struct v4l2_sliced_vbi_data {
 	__u32   id;
@@ -2517,6 +2529,7 @@ struct v4l2_meta_format {
  */
 struct v4l2_format {
 	__u32	 type;
+	__uapi_arch_pad_long;
 	union {
 		struct v4l2_pix_format		pix;     /* V4L2_BUF_TYPE_VIDEO_CAPTURE */
 		struct v4l2_pix_format_mplane	pix_mp;  /* V4L2_BUF_TYPE_VIDEO_CAPTURE=
_MPLANE */
@@ -2577,7 +2590,8 @@ struct v4l2_event_ctrl {
 	__s32 maximum;
 	__s32 step;
 	__s32 default_value;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 struct v4l2_event_frame_sync {
 	__u32 frame_sequence;
@@ -2606,6 +2620,7 @@ struct v4l2_event_motion_det {
=20
 struct v4l2_event {
 	__u32				type;
+	__uapi_arch_pad32;
 	union {
 		struct v4l2_event_vsync		vsync;
 		struct v4l2_event_ctrl		ctrl;
@@ -2623,7 +2638,8 @@ struct v4l2_event {
 #endif
 	__u32				id;
 	__u32				reserved[8];
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 #define V4L2_EVENT_SUB_FL_SEND_INITIAL		(1 << 0)
 #define V4L2_EVENT_SUB_FL_ALLOW_FEEDBACK	(1 << 1)
@@ -2699,12 +2715,13 @@ struct v4l2_create_buffers {
 	__u32			index;
 	__u32			count;
 	__u32			memory;
+	__uapi_arch_pad_long;
 	struct v4l2_format	format;
 	__u32			capabilities;
 	__u32			flags;
 	__u32			max_num_buffers;
 	__u32			reserved[5];
-};
+} __uapi_arch_align;
=20
 /**
  * struct v4l2_remove_buffers - VIDIOC_REMOVE_BUFS argument
diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio=
_net.h
index 1db45b01532b..9048c6e7c386 100644
--- a/include/uapi/linux/virtio_net.h
+++ b/include/uapi/linux/virtio_net.h
@@ -357,9 +357,23 @@ struct virtio_net_rss_config {
 	__le16 unclassified_queue;
 	__le16 indirection_table[1/* + indirection_table_mask */];
 	__le16 max_tx_vq;
-	__u8 hash_key_length;
-	__u8 hash_key_data[/* hash_key_length */];
-};
+	union {
+		/*
+		 * structure size is a aligned for 32-bit member,
+		 * either 16 or 32 bit depending on architecture,
+		 * but flexarray hash_key_data starts before end.
+		 */
+#ifdef __m68k__
+		__u16 :16;
+#else
+		__u32 :32;
+#endif
+		struct {
+			__u8 hash_key_length;
+			__u8 hash_key_data[/* hash_key_length */];
+		};
+	} __uapi_arch_align;
+} __uapi_arch_align;
=20
 struct virtio_net_rss_config_hdr {
 	__le32 hash_types;
@@ -371,7 +385,10 @@ struct virtio_net_rss_config_hdr {
 struct virtio_net_rss_config_trailer {
 	__le16 max_tx_vq;
 	__u8 hash_key_length;
-	__u8 hash_key_data[/* hash_key_length */];
+	union {
+		__uapi_arch_pad8;
+		__DECLARE_FLEX_ARRAY(__u8, hash_key_data); /* hash_key_length */
+	};
 };
=20
  #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1
@@ -388,9 +405,18 @@ struct virtio_net_hash_config {
 	__le32 hash_types;
 	/* for compatibility with virtio_net_rss_config */
 	__le16 reserved[4];
-	__u8 hash_key_length;
-	__u8 hash_key_data[/* hash_key_length */];
-};
+	union {
+#ifdef __m68k__
+		__u16 :16;
+#else
+		__u32 :32;
+#endif
+		struct {
+			__u8 hash_key_length;
+			__u8 hash_key_data[/* hash_key_length */];
+		};
+	};
+} __uapi_arch_align;
=20
  #define VIRTIO_NET_CTRL_MQ_HASH_CONFIG         2
=20
diff --git a/include/uapi/linux/virtio_ring.h b/include/uapi/linux/virti=
o_ring.h
index f8c20d3de8da..9d01bfd25170 100644
--- a/include/uapi/linux/virtio_ring.h
+++ b/include/uapi/linux/virtio_ring.h
@@ -157,13 +157,14 @@ typedef struct vring_used __attribute__((aligned(V=
RING_USED_ALIGN_SIZE)))
=20
 struct vring {
 	unsigned int num;
+	__uapi_arch_pad_long;
=20
 	vring_desc_t *desc;
=20
 	vring_avail_t *avail;
=20
 	vring_used_t *used;
-};
+} __uapi_arch_align;
=20
 #ifndef VIRTIO_RING_NO_LEGACY
=20
@@ -202,7 +203,7 @@ static inline void vring_init(struct vring *vr, unsi=
gned int num, void *p,
 	vr->num =3D num;
 	vr->desc =3D p;
 	vr->avail =3D (struct vring_avail *)((char *)p + num * sizeof(struct v=
ring_desc));
-	vr->used =3D (void *)(((uintptr_t)&vr->avail->ring[num] + sizeof(__vir=
tio16)
+	vr->used =3D (void *)(((unsigned long)&vr->avail->ring[num] + sizeof(_=
_virtio16)
 		+ align-1) & ~(align - 1));
 }
=20
diff --git a/include/uapi/linux/virtio_snd.h b/include/uapi/linux/virtio=
_snd.h
index a4cfb9f6561a..40a1482cfaa2 100644
--- a/include/uapi/linux/virtio_snd.h
+++ b/include/uapi/linux/virtio_snd.h
@@ -407,6 +407,12 @@ struct virtio_snd_ctl_info {
 	__le32 index;
 	/* name identifier string for the element */
 	__u8 name[44];
+
+	/*
+	 * value union needs 64-bit alignment on some architectures, which
+	 * makes the layout architecture specific.
+	 */
+	__uapi_arch_pad32;
 	/* additional information about the element's value */
 	union {
 		/* VIRTIO_SND_CTL_TYPE_INTEGER */
diff --git a/include/uapi/linux/vm_sockets.h b/include/uapi/linux/vm_soc=
kets.h
index e05280e41522..a9d4215b2a5f 100644
--- a/include/uapi/linux/vm_sockets.h
+++ b/include/uapi/linux/vm_sockets.h
@@ -185,7 +185,7 @@ struct sockaddr_vm {
 	unsigned int svm_port;
 	unsigned int svm_cid;
 	__u8 svm_flags;
-	unsigned char svm_zero[sizeof(struct sockaddr) -
+	unsigned char svm_zero[sizeof(struct __kernel_sockaddr) -
 			       sizeof(sa_family_t) -
 			       sizeof(unsigned short) -
 			       sizeof(unsigned int) -
diff --git a/include/uapi/linux/wireless.h b/include/uapi/linux/wireless=
.h
index 3c2ad5fae17f..98a23b2cfc43 100644
--- a/include/uapi/linux/wireless.h
+++ b/include/uapi/linux/wireless.h
@@ -692,7 +692,8 @@ struct iw_point {
   void __user	*pointer;	/* Pointer to the data  (in user space) */
   __u16		length;		/* number of fields or size in bytes */
   __u16		flags;		/* Optional params */
-};
+  __uapi_arch_pad_long;
+} __uapi_arch_align;
=20
=20
 /*
@@ -884,9 +885,10 @@ struct iw_statistics {
=20
 	struct iw_quality	qual;		/* Quality of the link
 						 * (instant/mean/max) */
+	__uapi_arch_pad16;
 	struct iw_discarded	discard;	/* Packet discarded counts */
 	struct iw_missed	miss;		/* Packet missed counts */
-};
+} __uapi_arch_align;
=20
 /* ------------------------ IOCTL REQUEST ------------------------ */
 /*
@@ -1002,6 +1004,8 @@ struct iw_range {
=20
 	/* Rates */
 	__u8		num_bitrates;	/* Number of entries in the list */
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	__s32		bitrate[IW_MAX_BITRATES];	/* list, in bps */
=20
 	/* RTS threshold */
@@ -1025,12 +1029,16 @@ struct iw_range {
 	__u16	encoding_size[IW_MAX_ENCODING_SIZES];	/* Different token sizes */
 	__u8	num_encoding_sizes;	/* Number of entry in the list */
 	__u8	max_encoding_tokens;	/* Max number of tokens */
+
 	/* For drivers that need a "login/passwd" form */
 	__u8	encoding_login_index;	/* token index for login token */
+	__uapi_arch_pad8;
=20
 	/* Transmit power */
 	__u16		txpower_capa;	/* What options are supported */
 	__u8		num_txpower;	/* Number of entries in the list */
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	__s32		txpower[IW_MAX_TXPOWER];	/* list, in bps */
=20
 	/* Wireless Extension version info */
@@ -1049,12 +1057,13 @@ struct iw_range {
 	/* Frequency */
 	__u16		num_channels;	/* Number of channels [0; num - 1] */
 	__u8		num_frequency;	/* Number of entry in the list */
+	__uapi_arch_pad8;
 	struct iw_freq	freq[IW_MAX_FREQUENCIES];	/* list */
 	/* Note : this frequency list doesn't need to fit channel numbers,
 	 * because each entry contain its channel index */
=20
 	__u32		enc_capa;	/* IW_ENC_CAPA_* bit field */
-};
+} __uapi_arch_align;
=20
 /*
  * Private ioctl interface information
@@ -1080,8 +1089,9 @@ struct iw_priv_args {
 struct iw_event {
 	__u16		len;			/* Real length of this stuff */
 	__u16		cmd;			/* Wireless IOCTL */
+	__uapi_arch_pad_long;
 	union iwreq_data	u;		/* IOCTL fixed payload */
-};
+} __uapi_arch_align;
=20
 /* Size of the Event prefix (including padding and alignement junk) */
 #define IW_EV_LCP_LEN	(sizeof(struct iw_event) - sizeof(union iwreq_dat=
a))
diff --git a/include/uapi/linux/x25.h b/include/uapi/linux/x25.h
index 034b7dc5593a..1b4ffcbac46b 100644
--- a/include/uapi/linux/x25.h
+++ b/include/uapi/linux/x25.h
@@ -75,7 +75,8 @@ struct x25_subscrip_struct {
 	char device[200-sizeof(unsigned long)];
 	unsigned long	global_facil_mask;	/* 0 to disable negotiation */
 	unsigned int	extended;
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 /* values for above global_facil_mask */
=20
diff --git a/include/uapi/linux/xfrm.h b/include/uapi/linux/xfrm.h
index 1e463fd4e93a..b14088829f8c 100644
--- a/include/uapi/linux/xfrm.h
+++ b/include/uapi/linux/xfrm.h
@@ -59,9 +59,11 @@ struct xfrm_selector {
 	__u8	prefixlen_d;
 	__u8	prefixlen_s;
 	__u8	proto;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	int	ifindex;
 	__kernel_uid32_t	user;
-};
+} __uapi_arch_align;
=20
 #define XFRM_INF (~(__u64)0)
=20
@@ -265,8 +267,9 @@ struct xfrm_encap_tmpl {
 	__u16		encap_type;
 	__be16		encap_sport;
 	__be16		encap_dport;
+	__uapi_arch_pad16;
 	xfrm_address_t	encap_oa;
-};
+} __uapi_arch_align;
=20
 /* AEVENT flags  */
 enum xfrm_ae_ftype_t {
@@ -285,9 +288,11 @@ enum xfrm_ae_ftype_t {
=20
 struct xfrm_userpolicy_type {
 	__u8		type;
+	__uapi_arch_pad8;
 	__u16		reserved1;
 	__u8		reserved2;
-};
+	__uapi_arch_pad8;
+} __uapi_arch_align;
=20
 /* Netlink message attributes.  */
 enum xfrm_attr_type_t {
@@ -409,7 +414,10 @@ struct xfrm_usersa_info {
 #define XFRM_STATE_AF_UNSPEC	32
 #define XFRM_STATE_ALIGN4	64
 #define XFRM_STATE_ESN		128
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 #define XFRM_SA_XFLAG_DONT_ENCAP_DSCP	1
 #define XFRM_SA_XFLAG_OSEQ_MAY_WRAP	2
@@ -419,7 +427,8 @@ struct xfrm_usersa_id {
 	__be32				spi;
 	__u16				family;
 	__u8				proto;
-};
+	__uapi_arch_pad8;
+} __uapi_arch_align;
=20
 struct xfrm_aevent_id {
 	struct xfrm_usersa_id		sa_id;
@@ -450,13 +459,16 @@ struct xfrm_userpolicy_info {
 #define XFRM_POLICY_ICMP	2
 #define XFRM_POLICY_CPU_ACQUIRE	4
 	__u8				share;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 struct xfrm_userpolicy_id {
 	struct xfrm_selector		sel;
 	__u32				index;
 	__u8				dir;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 struct xfrm_user_acquire {
 	struct xfrm_id			id;
@@ -472,12 +484,18 @@ struct xfrm_user_acquire {
 struct xfrm_user_expire {
 	struct xfrm_usersa_info		state;
 	__u8				hard;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 struct xfrm_user_polexpire {
 	struct xfrm_userpolicy_info	pol;
 	__u8				hard;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 struct xfrm_usersa_flush {
 	__u8				proto;
@@ -485,8 +503,10 @@ struct xfrm_usersa_flush {
=20
 struct xfrm_user_report {
 	__u8				proto;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	struct xfrm_selector		sel;
-};
+} __uapi_arch_align;
=20
 /* Used by MIGRATE to pass addresses IKE should use to perform
  * SA negotiation with the peer */
@@ -495,7 +515,8 @@ struct xfrm_user_kmaddress {
 	xfrm_address_t                  remote;
 	__u32				reserved;
 	__u16				family;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 struct xfrm_user_migrate {
 	xfrm_address_t			old_daddr;
@@ -530,7 +551,9 @@ struct xfrm_address_filter {
 struct xfrm_user_offload {
 	int				ifindex;
 	__u8				flags;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
 /* This flag was exposed without any kernel code that supports it.
  * Unfortunately, strongswan has the code that sets this flag,
  * which makes it impossible to reuse this bit.
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index c6e2925f47e6..3ccf50960ba5 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -118,7 +118,8 @@ struct fastrpc_mem_map {
 	__u64 vaddrout;		/* [out] remote virtual address */
 	__s32 attrs;		/* buffer attributes used for SMMU mapping */
 	__s32 reserved[4];
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 struct fastrpc_req_munmap {
 	__u64 vaddrout;	/* address to unmap */
@@ -131,7 +132,8 @@ struct fastrpc_mem_unmap {
 	__u64 vaddr;		/* remote process (dsp) virtual address */
 	__u64 length;		/* buffer size */
 	__s32 reserved[5];
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 struct fastrpc_ioctl_capability {
 	__u32 unused; /* deprecated, ignored by the kernel */
diff --git a/include/uapi/misc/xilinx_sdfec.h b/include/uapi/misc/xilinx=
_sdfec.h
index ee1a42ae6f46..1e592afcbe5f 100644
--- a/include/uapi/misc/xilinx_sdfec.h
+++ b/include/uapi/misc/xilinx_sdfec.h
@@ -140,7 +140,9 @@ enum xsdfec_axis_word_include {
 struct xsdfec_turbo {
 	__u32 alg;
 	__u8 scale;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /**
  * struct xsdfec_ldpc_params - User data for LDPC codes.
@@ -183,11 +185,14 @@ struct xsdfec_ldpc_params {
 	__u32 sc_off;
 	__u32 la_off;
 	__u32 qc_off;
+	__uapi_arch_pad_long;
 	__u32 *sc_table;
 	__u32 *la_table;
 	__u32 *qc_table;
 	__u16 code_id;
-};
+	__uapi_arch_pad16;
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 /**
  * struct xsdfec_status - Status of SD-FEC core.
@@ -197,7 +202,9 @@ struct xsdfec_ldpc_params {
 struct xsdfec_status {
 	__u32 state;
 	__s8 activity;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /**
  * struct xsdfec_irq - Enabling or Disabling Interrupts.
diff --git a/include/uapi/mtd/mtd-abi.h b/include/uapi/mtd/mtd-abi.h
index 714d55b49d2a..168717991c7c 100644
--- a/include/uapi/mtd/mtd-abi.h
+++ b/include/uapi/mtd/mtd-abi.h
@@ -136,7 +136,8 @@ struct mtd_read_req {
 	__u8 mode;
 	__u8 padding[7];
 	struct mtd_read_req_ecc_stats ecc_stats;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 #define MTD_ABSENT		0
 #define MTD_RAM			1
@@ -174,13 +175,15 @@ struct mtd_read_req {
=20
 struct mtd_info_user {
 	__u8 type;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	__u32 flags;
 	__u32 size;	/* Total size of the MTD */
 	__u32 erasesize;
 	__u32 writesize;
 	__u32 oobsize;	/* Amount of OOB data per block (e.g. 16) */
 	__u64 padding;	/* Old obsolete field; do not use */
-};
+} __uapi_arch_align;
=20
 struct region_info_user {
 	__u32 offset;		/* At which this region starts,
diff --git a/include/uapi/rdma/bnxt_re-abi.h b/include/uapi/rdma/bnxt_re=
-abi.h
index faa9d62b3b30..dfbd4a90c5d0 100644
--- a/include/uapi/rdma/bnxt_re-abi.h
+++ b/include/uapi/rdma/bnxt_re-abi.h
@@ -129,6 +129,7 @@ struct bnxt_re_qp_req {
 	__aligned_u64 qp_handle;
 	__aligned_u64 comp_mask;
 	__u32 sq_slots;
+	__u32 :32;
 };
=20
 struct bnxt_re_qp_resp {
diff --git a/include/uapi/rdma/hfi/hfi1_ioctl.h b/include/uapi/rdma/hfi/=
hfi1_ioctl.h
index 8f3d9fe7b141..864264f049b7 100644
--- a/include/uapi/rdma/hfi/hfi1_ioctl.h
+++ b/include/uapi/rdma/hfi/hfi1_ioctl.h
@@ -94,7 +94,8 @@ struct hfi1_ctxt_info {
 	__u16 rcvhdrq_cnt;      /* number of RcvHdrQ entries */
 	__u16 rcvhdrq_entsize;  /* size (in bytes) for each RcvHdrQ entry */
 	__u16 sdma_ring_size;   /* number of entries in SDMA request ring */
-};
+	__u16 :16;		/* pad to 8 byte alignment */
+} __attribute__((aligned(8)));
=20
 struct hfi1_tid_info {
 	/* virtual address of first page in transfer */
diff --git a/include/uapi/rdma/ib_user_ioctl_verbs.h b/include/uapi/rdma=
/ib_user_ioctl_verbs.h
index 89e6a3f13191..3f46f6e06017 100644
--- a/include/uapi/rdma/ib_user_ioctl_verbs.h
+++ b/include/uapi/rdma/ib_user_ioctl_verbs.h
@@ -192,7 +192,8 @@ struct ib_uverbs_flow_action_esp_encap {
 	RDMA_UAPI_PTR(struct ib_uverbs_flow_action_esp_encap *, next_ptr);
 	__u16	len;		/* Len of the filter struct val_ptr points to */
 	__u16	type;		/* Use flow_spec_type enum */
-};
+	__u32 :32; /* pad to 8-byte alignment */
+} __attribute__((aligned(8)));
=20
 struct ib_uverbs_flow_action_esp {
 	__u32		spi;
diff --git a/include/uapi/rdma/ib_user_mad.h b/include/uapi/rdma/ib_user=
_mad.h
index 10b5f6a4c677..3f35feae4f0b 100644
--- a/include/uapi/rdma/ib_user_mad.h
+++ b/include/uapi/rdma/ib_user_mad.h
@@ -190,7 +190,8 @@ struct ib_user_mad_reg_req {
 	__u8	mgmt_class_version;
 	__u8    oui[3];
 	__u8	rmpp_version;
-};
+	__uapi_arch_pad8;
+} __attribute__((aligned(4)));
=20
 /**
  * ib_user_mad_reg_req2 - MAD registration request
diff --git a/include/uapi/rdma/qedr-abi.h b/include/uapi/rdma/qedr-abi.h
index bf7333b2b5d7..8a26bc0ced00 100644
--- a/include/uapi/rdma/qedr-abi.h
+++ b/include/uapi/rdma/qedr-abi.h
@@ -130,14 +130,19 @@ struct qedr_create_qp_uresp {
 	/* SQ */
 	__u32 sq_db_offset;
 	__u16 sq_icid;
+	__uapi_arch_pad16;
=20
 	/* RQ */
 	__u32 rq_db_offset;
 	__u16 rq_icid;
+	__uapi_arch_pad16;
=20
 	__u32 rq_db2_offset;
 	__u32 reserved;
-
+#ifdef __m68k__
+	__u16 :16;
+	__u16 :16;
+#endif
 	/* address of SQ doorbell recovery user entry */
 	__aligned_u64 sq_db_rec_addr;
=20
diff --git a/include/uapi/rdma/rdma_user_rxe.h b/include/uapi/rdma/rdma_=
user_rxe.h
index bb092fccb813..7119f72b77df 100644
--- a/include/uapi/rdma/rdma_user_rxe.h
+++ b/include/uapi/rdma/rdma_user_rxe.h
@@ -58,7 +58,8 @@ struct rxe_global_route {
 	__u8		sgid_index;
 	__u8		hop_limit;
 	__u8		traffic_class;
-};
+	__uapi_arch_pad8;
+} __uapi_arch_align;
=20
 struct rxe_av {
 	__u8			port_num;
@@ -88,6 +89,8 @@ struct rxe_send_wr {
 			__u32	rkey;
 			__u8	type;
 			__u8	level;
+			__u16 :16;
+			__u32 :32;
 		} flush;
 		struct {
 			__aligned_u64 remote_addr;
diff --git a/include/uapi/regulator/regulator.h b/include/uapi/regulator=
/regulator.h
index 71bf71a22e7f..8ee9cdc9461f 100644
--- a/include/uapi/regulator/regulator.h
+++ b/include/uapi/regulator/regulator.h
@@ -8,9 +8,9 @@
 #ifndef _UAPI_REGULATOR_H
 #define _UAPI_REGULATOR_H
=20
-#ifdef __KERNEL__
 #include <linux/types.h>
-#else
+
+#ifndef __KERNEL__
 #include <stdint.h>
 #endif
=20
@@ -62,7 +62,7 @@
=20
 struct reg_genl_event {
 	char reg_name[32];
-	uint64_t event;
+	__u64 event;
 };
=20
 /* attributes of reg_genl_family */
diff --git a/include/uapi/scsi/fc/fc_els.h b/include/uapi/scsi/fc/fc_els=
.h
index 019096beb179..b7bc5c952c7b 100644
--- a/include/uapi/scsi/fc/fc_els.h
+++ b/include/uapi/scsi/fc/fc_els.h
@@ -744,8 +744,9 @@ struct fc_els_rpl_resp {
 	__u8		rpl_llen[3];	/* list length */
 	__u8		rpl_resv3;	/* reserved - must be zero */
 	__u8		rpl_index[3];	/* starting index */
+	__uapi_arch_pad32;
 	struct fc_els_pnb rpl_pnb[1];	/* variable number of PNBs */
-};
+} __uapi_arch_align;
=20
 /*
  * Link Error Status Block.
@@ -766,8 +767,9 @@ struct fc_els_rps {
 	__u8		rps_cmd;	/* command */
 	__u8		rps_resv[2];	/* reserved - must be zero */
 	__u8		rps_flag;	/* flag - see below */
+	__uapi_arch_pad32;
 	__be64		rps_port_spec;	/* port selection */
-};
+} __uapi_arch_align;
=20
 enum fc_els_rps_flag {
 	FC_ELS_RPS_DID =3D	0x00,	/* port identified by D_ID of req. */
@@ -874,6 +876,7 @@ struct fc_els_clir {
 	__u8		clir_port_type;	/* incident port type */
 	__u8		clir_port_id[3];	/* incident port ID */
=20
+	__uapi_arch_pad32;
 	__be64		clir_conn_wwpn;	/* connected port name */
 	__be64		clir_conn_wwnn;	/* connected node name */
 	__be64		clir_fab_name;	/* fabric name */
@@ -881,8 +884,9 @@ struct fc_els_clir {
 	__be32		clir_trans_id;	/* transaction ID */
 	__u8		clir_resv[3];	/* reserved */
 	__u8		clir_ts_fmt;	/* time stamp format */
+	__uapi_arch_pad32;
 	__be64		clir_timestamp;	/* time stamp */
-};
+} __uapi_arch_align;
=20
 /*
  * CLIR clir_ts_fmt - time stamp format values.
@@ -1052,7 +1056,8 @@ struct fc_fn_deli_desc {
 					 * detecting Port Name
 					 */
 	__be32		deli_reason_code;/* see enum fc_fpin_deli_event_types */
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /*
  * Peer Congestion Notification Descriptor
@@ -1075,10 +1080,11 @@ struct fc_fn_peer_congn_desc {
 					 * congestion event
 					 */
 	__be32		pname_count;	/* number of portname_list elements */
+	__uapi_arch_pad32;
 	__be64		pname_list[];	/* list of N_Port_Names accessible
 					 * through the attached port
 					 */
-};
+} __uapi_arch_align;
=20
 /*
  * Congestion Notification Descriptor
diff --git a/include/uapi/scsi/scsi_bsg_mpi3mr.h b/include/uapi/scsi/scs=
i_bsg_mpi3mr.h
index f5ea1db92339..e750ea5edbc8 100644
--- a/include/uapi/scsi/scsi_bsg_mpi3mr.h
+++ b/include/uapi/scsi/scsi_bsg_mpi3mr.h
@@ -248,8 +248,11 @@ struct mpi3mr_logdata_entry {
 	__u8	valid_entry;
 	__u8	rsvd1;
 	__u16	rsvd2;
-	__u8	data[1]; /* Variable length Array */
-};
+	union {
+		__u16	:16;	 /* pad to alignment */
+		__u8	data[1]; /* Variable length Array */
+	};
+};=20
=20
 /**
  * struct mpi3mr_bsg_in_log_data - Log data entries saved by
diff --git a/include/uapi/scsi/scsi_netlink.h b/include/uapi/scsi/scsi_n=
etlink.h
index 1b1737c3c9d8..ed0c68c709f0 100644
--- a/include/uapi/scsi/scsi_netlink.h
+++ b/include/uapi/scsi/scsi_netlink.h
@@ -78,6 +78,7 @@ struct scsi_nl_host_vendor_msg {
 	__u64 vendor_id;
 	__u16 host_no;
 	__u16 vmsg_datalen;
+	__u32 :32;
 } __attribute__((aligned(sizeof(__u64))));
=20
=20
diff --git a/include/uapi/sound/asequencer.h b/include/uapi/sound/aseque=
ncer.h
index a5c41f771e05..f7f5e5abf1ab 100644
--- a/include/uapi/sound/asequencer.h
+++ b/include/uapi/sound/asequencer.h
@@ -420,10 +420,12 @@ struct snd_seq_remove_events {
=20
 	int  type;	/* For REMOVE_EVENT_TYPE */
 	char  tag;	/* Tag for REMOVE_TAG */
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
=20
 	int  reserved[10];	/* To allow for future binary compatibility */
=20
-};
+} __uapi_arch_align;
=20
=20
 	/* known port numbers */
@@ -482,6 +484,7 @@ struct snd_seq_remove_events {
 struct snd_seq_port_info {
 	struct snd_seq_addr addr;	/* client/port numbers */
 	char name[64];			/* port name */
+	__uapi_arch_pad16;
=20
 	unsigned int capability;	/* port capability bits */
 	unsigned int type;		/* port type bits */
@@ -498,7 +501,7 @@ struct snd_seq_port_info {
 	unsigned char direction;	/* port usage direction (r/w/bidir) */
 	unsigned char ump_group;	/* 0 =3D UMP EP (no conversion), 1-16 =3D UMP=
 group number */
 	char reserved[57];		/* for future use */
-};
+} __uapi_arch_align;
=20
=20
 /* queue flags */
@@ -514,11 +517,13 @@ struct snd_seq_queue_info {
 	 */
 	int owner;		/* client id for owner of the queue */
 	unsigned locked:1;	/* timing queue locked for other queues */
+	unsigned       :7;	/* pad to sizeof(unsigned) */
 	char name[64];		/* name of this queue */
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	unsigned int flags;	/* flags */
 	char reserved[60];	/* for future use */
-
-};
+} __uapi_arch_align;
=20
 /* queue info/status */
 struct snd_seq_queue_status {
@@ -593,14 +598,16 @@ struct snd_seq_port_subscribe {
=20
 struct snd_seq_query_subs {
 	struct snd_seq_addr root;	/* client/port id to be searched */
+	__uapi_arch_pad16;
 	int type;		/* READ or WRITE */
 	int index;		/* 0..N-1 */
 	int num_subs;		/* R/O: number of subscriptions on this port */
 	struct snd_seq_addr addr;	/* R/O: result */
 	unsigned char queue;	/* R/O: result */
+	__uapi_arch_pad8;
 	unsigned int flags;	/* R/O: result */
 	char reserved[64];	/* for future use */
-};
+} __uapi_arch_align;
=20
 /*
  * UMP-specific information
diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index d3ce75ba938a..daac66edc1f0 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -126,10 +126,11 @@ struct snd_hwdep_dsp_status {
 struct snd_hwdep_dsp_image {
 	unsigned int index;		/* W: DSP index */
 	unsigned char name[64];		/* W: ID (e.g. file name) */
+	__uapi_arch_pad_long;
 	unsigned char __user *image;	/* W: binary image */
-	size_t length;			/* W: size of image in bytes */
+	__kernel_size_t length;		/* W: size of image in bytes */
 	unsigned long driver_data;	/* W: driver-specific data */
-};
+} __uapi_arch_align;
=20
 #define SNDRV_HWDEP_IOCTL_PVERSION	_IOR ('H', 0x00, int)
 #define SNDRV_HWDEP_IOCTL_INFO		_IOR ('H', 0x01, struct snd_hwdep_info)
@@ -397,7 +398,10 @@ struct snd_interval {
 		     openmax:1,
 		     integer:1,
 		     empty:1;
-};
+	unsigned int :4;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 #define SNDRV_MASK_MAX	256
=20
@@ -434,6 +438,7 @@ struct snd_pcm_sw_params {
 	int tstamp_mode;			/* timestamp mode */
 	unsigned int period_step;
 	unsigned int sleep_min;			/* min ticks to sleep */
+	__uapi_arch_pad_long;
 	snd_pcm_uframes_t avail_min;		/* min avail frames for wakeup */
 	snd_pcm_uframes_t xfer_align;		/* obsolete: xfer size need to be a mul=
tiple */
 	snd_pcm_uframes_t start_threshold;	/* min hw_avail frames for automati=
c start */
@@ -449,14 +454,15 @@ struct snd_pcm_sw_params {
 	unsigned int proto;			/* protocol version */
 	unsigned int tstamp_type;		/* timestamp type (req. proto >=3D 2.0.12) =
*/
 	unsigned char reserved[56];		/* reserved for future */
-};
+} __uapi_arch_align;
=20
 struct snd_pcm_channel_info {
 	unsigned int channel;
+	__uapi_arch_pad_long;
 	__kernel_off_t offset;		/* mmap offset */
 	unsigned int first;		/* offset to first sample in bits */
 	unsigned int step;		/* samples distance in bits */
-};
+} __uapi_arch_align;
=20
 enum {
 	/*
@@ -528,12 +534,17 @@ struct __snd_timespec64 {
=20
 #endif
=20
+#define __snd_pad_long_to_timespec	__uapi_arch_pad_long_to_u64
+#define __snd_pad_int_to_timespec	__uapi_arch_pad32
+
 struct __snd_pcm_mmap_status {
 	snd_pcm_state_t state;		/* RO: state - SNDRV_PCM_STATE_XXXX */
 	int pad1;			/* Needed for 64 bit alignment */
 	snd_pcm_uframes_t hw_ptr;	/* RO: hw ptr (0...boundary-1) */
+	__snd_pad_long_to_timespec;
 	struct __snd_timespec tstamp;	/* Timestamp */
 	snd_pcm_state_t suspended_state; /* RO: suspended stream state */
+	__snd_pad_int_to_timespec;
 	struct __snd_timespec audio_tstamp; /* from sample counter or wall clo=
ck */
 };
=20
@@ -548,6 +559,7 @@ struct __snd_pcm_mmap_control {
=20
 struct __snd_pcm_sync_ptr {
 	unsigned int flags;
+	__uapi_arch_pad32;
 	union {
 		struct __snd_pcm_mmap_status status;
 		unsigned char reserved[64];
@@ -583,8 +595,8 @@ struct __snd_pcm_mmap_status64 {
 struct __snd_pcm_mmap_control64 {
 	__pad_before_uframe __pad1;
 	snd_pcm_uframes_t appl_ptr;	 /* RW: appl ptr (0...boundary-1) */
-	__pad_before_uframe __pad2;	 // This should be __pad_after_uframe, but=
 binary
-					 // backwards compatibility constraints prevent a fix.
+	__pad_before_uframe __pad2;	 /* This should be __pad_after_uframe, but=
 binary
+					   backwards compatibility constraints prevent a fix. */
=20
 	__pad_before_uframe __pad3;
 	snd_pcm_uframes_t  avail_min;	 /* RW: min available frames for wakeup =
*/
@@ -774,20 +786,25 @@ struct snd_rawmidi_framing_tstamp {
=20
 struct snd_rawmidi_params {
 	int stream;
-	size_t buffer_size;		/* queue size in bytes */
-	size_t avail_min;		/* minimum avail bytes for wakeup */
+	__uapi_arch_pad_long;
+	__kernel_size_t buffer_size;	/* queue size in bytes */
+	__kernel_size_t avail_min;	/* minimum avail bytes for wakeup */
 	unsigned int no_active_sensing: 1; /* do not send active sensing byte =
in close() */
+	unsigned int :7;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	unsigned int mode;		/* For input data only, frame incoming data */
 	unsigned char reserved[12];	/* reserved for future use */
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 #ifndef __KERNEL__
 struct snd_rawmidi_status {
 	int stream;
 	__time_pad pad1;
 	struct timespec tstamp;		/* Timestamp */
-	size_t avail;			/* available bytes */
-	size_t xruns;			/* count of overruns since last status (in bytes) */
+	__kernel_size_t avail;		/* available bytes */
+	__kernel_size_t xruns;		/* count of overruns since last status (in byt=
es) */
 	unsigned char reserved[16];	/* reserved for future use */
 };
 #endif
@@ -917,28 +934,32 @@ struct snd_timer_ginfo {
 	int card;			/* card number */
 	unsigned char id[64];		/* timer identification */
 	unsigned char name[80];		/* timer name */
+	__uapi_arch_pad_long;
 	unsigned long reserved0;	/* reserved for future use */
 	unsigned long resolution;	/* average period resolution in ns */
 	unsigned long resolution_min;	/* minimal period resolution in ns */
 	unsigned long resolution_max;	/* maximal period resolution in ns */
 	unsigned int clients;		/* active timer clients */
 	unsigned char reserved[32];
-};
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 struct snd_timer_gparams {
 	struct snd_timer_id tid;	/* requested timer ID */
+	__uapi_arch_pad_long;
 	unsigned long period_num;	/* requested precise period duration (in sec=
onds) - numerator */
 	unsigned long period_den;	/* requested precise period duration (in sec=
onds) - denominator */
 	unsigned char reserved[32];
-};
+} __uapi_arch_align;
=20
 struct snd_timer_gstatus {
 	struct snd_timer_id tid;	/* requested timer ID */
+	__uapi_arch_pad_long;
 	unsigned long resolution;	/* current period resolution in ns */
 	unsigned long resolution_num;	/* precise current period resolution (in=
 seconds) - numerator */
 	unsigned long resolution_den;	/* precise current period resolution (in=
 seconds) - denominator */
 	unsigned char reserved[32];
-};
+} __uapi_arch_align;
=20
 struct snd_timer_select {
 	struct snd_timer_id id;	/* bind to timer ID */
@@ -1134,7 +1155,9 @@ struct snd_ctl_elem_list {
 	unsigned int count;		/* R: count of all elements */
 	struct snd_ctl_elem_id __user *pids; /* R: IDs */
 	unsigned char reserved[50];
-};
+	__uapi_arch_pad16;
+	__uapi_arch_pad_long;
+} __uapi_arch_align;
=20
 struct snd_ctl_elem_info {
 	struct snd_ctl_elem_id id;	/* W: element ID */
@@ -1159,6 +1182,7 @@ struct snd_ctl_elem_info {
 			char name[64];		/* R: value name */
 			__u64 names_ptr;	/* W: names list (ELEM_ADD only) */
 			unsigned int names_length;
+			__uapi_arch_pad32;
 		} enumerated;
 		unsigned char reserved[128];
 	} value;
@@ -1168,6 +1192,10 @@ struct snd_ctl_elem_info {
 struct snd_ctl_elem_value {
 	struct snd_ctl_elem_id id;	/* W: element ID */
 	unsigned int indirect: 1;	/* W: indirect access - obsoleted */
+	unsigned int :7;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+	__uapi_arch_pad32;
 	union {
 		union {
 			long value[128];
@@ -1188,7 +1216,7 @@ struct snd_ctl_elem_value {
 		struct snd_aes_iec958 iec958;
 	} value;		/* RO */
 	unsigned char reserved[128];
-};
+} __uapi_arch_align;
=20
 struct snd_ctl_tlv {
 	unsigned int numid;	/* control element numeric identification */
diff --git a/include/uapi/sound/asound_fm.h b/include/uapi/sound/asound_=
fm.h
index 25ec5e38af5c..a3bed2d92184 100644
--- a/include/uapi/sound/asound_fm.h
+++ b/include/uapi/sound/asound_fm.h
@@ -2,6 +2,7 @@
 #ifndef __SOUND_ASOUND_FM_H
 #define __SOUND_ASOUND_FM_H
=20
+#include <linux/types.h>
 /*
  *  Advanced Linux Sound Architecture - ALSA
  *
@@ -56,9 +57,12 @@ struct snd_dm_fm_voice {
 struct snd_dm_fm_note {
 	unsigned char voice;	/* 0-17 voice channel */
 	unsigned char octave;	/* 3 bits: what octave to play */
+	__uapi_arch_pad16;
 	unsigned int fnum;	/* 10 bits: frequency number */
 	unsigned char key_on;	/* set for active, clear for silent */
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /*
  *  FM parameters that apply globally to all voices, and thus are not "=
notes"
diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/=
compress_offload.h
index b610683fd8db..4115471b09e4 100644
--- a/include/uapi/sound/compress_offload.h
+++ b/include/uapi/sound/compress_offload.h
@@ -34,6 +34,8 @@ struct snd_compr_params {
 	struct snd_compressed_buffer buffer;
 	struct snd_codec codec;
 	__u8 no_wake_mode;
+	__u8  :8;
+	__u16 :16;
 } __attribute__((packed, aligned(4)));
=20
 /**
diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/c=
ompress_params.h
index d7db6b4e1166..4b119490e438 100644
--- a/include/uapi/sound/compress_params.h
+++ b/include/uapi/sound/compress_params.h
@@ -360,6 +360,7 @@ struct snd_dec_opus {
 		__u8 coupled_count;
 		__u8 channel_map[8];
 	} chan_map;
+	__u8 :8, :8, :8;
 } __attribute__((packed, aligned(4)));
=20
 union snd_codec_options {
diff --git a/include/uapi/sound/emu10k1.h b/include/uapi/sound/emu10k1.h
index 4c32a116e7ad..b310561ed51a 100644
--- a/include/uapi/sound/emu10k1.h
+++ b/include/uapi/sound/emu10k1.h
@@ -184,9 +184,9 @@
 #define A_CC_REG_NONZERO	A_C_00000100
=20
 /* FX buses */
-// These are arbitrary mappings; our DSP code simply expects
-// the config files to route the channels this way.
-// The numbers are documented in {audigy,sb-live}-mixer.rst.
+/* These are arbitrary mappings; our DSP code simply expects	*/
+/* the config files to route the channels this way.		*/
+/* The numbers are documented in {audigy,sb-live}-mixer.rst.	*/
 #define FXBUS_PCM_LEFT		0x00
 #define FXBUS_PCM_RIGHT		0x01
 #define FXBUS_PCM_LEFT_REAR	0x02
@@ -334,8 +334,9 @@ struct snd_emu10k1_fx8010_control_gpr {
 	int min;			/* minimum range */
 	int max;			/* maximum range */
 	unsigned int translation;	/* translation type (EMU10K1_GPR_TRANSLATION=
*) */
+	__uapi_arch_pad_long;
 	const unsigned int *tlv;
-};
+} __uapi_arch_align;
=20
 /* old ABI without TLV support */
 struct snd_emu10k1_fx8010_control_old_gpr {
@@ -356,9 +357,11 @@ struct snd_emu10k1_fx8010_code {
 	__u32 *gpr_map;			/* initializers */
=20
 	unsigned int gpr_add_control_count; /* count of GPR controls to add/re=
place */
+	__uapi_arch_pad_long;
 	struct snd_emu10k1_fx8010_control_gpr *gpr_add_controls; /* GPR contro=
ls to add/replace */
=20
 	unsigned int gpr_del_control_count; /* count of GPR controls to remove=
 */
+	__uapi_arch_pad_long;
 	struct emu10k1_ctl_elem_id *gpr_del_controls; /* IDs of GPR controls t=
o remove */
=20
 	unsigned int gpr_list_control_count; /* count of GPR controls to list =
*/
@@ -371,7 +374,7 @@ struct snd_emu10k1_fx8010_code {
=20
 	__EMU10K1_DECLARE_BITMAP(code_valid, 1024); /* bitmask of valid instru=
ctions */
 	__u32 *code;			  /* one instruction - 64 bits */
-};
+} __uapi_arch_align;
=20
 struct snd_emu10k1_fx8010_tram {
 	unsigned int address;		/* 31.bit =3D=3D 1 -> external TRAM */
@@ -394,8 +397,10 @@ struct snd_emu10k1_fx8010_pcm_rec {
 	unsigned short gpr_running;	/* GPR containing info if PCM is running (=
FX8010) */
 	unsigned char pad;		/* reserved */
 	unsigned char etram[32];	/* external TRAM address & data (one per chan=
nel) */
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	unsigned int res2;		/* reserved */
-};
+} __uapi_arch_align;
=20
 #define SNDRV_EMU10K1_VERSION		SNDRV_PROTOCOL_VERSION(1, 0, 1)
=20
diff --git a/include/uapi/sound/hdsp.h b/include/uapi/sound/hdsp.h
index 0961954658d6..551626734c30 100644
--- a/include/uapi/sound/hdsp.h
+++ b/include/uapi/sound/hdsp.h
@@ -57,7 +57,8 @@ struct hdsp_config_info {
 	unsigned char phone_gain;
 	unsigned char xlr_breakout_cable;
 	unsigned char analog_extension_board;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 #define SNDRV_HDSP_IOCTL_GET_CONFIG_INFO _IOR('H', 0x41, struct hdsp_co=
nfig_info)
=20
@@ -70,7 +71,8 @@ struct hdsp_firmware {
 struct hdsp_version {
 	enum HDSP_IO_Type io_type;
 	unsigned short firmware_rev;
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 #define SNDRV_HDSP_IOCTL_GET_VERSION _IOR('H', 0x43, struct hdsp_versio=
n)
=20
diff --git a/include/uapi/sound/hdspm.h b/include/uapi/sound/hdspm.h
index 7043bb3d435a..bc27cea9e055 100644
--- a/include/uapi/sound/hdspm.h
+++ b/include/uapi/sound/hdspm.h
@@ -39,6 +39,8 @@ struct hdspm_peak_rms {
 	__u64 output_rms[64];
=20
 	__u8 speed; /* enum {ss, ds, qs} */
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	int status2;
 };
=20
@@ -51,6 +53,7 @@ struct hdspm_config {
 	unsigned char pref_sync_ref;
 	unsigned char wordclock_sync_check;
 	unsigned char madi_sync_check;
+	__uapi_arch_pad8;
 	unsigned int system_sample_rate;
 	unsigned int autosync_sample_rate;
 	unsigned char system_clock_mode;
@@ -59,7 +62,7 @@ struct hdspm_config {
 	unsigned char line_out;
 	unsigned int passthru;
 	unsigned int analog_out;
-};
+} __uapi_arch_align;
=20
 #define SNDRV_HDSPM_IOCTL_GET_CONFIG \
 	_IOR('H', 0x41, struct hdspm_config)
@@ -140,6 +143,8 @@ enum hdspm_syncsource {
=20
 struct hdspm_status {
 	__u8 card_type; /* enum hdspm_io_type */
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	enum hdspm_syncsource autosync_source;
=20
 	__u64 card_clock;
@@ -156,7 +161,9 @@ struct hdspm_status {
 			__u8 frame_format; /* enum hdspm_madi_frame_format */
 		} madi;
 	} card_specific;
-};
+	__uapi_arch_pad8;
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 #define SNDRV_HDSPM_IOCTL_GET_STATUS \
 	_IOR('H', 0x47, struct hdspm_status)
@@ -170,10 +177,13 @@ struct hdspm_status {
 struct hdspm_version {
 	__u8 card_type; /* enum hdspm_io_type */
 	char cardname[20];
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	unsigned int serial;
 	unsigned short firmware_rev;
+	__uapi_arch_pad16;
 	int addons;
-};
+} __uapi_arch_align;
=20
 #define SNDRV_HDSPM_IOCTL_GET_VERSION _IOR('H', 0x48, struct hdspm_vers=
ion)
=20
diff --git a/include/uapi/sound/sb16_csp.h b/include/uapi/sound/sb16_csp=
.h
index 5a80f5ec02ee..b00225a15277 100644
--- a/include/uapi/sound/sb16_csp.h
+++ b/include/uapi/sound/sb16_csp.h
@@ -8,6 +8,7 @@
 #ifndef _UAPI__SOUND_SB16_CSP_H
 #define _UAPI__SOUND_SB16_CSP_H
=20
+#include <linux/types.h>
=20
 /* CSP modes */
 #define SNDRV_SB_CSP_MODE_NONE		0x00
@@ -70,6 +71,7 @@ struct snd_sb_csp_start {
 struct snd_sb_csp_info {
 	char codec_name[16];		/* id name of codec */
 	unsigned short func_nr;		/* function number */
+	__uapi_arch_pad16;
 	unsigned int acc_format;	/* accepted PCM formats */
 	unsigned short acc_channels;	/* accepted channels */
 	unsigned short acc_width;	/* accepted sample width */
@@ -79,7 +81,7 @@ struct snd_sb_csp_info {
 	unsigned short run_width;	/* current sample width */
 	unsigned short version;		/* version id: 0x10 - 0x1f */
 	unsigned short state;		/* state bits */
-};
+} __uapi_arch_align;
=20
 /* HWDEP controls */
 /* get CSP information */
diff --git a/include/uapi/video/sisfb.h b/include/uapi/video/sisfb.h
index f1e811951288..183425f5c950 100644
--- a/include/uapi/video/sisfb.h
+++ b/include/uapi/video/sisfb.h
@@ -90,6 +90,8 @@ struct sisfb_info {
 	__u8	sisfb_patchlevel;
=20
 	__u8	sisfb_caps;		/* sisfb capabilities */
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
=20
 	__u32	sisfb_tqlen;		/* turbo queue length (in KB) */
=20
@@ -100,6 +102,7 @@ struct sisfb_info {
 	__u8	sisfb_lcdpdc;		/* PanelDelayCompensation */
=20
 	__u8	sisfb_lcda;		/* Detected status of LCDA for low res/text modes */
+	__uapi_arch_pad16;
=20
 	__u32	sisfb_vbflags;
 	__u32	sisfb_currentvbflags;
@@ -112,6 +115,7 @@ struct sisfb_info {
 	__u8	sisfb_haveemilcd;
=20
 	__u8	sisfb_lcdpdca;		/* PanelDelayCompensation for LCD-via-CRT1 */
+	__uapi_arch_pad8;
=20
 	__u16	sisfb_tvxpos, sisfb_tvypos;	/* Warning: Values + 32 ! */
=20
@@ -122,6 +126,7 @@ struct sisfb_info {
 	__u32	sisfb_curdstn;
=20
 	__u16	sisfb_pci_vendor;	/* PCI vendor (SiS or XGI) */
+	__uapi_arch_pad16;
=20
 	__u32	sisfb_vbflags2;		/* ivideo->vbflags2 */
=20
@@ -130,7 +135,8 @@ struct sisfb_info {
 	__u8	sisfb_was_boot_device;	/* This card was the boot video device (ie=
 is primary) */
=20
 	__u8	reserved[183];		/* for future use */
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 #define SISFB_CMD_GETVBFLAGS	0x55AA0001	/* no arg; result[1] =3D vbflag=
s */
 #define SISFB_CMD_SWITCHCRT1	0x55AA0010	/* arg[0]: 99 =3D query, 0 =3D =
off, 1 =3D on */
diff --git a/include/uapi/video/uvesafb.h b/include/uapi/video/uvesafb.h
index a0d5c9213e92..f6b17c895c8a 100644
--- a/include/uapi/video/uvesafb.h
+++ b/include/uapi/video/uvesafb.h
@@ -32,9 +32,11 @@ struct v86_regs {
=20
 struct uvesafb_task {
 	__u8 flags;
+	__uapi_arch_pad8;
+	__uapi_arch_pad16;
 	int buf_len;
 	struct v86_regs regs;
-};
+} __uapi_arch_align;
=20
 /* Constants for the capabilities field
  * in vbe_ib */
diff --git a/include/uapi/xen/evtchn.h b/include/uapi/xen/evtchn.h
index aef2b75f3413..26879a428cda 100644
--- a/include/uapi/xen/evtchn.h
+++ b/include/uapi/xen/evtchn.h
@@ -86,6 +86,8 @@ struct ioctl_evtchn_notify {
 #define IOCTL_EVTCHN_RESET				\
 	_IOC(_IOC_NONE, 'E', 5, 0)
=20
+typedef unsigned short domid_t;
+
 /*
  * Restrict this file descriptor so that it can only be used to bind
  * new interdomain events from one domain.
diff --git a/include/uapi/xen/gntalloc.h b/include/uapi/xen/gntalloc.h
index 3109282672f3..88c87944da85 100644
--- a/include/uapi/xen/gntalloc.h
+++ b/include/uapi/xen/gntalloc.h
@@ -35,7 +35,8 @@ struct ioctl_gntalloc_alloc_gref {
 		__u32 gref_ids[1];
 		__DECLARE_FLEX_ARRAY(__u32, gref_ids_flex);
 	};
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 #define GNTALLOC_FLAG_WRITABLE 1
=20
@@ -51,7 +52,8 @@ struct ioctl_gntalloc_dealloc_gref {
 	__u64 index;
 	/* Number of references to unmap */
 	__u32 count;
-};
+	__uapi_arch_pad32;
+} __uapi_arch_align;
=20
 /*
  * Sets up an unmap notification within the page, so that the other sid=
e can do
diff --git a/include/uapi/xen/gntdev.h b/include/uapi/xen/gntdev.h
index 7a7145395c09..9ba3a53dad3b 100644
--- a/include/uapi/xen/gntdev.h
+++ b/include/uapi/xen/gntdev.h
@@ -152,6 +152,9 @@ struct ioctl_gntdev_unmap_notify {
 	__u32 event_channel_port;
 };
=20
+typedef __u32 grant_ref_t;
+typedef __u16 domid_t;
+
 struct gntdev_grant_copy_segment {
 	union {
 		void __user *virt;
@@ -165,7 +168,8 @@ struct gntdev_grant_copy_segment {
=20
 	__u16 flags;  /* GNTCOPY_* */
 	__s16 status; /* GNTST_* */
-};
+	__uapi_arch_pad16;
+} __uapi_arch_align;
=20
 /*
  * Copy between grant references and local buffers.
@@ -199,8 +203,9 @@ struct gntdev_grant_copy_segment {
 	_IOC(_IOC_NONE, 'G', 8, sizeof(struct ioctl_gntdev_grant_copy))
 struct ioctl_gntdev_grant_copy {
 	unsigned int count;
+	__uapi_arch_pad_long;
 	struct gntdev_grant_copy_segment __user *segments;
-};
+} __uapi_arch_align;
=20
 /* Clear (set to zero) the byte specified by index */
 #define UNMAP_NOTIFY_CLEAR_BYTE 0x1
diff --git a/include/uapi/xen/privcmd.h b/include/uapi/xen/privcmd.h
index 8e2c8fd44764..034a6304a624 100644
--- a/include/uapi/xen/privcmd.h
+++ b/include/uapi/xen/privcmd.h
@@ -36,7 +36,12 @@
=20
 #include <linux/types.h>
 #include <linux/compiler.h>
+#ifdef __KERNEL__
 #include <xen/interface/xen.h>
+#else
+typedef __u16 domid_t;
+typedef __u64 xen_pfn_t;
+#endif
=20
 struct privcmd_hypercall {
 	__u64 op;
@@ -56,16 +61,19 @@ struct privcmd_mmap_entry {
 struct privcmd_mmap {
 	int num;
 	domid_t dom; /* target domain */
+	__uapi_arch_pad16;
 	struct privcmd_mmap_entry __user *entry;
-};
+} __uapi_arch_align;
=20
 struct privcmd_mmapbatch {
 	int num;     /* number of pages to populate */
 	domid_t dom; /* target domain */
+	__uapi_arch_pad16;
 	__u64 addr;  /* virtual address */
 	xen_pfn_t __user *arr; /* array of mfns - or'd with
 				  PRIVCMD_MMAPBATCH_*_ERROR on err */
-};
+	__uapi_arch_pad_long_to_u64;
+} __uapi_arch_align;
=20
 #define PRIVCMD_MMAPBATCH_MFN_ERROR     0xf0000000U
 #define PRIVCMD_MMAPBATCH_PAGED_ERROR   0x80000000U
@@ -73,6 +81,7 @@ struct privcmd_mmapbatch {
 struct privcmd_mmapbatch_v2 {
 	unsigned int num; /* number of pages to populate */
 	domid_t dom;      /* target domain */
+	__uapi_arch_pad16;
 	__u64 addr;       /* virtual address */
 	const xen_pfn_t __user *arr; /* array of mfns */
 	int __user *err;  /* array of error codes */
@@ -80,23 +89,25 @@ struct privcmd_mmapbatch_v2 {
=20
 struct privcmd_dm_op_buf {
 	void __user *uptr;
-	size_t size;
+	__kernel_size_t size;
 };
=20
 struct privcmd_dm_op {
 	domid_t dom;
 	__u16 num;
+	__uapi_arch_pad_long;
 	const struct privcmd_dm_op_buf __user *ubufs;
-};
+} __uapi_arch_align;
=20
 struct privcmd_mmap_resource {
 	domid_t dom;
+	__uapi_arch_pad16;
 	__u32 type;
 	__u32 id;
 	__u32 idx;
 	__u64 num;
 	__u64 addr;
-};
+} __uapi_arch_align;
=20
 /* For privcmd_irqfd::flags */
 #define PRIVCMD_IRQFD_FLAG_DEASSIGN (1 << 0)

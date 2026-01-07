Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F47529B216
	for <linux-m68k@vger.kernel.org>; Wed,  7 Jan 2026 08:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767774026; cv=none; b=XmCE8OSe0zgWcrmcC15/3+Rs0NFT6sUG0ghjdbTP7zjKSC6MGJudhWfS15/U5vwBBi7rRn1l46olG7YFx+lfcA12phAw7gFw3QNzQbJiRy4djL0D+FDWWD2F2Adz1YF6ZFemR05TQmPFuE5XTQs1um+r+5Ds4s/hcYVnR/oS+LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767774026; c=relaxed/simple;
	bh=h8djp6E/+4YuUGsm01Dt14/HzRrP/2kzBvlaFCBUU8o=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ujQTmgsFGwAAaGXjvWk89E1azP3o/1oO2cAMdtkzHC9QQjIFgFrItjvCMU6yVCBgga9fTsGhSb2vTD6D5kQxsqtiv7X8fE+sXdf/g26huzLjdnA2bRA6lCvK5rUDprcBr/1002qVpwVF7F1WycZDeo8AfmSrs48jrwZ6Mx2gvl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=B/9IB8Om; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HfpZ+aW4; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="B/9IB8Om";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HfpZ+aW4"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id EA9481D00129;
	Wed,  7 Jan 2026 03:20:21 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 07 Jan 2026 03:20:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767774021;
	 x=1767860421; bh=IsmvRUmDU7intyuwexKKCWExxHdHe+qoTY/epFj/jDQ=; b=
	B/9IB8OmlApERjYz+6OdcGdLsedibIjWdm0z+v6ZBp7EyFuByt+5lGnQPxsNZ9uK
	548GmhNH4U9fTI3TdcnYafzhhgk7F6cY7bD6OAqnlOwJxKWshNFgugbdOyNWPasF
	ku7JoncxGOYzpm6mwvl+0qhtssHXVvzu2okgvt2mzvLWgW2o9ZvwyjMeeMjhL8RS
	eUU2B1wsB6VIwoj3hgn/v3NZbxgGzqnpRPvyGG6wrti/onJhr+JQYFjZK+agrIbe
	lPiuYFO+zJOsm/BJURiN9F5deInF/V7556S67lVhqF/gDvQA8spxLuEbLU8UfraT
	5TkMBkTWykMABwe3z1tmWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767774021; x=
	1767860421; bh=IsmvRUmDU7intyuwexKKCWExxHdHe+qoTY/epFj/jDQ=; b=H
	fpZ+aW4OYzODf0m0F6osbDdTiXXiR0PGZCD5dWatEh50kA/XjGLxWtnh7HcrmvdR
	XP1KYxnsp4g/IDLhthPd+Aqaks140Eje/eavnHAO8akZpxlaLUMZXwOrpv8/QOtY
	y4aPV/LAkcOJPWrP2NjCR2Nx+9W0e2RvZxwSZC9bzCkc+AyFVFrntHDrlJjzof/h
	nAIJPGJi3vNQjaHZmlsrLkVDTuYWfEmzIwZRcjmH5kXNIc3kpBkirm4D2Gx6m/z/
	jDoBlCS4E1CdII7UuE8XkzxsmJfSiP7B6IhzpFKwAhStimJK9UCuOKhAPt4QWbnh
	Ofpxbz4jaqKg9/SfIn4Ug==
X-ME-Sender: <xms:RRdeaX4VrSdS5mKfzKn-KSfJq0Z1wYqF-6N4e9FoX9XkspfkJ3UjSQ>
    <xme:RRdeaXsuuFUJPCI-YsfKDvSG0lQzNY8fdNcETmDrsxpKmh_ggeg84m2TbhrBjeORL
    DmIFwfionvpRzhOu-bPOjIZHLXU5A_U3AJzMg4zkEovO11uA7NLE5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutddvheekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepkedvuefhiedtueeijeevtdeiieejfeelvefffeelkeeiteejffdvkefgteeuhffg
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhmie
    ekkheskhholhhlrgdrnhhopdhrtghpthhtohepthhhohhmrghsrdifvghishhsshgthhhu
    hheslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqd
    hmieekkhdrohhrghdprhgtphhtthhopeguvggsihgrnhdqieekkheslhhishhtshdruggv
    sghirghnrdhorhhgpdhrtghpthhtohepphhorhhtqdhmieekkhesnhgvthgsshgurdhorh
    hgpdhrtghpthhtohepghhlrghusghithiisehphhihshhikhdrfhhuqdgsvghrlhhinhdr
    uggvpdhrtghpthhtoheplhhinhhugidqmheikehksehvghgvrhdrkhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:RRdeaU_oqZQpHjA7Y86kYk4ILDbVTXGHCeXw1Tk9YFF-xSQzPzoieA>
    <xmx:RRdeabzeSywxqCpXoAHgWj1Cfy1X7xxvtGgFlLDqJ5UORdLSvZyX7A>
    <xmx:RRdeaQN8R_dZG84FVzJJkfZMVB99i4tbrA_MmJ2ULRYNOpqoDTrnWg>
    <xmx:RRdeaQ-dh-SQXthP0-dzXNgvQA_iaXUgS04GVAth3kt7SWYaTn539Q>
    <xmx:RRdeaQUpELM-ZdBDZVSwWWQSFbu3eRLeGFYD-TKW9WFL7zQHxkArXhjf>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1C131700065; Wed,  7 Jan 2026 03:20:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ADdmIppGoxVg
Date: Wed, 07 Jan 2026 09:19:59 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>,
 "port-m68k@netbsd.org" <port-m68k@netbsd.org>,
 "debian-68k@lists.debian.org" <debian-68k@lists.debian.org>,
 "linux-m68k@vger.kernel.org" <linux-m68k@vger.kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Message-Id: <baadfe05-0893-4182-8c7e-7ea816aee905@app.fastmail.com>
In-Reply-To: 
 <CAMuHMdWVwXq+PzW_K1Lkn3hCAZuL4ps2VPEng4tB4wuhT+oytA@mail.gmail.com>
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
 <e01dfc6d-a45f-4d17-a27c-67f913dc614c@app.fastmail.com>
 <CAMuHMdWVwXq+PzW_K1Lkn3hCAZuL4ps2VPEng4tB4wuhT+oytA@mail.gmail.com>
Subject: Re: Preliminary results - was: Re: Question on BIGGEST_ALIGNMENT in GCC on
 NetBSD/m68k
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 6, 2026, at 20:31, Geert Uytterhoeven wrote:
> On Tue, 6 Jan 2026 at 16:38, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Tue, Jan 6, 2026, at 14:40, John Paul Adrian Glaubitz wrote:
>> > On Tue, 2026-01-06 at 14:34 +0100, Kolbj=C3=B8rn Barmen wrote:
>> The diffstat is
>>
>>  407 files changed, 2433 insertions(+), 754 deletions(-)
>>
>> and I think this touches around 1500 structures, though
>> most files only have a single one.
>
> Thanks, this seems to work fine for atari_defconfig, and generates
> the exact same code as before.

Ok, good. The more interesting bit then is what happens when
you actually turn on -malign-int for the kernel itself. There
are many drivers that change behavior, but mostly this is going
to be a fix rather than a regression. As far as I can tell, this
change is all that should be needed for atari:

diff --git a/arch/m68k/include/asm/atarihw.h b/arch/m68k/include/asm/ata=
rihw.h
index 9a038a3edb83..467005598fc6 100644
--- a/arch/m68k/include/asm/atarihw.h
+++ b/arch/m68k/include/asm/atarihw.h
@@ -334,7 +334,7 @@ struct TT_DMA {
 	u_char	dma_cnt_lmd;
 	u_char	char_dummy7;
 	u_char	dma_cnt_lo;
-	u_long	dma_restdata;
+	u_long	dma_restdata __packed;
 	u_short	dma_ctrl;
 };
 #define	tt_scsi_dma	((*(volatile struct TT_DMA *)TT_SCSI_DMA_BAS))
@@ -417,13 +417,13 @@ struct BLITTER
   u_short halftone[16];
   u_short src_x_inc;
   u_short src_y_inc;
-  u_long src_address;
+  u_long src_address __packed;
   u_short endmask1;
   u_short endmask2;
   u_short endmask3;
   u_short dst_x_inc;
   u_short dst_y_inc;
-  u_long dst_address;
+  u_long dst_address __packed;
   u_short wd_per_line;
   u_short ln_per_bb;
   u_short hlf_op_reg;
diff --git a/arch/m68k/include/asm/openprom.h b/arch/m68k/include/asm/op=
enprom.h
index 6456ba40a946..741e83d76ff2 100644
--- a/arch/m68k/include/asm/openprom.h
+++ b/arch/m68k/include/asm/openprom.h
@@ -78,7 +78,7 @@ struct linux_arguments_v0 {
 	int dev_partition;
 	char *kernel_file_name;
 	void *aieee1;           /* XXX */
-};
+} __packed;
=20
 /* V2 and up boot things. */
 struct linux_bootargs_v2 {


> However, m68k allmodconfig fails with:
>
>     In file included from tools/include/nolibc/nolibc.h:97,
>                      from tools/include/nolibc/stddef.h:8,
>                      from ./usr/include/scsi/fc/fc_els.h:14,
>                      from <command-line>:
>     tools/include/nolibc/types.h:120:1: error: padding struct size to
> alignment boundary with 1 bytes [-Werror=3Dpadded]
>       120 | };
>           | ^
>     cc1: all warnings being treated as errors
>     make[4]: *** [usr/include/Makefile:85:
> usr/include/scsi/fc/fc_els.hdrtest] Error 1
>
> This is due to struct linux_dirent64 in tools/include/nolibc/types.h.
> The same definition in include/linux/dirent.h doesn't cause issues.

I left out the nolibc changes, as Thomas Wei=C3=9Fschuh has already
posted patches to remove the dependency entirely. This is what
I use for testing with nolibc at the moment:

diff --git a/tools/include/nolibc/netinet/in.h b/tools/include/nolibc/ne=
tinet/in.h
new file mode 100644
index 000000000000..a6a1b19f5242
--- /dev/null
+++ b/tools/include/nolibc/netinet/in.h
@@ -0,0 +1 @@
+#include <linux/in.h>
diff --git a/tools/include/nolibc/std.h b/tools/include/nolibc/std.h
index 392f4dd94158..3fe83a4f7a2d 100644
--- a/tools/include/nolibc/std.h
+++ b/tools/include/nolibc/std.h
@@ -25,7 +25,7 @@ typedef unsigned int         mode_t;
 typedef   signed int          pid_t;
 typedef unsigned int          uid_t;
 typedef unsigned int          gid_t;
-typedef unsigned long       nlink_t;
+typedef unsigned int        nlink_t;
 typedef  int64_t              off_t;
 typedef   signed long     blksize_t;
 typedef   signed long      blkcnt_t;
diff --git a/tools/include/nolibc/stdlib.h b/tools/include/nolibc/stdlib=
.h
index f184e108ed0a..497cbe1b5dba 100644
--- a/tools/include/nolibc/stdlib.h
+++ b/tools/include/nolibc/stdlib.h
@@ -19,6 +19,7 @@
=20
 struct nolibc_heap {
 	size_t	len;
+	char __pad[__alignof__(struct {} __attribute__((__aligned__))) - __ali=
gnof__(size_t)];
 	char	user_p[] __attribute__((__aligned__));
 };
=20
diff --git a/tools/include/nolibc/sys/socket.h b/tools/include/nolibc/sy=
s/socket.h
new file mode 100644
index 000000000000..1d97008308ea
--- /dev/null
+++ b/tools/include/nolibc/sys/socket.h
@@ -0,0 +1,26 @@
+#include "../nolibc.h"
+
+#ifndef _NOLIBC_SYS_SOCKET_H
+#define _NOLIBC_SYS_SOCKET_H
+
+#include <linux/socket.h>
+
+typedef __kernel_sa_family_t	sa_family_t;
+
+/*
+ *	1003.1g requires sa_family_t and that sa_data is char.
+ */
+
+struct sockaddr {
+	sa_family_t	sa_family;	/* address family, AF_xxx	*/
+#ifdef __clang__
+	char sa_data[14];		/* prevent -Wgnu-variable-sized-type-not-at-end war=
ning */
+#else
+	union {
+		char sa_data_min[14];		/* Minimum 14 bytes of protocol address	*/
+		__DECLARE_FLEX_ARRAY(char, sa_data);
+	};
+#endif
+};
+
+#endif
diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
index 470a5f77bc0f..a3193424e818 100644
--- a/tools/include/nolibc/types.h
+++ b/tools/include/nolibc/types.h
@@ -10,6 +10,8 @@
 #ifndef _NOLIBC_TYPES_H
 #define _NOLIBC_TYPES_H
=20
+#include <linux/types.h>
+
 #include "std.h"
 #include <linux/mman.h>
 #include <linux/stat.h>
@@ -116,7 +118,10 @@ struct linux_dirent64 {
 	int64_t        d_off;
 	unsigned short d_reclen;
 	unsigned char  d_type;
-	char           d_name[];
+	union {
+		char __pad[5];
+		__DECLARE_FLEX_ARRAY(char, d_name);
+	};
 };
=20
 /* The format of the struct as returned by the libc to the application,=
 which
@@ -124,8 +129,8 @@ struct linux_dirent64 {
  */
 struct stat {
 	dev_t     st_dev;     /* ID of device containing file */
-	ino_t     st_ino;     /* inode number */
 	mode_t    st_mode;    /* protection */
+	ino_t     st_ino;     /* inode number */
 	nlink_t   st_nlink;   /* number of hard links */
 	uid_t     st_uid;     /* user ID of owner */
 	gid_t     st_gid;     /* group ID of owner */


>> --- a/usr/include/Makefile
>> +++ b/usr/include/Makefile
>> @@ -6,7 +6,10 @@
>>  #
>>  # -std=3Dc90 (equivalent to -ansi) catches the violation of those.
>>  # We cannot go as far as adding -Wpedantic since it emits too many w=
arnings.
>> -UAPI_CFLAGS :=3D -std=3Dc90 -Werror=3Dimplicit-function-declaration
>> +UAPI_CFLAGS :=3D -std=3Dc90 -Werror=3Dimplicit-function-declaration =
-Werror=3Dpadded
>> +
>> +# when cross-compiling with a minimal toolchain, use nolibc headers
>> +UAPI_CFLAGS +=3D -I$(srctree)/tools/include/nolibc/
>
> Without the rest of the patch, this line on its own is already causing
> various allmodconfig failures for me:
>
>     In file included from /usr/m68k-linux-gnu/include/sys/socket.h:26,
>                      from usr/include/linux/if.h:28,
>                      from ./usr/include/linux/netfilter_bridge/ebtable=
s.h:17,
>                      from <command-line>:
>     /usr/m68k-linux-gnu/include/bits/types/struct_iovec.h:26:8: error:
> redefinition of =E2=80=98struct iovec=E2=80=99

This should also be addressed by either my nolibc change or Thomas'
uapi cleanup.

> Dropping this line made the linux_dirent64 issue go away, and revealed
> a few more missing pieces, so here is a gmail-whitespace-damaged patch:
>
> diff --git a/include/uapi/linux/xfrm.h b/include/uapi/linux/xfrm.h
> index 70eece6aa30e9306..4c10f5402d77757d 100644
> --- a/include/uapi/linux/xfrm.h
> +++ b/include/uapi/linux/xfrm.h
> @@ -27,7 +27,9 @@ struct xfrm_id {
>         xfrm_address_t  daddr;
>         __be32          spi;
>         __u8            proto;
> -};
> +       __uapi_arch_pad8;
> +       __uapi_arch_pad16;
> +} __uapi_arch_align;
>
>  struct xfrm_sec_ctx {
>         __u8    ctx_doi;
> @@ -255,6 +257,7 @@ struct xfrm_user_tmpl {
>         __u8                    mode;
>         __u8                    share;
>         __u8                    optional;
> +       __uapi_arch_pad8;
>         __u32                   aalgos;
>         __u32                   ealgos;
>         __u32                   calgos;
>

Right, I missed this one because I had another patch in my
test tree that did a similar change but wasn't part of the
padding series.:
https://lore.kernel.org/all/20240216202657.2493685-1-arnd@kernel.org/

      Arnd

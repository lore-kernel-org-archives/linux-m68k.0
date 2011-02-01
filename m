From: Dmitry Torokhov <dtor@vmware.com>
Subject: Re: Early crash (was: Re: module: show version information for
 built-in modules in sysfs)
Date: Tue, 1 Feb 2011 13:09:44 -0800
Message-ID: <20110201210944.GA12348@dtor-ws.eng.vmware.com>
References: <AANLkTin4gOnEMruLDM=TkNYsNf5S370WqbcDVJzT7_Z4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp-outbound-1.vmware.com ([65.115.85.69]:16483 "EHLO
	smtp-outbound-1.vmware.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751633Ab1BAVJp (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 1 Feb 2011 16:09:45 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTin4gOnEMruLDM=TkNYsNf5S370WqbcDVJzT7_Z4@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Tue, Feb 01, 2011 at 12:33:29PM -0800, Geert Uytterhoeven wrote:
> On Mon, Jan 24, 2011 at 11:59, Linux Kernel Mailing List
> <linux-kernel@vger.kernel.org> wrote:
> > Gitweb: =A0 =A0 http://git.kernel.org/linus/e94965ed5beb23c6fabf7ed=
31f625e66d7ff28de
>=20
> > =A0 =A0module: show version information for built-in modules in sys=
fs
> >
> > =A0 =A0Currently only drivers that are built as modules have their =
versions
> > =A0 =A0shown in /sys/module/<module_name>/version, but this informa=
tion might
> > =A0 =A0also be useful for built-in drivers as well. This especially=
 important
> > =A0 =A0for drivers that do not define any parameters - such drivers=
, if
> > =A0 =A0built-in, are completely invisible from userspace.
> >
> > =A0 =A0This patch changes MODULE_VERSION() macro so that in case wh=
en we are
> > =A0 =A0compiling built-in module, version information is stored in =
a separate
> > =A0 =A0section. Kernel then uses this data to create 'version' sysf=
s attribute
> > =A0 =A0in the same fashion it creates attributes for module paramet=
ers.
>=20
> This commit causes the crash below on m68k (ARAnyM).
> Reverting this commit and its dependency
> 3b90a5b292321b2acac3921f77046ae195aef53f
> ("module: fix linker error for MODULE_VERSION when !MODULE and CONFIG=
_SYSFS=3Dn")
> makes it boot again.
>=20

Hi Geert,

Does the follwing help by any chance?

=46rom d6fd4a6e0fc2d3f0a74962d4a6f663a46d230ecd Mon Sep 17 00:00:00 200=
1
diff --git a/arch/m68knommu/kernel/vmlinux.lds.S b/arch/m68knommu/kerne=
l/vmlinux.lds.S
index ef33213..47e15eb 100644
--- a/arch/m68knommu/kernel/vmlinux.lds.S
+++ b/arch/m68knommu/kernel/vmlinux.lds.S
@@ -141,6 +141,12 @@ SECTIONS {
 		*(__param)
 		__stop___param =3D .;
=20
+		/* Built-in module versions */
+		. =3D ALIGN(4) ;
+		__start___modver =3D .;
+		*(__modver)
+		__stop___modver =3D .;
+
 		. =3D ALIGN(4) ;
 		_etext =3D . ;
 	} > TEXT

Thanks,

Dmitry

From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [m68k] partial success but does not boot: 3.2~rc7
Date: Sun, 1 Jan 2012 23:41:24 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1201012337470.20109@herc.mirbsd.org>
References: <Pine.BSM.4.64L.1201012102110.20109@herc.mirbsd.org>
 <1325460465.13595.179.camel@deadeye>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:25395 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751019Ab2AAXlt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 1 Jan 2012 18:41:49 -0500
In-Reply-To: <1325460465.13595.179.camel@deadeye>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Debian kernel team <debian-kernel@lists.debian.org>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

Ben Hutchings dixit:

>It is quite possible that m68k kernel udebs have not been built for so=
me
>years, though the configuration has been updated along with other
>architectures.

I don=E2=80=99t think that is it, as the last upload had this in .chang=
es:

[=E2=80=A6]
 4b1a4046ca58561cc6c94d020a9f10f4 1997696 debian-installer extra kernel=
-image-3.0.0-2-amiga-di_3.0.0-6_m68k.udeb
 af52e25d6186c6fd5c9b20888221f97a 35168 debian-installer standard nic-s=
hared-modules-3.0.0-2-amiga-di_3.0.0-6_m6
 808da40f5886053613dceae960cc64f8 38508 debian-installer optional ppp-m=
odules-3.0.0-2-amiga-di_3.0.0-6_m68k.udeb
 e664ddcea14d6a5f341a8cdfefefac2e 10918 debian-installer standard cdrom=
-core-modules-3.0.0-2-amiga-di_3.0.0-6_m6
 8f1fa83300a63dc0017eafc97da549cd 15636 debian-installer standard scsi-=
modules-3.0.0-2-amiga-di_3.0.0-6_m68k.ude
 1ceac41404a52273068c08d02d993557 305086 debian-installer extra btrfs-m=
odules-3.0.0-2-amiga-di_3.0.0-6_m68k.udeb
 f37e385c35fbae32f93d78312054009f 18960 debian-installer standard isofs=
-modules-3.0.0-2-amiga-di_3.0.0-6_m68k.ud
[=E2=80=A6]

>The module list for nic-shared-modules on m68k looks wrong in that the=
re
>are several driver modules listed there; those belong in nic-modules o=
r
>nic-extra-modules.  If m68k doesn't have any network drivers using the
>library modules such as mii then the package should be disabled by
>removing the module list file.

 d4ef87ebeac4a5177f560a7627d9ea52 13250 debian-installer standard nic-s=
hared-modules-3.0.0-2-atari-di_3.0.0-6_m6

It built last time and seems to have some content.

>> 18:50=E2=8E=9C<mirabilos> -rw-r--r-- 1 root root 1845989 Jan  1 18:3=
2
>>      =E2=8E=9C    /var/cache/pbuilder/build/cow.937/tmp/buildd/linux=
-2.6-3.2~rc7/debian/linux-image-3.2.0-rc7-atari/boo
>>      =E2=8E=9C    t/vmlinuz-3.2.0-rc7-atari
>>=20
>> $sourcedir wrong? $installedname wrong?
>
>Did you also build the amiga and mac flavours?  The kernel-versions fi=
le
>for m68k lists all three flavours.

Ah, that might be it. On the other hand, I seem to recall it erroring o=
ut
on the atari part. Not too sure.

>> No idea whether this should be committed.
>
>Hell no.  We must either fix or remove the kernel-wedge configuration
>for m68k.  (I already did the latter for alpha.)

OK. I hope =E2=80=9Cwe=E2=80=9D (and maybe, when^Wif they wake up, the =
m68k porters)
can fix it, instead. Wouter=E2=80=99s built a d-i during Deb=C4=86evap=C4=
=8Di=C4=87iConf,
after all.

>My guess is that on m68k get_cpu_sysdev(0) returns NULL and thus
>topology_add_dev() passes an invalid pointer into sysfs_create_group()=
=2E
>So either m68k (and maybe some other architectures with no SMP support=
)
>need to be fixed or the CPU topology code needs to allow for this.

@linux-m68k, are you listening in? ;-)

Goodnight, and happy new year,
//mirabilos
--=20
> Hi, does anyone sell openbsd stickers by themselves and not packaged
> with other products?
No, the only way I've seen them sold is for $40 with a free OpenBSD CD.
	-- Haroon Khalid and Steve Shockley in gmane.os.openbsd.misc

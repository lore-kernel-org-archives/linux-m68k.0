From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: atafb and X/fbdev
Date: Sat, 7 Jul 2012 09:18:00 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1207070912580.7146@herc.mirbsd.org>
References: <Pine.BSM.4.64L.1207062301330.12225@herc.mirbsd.org>
 <4FF7AFD7.8000005@biophys.uni-duesseldorf.de> <Pine.BSM.4.64L.1207070751590.7146@herc.mirbsd.org>
 <CAMuHMdW1Gigu0642GuXHGyOmghDLkndboTKyGt=z=zDgWcNWFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:27031 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750856Ab2GGJTH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 7 Jul 2012 05:19:07 -0400
Received: from herc.mirbsd.org (tg@localhost [IPv6:::1])
	by herc.mirbsd.org (8.14.5/8.14.5) with ESMTP id q679I21N017065
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-m68k@vger.kernel.org>; Sat, 7 Jul 2012 09:18:06 GMT
In-Reply-To: <CAMuHMdW1Gigu0642GuXHGyOmghDLkndboTKyGt=z=zDgWcNWFw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
Cc: linux-m68k@vger.kernel.org

Geert Uytterhoeven dixit:

>The 16-bpp Falcon mode should be chunky and work.

That's video=3Datafb:falh16 ?

>> Hrm, okay. I couldn=E2=80=99t find much in the =E2=80=99net except a=
 reference to
>> xfree68 but was unable to find that, either. Too bad, all the histor=
y=E2=80=A6
>> you don=E2=80=99t happen to know the _package_ name of the server, a=
nd the
>> needed config? ;-)
>
>xserver-fbdev? Or is that already the newer broken one?

Hrm. I looked on archive.debian.org but wasn=E2=80=99t too successful;
the =E2=80=9Cold=E2=80=9D stuff is just a package xserver-xfree86 but t=
hat one=E2=80=99s
fbdev didn=E2=80=99t like interleaved planes already. (Ok, that was pot=
ato.)

>The "XFree68" binaries I uploaded in the nineties should still be avai=
lable
>on FTP sites, though.

Hrm. I can look through archive.debian.org and snapshot.debian.org;
lookup is easiest by source package names.

>For the future, my plan (if I ever get to it, sigh) is to use tinyX
>shadowfb, and

Hrm sounds interesting, too. (Too bad xfbdev=C2=B9 gets SIGFPE, it woul=
d
probably have been a reasonable starting point.)

=E2=91=A0 http://packages.debian.org/sid/xserver-xfbdev

(Looking at p.d.o I probably should try with xserver-xephyr over
ssh X forwarding whether the rest of the system works first.)

>console. As I wrote it, there's no license issue in taking that ;-)

Right ;)

Thanks,
//mirabilos
--=20
13:37=E2=8E=9C=C2=ABNatureshadow=C2=BB Deep inside, I hate mirabilos. I=
 mean, he's a good
guy. But he's always right! In every fsckin' situation, he's right. Eve=
n
with his deeply perverted taste in software and borked ambition towards
broken OSes - in the end, he's damn right about it :(! [=E2=80=A6] work=
s in mksh

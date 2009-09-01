From: Stephen R Marenka <stephen@marenka.net>
Subject: Re: bogl: don't know screen type 1
Date: Tue, 1 Sep 2009 10:17:47 -0500
Message-ID: <20090901151747.GB27514@marenka.net>
References: <8259f0250908302028n9b0cb56td402539007736fce@mail.gmail.com> <20090831120617.GA1114@marenka.net> <8259f0250908310558l3ddd5fam7d15946a7c1e8572@mail.gmail.com> <8259f0250908311511h77270544vb2dc3dd383f1add8@mail.gmail.com> <8259f0250908311516r49e54c7fi44ead0f040cade30@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp.knology.net ([24.214.63.101]:47832 "EHLO smtp.knology.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753721AbZIAPRw (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 1 Sep 2009 11:17:52 -0400
Content-Disposition: inline
In-Reply-To: <8259f0250908311516r49e54c7fi44ead0f040cade30@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: debian-68k@lists.debian.org

On Tue, Sep 01, 2009 at 12:16:27AM +0200, mike wrote:
> Btw, i noticed an error
> http://people.debian.org/~smarenka/d-i/m68k/images/daily/build_native=
hd.log
> E: Couldn't find package libnss-dns-udeb
> make[2]: *** [stamps/get_udebs-nativehd-stamp] Error 100
> make[1]: *** [_build] Error 2
> make: *** [build_nativehd] Error 2

Yep. debian-installer dailies are now *dead* until we get a modern libc
working.

> 2009/9/1 mike <localgost@gmail.com>:
> > debian-installer/framebuffer=3Dfalse
> > ; Stephen R. Marenka, 16 Aug 2004
> > ; nolangchooser replaced with debian-installer/framebuffer=3Dfalse
> >
> > amiboot-5.6 -d -k //kernels/vmlinuz-2.4.27-amiga -r //cdrom/initrd.=
gz
> > root=3D/dev/ram ramdisk_size=3D15000 debian-installer/framebuffer=3D=
false
> >
> > Thanks Stephen :D
> >
> >
> > 2009/8/31 mike <localgost@gmail.com>:
> >> Hi,
> >>
> >> Tested that to, its just a modified StartInstall file. i believe i
> >> adjusted the fb=3D last time around, but to what i dont know. it d=
oes
> >> work with 2.6, however i cant find any 1. cd isos i can download a=
part
> >> from 3.1r8. Last time i installed from a iso image on the hard dri=
ve,
> >> i even tracked down the loop.ko from my previous installation. (i
> >> think and hope)
> >>
> >> Thanks.
> >>
> >> -Mike
> >>
> >> 2009/8/31 Stephen R Marenka <stephen@marenka.net>:
> >>> On Mon, Aug 31, 2009 at 05:28:50AM +0200, mike wrote:
> >>>> Hi,
> >>>>
> >>>> Decided to reinstall linux, but this error haunts me.
> >>>> Adding nolangchooser didnt help.
> >>>>
> >>>> My boot file looks like this
> >>>> amiboot -d -m mfile -k vmlinuz-2.4.27-amiga -r initrd.gz root=3D=
/dev/ram
> >>>> video=3Damifb:pal-lace
> >>>>
> >>>> Tried pretty much everything, it seems to die around the kbd cho=
oser,
> >>>> so i added bootkbd=3Dquerty/us.
> >>>> This resulted in a segmentation fault before the bogl'ing starte=
d. By
> >>>> the life of my i cant remember what i did last time.... But im p=
retty
> >>>> sure i didnt add nolangchooser.
> >>>
> >>> I believe you want to add the parameter fb=3Dfalse to your kernel
> >>> parameters. bogl is a graphics library that assumes kernel suppor=
t
> >>> that amiga doesn't have. fb=3Dfalse tells d-i to not go there.
> >>>
> >>> 2.4.27 hasn't been tested with d-i in quite some time, at least n=
ot by me.
> >>>
> >>> Peace,
> >>>
> >>> Stephen
> >>>
> >>> --
> >>> Stephen R. Marenka =A0 =A0 If life's not fun, you're not doing it=
 right!
> >>> <stephen@marenka.net>
> >>>
> >>
> >
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
Stephen R. Marenka     If life's not fun, you're not doing it right!
<stephen@marenka.net>
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

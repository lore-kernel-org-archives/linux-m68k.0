From: "Christian T. Steigies" <cts@debian.org>
Subject: Re: [PATCH 00/11] Atari Ethernet/USB patch series - for upstream
 and debian-kernel
Date: Fri, 29 Mar 2013 09:06:29 +0100
Message-ID: <20130329080629.GB14587@chumley.earth.sol>
References: <1364193464-3890-1-git-send-email-schmitz@debian.org>
 <Pine.BSM.4.64L.1303251751380.27649@herc.mirbsd.org>
 <51515889.6040106@uter.be>
 <5152996E.50800@gmail.com>
 <20130328211747.GA10917@chumley.earth.sol>
 <5154C5E0.3040608@gmail.com>
 <20130328231039.GA14587@chumley.earth.sol>
 <CAMuHMdWxCW0Gp8jYYk7R3WDJ8u-LJBZJ5d9jjaPAf27vXv3jDA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-in-08.arcor-online.net ([151.189.21.48]:60681 "EHLO
	mail-in-08.arcor-online.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755564Ab3C2IGd (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Fri, 29 Mar 2013 04:06:33 -0400
Content-Disposition: inline
In-Reply-To: <CAMuHMdWxCW0Gp8jYYk7R3WDJ8u-LJBZJ5d9jjaPAf27vXv3jDA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Wouter Verhelst <w@uter.be>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org, Ingo J?rgensmann <ij@2012.bluespice.org>

On Fri, Mar 29, 2013 at 08:56:43AM +0100, Geert Uytterhoeven wrote:
> On Fri, Mar 29, 2013 at 12:10 AM, Christian T. Steigies <cts@debian.org> wrote:
> > The HID drivers seem to be enabled in the official kernel, which runs on
> > kullervo, I don't seem to be able to switch off just the microsoft one.
> > Maybe by modifying the generic config, but I am afraid the magical package
> > building breaks again, genconfig.py does not run on my testing box, not sure
> > why. In Geert's tree, memcmp is not used in the driver, thats probably why
> > this one builds:
> >
> > @@ -47,9 +46,9 @@
> >                 rdesc[559] = 0x45;
> >         }
> >         /* the same as above (s/usage/physical/) */
> > -       if ((quirks & MS_RDESC_3K) && *rsize == 106 &&
> > -                       !memcmp((char []){ 0x19, 0x00, 0x29, 0xff },
> > -                               &rdesc[94], 4)) {
> > +       if ((quirks & MS_RDESC_3K) && *rsize == 106 && rdesc[94] == 0x19 &&
> > +                       rdesc[95] == 0x00 && rdesc[96] == 0x29 &&
> > +                       rdesc[97] == 0xff) {
> >                 rdesc[94] = 0x35;
> >                 rdesc[96] = 0x45;
> >         }
> >
> >> >buildds) another way. kernel-package?
> 
> I reported that problem and it got fixed. Probably the fix never made it to
> -stable?

Yes, I was not precise. The orig is what hid-microsoft looks like in
Debian's linux-source-3.8. The patched one is from Geert's tree, so it is
fixed in linux-m68k. Maybe I am missing something, but I don't see anything
in the patches at first glance, only this, which makes me shiver:

+       ret = hid_add_device(hid_dev);
+       if (ret)
+               goto probe_err1;

Reminds me of fortran, are gotos legal in kernel source?

In any case, I can build from Geert's try, but no debian packages (yet). 
I should try in an unstable chroot, or a real m68k box.

Christian

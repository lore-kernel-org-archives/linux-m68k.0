From: "Christian T. Steigies" <cts@debian.org>
Subject: Re: [PATCH 00/11] Atari Ethernet/USB patch series - for upstream
 and debian-kernel
Date: Fri, 29 Mar 2013 09:22:38 +0100
Message-ID: <20130329082238.GC14587@chumley.earth.sol>
References: <1364193464-3890-1-git-send-email-schmitz@debian.org>
 <Pine.BSM.4.64L.1303251751380.27649@herc.mirbsd.org>
 <51515889.6040106@uter.be>
 <5152996E.50800@gmail.com>
 <20130328211747.GA10917@chumley.earth.sol>
 <5154C5E0.3040608@gmail.com>
 <20130328231039.GA14587@chumley.earth.sol>
 <5154E9E0.1020005@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-in-11.arcor-online.net ([151.189.21.51]:34878 "EHLO
	mail-in-11.arcor-online.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755474Ab3C2IWl (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Fri, 29 Mar 2013 04:22:41 -0400
Content-Disposition: inline
In-Reply-To: <5154E9E0.1020005@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Wouter Verhelst <w@uter.be>, Thorsten Glaser <tg@mirbsd.de>, geert@linux-m68k.org, linux-m68k@vger.kernel.org, Ingo J?rgensmann <ij@2012.bluespice.org>

On Fri, Mar 29, 2013 at 02:09:52PM +1300, Michael Schmitz wrote:
> Christian,
> 
> >yup. CONFIG_SCSI_ZORRO7XX is enabled, will this be the new driver?
> 
> No, that's a different chipset, not ESP.

ok
 
> >As far as I remember, the config is combined of a generic config, an m68k
> >config, and an amiga config. Each file set only part of the total config,
> 
> And you can't patch the generic config? Not that I'd want to submit
> that as a patch against the kernel source, of course.

yes, probably. But it is not really defined anywhere... how does this
Makefile work? 
In drivers/hid/Makefile there is a line:

obj-$(CONFIG_HID_MICROSOFT)     += hid-microsoft.o
 
This depends on HID_USB, we don't have USB on Amiga so I add:
# CONFIG_USB_HID is not set
to config.amiga, but then the build fails here, just as when I edit the
subarches that should be built:

debian/bin/gencontrol.py
Traceback (most recent call last):
  File "debian/bin/gencontrol.py", line 427, in <module>
    Gencontrol()()
  File "debian/lib/python/debian_linux/gencontrol.py", line 91, in __call__
    self.do_main(packages, makefile)
  File "debian/lib/python/debian_linux/gencontrol.py", line 111, in do_main
    self.do_main_recurse(packages, makefile, vars, makeflags, extra)
  File "debian/lib/python/debian_linux/gencontrol.py", line 125, in do_main_recurse
    self.do_arch(packages, makefile, arch, vars.copy(), makeflags.copy(), extra)
  File "debian/lib/python/debian_linux/gencontrol.py", line 157, in do_arch
    self.do_arch_packages(packages, makefile, arch, vars, makeflags, extra)
  File "debian/bin/gencontrol.py", line 132, in do_arch_packages
    env=kw_env)
  File "/usr/lib/python2.7/subprocess.py", line 679, in __init__
    errread, errwrite)
  File "/usr/lib/python2.7/subprocess.py", line 1259, in _execute_child
    raise child_exception
OSError: [Errno 2] No such file or directory

Maybe that is the real problem I am facing. And I always thought python
produces usable error messages...

> >probably so that the kernels across all arches support more of less the same
> >features. Thats a good idea, but I think many drivers are useless for the
> >buildds, by removing them the kernel can fit into memory again, just barely.
> 
> That sort of stuff should be built as modules anyway.

Yes, it is built as a module, but the build still fails. I removed some
video and network drivers, some filesystems which we do not use on the
buildds, but the kernel size was just reduced by a little bit. So in the
long run, maybe we do have to fix amiboot so that we can still use the full
memory?

Christian

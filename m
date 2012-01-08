From: Greg KH <gregkh@suse.de>
Subject: Re: [m68k] partial success but does not boot: 3.2~rc7
Date: Sun, 8 Jan 2012 09:57:27 -0800
Message-ID: <20120108175727.GD29499@suse.de>
References: <Pine.BSM.4.64L.1201012102110.20109@herc.mirbsd.org>
 <1325460465.13595.179.camel@deadeye>
 <1325462025.13595.189.camel@deadeye>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:33568 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754296Ab2AHR6D (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sun, 8 Jan 2012 12:58:03 -0500
Content-Disposition: inline
In-Reply-To: <1325462025.13595.189.camel@deadeye>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Thorsten Glaser <tg@mirbsd.de>, Debian kernel team <debian-kernel@lists.debian.org>, linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

On Sun, Jan 01, 2012 at 11:53:45PM +0000, Ben Hutchings wrote:
> On Sun, 2012-01-01 at 23:27 +0000, Ben Hutchings wrote:
> > On Sun, 2012-01-01 at 21:16 +0000, Thorsten Glaser wrote:
> [...]
> > > =E2=80=A2 work and fail
> > >=20
> > > This is for debian-68k, linux-68k and debian-kernel:
> > >=20
> > > ARAnyM =E2=80=9Cconsole=E2=80=9D output of a working (3.0) and fa=
iling (3.2) boot,
> > > for your debugging pleasure. I can run arbitrary tests against th=
e
> > > failing kernel, as long as they=E2=80=99re limited to [LILO].Args=
 or make
> > > it boot ;-)
> >=20
> > This is presumably triggered by enabling CPU topology information i=
n
> > sysfs on UP systems.  This is a Debian patch for 3.2
> > (features/all/topology-Provide-CPU-topology-in-sysfs-in-SMP-configu=
ra.patch) but has been accepted upstream for 3.3.
> >=20
> > My guess is that on m68k get_cpu_sysdev(0) returns NULL and thus
> > topology_add_dev() passes an invalid pointer into sysfs_create_grou=
p().
> > So either m68k (and maybe some other architectures with no SMP supp=
ort)
> > need to be fixed or the CPU topology code needs to allow for this.
>=20
> None of these architectures appears to call register_cpu():
>=20
>     c6x frv h8300 m68k microblaze openrisc score um xtensa
>=20
> and therefore they will all panic at boot following this change (comm=
it
> ccbc60d3e19a1b6ae66ca0d89b3da02dde62088b).  So either I can try to fi=
x
> them or else it must be reverted for now.

As this is now in Linus's tree, and he has asked for a fix, could you
make one up?

thanks,

greg k-h

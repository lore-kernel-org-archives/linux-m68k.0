From: "Christian T. Steigies" <cts@debian.org>
Subject: Re: Linux/m68k on the Apollo FPGA softcore?
Date: Fri, 5 Feb 2016 16:15:21 +0100
Message-ID: <20160205151521.GA22021@nunzio.venus.sol>
References: <alpine.DEB.2.10.1602021757210.2761@firda>
 <56B36771.9010006@physik.fu-berlin.de>
 <alpine.OSX.2.20.1602051545100.775@brendeholten.uninett.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-in-05.arcor-online.net ([151.189.21.45]:33951 "EHLO
	mail-in-05.arcor-online.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752872AbcBEPPY (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 5 Feb 2016 10:15:24 -0500
Content-Disposition: inline
In-Reply-To: <alpine.OSX.2.20.1602051545100.775@brendeholten.uninett.no>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Kolbj?rn Barmen <linux-m68k@kolla.no>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-m68k@vger.kernel.org

On Fri, Feb 05, 2016 at 03:49:53PM +0100, Kolbj?rn Barmen wrote:
> On Thu, 4 Feb 2016, John Paul Adrian Glaubitz wrote:
>=20
> > On 02/02/2016 06:16 PM, Kolbj=F8rn Barmen wrote:
> > > From what I understand, the core implements a new FPU, not
> > > compatible with existing FPUs, and there has
> > > been talks about a new MMU implementation too.=20
> >=20
> > Well, that would be too bad given the fact that there is already a =
huge
> > number of applications and kernels which work with the old FPU/MMU
> > combination.
>=20
> Sure, but the idea is to move forward from what I understand.
>=20
> > I'd buy such an accelerator in a heartbeat, but it should be binary
> > compatible with existing 68020+ code.
>=20
> Apparently it will be usermode compatible with all existing 68k, but =
not
> supervisor mode compatible, not MMU compatibale, not FPU compatible. =
And
> it is already blazingly fast compared to most 68060 systems, without =
any
> optimization done.
>=20
> I guess it will be an AmigaOS only CPU core :)

=46rom what I read it will replace only the CPU, so you still need the =
old,
fragile Amiga/Atari/Mac hardware around it? It would be great, if this =
could
be included into a minimig or MiST to replace all of the old hardware a=
nd
allows you to use a readily available USB mouse and keyboard.
Then it would be a new system m68k and "somebody" could write a new ker=
nel
for this, with drivers for the FPU/MMU, instead of splitting the amiga
architecture into two incompatible ones. MiST is working great with AOS=
,
TOS, and I would love to have an m68k machine that can boot off an SD c=
ard
instead of a floppy disk (until you install some drivers on a IDE or SC=
SI
harddisk since nothing newer is directly supported).

But the nice thing about the FPGA computers is, everybody can write his=
 own
core, so we only need to implement the original MMU/FPU in an FPGA ;-)

Christian

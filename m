From: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
Subject: Re: Network died completely in 2.6.29 - also on m68k :)
Date: Sat, 18 Apr 2009 00:42:09 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.0904180031290.26529@halbrend.uninett.no>
References: <alpine.LNX.2.01.0904160950280.9424@halbrend.uninett.no> <alpine.LNX.2.01.0904161710040.9966@halbrend.uninett.no> <alpine.DEB.1.00.0904170300570.18855@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.00.0904170300570.18855@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>, linux-m68k@lists.linux-m68k.org

On Fri, 17 Apr 2009, Michael Schmitz wrote:

> Hi Kolla,
>=20
> > > described here http://lkml.org/lkml/2009/3/27/421
>=20
> Ah, that explains why I had network trouble with one of the kernels I=
 tested=20
> this week, perhaps ...
>=20
> > > So, I tryed to pull out a m68k-v2.6.29.1 from git, but appearantl=
y there is no
> > > such thing. So=C2=B8 it is probably to add the "Disable GRO on le=
gacy netif_rx
> > > path" patch (in posting above) to the v2.6.29 branch, no?
> > >=20
> > > I will put it in locally now and see if it works for me.
> >=20
> > This seems to have done the trick yes, the patch is this one:
>=20
> FWIW, Geert's tree is at 2.6.30-rc now, did you try that one?=20

Only on aranym, not on real hardware. I currently have 2.6.29 with the
above patch, and an ipv6-patch (with module parameters to disable
autoconf) running on my Mac Quadra910, one A1200 and Aranym.

-- kolla
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

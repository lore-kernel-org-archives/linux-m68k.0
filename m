From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: Network died completely in 2.6.29 - also on m68k :)
Date: Fri, 17 Apr 2009 03:03:18 +0200 (CEST)
Message-ID: <alpine.DEB.1.00.0904170300570.18855@zirkon.biophys.uni-duesseldorf.de>
References: <alpine.LNX.2.01.0904160950280.9424@halbrend.uninett.no>
 <alpine.LNX.2.01.0904161710040.9966@halbrend.uninett.no>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Boundary_(ID_mPMsCPeQTh1q1VeYTqQ0lA)"
Return-path: <linux-m68k-owner@vger.kernel.org>
In-reply-to: <alpine.LNX.2.01.0904161710040.9966@halbrend.uninett.no>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?ISO-8859-15?Q?Kolbj=F8rn_Barmen?= <linux-m68k@kolla.no>
Cc: linux-m68k@lists.linux-m68k.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--Boundary_(ID_mPMsCPeQTh1q1VeYTqQ0lA)
Content-type: TEXT/PLAIN; charset=UTF-8
Content-transfer-encoding: QUOTED-PRINTABLE

Hi Kolla,

> > described here http://lkml.org/lkml/2009/3/27/421

Ah, that explains why I had network trouble with one of the kernels I teste=
d=20
this week, perhaps ...

> > So, I tryed to pull out a m68k-v2.6.29.1 from git, but appearantly ther=
e is no
> > such thing. So=C2=B8 it is probably to add the "Disable GRO on legacy n=
etif_rx
> > path" patch (in posting above) to the v2.6.29 branch, no?
> >=20
> > I will put it in locally now and see if it works for me.
>=20
> This seems to have done the trick yes, the patch is this one:

FWIW, Geert's tree is at 2.6.30-rc now, did you try that one?=20

=09Michael

--Boundary_(ID_mPMsCPeQTh1q1VeYTqQ0lA)--

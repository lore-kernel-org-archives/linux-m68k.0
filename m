From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 07/28] m68k/irq: Switch irq_chip methods to "struct
 irq_data *data"
Date: Mon, 12 Sep 2011 12:48:30 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1109121204040.2525@nippy.intranet>
References: <1315742394-16036-1-git-send-email-geert@linux-m68k.org> <1315742394-16036-8-git-send-email-geert@linux-m68k.org> <alpine.LNX.2.00.1109112327500.2286@nippy.intranet> <CAMuHMdWri-LyhDN+z-WpJUkERekAwkD_F88VOtB9kEm_u=QzrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-1463806400-566375710-1315793904=:2525"
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWri-LyhDN+z-WpJUkERekAwkD_F88VOtB9kEm_u=QzrA@mail.gmail.com>
Content-ID: <alpine.LNX.2.00.1109121244090.2525@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463806400-566375710-1315793904=:2525
Content-Type: TEXT/PLAIN; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <alpine.LNX.2.00.1109121244091.2525@nippy.intranet>


On Sun, 11 Sep 2011, Geert Uytterhoeven wrote:

>=20
> > @@ -152,7 +149,7 @@ void baboon_irq_enable(int irq)
> >
> > =A0 =A0 =A0 =A0baboon_disabled &=3D ~(1 << irq_idx);
> > =A0 =A0 =A0 =A0if (!baboon_disabled)
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 mac_enable_irq(IRQ_NUBUS_C);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mac_irq_enable(irq_get_irq_data(IRQ_NUBUS=
_C));
>=20
> irq_get_irq_data() is not available in the non-genirq case, so this=20
> cleanup cannot be folded in patch 7, and has to wait until after patch=20
> 27.

Right, I forgot about that.

>=20
> I'll add it at the end of the series, OK?

That's fine. Please go ahead and add my signed-off-by tag (or I can=20
resubmit if you would prefer).

Finn

>=20
> Gr{oetje,eeting}s,
>=20
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Geert
---1463806400-566375710-1315793904=:2525--

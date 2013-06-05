From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2] arch/*/asm/include/bitops.h: api issue, find_*_bit()
 defination are different with each other
Date: Wed, 5 Jun 2013 15:02:22 +0200
Message-ID: <20130605130222.GL23140__26207.4282778942$1370437362$gmane$org@pengutronix.de>
References: <51AE8FEF.1020809@asianux.com>
 <51AE903C.6010806@asianux.com>
 <51AE909D.9080006@asianux.com>
 <20130605071915.GK23140@pengutronix.de>
 <51AF225A.5020703@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51AF225A.5020703@asianux.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Chen Gang <gang.chen@asianux.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux-Arch <linux-arch@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hello,

On Wed, Jun 05, 2013 at 07:34:50PM +0800, Chen Gang wrote:
> >> +extern unsigned long  _find_first_zero_bit_le(const void *p,
> > doesn't checkpatch critizise the double space in the line above?
> >=20
>=20
> Thank you very much for your carefully checking (could you tell me ho=
w
> do you find it ?)  :-)
I have no tool for that, it just catched my eye.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |

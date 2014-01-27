From: Yann Droneaud <ydroneaud@opteya.com>
Subject: Re: [PATCH] arm64: Add pdev_archdata for dmamask
Date: Mon, 27 Jan 2014 22:42:22 +0100
Message-ID: <1390858942-10904-1-git-send-email-ydroneaud@opteya.com>
References: <y> <1390845177-2626-1-git-send-email-lauraa@codeaurora.org> <20140127181836.GH26766@pengutronix.de> <1390854331.23180.22.camel@localhost.localdomain> <20140127203635.GA15937@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp4-g21.free.fr ([212.27.42.4]:40225 "EHLO smtp4-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752830AbaA0Vnf (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 27 Jan 2014 16:43:35 -0500
In-Reply-To: <20140127203635.GA15937@n2100.arm.linux.org.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Yann Droneaud <ydroneaud@opteya.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Laura Abbott <lauraa@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org

Hi Russel,

Le lundi 27 janvier 2014 =C3=A0 20:36 +0000, Russell King - ARM Linux a
=C3=A9crit :
> On Mon, Jan 27, 2014 at 09:25:31PM +0100, Yann Droneaud wrote:
> > ARM, even AAAAARGH64 [1], doesn't need a special treatement regardi=
ng
> > the infamous dma_mask pointer. So perhaps my solution is better.
> >=20
> > This solution (adding dma_mask in pdev_archdata) is already in use =
in
> > powerpc architecture. See arch/powerpc/kernel/setup-common.c
> >=20
> > The advantage of this solution is that it makes a dma_mask placehol=
der
> > available to statically allocated platform_device struct, while min=
e
> > only address the problem for platform_device struct allocated with
> > platform_device_alloc().
>=20
> As I've already said in this thread, the basic problem comes from DT'=
s
> platform device creation.  It's the responsibility of the device crea=
tor
> to set the dma_mask pointer appropriately, and DT doesn't do that.  S=
o,
> DT needs to be fixed rather than everyone introducing their own
> workarounds for this.
>

Sure proliferation of fixes is not what we want.

Note that Uwe added me to the thread not because I tried to address
the same issue, but I tried to improve platform_device_register_full() =
to
not allocate and leak an u64 used to hold the dma mask provided as part=
 of
platform_device_info. I believe he thought the two issues could be solv=
ed
at the same time.

> > I'm also considering using dma_set_mask_and_coherent() in
> > platform_device_register_full() and drivers using
> > platform_device_alloc().
>=20
> As the one who introduced dma_set_mask_and_coherent, consider this a
> strong NAK on that.  The reason is dma_set_mask_and_coherent() is
> for drivers to set their requirements, not for the bus requirements
> to be set in the first place.
>=20
> It also means that drivers which need no DMA support are subjected to
> DMA restrictions (in that dma_set_mask_and_coherent can error out if
> the platform can't support the DMA mask.)
>=20

I'm not sure to understand your point here. If the driver explicitly se=
t
a DMA mask in its call to platform_device_register_full(), can't we sup=
pose
it should be subject to restriction from the platform ?

As I'm not sure to be clear on this particular point, here's the patch =
I
was considering, (sorry of being quite out of topic):

                           ---8<---

Subject: [PATCH] driver core/platform: use dma_set_mask_and_coherent() =
in
 platform_device_register_full()

dma_set_mask_and_coherent() is a nice function for setting the
various DMA masks in struct device. Additionnaly, it checks the
mask value against arch limits.

It may be used to control the validity of the dma_mask given to
platform_device_register_full() and setting the masks in struct
platform_device.

Note: as dma_set_mask() does nothing on m68k, or returns -EINVAL
      on sparc (if PCI support not built), etc. this could break
      in unpleasant ways I'm not yet able to detail ...

Cc: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Cc: "David S. Miller" <davem@davemloft.net>
Cc: sparclinux@vger.kernel.org
Signed-off-by: Yann Droneaud <ydroneaud@opteya.com>
---
 drivers/base/platform.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index bc78848dd59a..ada1d366e1b6 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -446,8 +446,10 @@ struct platform_device *platform_device_register_f=
ull(
 		if (!pdev->dev.dma_mask)
 			goto err;
=20
-		*pdev->dev.dma_mask =3D pdevinfo->dma_mask;
-		pdev->dev.coherent_dma_mask =3D pdevinfo->dma_mask;
+		ret =3D dma_set_mask_and_coherent(&pdev->dev,
+						pdevinfo->dma_mask);
+		if (ret)
+			goto err;
 	}
=20
 	ret =3D platform_device_add_resources(pdev,
--=20
1.8.5.3

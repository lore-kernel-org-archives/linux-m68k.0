From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] rtc: rp5c01 - Add NVRAM support
Date: Sun, 18 Jul 2010 20:32:06 +0200
Message-ID: <AANLkTilzH61NsPF5maM77chbuQA8ptUiV5iaXtOShYOB@mail.gmail.com>
References: <alpine.DEB.2.00.1006131208470.18415@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:50187 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756994Ab0GRScI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 18 Jul 2010 14:32:08 -0400
In-Reply-To: <alpine.DEB.2.00.1006131208470.18415@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, rtc-linux@googlegroups.com, Linux Kernel Development <linux-kernel@vger.kernel.org>

On Sun, Jun 13, 2010 at 12:12, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> The Ricoh RP5C01 RTC contains 26 x 4 bits of NVRAM.
> Provide access to it via a sysfs "nvram" attribute file.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Alessandro: Ping?

> --
> Question: Is a spinlock in priv the right kind of locking?
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Should I use e.g. rtc-device.ops_lo=
ck instead?
>
> diff --git a/drivers/rtc/rtc-rp5c01.c b/drivers/rtc/rtc-rp5c01.c
> index a95f733..36eb661 100644
> --- a/drivers/rtc/rtc-rp5c01.c
> +++ b/drivers/rtc/rtc-rp5c01.c
> @@ -63,6 +63,8 @@ enum {
> =C2=A0struct rp5c01_priv {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 __iomem *regs;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct rtc_device *rtc;
> + =C2=A0 =C2=A0 =C2=A0 spinlock_t lock; =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=
 against concurrent RTC/NVRAM access */
> + =C2=A0 =C2=A0 =C2=A0 struct bin_attribute nvram_attr;
> =C2=A0};
>
> =C2=A0static inline unsigned int rp5c01_read(struct rp5c01_priv *priv=
,
> @@ -92,6 +94,7 @@ static int rp5c01_read_time(struct device *dev, str=
uct rtc_time *tm)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct rp5c01_priv *priv =3D dev_get_drvda=
ta(dev);
>
> + =C2=A0 =C2=A0 =C2=A0 spin_lock_irq(&priv->lock);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rp5c01_lock(priv);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0tm->tm_sec =C2=A0=3D rp5c01_read(priv, RP5=
C01_10_SECOND) * 10 +
> @@ -111,6 +114,7 @@ static int rp5c01_read_time(struct device *dev, s=
truct rtc_time *tm)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tm->tm_year +=3D=
 100;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rp5c01_unlock(priv);
> + =C2=A0 =C2=A0 =C2=A0 spin_unlock_irq(&priv->lock);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return rtc_valid_tm(tm);
> =C2=A0}
> @@ -119,6 +123,7 @@ static int rp5c01_set_time(struct device *dev, st=
ruct rtc_time *tm)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct rp5c01_priv *priv =3D dev_get_drvda=
ta(dev);
>
> + =C2=A0 =C2=A0 =C2=A0 spin_lock_irq(&priv->lock);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rp5c01_lock(priv);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rp5c01_write(priv, tm->tm_sec / 10, RP5C01=
_10_SECOND);
> @@ -139,6 +144,7 @@ static int rp5c01_set_time(struct device *dev, st=
ruct rtc_time *tm)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rp5c01_write(priv, tm->tm_year % 10, RP5C0=
1_1_YEAR);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rp5c01_unlock(priv);
> + =C2=A0 =C2=A0 =C2=A0 spin_unlock_irq(&priv->lock);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}
>
> @@ -147,6 +153,72 @@ static const struct rtc_class_ops rp5c01_rtc_ops=
 =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.set_time =C2=A0 =C2=A0 =C2=A0 =3D rp5c01_=
set_time,
> =C2=A0};
>
> +
> +/*
> + * The NVRAM is organized as 2 blocks of 13 nibbles of 4 bits.
> + * We provide access to them like AmigaOS does: the high nibble of e=
ach 8-bit
> + * byte is stored in BLOCK10, the low nibble in BLOCK11.
> + */
> +
> +static ssize_t rp5c01_nvram_read(struct file *filp, struct kobject *=
kobj,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct bin_attribute *bin_att=
r,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *buf, loff_t pos, size_t=
 size)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct device *dev =3D container_of(kobj, stru=
ct device, kobj);
> + =C2=A0 =C2=A0 =C2=A0 struct rp5c01_priv *priv =3D dev_get_drvdata(d=
ev);
> + =C2=A0 =C2=A0 =C2=A0 ssize_t count;
> +
> + =C2=A0 =C2=A0 =C2=A0 spin_lock_irq(&priv->lock);
> +
> + =C2=A0 =C2=A0 =C2=A0 for (count =3D 0; size > 0 && pos < RP5C01_MOD=
E; count++, size--) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u8 data;
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rp5c01_write(priv,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0RP5C01_MODE_TIMER_EN | RP5C01_MODE_RAM_BLOC=
K10,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0RP5C01_MODE);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D rp5c01_re=
ad(priv, pos) << 4;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rp5c01_write(priv,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0RP5C01_MODE_TIMER_EN | RP5C01_MODE_RAM_BLOC=
K11,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0RP5C01_MODE);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data |=3D rp5c01_r=
ead(priv, pos++);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rp5c01_write(priv,=
 RP5C01_MODE_TIMER_EN | RP5C01_MODE_MODE01,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0RP5C01_MODE);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *buf++ =3D data;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 spin_unlock_irq(&priv->lock);
> + =C2=A0 =C2=A0 =C2=A0 return count;
> +}
> +
> +static ssize_t rp5c01_nvram_write(struct file *filp, struct kobject =
*kobj,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct bin_attribute *bin_at=
tr,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *buf, loff_t pos, size_=
t size)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct device *dev =3D container_of(kobj, stru=
ct device, kobj);
> + =C2=A0 =C2=A0 =C2=A0 struct rp5c01_priv *priv =3D dev_get_drvdata(d=
ev);
> + =C2=A0 =C2=A0 =C2=A0 ssize_t count;
> +
> + =C2=A0 =C2=A0 =C2=A0 spin_lock_irq(&priv->lock);
> +
> + =C2=A0 =C2=A0 =C2=A0 for (count =3D 0; size > 0 && pos < RP5C01_MOD=
E; count++, size--) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u8 data =3D *buf++=
;
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rp5c01_write(priv,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0RP5C01_MODE_TIMER_EN | RP5C01_MODE_RAM_BLOC=
K10,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0RP5C01_MODE);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rp5c01_write(priv,=
 data >> 4, pos);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rp5c01_write(priv,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0RP5C01_MODE_TIMER_EN | RP5C01_MODE_RAM_BLOC=
K11,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0RP5C01_MODE);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rp5c01_write(priv,=
 data & 0xf, pos++);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rp5c01_write(priv,=
 RP5C01_MODE_TIMER_EN | RP5C01_MODE_MODE01,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0RP5C01_MODE);
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 spin_unlock_irq(&priv->lock);
> + =C2=A0 =C2=A0 =C2=A0 return count;
> +}
> +
> =C2=A0static int __init rp5c01_rtc_probe(struct platform_device *dev)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *res;
> @@ -168,6 +240,15 @@ static int __init rp5c01_rtc_probe(struct platfo=
rm_device *dev)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_free_=
priv;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>
> + =C2=A0 =C2=A0 =C2=A0 sysfs_bin_attr_init(&priv->nvram_attr);
> + =C2=A0 =C2=A0 =C2=A0 priv->nvram_attr.attr.name =3D "nvram";
> + =C2=A0 =C2=A0 =C2=A0 priv->nvram_attr.attr.mode =3D S_IRUGO | S_IWU=
SR;
> + =C2=A0 =C2=A0 =C2=A0 priv->nvram_attr.read =3D rp5c01_nvram_read;
> + =C2=A0 =C2=A0 =C2=A0 priv->nvram_attr.write =3D rp5c01_nvram_write;
> + =C2=A0 =C2=A0 =C2=A0 priv->nvram_attr.size =3D RP5C01_MODE;
> +
> + =C2=A0 =C2=A0 =C2=A0 spin_lock_init(&priv->lock);
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rtc =3D rtc_device_register("rtc-rp5c01", =
&dev->dev, &rp5c01_rtc_ops,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0THIS_MODULE);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(rtc)) {
> @@ -177,8 +258,15 @@ static int __init rp5c01_rtc_probe(struct platfo=
rm_device *dev)
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0priv->rtc =3D rtc;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0platform_set_drvdata(dev, priv);
> +
> + =C2=A0 =C2=A0 =C2=A0 error =3D sysfs_create_bin_file(&dev->dev.kobj=
, &priv->nvram_attr);
> + =C2=A0 =C2=A0 =C2=A0 if (error)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_unregiste=
r;
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>
> +out_unregister:
> + =C2=A0 =C2=A0 =C2=A0 rtc_device_unregister(rtc);
> =C2=A0out_unmap:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0iounmap(priv->regs);
> =C2=A0out_free_priv:
> @@ -190,6 +278,7 @@ static int __exit rp5c01_rtc_remove(struct platfo=
rm_device *dev)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct rp5c01_priv *priv =3D platform_get_=
drvdata(dev);
>
> + =C2=A0 =C2=A0 =C2=A0 sysfs_remove_bin_file(&dev->dev.kobj, &priv->n=
vram_attr);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rtc_device_unregister(priv->rtc);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0iounmap(priv->regs);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(priv);
> --
> 1.7.0.4

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
